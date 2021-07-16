--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-0ubuntu0.21.04.1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-0ubuntu0.21.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: attended_community_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attended_community_resource (
    id integer NOT NULL,
    student_id integer NOT NULL,
    community_resource_id integer NOT NULL,
    year_level character varying(6) NOT NULL
);


ALTER TABLE public.attended_community_resource OWNER TO postgres;

--
-- Name: attended_community_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attended_community_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attended_community_resource_id_seq OWNER TO postgres;

--
-- Name: attended_community_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attended_community_resource_id_seq OWNED BY public.attended_community_resource.id;


--
-- Name: auth_cas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_cas (
    id integer NOT NULL,
    user_id integer,
    created_on timestamp without time zone,
    service character varying(512),
    ticket character varying(512),
    renew character(1)
);


ALTER TABLE public.auth_cas OWNER TO postgres;

--
-- Name: auth_cas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_cas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_cas_id_seq OWNER TO postgres;

--
-- Name: auth_cas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_cas_id_seq OWNED BY public.auth_cas.id;


--
-- Name: auth_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_event (
    id integer NOT NULL,
    time_stamp timestamp without time zone,
    client_ip character varying(512),
    user_id integer,
    origin character varying(512),
    description text
);


ALTER TABLE public.auth_event OWNER TO postgres;

--
-- Name: auth_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_event_id_seq OWNER TO postgres;

--
-- Name: auth_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_event_id_seq OWNED BY public.auth_event.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    role character varying(512),
    description text
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_membership (
    id integer NOT NULL,
    user_id integer,
    group_id integer
);


ALTER TABLE public.auth_membership OWNER TO postgres;

--
-- Name: auth_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_membership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_membership_id_seq OWNER TO postgres;

--
-- Name: auth_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_membership_id_seq OWNED BY public.auth_membership.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    group_id integer,
    name character varying(512),
    table_name character varying(512),
    record_id integer
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    first_name character varying(128),
    last_name character varying(128),
    email character varying(512),
    password character varying(512),
    registration_key character varying(512),
    reset_password_key character varying(512),
    registration_id character varying(512)
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: college; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.college (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    abbreviation character varying(8) NOT NULL,
    address character varying(50) NOT NULL,
    dean integer,
    contact_number character varying(15)
);


ALTER TABLE public.college OWNER TO postgres;

--
-- Name: college_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.college_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.college_id_seq OWNER TO postgres;

--
-- Name: college_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.college_id_seq OWNED BY public.college.id;


--
-- Name: committee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.committee (
    id integer NOT NULL,
    faculty_id integer NOT NULL,
    transcript_id integer NOT NULL,
    "position" character varying(80) NOT NULL
);


ALTER TABLE public.committee OWNER TO postgres;

--
-- Name: committee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.committee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.committee_id_seq OWNER TO postgres;

--
-- Name: committee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.committee_id_seq OWNED BY public.committee.id;


--
-- Name: community_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.community_resource (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    type integer NOT NULL,
    families_total integer,
    patients_daily_ave integer
);


ALTER TABLE public.community_resource OWNER TO postgres;

--
-- Name: community_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.community_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.community_resource_id_seq OWNER TO postgres;

--
-- Name: community_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.community_resource_id_seq OWNED BY public.community_resource.id;


--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    code character varying(15) NOT NULL,
    title character varying(80) NOT NULL,
    units integer NOT NULL
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO postgres;

--
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- Name: enrollment_certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment_certificate (
    id integer NOT NULL,
    student_id integer,
    registrar integer,
    date_issued date,
    revision integer,
    term_sem character varying(15),
    term_year text
);


ALTER TABLE public.enrollment_certificate OWNER TO postgres;

--
-- Name: enrollment_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollment_certificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollment_certificate_id_seq OWNER TO postgres;

--
-- Name: enrollment_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollment_certificate_id_seq OWNED BY public.enrollment_certificate.id;


--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    "position" character varying(80) NOT NULL,
    title character varying(15)
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculty_id_seq OWNER TO postgres;

