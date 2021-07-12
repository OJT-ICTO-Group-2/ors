# -*- coding: utf-8 -*-

# -------------------------------------------------------------------------
# AppConfig configuration made easy. Look inside private/appconfig.ini
# Auth is for authenticaiton and access control
# -------------------------------------------------------------------------
from gluon.contrib.appconfig import AppConfig
from gluon.tools import Auth
import csv

# -------------------------------------------------------------------------
# This scaffolding model makes your app work on Google App Engine too
# File is released under public domain and you can use without limitations
# -------------------------------------------------------------------------

if request.global_settings.web2py_version < "2.15.5":
    raise HTTP(500, "Requires web2py 2.15.5 or newer")

# -------------------------------------------------------------------------
# if SSL/HTTPS is properly configured and you want all HTTP requests to
# be redirected to HTTPS, uncomment the line below:
# -------------------------------------------------------------------------
# request.requires_https()

# -------------------------------------------------------------------------
# once in production, remove reload=True to gain full speed
# -------------------------------------------------------------------------
configuration = AppConfig(reload=True)

if not request.env.web2py_runtime_gae:
    # ---------------------------------------------------------------------
    # if NOT running on Google App Engine use SQLite or other DB
    # ---------------------------------------------------------------------
    db = DAL('postgres://anjelo:admin@localhost:5432/ors1')
    db.define_table('faculty',
                    Field("name", type='string', length=150, notnull=True),
                    Field("position", type="string", length=80, notnull=True),
                    Field("title", type='string', length=15))
    db.define_table('college',
                    Field("name", type='string', length=80, notnull=True, unique=True),
                    Field("abbreviation", type='string', length=8, notnull=True, unique=True),
                    Field("address", type='string', length=50, notnull=True),
                    Field("dean",'reference faculty'))
    db.define_table('program',
                    Field("name", type='string', length=50, notnull=True, unique=True),
                    Field("abbreviation", type='string', length=10, notnull=True, unique=True),
                    Field("ladderized", type='boolean', notnull=True, default=False))
    db.define_table('specialization',
                    Field("name", type='string', length=50, notnull=True, unique=True),
                    Field("program_id", 'reference program', notnull=True))
    db.define_table('student',
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
                    Field("class_year", type='string', length=9))
    db.define_table('course',
                    Field("code", type='string', length=15, notnull=True, unique=True),
                    Field("title", type='string', length=80, notnull=True),
                    Field("units", type='integer', notnull=True))
    db.define_table('rle_course',
                    Field("code_subject", type='string', length=15, notnull=True),
                    Field("code_digit", type='string', length=15, notnull=True),
                    Field("title", type='string', length=80, notnull=True),
                    Field("lecture_total", type='integer', notnull=True),
                    Field("lecture_units", type='integer', notnull=True),
                    Field("rle_hours", type='integer', notnull=True),
                    Field("rle_units", type='integer', notnull=True))
    db.define_table('grade',
                    Field("student_id", 'reference student', notnull=True),
                    Field("course_id", 'reference course', notnull=True),
                    Field("term_sem", type="string", length=15, notnull=True),
                    Field("term_year", type="text", length=10, notnull=True),
                    Field("final_grade", type="double", notnull=True),
                    Field("removal_rating", type="double"),
                    Field("equivalent", type="double", notnull=True))
    db.define_table('staff',
                    Field("name", type='string', length=150, notnull=True),
                    Field("position", type="string", length=80, notnull=True),
                    Field("title", type='string', length=15))
    db.define_table('transcript',
                    Field("student_id", 'reference student', notnull=True),
                    Field("attestor_id", 'reference faculty', notnull=True),
                    Field("reviewer_id", 'reference faculty', notnull=True),
                    Field("registrar_id", 'reference staff', notnull=True),
                    Field("remarks", type='string', length=50),
                    Field("revision", type='integer', notnull=True, default=0),
                    Field("date_conferred", type='date'),
                    Field("ref_no", type='string', length=8),
                    Field("series", type='integer'))
    db.define_table('committee',
                    Field("faculty_id", 'reference faculty', notnull=True),
                    Field("transcript_id", 'reference transcript', notnull=True),
                    Field("position", type="string", length=80, notnull=True))
    db.define_table('community_resource',
                    Field("name", type='string', notnull=True),
                    Field("type", type='integer', notnull=True),
                    Field("families_total", type='integer'),
                    Field("patients_daily_ave", type='integer'))
    db.define_table('attended_community_resource',
                    Field("student_id", 'reference student', notnull=True),
                    Field("community_resource_id", 'reference community_resource', notnull=True),
                    Field("year_level", type='string', length=6, notnull=True))
    db.define_table('rle_record',
                    Field("registrar_id", 'reference staff', notnull=True),
                    Field("revision", type='integer', notnull=True, default=0))


    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/colleges.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.college.insert(name=row[0], abbreviation=row[1], address=row[2])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/programs.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.program.insert(name=row[0], abbreviation=row[1])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/specializations.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.specialization.insert(name=row[0], program_id=row[1])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/students.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.student.insert(student_id=row[0],first_name=row[1], middle_name=row[2], last_name=row[3], address=row[4],
    #                           birthdate=row[5], birthplace=row[6], program_id=row[7], specialization_id=row[8],
    #                           last_attended=row[9], category=row[10], college_id=row[11], sem_admitted=row[12])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/courses.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.course.insert(code=row[0], title=row[1], units=row[2])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/grades1.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     i = 1
    #     for row in file:
    #         db.grade.insert(student_id=row[0], course_id=i, term_sem=row[2], term_year=row[3], final_grade=row[4],
    #                         removal_rating=row[5], equivalent=row[6])
    #         i = i + 1
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/staff.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.staff.insert(name=row[0], position=row[1], title=row[2])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/faculties.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.faculty.insert(name=row[0], position=row[1], title=row[2])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/transcripts.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.transcript.update_or_insert(student_id=row[0], attestor_id=row[1], reviewer_id=row[2], registrar_id=row[3], revision=row[4])
    #
    # with open('/home/www-data/web2py/applications/ORS/static/sample_data/committees.csv', 'r', newline='') as csv_file:
    #     file = csv.reader(csv_file)
    #     for row in file:
    #         db.committee.insert(faculty_id=row[0], transcript_id=row[1], position=row[2])


else:
    # ---------------------------------------------------------------------
    # connect to Google BigTable (optional 'google:datastore://namespace')
    # ---------------------------------------------------------------------
    db = DAL('google:datastore+ndb')
    # ---------------------------------------------------------------------
    # store sessions and tickets there
    # ---------------------------------------------------------------------
    session.connect(request, response, db=db)
    # ---------------------------------------------------------------------
    # or store session in Memcache, Redis, etc.
    # from gluon.contrib.memdb import MEMDB
    # from google.appengine.api.memcache import Client
    # session.connect(request, response, db = MEMDB(Client()))
    # ---------------------------------------------------------------------

# -------------------------------------------------------------------------
# by default give a view/generic.extension to all actions from localhost
# none otherwise. a pattern can be 'controller/function.extension'
# -------------------------------------------------------------------------
response.generic_patterns = []
if request.is_local and not configuration.get('app.production'):
    response.generic_patterns.append('*')

# -------------------------------------------------------------------------
# choose a style for forms
# -------------------------------------------------------------------------
response.formstyle = 'bootstrap4_inline'
response.form_label_separator = ''

# -------------------------------------------------------------------------
# (optional) optimize handling of static files
# -------------------------------------------------------------------------
# response.optimize_css = 'concat,minify,inline'
# response.optimize_js = 'concat,minify,inline'

# -------------------------------------------------------------------------
# (optional) static assets folder versioning
# -------------------------------------------------------------------------
# response.static_version = '0.0.0'

# -------------------------------------------------------------------------
# Here is sample code if you need for
# - email capabilities
# - authentication (registration, login, logout, ... )
# - authorization (role based authorization)
# - services (xml, csv, json, xmlrpc, jsonrpc, amf, rss)
# - old style crud actions
# (more options discussed in gluon/tools.py)
# -------------------------------------------------------------------------

# host names must be a list of allowed host names (glob syntax allowed)
auth = Auth(db, host_names=configuration.get('host.names'))

# -------------------------------------------------------------------------
# create all tables needed by auth, maybe add a list of extra fields
# -------------------------------------------------------------------------
auth.settings.extra_fields['auth_user'] = []
auth.define_tables(username=False, signature=False)

# -------------------------------------------------------------------------
# configure email
# -------------------------------------------------------------------------
mail = auth.settings.mailer
mail.settings.server = 'logging' if request.is_local else configuration.get('smtp.server')
mail.settings.sender = configuration.get('smtp.sender')
mail.settings.login = configuration.get('smtp.login')
mail.settings.tls = configuration.get('smtp.tls') or False
mail.settings.ssl = configuration.get('smtp.ssl') or False

# -------------------------------------------------------------------------
# configure auth policy
# -------------------------------------------------------------------------
auth.settings.registration_requires_verification = False
auth.settings.registration_requires_approval = False
auth.settings.reset_password_requires_verification = True

# -------------------------------------------------------------------------
# read more at http://dev.w3.org/html5/markup/meta.name.html
# -------------------------------------------------------------------------
response.meta.author = configuration.get('app.author')
response.meta.description = configuration.get('app.description')
response.meta.keywords = configuration.get('app.keywords')
response.meta.generator = configuration.get('app.generator')
response.show_toolbar = configuration.get('app.toolbar')

# -------------------------------------------------------------------------
# your http://google.com/analytics id
# -------------------------------------------------------------------------
response.google_analytics_id = configuration.get('google.analytics_id')

# -------------------------------------------------------------------------
# maybe use the scheduler
# -------------------------------------------------------------------------
if configuration.get('scheduler.enabled'):
    from gluon.scheduler import Scheduler
    scheduler = Scheduler(db, heartbeat=configuration.get('scheduler.heartbeat'))

# -------------------------------------------------------------------------
# Define your tables below (or better in another model file) for example
#
# >>> db.define_table('mytable', Field('myfield', 'string'))
#
# Fields can be 'string','text','password','integer','double','boolean'
#       'date','time','datetime','blob','upload', 'reference TABLENAME'
# There is an implicit 'id integer autoincrement' field
# Consult manual for more options, validators, etc.
#
# More API examples for controllers:
#
# >>> db.mytable.insert(myfield='value')
# >>> rows = db(db.mytable.myfield == 'value').select(db.mytable.ALL)
# >>> for row in rows: print row.id, row.myfield
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
# after defining tables, uncomment below to enable auditing
# -------------------------------------------------------------------------
# auth.enable_record_versioning(db)
