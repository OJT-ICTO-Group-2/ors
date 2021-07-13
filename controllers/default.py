# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
# This is a sample controller
# this file is released under public domain and you can use without limitations
# -------------------------------------------------------------------------

def index():
    students = db(db.student).select(orderby=db.student.id)
    return locals()


def get_tor_file():
    student_id = request.args(0)
    if not student_id:
        raise HTTP(400, "Bad request")

    # get data of student from database
    student = db(db.student.student_id == student_id).select().first()
    college = db(db.college.id == student.college_id).select().first()
    program = db(db.program.id == student.program_id).select().first()

    if student.specialization_id:
        specialization = db(db.specialization.id == student.specialization_id).select().first()
    else:
        specialization = None

    grades = db(db.grade.student_id == student.id).select(join=db.course.on(db.grade.course_id == db.course.id),
                                                          orderby=db.grade.term_year | db.grade.term_sem)

    terms = set()       # set of terms; terms are of type tuple: (term_sem, term_year); to be used as keys for term_data dictionary

    # store to terms set all terms attended by student
    for grade in grades:
        terms.add((grade.grade.term_sem, grade.grade.term_year))

    # sort the terms by school year
    terms = sorted(terms, key=lambda tup: tup[0])
    terms = sorted(terms, key=lambda tup: tup[1])

    term_grades = {}

    # iterate over the terms
    for term in terms:
        # initialize the contents of term_data
        term_grades[term] = []

        # check for each grade and store to term_data[term] if matches the term
        for grade in grades:
            if grade.grade.term_sem == term[0] and grade.grade.term_year == term[1]:
                term_grades[term].append(grade)

    transcript = db(db.transcript.student_id == student.id).select().first()

    attestor = db(db.faculty.id == transcript.attestor_id).select().first()     # indorsed by
    reviewer = db(db.faculty.id == transcript.reviewer_id).select().first()     # reviewed by
    registrar = db(db.staff.id == transcript.registrar_id).select().first()     # certified true


    # script for generating xlsx file of TOR
    import openpyxl as opx

    # store the file name
    file_name = f'{student.last_name}-{student.first_name}-{student.middle_name}-TOR.xlsx'.replace(" ", "_")

    # load template file
    wb = opx.load_workbook(filename='applications/ors/static/tor/TOR-template.xlsx')

    # get current worksheet
    ws = wb.active

    # write student data in header
    ws['I9'] = f'{student.last_name}, {student.first_name} {student.middle_name}'.upper()
    ws['I10'] = student.address
    ws['J11'] = student.birthdate.strftime("%B %-d, %Y")
    ws['J12'] = student.birthplace
    ws['K13'] = (" ").join(program.name.split(" ")[:4])
    ws['K14'] = (" ").join(program.name.split(" ")[4:])
    ws['K15'] = specialization.name if specialization else ""
    try:
        ws['J16'] = transcript.date_conferred.strftime("%B %-d, %Y")
    except:
        pass
    ws['J17'] = f'per BOR Referendum No. {transcript.ref_no}, s. {transcript.series}'

    ws['E14'] = student.last_attended
    ws['E15'] = student.category
    ws['E16'] = college.name
    ws['E17'] = student.sem_admitted

    # initialize counters
    i = 20
    j = 20
    row_counter = 0
    page_count = 1

    # iterate for each term and write grades in the file
    for term in terms:
        if term[0] == "Summer":
            ws[f'A{j}'] = f'{term[0]}, {term[1]}'
        elif len(term_grades[term]) < 2:
            ws[f'A{j}'] = f'{term[0].replace("Semester", "Sem.")}, {term[1]}'
        else:
            ws[f'A{j}'] = term[0]
            if row_counter + 1 >= 23: ws[f'A{j+44}'] = term[1]
            else: ws[f'A{j+1}'] = term[1]
        j += len(term_grades[term])

        for grade in term_grades[term]:
            # course code
            ws.merge_cells(f'C{i}:D{i}')
            ws[f'C{i}'] = grade.course.code

            #course title
            ws[f'E{i}'] = grade.course.title

            # final grade
            if grade.grade.final_grade == 4:
                ws[f'L{i}'] = "Inc."
            elif grade.grade.final_grade == 0:
                ws[f'L{i}'] = "Drp."
            else:
                ws[f'L{i}'] = grade.grade.final_grade

            # removal rating
            ws[f'M{i}'] = grade.grade.removal_rating

            # course units
            if grade.grade.final_grade == 4 and grade.grade.removal_rating is None or grade.grade.final_grade == 0:
                ws[f'N{i}'] = "-"
            else:
                ws[f'N{i}'] = grade.course.units

            # increment counters
            row_counter += 1
            i += 1

            # if one page is filled up, move to the next page
            if row_counter >= 23:
                i += 43
                j += 43
                row_counter = 0
                page_count += 1

    # if student graduated already, write the graduation details
    if student.date_graduated:
        for x in range(3):
            ws.unmerge_cells(f'E{i + x}:K{i + x}')
        # ws.merge_cells(start_row=i, start_column=1, end_row=i+2, end_column=14)
        ws.merge_cells(f'A{i}:N{i+2}')
        ws[f'A{i}'] = f'''GRADUATED WITH THE DEGREE OF {program.name.upper()} ({program.abbreviation}) ON
                          {student.date_graduated.strftime("%B %-d, %Y").upper()} PER REFERENDUM NO. {transcript.ref_no}, S. {transcript.series}
                          OF THE BOARD OF REGENTS, BICOL UNIVERSITY, LEGAZPI CITY.'''
        ws[f'A{i}'].alignment = opx.styles.Alignment(wrap_text=True, horizontal='center', vertical='center')

    if page_count > 1:
        for x in range(1, page_count):
            ws[f'I{x * 66 + 9}'] = f'{student.last_name}, {student.first_name} {student.middle_name}'.upper()
            ws[f'I{x * 66 + 10}'] = f'continuation of page {x}'

    indorser_name = attestor.name
    if attestor.title: indorser_name += f', {attestor.title}'

    reviewer_name = reviewer.name
    if reviewer.title: reviewer_name += f', {reviewer.title}'

    registrar_name = registrar.name
    if registrar.title: registrar_name += f', {registrar.title}'

    for x in range(0, page_count):
        ws[f'A{x * 66 + 58}'] = indorser_name
        ws[f'A{x * 66 + 59}'] = attestor.position
        ws[f'F{x * 66 + 61}'] = reviewer_name
        ws[f'F{x * 66 + 62}'] = reviewer.position
        ws[f'J{x * 66 + 62}'] = registrar_name
        ws[f'J{x * 66 + 63}'] = registrar.position
        ws[f'M{x * 66 + 65}'] = f'Revision: {transcript.revision}'

    ws[f'B{page_count * 66 + 121}'] = transcript.remarks

    file = f'applications/ors/static/tor/{file_name}'
    wb.save(filename=file)

    from gluon.contenttype import contenttype


    response.headers['Content-Type'] = contenttype('xlsx')
    response.headers['Content-disposition'] = f'attachment; filename={file_name}'
    response.stream(file)