--
-- Name: faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculty_id_seq OWNED BY public.faculty.id;


--
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    term_sem character varying(15) NOT NULL,
    term_year text NOT NULL,
    final_grade double precision NOT NULL,
    removal_rating double precision,
    equivalent double precision NOT NULL
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grade_id_seq OWNER TO postgres;

--
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_id_seq OWNED BY public.grade.id;


--
-- Name: grades_certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades_certificate (
    id integer NOT NULL,
    student_id integer NOT NULL,
    date_issued date NOT NULL,
    registrar integer NOT NULL,
    noted_by integer NOT NULL,
    revision integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.grades_certificate OWNER TO postgres;

--
-- Name: grades_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_certificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_certificate_id_seq OWNER TO postgres;

--
-- Name: grades_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_certificate_id_seq OWNED BY public.grades_certificate.id;


--
-- Name: program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.program (
    id integer NOT NULL,
    name character varying(70) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    ladderized character(1) DEFAULT 'F'::bpchar NOT NULL
);


ALTER TABLE public.program OWNER TO postgres;

--
-- Name: program_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.program_id_seq OWNER TO postgres;

--
-- Name: program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.program_id_seq OWNED BY public.program.id;


--
-- Name: rle_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rle_course (
    id integer NOT NULL,
    title character varying(80) NOT NULL,
    lecture_total integer NOT NULL,
    lecture_units integer NOT NULL,
    rle_hours integer NOT NULL,
    rle_units integer NOT NULL,
    year_level integer NOT NULL,
    code_subject character varying(10) NOT NULL,
    code_digit integer NOT NULL
);


ALTER TABLE public.rle_course OWNER TO postgres;

--
-- Name: rle_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rle_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rle_course_id_seq OWNER TO postgres;

--
-- Name: rle_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rle_course_id_seq OWNED BY public.rle_course.id;


--
-- Name: rle_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rle_record (
    id integer NOT NULL,
    registrar_id integer NOT NULL,
    revision integer DEFAULT 0 NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.rle_record OWNER TO postgres;

--
-- Name: rle_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rle_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rle_record_id_seq OWNER TO postgres;

--
-- Name: rle_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rle_record_id_seq OWNED BY public.rle_record.id;


--
-- Name: specialization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specialization (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    program_id integer NOT NULL
);


ALTER TABLE public.specialization OWNER TO postgres;

--
-- Name: specialization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.specialization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialization_id_seq OWNER TO postgres;

--
-- Name: specialization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.specialization_id_seq OWNED BY public.specialization.id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    "position" character varying(80) NOT NULL,
    title character varying(15)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    student_id character varying(18) NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    last_name character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    birthdate date NOT NULL,
    birthplace character varying(50) NOT NULL,
    program_id integer,
    specialization_id integer,
    last_attended integer,
    category character varying(20) NOT NULL,
    college_id integer NOT NULL,
    sem_admitted character varying(25) NOT NULL,
    date_graduated date,
    class_year character varying(9),
    gender character varying(10)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_seq OWNER TO postgres;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: transcript; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transcript (
    id integer NOT NULL,
    student_id integer NOT NULL,
    attestor_id integer NOT NULL,
    reviewer_id integer NOT NULL,
    registrar_id integer NOT NULL,
    remarks character varying(50),
    revision integer NOT NULL,
    date_conferred date,
    ref_no character varying(8),
    series integer
);


ALTER TABLE public.transcript OWNER TO postgres;

--
-- Name: transcript_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transcript_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transcript_id_seq OWNER TO postgres;

--
-- Name: transcript_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transcript_id_seq OWNED BY public.transcript.id;


--
-- Name: attended_community_resource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attended_community_resource ALTER COLUMN id SET DEFAULT nextval('public.attended_community_resource_id_seq'::regclass);


--
-- Name: auth_cas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_cas ALTER COLUMN id SET DEFAULT nextval('public.auth_cas_id_seq'::regclass);


--
-- Name: auth_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_event ALTER COLUMN id SET DEFAULT nextval('public.auth_event_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_membership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_membership ALTER COLUMN id SET DEFAULT nextval('public.auth_membership_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: college id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college ALTER COLUMN id SET DEFAULT nextval('public.college_id_seq'::regclass);


--
-- Name: committee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.committee ALTER COLUMN id SET DEFAULT nextval('public.committee_id_seq'::regclass);


--
-- Name: community_resource id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community_resource ALTER COLUMN id SET DEFAULT nextval('public.community_resource_id_seq'::regclass);


--
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- Name: enrollment_certificate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_certificate ALTER COLUMN id SET DEFAULT nextval('public.enrollment_certificate_id_seq'::regclass);


--
-- Name: faculty id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty ALTER COLUMN id SET DEFAULT nextval('public.faculty_id_seq'::regclass);


--
-- Name: grade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade ALTER COLUMN id SET DEFAULT nextval('public.grade_id_seq'::regclass);


--
-- Name: grades_certificate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades_certificate ALTER COLUMN id SET DEFAULT nextval('public.grades_certificate_id_seq'::regclass);


--
-- Name: program id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program ALTER COLUMN id SET DEFAULT nextval('public.program_id_seq'::regclass);


--
-- Name: rle_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_course ALTER COLUMN id SET DEFAULT nextval('public.rle_course_id_seq'::regclass);


--
-- Name: rle_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_record ALTER COLUMN id SET DEFAULT nextval('public.rle_record_id_seq'::regclass);


--
-- Name: specialization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialization ALTER COLUMN id SET DEFAULT nextval('public.specialization_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: transcript id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript ALTER COLUMN id SET DEFAULT nextval('public.transcript_id_seq'::regclass);


--
-- Data for Name: attended_community_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attended_community_resource (id, student_id, community_resource_id, year_level) FROM stdin;
1	3	1	II-III
2	3	2	I-IV
3	3	3	II-IV
4	3	4	II-IV
5	3	5	IV
6	3	6	III-IV
7	3	7	III
8	3	8	III
9	3	9	III
10	3	10	III
11	3	11	III
12	3	12	III-IV
13	3	13	III-IV
\.


--
-- Data for Name: auth_cas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_cas (id, user_id, created_on, service, ticket, renew) FROM stdin;
\.


--
-- Data for Name: auth_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_event (id, time_stamp, client_ip, user_id, origin, description) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, role, description) FROM stdin;
\.


--
-- Data for Name: auth_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_membership (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, group_id, name, table_name, record_id) FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, first_name, last_name, email, password, registration_key, reset_password_key, registration_id) FROM stdin;
\.


--
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.college (id, name, abbreviation, address, dean, contact_number) FROM stdin;
2	College of Arts and Letters	CAL	Legazpi City, Albay	\N	\N
4	College of Law	CL	Legazpi City, Albay	\N	\N
5	College of Engineering	CENG	Legazpi City, Albay	\N	\N
6	Institute of Design and Architeture	IDeA	Legazpi City, Albay	\N	\N
7	College of Industrial Technology	CIT	Legazpi City, Albay	\N	\N
8	College of Education	CE	Daraga, Albay	\N	\N
9	Institute of Physical Education, Sports and Recreation	IPESR	Daraga, Albay	\N	\N
10	College of Medicine	CM	Daraga, Albay	\N	\N
11	Graduate School	GS	Daraga, Albay	\N	\N
12	College of Social Sciences and Philosophy	CSSP	Daraga, Albay	\N	\N
13	College of Business, Economics and Management	CBEM	Daraga, Albay	\N	\N
14	Jesse M. Robredo Institute of Governance and Development	JMRIGD	Daraga, Albay	\N	\N
15	College of Agriculture and Forestry	CAF	Guinobatan, Albay	\N	\N
16	Gubat Campus	GC	Gubat, Sorsogon	\N	\N
17	Polangui Campus	PC	Polangui, Albay	\N	\N
18	Tabaco Campus	TC	Tabaco, Albay	\N	\N
3	College of Nursing	CN	Legazpi City, Albay	6	\N
1	College of Science	CS	Legazpi City, Albay	5	\N
\.


--
-- Data for Name: committee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.committee (id, faculty_id, transcript_id, "position") FROM stdin;
1	1	1	Member
2	2	1	Member
3	3	1	Vice-Chairperson
4	4	1	Chairperson
\.


--
-- Data for Name: community_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.community_resource (id, name, type, families_total, patients_daily_ave) FROM stdin;
1	Arimbay Health Center	1	700	\N
2	Bigaa Health Center	1	1148	\N
3	Bicol Regional Teaching and Training Hospital	2	\N	300
4	City Health Office	2	\N	150
5	City House Maternity Medical & Family Planning Clinic	2	\N	15
6	Josefina Belmonte Duran Memorial District Hospital	2	\N	100
7	Manila Health Department (Lying-in Clinic)	2	\N	50
8	National Center for Mental Health	2	\N	3000
9	Philippine Orthopedic Center	2	\N	700
10	San Lazaro Hospital	2	\N	500
11	Gubat District Hospital	2	\N	30
12	Vicente Peralta Memorial Hospital	2	\N	30
13	Sorsogon Medical Mission Group Hospital & Health Services Cooperative	2	\N	80
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (id, code, title, units) FROM stdin;
1	CS 101	Introduction to Computing	3
2	CS 102	Computer Programming 1	3
3	Math 101	Mathematical Analysis 1	5
4	Phys 1	Physics for Computing	3
5	GEC 11	Understanding the Self	3
6	PE 1	Physical Fitness and Gymnactics	2
7	NSTP 1	CWTS/LTS/ROTC	0
8	CS 103	Computer Programming 2	3
9	CS 107	Digital System Design	3
10	Math 102	Mathematical Analysis 2	5
11	GEC 12	Readings in the Philippine History	3
12	GEC 13	The Contemporary World	3
13	PE 2	Fundamentals of Rhythm and Dances	2
14	NSTP 2	CWTS/LTS/ROTC	0
15	CS 104	Data Structures and Algorithms	3
16	CS 106	Application Development & Emerging Technologies	3
17	CS 108	Object Oriented Programming	3
18	CS 109	Discrete Structures 1	3
19	Math Elec 101	Linear Algebra	3
20	GEC 14	Mathematics in the Modern World	3
21	PE 3	Fundamentals of Games and Sports	2
22	CS 105	Information Management	3
23	CS 110	Discrete Structures 2	3
24	CS 111	Design and Analysis of Algorithms	3
25	CS 112	Programming Languages	3
26	CS 113	Special Topics in Computing	1
27	Math Elec 102	Differential Equations	3
28	GEC 15	Purposive Communication	3
29	PE 4	Recreation and Youth Ledaership	2
30	CS 114	Operating Systems	3
31	CS 115	Computer Architecture and Organization	3
32	CS 116	Automata Theory and Formal Languages	3
33	CS 117	Software Engineering 1	3
34	CS Elec 1	Introduction to Artificial Intelligence	3
35	GEC 16	Art Appreciation	3
36	Fil 21	Kontekstwalisadong Komunikasyon sa Fil	3
37	CS 118	Software Engineering 2	3
38	CS 119	Networks and Communications	3
39	CS 120	Human Computer Interaction	1
40	CS 121	Information Assurance and Security	2
41	CS Elec 2	Computer Security and Cryptography	3
42	GEC 17	Science, Technology and Society	3
43	GEC 18	Ethics	3
44	Fil 22	Sosyedad at Literatura	3
45	CS 122	Practicum	3
46	CS 123	Numerical Analysis	3
47	CS 124	CS Thesis 1	3
48	CS Elec 3	CS Elective 3	3
49	GEC 20.1	The Entrepreneurial Mind	3
50	GEC Elec 21.1	Environmental Science	3
51	GEC Elec 22.1	Great Books	3
52	CS 125	CS Thesis 2	3
53	CS 126	Social Issues and Professional Practice	3
54	GEC 19	Life and Works of Rizal	3
55	GEC Elec 20.3	Human Reproduction	3
56	GEC Elec 21.4	Living in the IT Era	3
\.


--
-- Data for Name: enrollment_certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment_certificate (id, student_id, registrar, date_issued, revision, term_sem, term_year) FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (id, name, "position", title) FROM stdin;
1	Arnold G. Montas	Faculty In-Charge for Guidance Services	
2	Michelle D. Belir	Coordinator of Student Services	M.Econ
3	Jennifer L. Llovido	Department Chair	DIT
4	Gabriel M. Abanes	Registrar II	
5	Jocelyn E. Serrano	Dean	MSc
6	Maria Bernadette A. Palacio	Dean	Ed.D
\.


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (id, student_id, course_id, term_sem, term_year, final_grade, removal_rating, equivalent) FROM stdin;
1	1	1	1st Semester	2017-2018	1.4	\N	4.2
2	1	2	1st Semester	2017-2018	2.7	\N	8.1
3	1	3	1st Semester	2017-2018	1.7	\N	8.5
4	1	4	1st Semester	2017-2018	2.8	\N	8.4
5	1	5	1st Semester	2017-2018	2.3	\N	6.9
6	1	6	1st Semester	2017-2018	1.9	\N	3.8
7	1	7	1st Semester	2017-2018	2.4	\N	0
8	1	8	2nd Semester	2017-2018	2.1	\N	6.3
9	1	9	2nd Semester	2017-2018	2.5	\N	7.5
10	1	10	2nd Semester	2017-2018	1	\N	5
11	1	11	2nd Semester	2017-2018	4	2.2	6.6
12	1	12	2nd Semester	2017-2018	1.1	\N	3.3
13	1	13	2nd Semester	2017-2018	1.4	\N	2.8
14	1	14	2nd Semester	2017-2018	1.2	\N	0
15	1	15	1st Semester	2018-2019	2.4	\N	7.2
16	1	16	1st Semester	2018-2019	2.1	\N	6.3
18	1	18	1st Semester	2018-2019	1.3	\N	3.9
19	1	19	1st Semester	2018-2019	1.1	\N	3.3
20	1	20	1st Semester	2018-2019	2.1	\N	6.3
21	1	21	1st Semester	2018-2019	1.4	\N	2.8
22	1	22	2nd Semester	2018-2019	1.6	\N	4.8
24	1	24	2nd Semester	2018-2019	3	\N	9
25	1	25	2nd Semester	2018-2019	2.1	\N	6.3
26	1	26	2nd Semester	2018-2019	1.1	\N	1.1
27	1	27	2nd Semester	2018-2019	2.1	\N	6.3
28	1	28	2nd Semester	2018-2019	1.6	\N	4.8
29	1	29	2nd Semester	2018-2019	3	\N	6
30	1	30	1st Semester	2019-2020	2.4	\N	7.2
31	1	31	1st Semester	2019-2020	2.9	\N	8.7
32	1	32	1st Semester	2019-2020	1.4	\N	4.2
33	1	33	1st Semester	2019-2020	4	2.3	6.9
34	1	34	1st Semester	2019-2020	1.5	\N	4.5
35	1	35	1st Semester	2019-2020	1.9	\N	5.7
36	1	36	1st Semester	2019-2020	2.5	\N	7.5
37	1	37	2nd Semester	2019-2020	2.9	\N	8.7
38	1	38	2nd Semester	2019-2020	1.5	\N	4.5
39	1	39	2nd Semester	2019-2020	1.3	\N	1.3
40	1	40	2nd Semester	2019-2020	2.7	\N	5.4
41	1	41	2nd Semester	2019-2020	2	\N	6
42	1	42	2nd Semester	2019-2020	2.9	\N	8.7
43	1	43	2nd Semester	2019-2020	1.2	\N	3.6
44	1	44	2nd Semester	2019-2020	2.9	\N	8.7
45	1	45	Summer	2020	2.2	\N	6.6
46	1	46	1st Semester	2020-2021	1	\N	3
47	1	47	1st Semester	2020-2021	1.7	\N	5.1
48	1	48	1st Semester	2020-2021	1.2	\N	3.6
49	1	49	1st Semester	2020-2021	1.7	\N	5.1
50	1	50	1st Semester	2020-2021	2.7	\N	8.1
51	1	51	1st Semester	2020-2021	1.7	\N	5.1
52	1	52	2nd Semester	2020-2021	1	\N	3
53	1	53	2nd Semester	2020-2021	1.1	\N	3.3
54	1	54	2nd Semester	2020-2021	2.7	\N	8.1
55	1	55	2nd Semester	2020-2021	1	\N	3
56	1	56	2nd Semester	2020-2021	1.6	\N	4.8
57	2	1	1st Semester	2018-2019	1.4	\N	4.2
58	2	2	1st Semester	2018-2019	2.7	\N	8.1
59	2	3	1st Semester	2018-2019	1.7	\N	8.5
60	2	4	1st Semester	2018-2019	2.8	\N	8.4
61	2	5	1st Semester	2018-2019	2.3	\N	6.9
62	2	6	1st Semester	2018-2019	1.9	\N	3.8
63	2	7	1st Semester	2018-2019	2.4	\N	0
64	2	8	2nd Semester	2018-2019	2.1	\N	6.3
65	2	9	2nd Semester	2018-2019	2.5	\N	7.5
66	2	10	2nd Semester	2018-2019	1	\N	5
67	2	11	2nd Semester	2018-2019	4	2.2	6.6
68	2	12	2nd Semester	2018-2019	1.1	\N	3.3
69	2	13	2nd Semester	2018-2019	1.4	\N	2.8
70	2	14	2nd Semester	2018-2019	1.2	\N	0
23	1	23	2nd Semester	2018-2019	0	\N	0
17	1	17	1st Semester	2018-2019	4	\N	0
\.


--
-- Data for Name: grades_certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades_certificate (id, student_id, date_issued, registrar, noted_by, revision) FROM stdin;
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.program (id, name, abbreviation, ladderized) FROM stdin;
1	Bachelor of Science in Computer Science	BSCS	F
2	Bachelor of Science in Information Technology	BSIT	F
3	Bachelor of Science in Biology	BSBio	F
4	Bachelor of Science in Meteorology	BSMet	F
5	Bachelor of Science in Chemistry	BSChem	F
6	Bachelor of Science in Agricultural and Biosystems Engineering	BSABE	F
7	Bachelor of Science in Nursing	BSN	T
\.


--
-- Data for Name: rle_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rle_course (id, title, lecture_total, lecture_units, rle_hours, rle_units, year_level, code_subject, code_digit) FROM stdin;
1	Foundation of Midwifery / Nursing Practice 1	4	3	51	1	1	MN	100
2	Foundation of Midwifery / Nursing Practice 2	8	4	204	4	1	MN	101
3	Foundation of Midwifery / Nursing Practice 3	9	5	204	4	2	MN	102
4	Legal Aspects of Midwifery Practice	5	3	102	2	2	MN	103
5	Primary Health Care 1	7	4	153	3	2	PHC	1
6	Primary Health Care 2	5	3	102	2	2	PHC	2
7	Promotive & Preventive Nursing Care Management	10	5	255	5	3	Nursing	102
8	Curative & Relabilitative Nursing Care Management 1	16	8	408	8	3	Nursing	103
9	Summer Affiliation (RLE)	4	0	204	4	3	Nursing	104
10	Curative & Relabilitative Nursing Care Management 2	16	8	408	8	4	Nursing	105
11	Nursing Management and Leadership	16	8	408	8	4	Nursing	106
\.


--
-- Data for Name: rle_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rle_record (id, registrar_id, revision, student_id) FROM stdin;
1	1	0	3
\.


--
-- Data for Name: specialization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.specialization (id, name, program_id) FROM stdin;
1	Software Engineering	1
2	Data Science	1
3	Machine Learning	1
4	Computer Systems	1
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, name, "position", title) FROM stdin;
1	Christine A. Ramos	Registrar IV	
2	Ciara D. Mansos	Registrar III	
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, student_id, first_name, middle_name, last_name, address, birthdate, birthplace, program_id, specialization_id, last_attended, category, college_id, sem_admitted, date_graduated, class_year, gender) FROM stdin;
1	2017-CS-100101	Perrie	Garcia	Diaz	Buraguis, Legazpi City	1998-04-23	Legazpi City, Albay	1	1	2021	College Graduate	1	1st Sem., 2017-2018	2021-05-16	\N	\N
2	2018-CS-100102	Juan	Medina	Dela Cruz	Rizal Street, Legazpi City, Albay	1999-09-07	Legazpi City, Albay	6	2	2021	Undergraduate	1	1st Sem., 2018-2019	\N	\N	\N
3	2016-CN-100234	Stephanie	Reyes	Barreto	Rizal Street, Legazpi City	1998-06-24	Legazpi City	7	\N	\N	College Graduate	3	1st Sem., 2016-2017	2020-05-18	2019-2020	\N
\.


