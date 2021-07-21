
from gluon.contrib.appconfig import AppConfig

configuration = AppConfig(reload=True)

from db_creds import db_connection
db = DAL(db_connection)
db.define_table(
    'faculty',
    Field("name", type='string', length=150, notnull=True),
    Field("position", type="string", length=80, notnull=True),
    Field("title", type='string', length=15)
)
db.define_table(
    'college',
    Field("name", type='string', length=80, notnull=True, unique=True),
    Field("abbreviation", type='string', length=8, notnull=True, unique=True),
    Field("address", type='string', length=50, notnull=True),
    Field("dean",'reference faculty'),
    Field("contact_number", type='string', length=15)
)
db.define_table(
    'program',
    Field("name", type='string', length=50, notnull=True, unique=True),
    Field("abbreviation", type='string', length=10, notnull=True, unique=True),
    Field("ladderized", type='boolean', notnull=True, default=False)
)
db.define_table(
    'specialization',
    Field("name", type='string', length=50, notnull=True, unique=True),
    Field("program_id", 'reference program', notnull=True)
)
db.define_table(
    'student',
    Field("student_id", type='string', length=18, notnull=True, unique=True),
    Field("first_name", type='string', length=50, notnull=True),
    Field("middle_name", type='string', length=50),
    Field("last_name", type='string', length=50, notnull=True),
    Field("address", type='string', length=100, notnull=True),
    Field("birthdate", type='date', notnull=True),
    Field("birthplace", type='string', length=50, notnull=True),
    Field("program_id", 'reference program'),
    Field("specialization_id", 'reference specialization'),
    Field("last_attended", type='integer'),
    Field("category", type='string', length=20, notnull=True),
    Field("college_id", 'reference college', notnull=True),
    Field("sem_admitted", type='string', length=25, notnull=True),
    Field("date_graduated", type='date'),
    Field("class_year", type='string', length=9),
    Field("gender", type='string', length=10),
    Field("year_level", type='string', length=3)
)
db.define_table(
    'course',
    Field("code", type='string', length=15, notnull=True, unique=True),
    Field("title", type='string', length=80, notnull=True),
    Field("units", type='integer', notnull=True)
)
db.define_table(
    'rle_course',
    Field("year_level", type='integer', notnull=True),
    Field("code_subject", type='string', length=10, notnull=True),
    Field("code_digit", type='integer', notnull=True),
    Field("title", type='string', length=80, notnull=True),
    Field("lecture_total", type='integer', notnull=True),
    Field("lecture_units", type='integer', notnull=True),
    Field("rle_hours", type='integer', notnull=True),
    Field("rle_units", type='integer', notnull=True)
)
db.define_table(
    'grade',
    Field("student_id", 'reference student', notnull=True),
    Field("course_id", 'reference course', notnull=True),
    Field("term_sem", type="string", length=15, notnull=True),
    Field("term_year", type="text", length=10, notnull=True),
    Field("final_grade", type="double", notnull=True),
    Field("removal_rating", type="double"),
    Field("equivalent", type="double", notnull=True)
)
db.define_table(
    'staff',
    Field("name", type='string', length=150, notnull=True),
    Field("position", type="string", length=80, notnull=True),
    Field("title", type='string', length=15)
)
db.define_table(
    'transcript',
    Field("student_id", 'reference student', notnull=True),
    Field("attestor_id", 'reference faculty', notnull=True),
    Field("reviewer_id", 'reference faculty', notnull=True),
    Field("registrar_id", 'reference staff', notnull=True),
    Field("remarks", type='string', length=50),
    Field("revision", type='integer', notnull=True, default=0),
    Field("date_conferred", type='date'),
    Field("ref_no", type='string', length=8),
    Field("series", type='integer')
)
db.define_table(
    'committee',
    Field("faculty_id", 'reference faculty', notnull=True),
    Field("transcript_id", 'reference transcript', notnull=True),
    Field("position", type="string", length=80, notnull=True)
)
db.define_table(
    'community_resource',
    Field("name", type='string', notnull=True),
    Field("type", type='integer', notnull=True),
    Field("families_total", type='integer'),
    Field("patients_daily_ave", type='integer')
)
db.define_table(
    'attended_community_resource',
    Field("student_id", 'reference student', notnull=True),
    Field("community_resource_id", 'reference community_resource', notnull=True),
    Field("year_level", type='string', length=6, notnull=True)
)
db.define_table(
    'rle_record',
    Field("student_id", 'reference student', notnull=True),
    Field("registrar_id", 'reference staff', notnull=True),
    Field("revision", type='integer', notnull=True, default=0)
)
db.define_table(
    'grades_certificate',
    Field("student_id", 'reference student', notnull=True),
    Field("date_issued", type='date', notnull=True),
    Field("registrar", 'reference staff', notnull=True),
    Field("noted_by", 'reference staff', notnull=True),
    Field("revision", type='integer', notnull=True, default=0)
)
db.define_table(
    'enrollment_certificate',
    Field("student_id", 'reference student', notnull=True),
    Field("date_issued", type='date', default = request.now, requires = IS_DATE(format=('%d-%m-%Y'))),
    Field("registrar", 'reference staff'),
    Field("revision", type='integer', default=0),
    Field("term_sem", type="string", length=15),
    Field("term_year", type="text", length=10)
)
db.define_table(
    'good_moral_certificate',
    Field("student_id", 'reference student', notnull=True),
    Field("date_issued", type='date', default = request.now, requires = IS_DATE(format=('%d-%m-%Y'))),
    Field("registrar", 'reference staff'),
    Field("revision", type='integer', default=0)
)