def tor_view():
    student_id = request.args(0)
    student = db(db.student.student_id == student_id).select().first()
    college = db(db.college.id == student.college_id).select().first()
    program = db(db.program.id == student.program_id).select().first()
    specialization = db(db.specialization.id == student.specialization_id).select(
    ).first() if student.specialization_id else None
    grades = db(db.grade.student_id == student.id).select(join=db.course.on(db.grade.course_id == db.course.id),
                                                          orderby=db.grade.term_year | db.grade.term_sem)

    terms = set()       # set of terms; terms are of type tuple: (term_sem, term_year); to be used as keys for term_data dictionary

    # store to terms set all terms attended by student
    for grade in grades:
        terms.add((grade.grade.term_sem, grade.grade.term_year))

    # sort the terms by school year
    terms = sorted(terms, key=lambda tup: tup[0])
    terms = sorted(terms, key=lambda tup: tup[1])

    term_data = {}      # dictionary of grades data per term: {term: {"grades": [], "units": int, "equivalent": float}}
    summary = {"units": 0, "equivalent": 0}     # summary data

    # iterate over the terms
    for term in terms:
        # initialize the contents of term_data
        term_data[term] = {"grades": [], "units": 0, "equivalent": 0}

        # check for each grade and store to term_data[term] if matches the term
        for grade in grades:
            if grade.grade.term_sem == term[0] and grade.grade.term_year == term[1]:
                term_data[term]["grades"].append(grade)
                term_data[term]["units"] += grade.course.units
                term_data[term]["equivalent"] += grade.grade.equivalent

        term_data[term]["equivalent"] = round(
            term_data[term]["equivalent"], 1)     # round term equivalent
        # add term units to summary
        summary["units"] += term_data[term]["units"]
        # add term equivalent to summary
        summary["equivalent"] += term_data[term]["equivalent"]

    summary["equivalent"] = round(summary["equivalent"], 1)
    summary["GWA"] = round(summary["equivalent"] / summary["units"], 4)     # calculate for GWA

    transcript = db(db.transcript.student_id == student.id).select().first()
    committee = db(db.committee.transcript_id == transcript.id).select(join=db.faculty.on(db.committee.faculty_id == db.faculty.id))

    committee_list = []

    # sort the committee members according to position hierarchy
    for member in committee:
        if member.committee.position.lower() == "chairperson":
            chair = member
        elif member.committee.position.lower() == "vice-chairperson":
            vice_chair = member
        else:
            committee_list.append(member)
    try:
        # append the vice-chair and chair to the committee_list respectively
        committee_list.extend([vice_chair, chair])
    except:
        pass

    attestor = db(db.faculty.id == transcript.attestor_id).select().first()
    reviewer = db(db.faculty.id == transcript.reviewer_id).select().first()
    registrar = db(db.staff.id == transcript.registrar_id).select().first()

    return locals()

def get_rle_record_file():
    pass

def rle_record_view():
    student_id = request.args(0)
    if not student_id:
        raise HTTP(400, "Bad request")

    # get data of student from database
    student = db(db.student.student_id == student_id).select().first()
    rle_courses = db().select(db.rle_course.ALL)
    attended_cr = db(db.attended_community_resource.student_id == student.id).select()
    rle_record = db(db.rle_record.student_id == student.id).select().first()

    terms = {1, 2, 3, 4}

    term_courses = {}

    total = {"lecture_total": 0, "lecture_units": 0, "rle_hours": 0, "rle_units": 0}

    for term in terms:
        term_courses[term] = []
        for course in rle_courses:
            if course.year_level == term:
                term_courses[term].append(course)
                total["lecture_total"] += course.lecture_total
                total["lecture_units"] += course.lecture_units
                total["rle_hours"] += course.rle_hours
                total["rle_units"] += course.rle_units

    attended_cr_dict = {1: [], 2: []}
    for cr in attended_cr:
        if cr.community_resource_id.type == 1:
            attended_cr_dict[1].append(cr)
        elif cr.community_resource_id.type == 2:
            attended_cr_dict[2].append(cr)

    return locals()