--
-- Data for Name: transcript; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transcript (id, student_id, attestor_id, reviewer_id, registrar_id, remarks, revision, date_conferred, ref_no, series) FROM stdin;
2	2	5	1	1	\N	1	\N	\N	\N
1	1	5	1	1	\N	1	2021-05-26	02-A	2021
\.


--
-- Name: attended_community_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attended_community_resource_id_seq', 13, true);


--
-- Name: auth_cas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_cas_id_seq', 1, false);


--
-- Name: auth_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_event_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_membership_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: college_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.college_id_seq', 18, true);


--
-- Name: committee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.committee_id_seq', 4, true);


--
-- Name: community_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.community_resource_id_seq', 13, true);


--
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 56, true);


--
-- Name: enrollment_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollment_certificate_id_seq', 1, false);


--
-- Name: faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculty_id_seq', 6, true);


--
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grade_id_seq', 70, true);


--
-- Name: grades_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_certificate_id_seq', 1, false);


--
-- Name: program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.program_id_seq', 7, true);


--
-- Name: rle_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rle_course_id_seq', 11, true);


--
-- Name: rle_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rle_record_id_seq', 1, true);


--
-- Name: specialization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.specialization_id_seq', 4, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 2, true);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_seq', 3, true);


--
-- Name: transcript_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transcript_id_seq', 2, true);


