--
-- PostgreSQL database dump
--

\restrict 6KTNKqjf9AV8CmDEhSid5kVhZubOBywg8PGJbmQIPEaXbe5maYlcpHMvM4znJN4

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-12-09 08:56:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "clientQueryManagement";
--
-- TOC entry 4908 (class 1262 OID 32768)
-- Name: clientQueryManagement; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "clientQueryManagement" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "clientQueryManagement" OWNER TO postgres;

\unrestrict 6KTNKqjf9AV8CmDEhSid5kVhZubOBywg8PGJbmQIPEaXbe5maYlcpHMvM4znJN4
\connect "clientQueryManagement"
\restrict 6KTNKqjf9AV8CmDEhSid5kVhZubOBywg8PGJbmQIPEaXbe5maYlcpHMvM4znJN4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 32777)
-- Name: queries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.queries (
    queryid integer NOT NULL,
    queryheading character varying(80),
    querydescription character varying(200),
    mailid character varying(100),
    mobilenumber character varying(13),
    querycreatedtime timestamp without time zone DEFAULT now(),
    status character varying(10),
    queryclosedtime timestamp without time zone,
    userid bigint
);


ALTER TABLE public.queries OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32776)
-- Name: queries_queryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.queries_queryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.queries_queryid_seq OWNER TO postgres;

--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 219
-- Name: queries_queryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.queries_queryid_seq OWNED BY public.queries.queryid;


--
-- TOC entry 218 (class 1259 OID 32770)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50),
    hashedpassword character varying(80),
    rolename character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32769)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4748 (class 2604 OID 32780)