--
-- Name: attended_community_resource attended_community_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attended_community_resource
    ADD CONSTRAINT attended_community_resource_pkey PRIMARY KEY (id);


--
-- Name: auth_cas auth_cas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_cas
    ADD CONSTRAINT auth_cas_pkey PRIMARY KEY (id);


--
-- Name: auth_event auth_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_event
    ADD CONSTRAINT auth_event_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_membership auth_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: college college_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_abbreviation_key UNIQUE (abbreviation);


--
-- Name: college college_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_name_key UNIQUE (name);


--
-- Name: college college_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_pkey PRIMARY KEY (id);


--
-- Name: committee committee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.committee
    ADD CONSTRAINT committee_pkey PRIMARY KEY (id);


--
-- Name: community_resource community_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.community_resource
    ADD CONSTRAINT community_resource_pkey PRIMARY KEY (id);


--
-- Name: course course_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_code_key UNIQUE (code);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- Name: enrollment_certificate enrollment_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_certificate
    ADD CONSTRAINT enrollment_certificate_pkey PRIMARY KEY (id);


--
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (id);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- Name: grades_certificate grades_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades_certificate
    ADD CONSTRAINT grades_certificate_pkey PRIMARY KEY (id);


--
-- Name: program program_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_abbreviation_key UNIQUE (abbreviation);


--
-- Name: program program_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_name_key UNIQUE (name);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: rle_course rle_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_course
    ADD CONSTRAINT rle_course_pkey PRIMARY KEY (id);


--
-- Name: rle_record rle_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_record
    ADD CONSTRAINT rle_record_pkey PRIMARY KEY (id);


--
-- Name: specialization specialization_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_name_key UNIQUE (name);


--
-- Name: specialization specialization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_pkey PRIMARY KEY (id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: student student_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_student_id_key UNIQUE (student_id);


--
-- Name: transcript transcript_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript
    ADD CONSTRAINT transcript_pkey PRIMARY KEY (id);


--
-- Name: attended_community_resource attended_community_resource_community_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attended_community_resource
    ADD CONSTRAINT attended_community_resource_community_resource_id_fkey FOREIGN KEY (community_resource_id) REFERENCES public.community_resource(id) ON DELETE CASCADE;


--
-- Name: attended_community_resource attended_community_resource_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attended_community_resource
    ADD CONSTRAINT attended_community_resource_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: auth_cas auth_cas_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_cas
    ADD CONSTRAINT auth_cas_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_event auth_event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_event
    ADD CONSTRAINT auth_event_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_membership auth_membership_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) ON DELETE CASCADE;


--
-- Name: auth_membership auth_membership_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_membership
    ADD CONSTRAINT auth_membership_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.auth_user(id) ON DELETE CASCADE;