-- Name: queries queryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries ALTER COLUMN queryid SET DEFAULT nextval('public.queries_queryid_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 32773)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4902 (class 0 OID 32777)
-- Dependencies: 220
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (47, 'Voice Service', 'Noise in the phone call line', 'rajesh@gmail.com', '6369365581', '2025-07-22 10:45:00', 'Closed', '2025-08-01 00:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (46, 'Voice Service', 'Noise in the phone call line', 'rajesh@gmail.com', '6638686049', '2025-02-26 11:38:00', 'Closed', '2025-02-27 00:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (2, 'Voice Service', 'Noise in the phone call line', 'rajesh@gmail.com', '6369365581', '2025-12-04 17:51:39.308109', 'Open', NULL, 2);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (77, 'Voice Service', 'unable to receive phone calls', 'venky@gmail.com', '818425068', '2025-03-19 11:38:00', 'Closed', '2025-03-20 16:20:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (5, 'Internet Connectivity', 'Icons not intuitive.', 'venky@gmail.com', '8523755943', '2025-12-04 17:51:39.308109', 'Open', NULL, 9);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (1, 'Internet Connectivity', 'No internet for past 3 days', 'saran@gmail.com', '6638686049', '2025-11-30 17:51:39.308109', 'Closed', '2025-12-05 09:21:39.308109', 1);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (4, 'Wi-Fi coverage', 'more than 2 devices couldn''t able to connect', 'saran@gmail.com', '4753393384', '2025-12-01 17:51:39.308109', 'Open', NULL, 1);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (6, 'OTT Diagnosis', 'SunNxt app is not working - Login', 'csathishit@gmail.com', '9438534769', '2025-12-05 21:18:08.882287', 'Closed', '2025-12-06 13:28:16.840368', 1);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (3, 'OTT Diagnosis', '3 OTT apps not able to login', 'seetha@gmail.com', '2686615523', '2025-12-04 17:51:39.308109', 'Closed', '2025-12-06 13:29:24.060328', 5);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (73, 'Technical Support', 'Download button is inactive.', 'venky@gmail.com', '6460794942', '2025-07-03 11:38:00', 'Closed', '2025-07-05 15:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (57, 'Wi-Fi coverage', 'More than 3 connections is not allowing', 'seetha@gmail.com', '3879415680', '2025-05-19 11:38:00', 'Closed', '2025-05-21 14:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (56, 'Subscription Cancellation', 'Cancel option not visible in settings.', 'rajesh@gmail.com', '9734118945', '2025-06-15 15:40:00', 'Closed', '2025-06-16 16:34:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (55, 'Wi-Fi coverage', 'Wi-Fi is not working properly', 'rajesh@gmail.com', '4191042037', '2025-06-18 10:40:00', 'Closed', '2025-06-20 16:50:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (94, 'Technical Support', 'White screen on startup.', 'saran@gmail.com', '5625215460', '2025-02-13 13:34:00', 'Closed', '2025-02-21 13:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (93, 'OTT Diagnosis', 'Amazon Prime app is not working properly', 'venky@gmail.com', '7530165333', '2025-04-09 17:25:00', 'Closed', '2025-04-14 10:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (91, 'Wi-Fi coverage', 'Need to check wi-fi coverage strength', 'saran@gmail.com', '8401095516', '2025-04-10 14:45:00', 'Closed', '2025-04-11 10:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (90, 'UI Feedback', 'Filter section takes too much space.', 'saran@gmail.com', '5292505993', '2025-04-06 10:50:00', 'Closed', '2025-04-08 09:58:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (89, 'Wi-Fi coverage', 'Wi-Fi is not working properly', 'saran@gmail.com', '3184013731', '2025-05-26 10:19:00', 'Closed', '2025-06-12 15:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (88, 'Voice Service', 'unable to make calls', 'saran@gmail.com', '6654327583', '2025-06-07 14:50:00', 'Closed', '2025-06-08 14:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (71, 'Technical Support', 'Slow performance during peak hours.', 'venky@gmail.com', '9428958105', '2025-05-28 14:10:00', 'Closed', '2025-06-01 14:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (70, 'Voice Service', 'Noise in the phone call line', 'venky@gmail.com', '8179811997', '2025-04-01 15:20:00', 'Closed', '2025-04-13 15:20:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (69, 'OTT Diagnosis', 'Few OTT app is not working', 'rajesh@gmail.com', '4288812024', '2025-02-10 10:00:00', 'Closed', '2025-02-13 10:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (68, 'Wi-Fi coverage', 'need to increase the no of wi-fi connections', 'venky@gmail.com', '1235104093', '2025-04-26 10:20:00', 'Closed', '2025-04-29 15:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (67, 'Technical Support', 'Live chat not launching.', 'venky@gmail.com', '1759888188', '2025-05-29 12:50:00', 'Closed', '2025-05-30 15:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (66, 'Wi-Fi coverage', 'only few Wi-Fi connections are allowed', 'rajesh@gmail.com', '3203920567', '2025-05-24 15:40:00', 'Closed', '2025-06-06 10:30:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (95, 'Login Issue', 'Forgot my password and reset is not working.', 'saran@gmail.com', '8172065417', '2025-02-17 14:19:00', 'Closed', '2025-03-02 12:50:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (85, 'Payment Failure', 'Charged twice for one payment.', 'saran@gmail.com', '2052334703', '2025-07-20 15:20:00', 'Closed', '2025-07-25 15:20:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (84, 'Technical Support', 'Download button is inactive.', 'rajesh@gmail.com', '9634484656', '2025-04-07 09:55:00', 'Closed', '2025-04-09 18:30:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (83, 'UI Feedback', 'Dark mode missing in login.', 'rajesh@gmail.com', '9058805245', '2025-07-19 09:37:00', 'Closed', '2025-07-26 10:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (82, 'Wi-Fi coverage', 'wi-fi coverage issue', 'rajesh@gmail.com', '2099154981', '2025-06-05 11:10:00', 'Closed', '2025-06-11 11:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (54, 'Payment Failure', 'Monthly payment failure', 'rajesh@gmail.com', '3033595411', '2025-07-23 11:25:00', 'Closed', '2025-07-24 10:30:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (53, 'Internet Connectivity', 'No internet for past 3 days', 'rajesh@gmail.com', '9214400119', '2025-06-10 15:40:00', 'Closed', '2025-06-12 11:11:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (52, 'OTT Diagnosis', 'OTT app subscription issue', 'venky@gmail.com', '5120344433', '2025-04-05 09:55:00', 'Closed', '2025-04-12 11:25:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (51, 'Technical Support', 'Modrem is not working. Software issue may be', 'rajesh@gmail.com', '5114031913', '2025-05-12 11:25:00', 'Closed', '2025-05-26 11:35:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (50, 'UI Feedback', 'Icons not intuitive.', 'rajesh@gmail.com', '8523755943', '2025-06-19 11:38:00', 'Closed', '2025-06-20 15:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (72, 'Subscription Cancellation', 'App locked after cancellation.', 'venky@gmail.com', '4441447695', '2025-03-17 15:40:00', 'Closed', '2025-03-19 10:50:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (65, 'Payment Failure', 'Payment shows success but app locked.', 'seetha@gmail.com', '5610385254', '2025-04-19 15:20:00', 'Closed', '2025-04-20 15:28:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (64, 'Technical Support', 'Cannot access to mobile app for payment settlement', 'seetha@gmail.com', '4538801808', '2025-02-19 12:10:00', 'Closed', '2025-02-20 15:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (63, 'Subscription Cancellation', 'Want refund for unused days.', 'seetha@gmail.com', '2206017563', '2025-05-27 15:20:00', 'Closed', '2025-05-29 10:49:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (62, 'Payment Failure', 'Need help with failed subscription payment.', 'seetha@gmail.com', '9995378276', '2025-05-29 12:10:00', 'Closed', '2025-06-01 10:08:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (61, 'Login Issue', 'Cannot log in on mobile app.', 'seetha@gmail.com', '4905937145', '2025-07-15 14:05:00', 'Closed', '2025-07-17 14:26:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (60, 'Internet Connectivity', 'Icons not intuitive.', 'seetha@gmail.com', '3917521611', '2025-04-11 11:00:00', 'Closed', '2025-04-22 10:58:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (49, 'Wi-Fi coverage', 'Wi-Fi signal strength is weak', 'saran@gmail.com', '4753393384', '2025-02-25 16:38:00', 'Closed', '2025-03-07 08:25:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (76, 'Voice Service', 'Frequent Disconnection for phone calls', 'venky@gmail.com', '4915591174', '2025-06-07 10:10:00', 'Closed', '2025-06-10 09:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (75, 'Internet Connectivity', 'Unable to access to web pages', 'venky@gmail.com', '1304088049', '2025-07-18 15:08:00', 'Closed', '2025-07-25 09:48:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (74, 'UI Feedback', 'Buttons overlap on smaller screens.', 'venky@gmail.com', '9777668613', '2025-04-23 09:55:00', 'Closed', '2025-05-03 10:50:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (105, 'Voice Noise Issue', 'Need to check phone line wire', 'csathishit@gmail.com', '9834859438', '2025-12-08 19:02:11.768889', 'Open', NULL, 1);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (92, 'UI Feedback', 'Color scheme hard to read in sunlight.', 'saran@gmail.com', '689770710', '2025-02-22 16:35:00', 'Closed', '2025-02-27 12:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (81, 'Wi-Fi coverage', 'need to config router for wi-fi configuration', 'rajesh@gmail.com', '242959217', '2025-07-16 10:40:00', 'Closed', '2025-07-17 15:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (80, 'Technical Support', 'Freezing during screen load.', 'rajesh@gmail.com', '4530781588', '2025-06-25 11:10:00', 'Closed', '2025-06-30 15:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (79, 'Payment Failure', 'Payment failed due to card error.', 'rajesh@gmail.com', '4779789604', '2025-04-01 15:30:00', 'Closed', '2025-04-08 14:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (78, 'Subscription Cancellation', 'Wrong account cancelled.', 'rajesh@gmail.com', '4162709388', '2025-06-15 14:50:00', 'Closed', '2025-06-19 15:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (98, 'Technical Support', 'Settings not saving properly.', 'venky@gmail.com', '7586052409', '2025-02-11 10:09:00', 'Closed', '2025-02-17 15:35:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (97, 'UI Feedback', 'Color scheme hard to read in sunlight.', 'rajesh@gmail.com', '2094516406', '2025-07-24 12:08:00', 'Closed', '2025-08-08 12:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (96, 'Subscription Cancellation', 'Auto-renew not turned off.', 'rajesh@gmail.com', '9180520966', '2025-04-12 15:10:00', 'Closed', '2025-04-19 14:48:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (87, 'Wi-Fi coverage', 'Need to include wi-fi connection mode by resettng', 'saran@gmail.com', '1283541419', '2025-02-23 12:54:00', 'Closed', '2025-02-27 15:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (86, 'Wi-Fi coverage', 'Need wi-fi connection is not able to display and connect', 'saran@gmail.com', '9722727167', '2025-06-24 11:10:00', 'Closed', '2025-06-25 10:40:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (48, 'OTT Diagnosis', 'OTT apps login issue', 'saran@gmail.com', '2686615523', '2025-06-18 15:25:00', 'Closed', '2025-06-19 11:20:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (59, 'Technical Support', 'Modrem software faulty', 'seetha@gmail.com', '3070184682', '2025-05-28 09:57:00', 'Closed', '2025-06-04 14:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (58, 'Wi-Fi coverage', 'Need extra coverage with booster', 'rajesh@gmail.com', '5617939417', '2025-03-16 15:00:00', 'Closed', '2025-03-29 17:00:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (104, 'Voice Service', 'unclear voice in phone', 'venky@gmail.com', '7930553343', '2025-02-08 12:30:00', 'Closed', '2025-02-10 10:05:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (103, 'Subscription Cancellation', 'App locked after cancellation.', 'venky@gmail.com', '926809499', '2025-06-19 10:21:00', 'Closed', '2025-06-20 10:20:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (102, 'Internet Connectivity', 'No internet for past 3 days', 'venky@gmail.com', '2150242565', '2025-04-29 10:45:00', 'Closed', '2025-05-10 09:45:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (101, 'Subscription Cancellation', 'Received cancellation email but charged again.', 'venky@gmail.com', '2634161688', '2025-03-15 11:08:00', 'Closed', '2025-03-18 14:10:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (100, 'Wi-Fi coverage', 'Time range in export is incorrect.', 'seetha@gmail.com', '47574843', '2025-07-14 11:20:00', 'Closed', '2025-07-17 10:45:00', NULL);
INSERT INTO public.queries (queryid, queryheading, querydescription, mailid, mobilenumber, querycreatedtime, status, queryclosedtime, userid) VALUES (99, 'Voice Service', 'Frequent Disconnection for phone calls', 'venky@gmail.com', '941377753', '2025-03-17 11:28:00', 'Closed', '2025-03-23 15:20:00', NULL);


--
-- TOC entry 4900 (class 0 OID 32770)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (1, 'saran', 'a33a5624ae62d707cef1435f8c8a49d5ec8dce6139d2292dd4cb6eef39987b23', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (2, 'rajesh', '9133ded07e03219d09baff9b6b0b44928703f691ae5ba7711d6f7a89fb954f1f', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (3, 'kishorekumar', '67690a557c1c997c04c2e743841218d06e9ee5555a23906763dc27c4b061f7e5', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (4, 'vasanthakumar', '45e1433270463f726eb78ce1a8cf6cdfb1ad318cb564e77962fa592ca9778bbe', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (5, 'seetha', 'c87c2d587a805d7cc94007e5699379e03c0803993cd28e1e10c954375f704fa3', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (6, 'ravi', 'c030f4e8c56498fe18f73f8b7ecd4b219adb8d45d986e5569bee1455b8718089', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (7, 'krishna', '5a985e6583f36caeb32cb300dfccb80a620bdaf39adb829ef594d4ab39a4ad54', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (8, 'kannan', '4105bd3cebfd9447ff84091778bda397b56f922e96a0bcfaedadf3166fc0068d', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (9, 'venkatesh', '50da717b06dddd215d425abf4c2730fcdae8b1c7dc58d400086926d5018e69e4', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (10, 'raviteja', 'a46ff81675e910f4a76a2372f7e522b5a9830d0ac5078b1541b9f89869f95e47', 'Client');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (11, 'saravana', 'dbd9c41540f24ed1163b0bd061cb1bdd8d2fea31cdb3233ec4eaba3a37aef64d', 'Support');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (12, 'santhosh', 'ea76ad3a5622acdff25d8f245020a425e4b0a20ca327af7f4fd882d1519ed2d6', 'Support');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (13, 'mani', '652c25d8b2a414d961354e35296e81d2f6aff7c1e98dd29ba0233cd9af463528', 'Support');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (14, 'jai', '8f9567387e24881fc91e9e79862a2b522466b2254e1a3af6d053c604597f0457', 'Support');
INSERT INTO public.users (userid, username, hashedpassword, rolename) VALUES (15, 'rajeshg', '81d1b3170a1f75ee4cf1170a683214a668570b833675a77775ee6704ca464a48', 'Support');


--
-- TOC entry 4912 (class 0 OID 0)
-- Dependencies: 219
-- Name: queries_queryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.queries_queryid_seq', 105, true);


--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 15, true);


--
-- TOC entry 4753 (class 2606 OID 32783)
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (queryid);


--
-- TOC entry 4751 (class 2606 OID 32775)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


-- Completed on 2025-12-09 08:56:25

--
-- PostgreSQL database dump complete
--

\unrestrict 6KTNKqjf9AV8CmDEhSid5kVhZubOBywg8PGJbmQIPEaXbe5maYlcpHMvM4znJN4