--
-- Name: auth_permission auth_permission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.auth_group(id) ON DELETE CASCADE;


--
-- Name: college college_dean_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_dean_fkey FOREIGN KEY (dean) REFERENCES public.faculty(id) ON DELETE CASCADE;


--
-- Name: committee committee_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.committee
    ADD CONSTRAINT committee_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty(id) ON DELETE CASCADE;


--
-- Name: committee committee_transcript_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.committee
    ADD CONSTRAINT committee_transcript_id_fkey FOREIGN KEY (transcript_id) REFERENCES public.transcript(id) ON DELETE CASCADE;


--
-- Name: enrollment_certificate enrollment_certificate_registrar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_certificate
    ADD CONSTRAINT enrollment_certificate_registrar_fkey FOREIGN KEY (registrar) REFERENCES public.staff(id) ON DELETE CASCADE;


--
-- Name: enrollment_certificate enrollment_certificate_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment_certificate
    ADD CONSTRAINT enrollment_certificate_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: grade grade_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- Name: grade grade_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: grades_certificate grades_certificate_noted_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades_certificate
    ADD CONSTRAINT grades_certificate_noted_by_fkey FOREIGN KEY (noted_by) REFERENCES public.staff(id) ON DELETE CASCADE;


--
-- Name: grades_certificate grades_certificate_registrar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades_certificate
    ADD CONSTRAINT grades_certificate_registrar_fkey FOREIGN KEY (registrar) REFERENCES public.staff(id) ON DELETE CASCADE;


--
-- Name: grades_certificate grades_certificate_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades_certificate
    ADD CONSTRAINT grades_certificate_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: rle_record rle_record_registrar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_record
    ADD CONSTRAINT rle_record_registrar_id_fkey FOREIGN KEY (registrar_id) REFERENCES public.staff(id) ON DELETE CASCADE;


--
-- Name: rle_record rle_record_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rle_record
    ADD CONSTRAINT rle_record_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: specialization specialization_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specialization
    ADD CONSTRAINT specialization_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: student student_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(id) ON DELETE CASCADE;


--
-- Name: student student_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id) ON DELETE CASCADE;


--
-- Name: student student_specialization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_specialization_id_fkey FOREIGN KEY (specialization_id) REFERENCES public.specialization(id) ON DELETE CASCADE;


--
-- Name: transcript transcript_attestor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript
    ADD CONSTRAINT transcript_attestor_id_fkey FOREIGN KEY (attestor_id) REFERENCES public.faculty(id) ON DELETE CASCADE;


--
-- Name: transcript transcript_registrar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript
    ADD CONSTRAINT transcript_registrar_id_fkey FOREIGN KEY (registrar_id) REFERENCES public.staff(id) ON DELETE CASCADE;


--
-- Name: transcript transcript_reviewer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript
    ADD CONSTRAINT transcript_reviewer_id_fkey FOREIGN KEY (reviewer_id) REFERENCES public.faculty(id) ON DELETE CASCADE;


--
-- Name: transcript transcript_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcript
    ADD CONSTRAINT transcript_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

