--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: department; Type: TABLE; Schema: public; Owner: sales_dm_user
--

CREATE TABLE public.department (
    dept_id integer NOT NULL,
    dept_name text
);


ALTER TABLE public.department OWNER TO sales_dm_user;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: sales_dm_user
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    emp_fname text,
    emp_lname text,
    dept_id integer
);


ALTER TABLE public.employee OWNER TO sales_dm_user;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: sales_dm_user
--

CREATE TABLE public.sales (
    sales_id integer NOT NULL,
    sales_date date,
    sales_amount numeric(10,2),
    emp_id integer
);


ALTER TABLE public.sales OWNER TO sales_dm_user;

--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: sales_dm_user
--

COPY public.department (dept_id, dept_name) FROM stdin;
1	queens
2	manhattan-east
3	manhattan-west
4	manhattan-upper-east
5	manhattan-upper-west
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: sales_dm_user
--

COPY public.employee (emp_id, emp_fname, emp_lname, dept_id) FROM stdin;
1	Michale	Robbin	1
2	Carlos	Snares	2
3	Enric	Dosio	1
4	Jhon	Snares	2
5	Joseph	Dosni	3
6	Zanifer	Emily	3
7	Kuleswar	Sitaraman	1
8	Henrey	Gabriel	3
9	Alex	Manuel	1
10	George	Mardy	4
11	Mario	Saule	2
12	Alan	Snappy	4
13	Maria	Foster	1
14	Nickole	Tilde	4
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: sales_dm_user
--

COPY public.sales (sales_id, sales_date, sales_amount, emp_id) FROM stdin;
936	2020-11-23	8949.00	11
462	2019-06-11	8270.00	5
655	2020-01-06	1051.00	6
619	2022-05-22	7385.00	5
191	2022-03-18	4281.00	10
689	2021-03-22	249.00	1
112	2018-01-01	132.00	10
980	2018-12-29	990.00	13
906	2020-04-06	6601.00	6
781	2019-05-30	8284.00	7
387	2019-11-18	2389.00	5
272	2020-03-03	1811.00	6
777	2020-11-28	3630.00	12
790	2018-06-04	768.00	9
118	2021-01-07	2670.00	13
567	2022-02-12	6508.00	5
754	2018-01-14	6118.00	9
553	2022-09-06	5442.00	9
454	2022-09-12	2966.00	13
686	2018-09-23	6966.00	4
316	2021-05-10	535.00	11
967	2019-03-27	32.00	2
55	2020-08-27	365.00	12
196	2022-10-18	9890.00	1
548	2020-12-02	7132.00	12
962	2022-12-01	4862.00	3
284	2020-01-05	8971.00	1
586	2021-02-02	3188.00	11
422	2021-01-04	7163.00	12
393	2018-10-09	9681.00	5
42	2019-10-13	900.00	7
460	2021-03-06	3295.00	4
902	2020-08-28	563.00	13
921	2022-10-28	1741.00	10
465	2020-11-10	8940.00	11
254	2019-05-04	6215.00	8
346	2022-09-15	7701.00	11
205	2018-10-02	3472.00	2
820	2021-06-09	9922.00	10
123	2018-12-24	1980.00	5
640	2019-02-11	4882.00	5
493	2022-02-27	4766.00	11
9	2019-04-16	5238.00	13
973	2022-09-23	8323.00	7
389	2021-11-16	3847.00	7
375	2022-03-05	9007.00	7
676	2020-07-10	2477.00	11
369	2022-08-21	1489.00	2
618	2021-11-08	1601.00	9
299	2021-04-29	4075.00	9
295	2019-12-29	4967.00	4
232	2022-06-17	8786.00	12
845	2022-06-25	3336.00	10
472	2021-02-06	1587.00	6
39	2021-10-22	1010.00	10
365	2022-09-13	4076.00	1
705	2021-04-23	4309.00	2
48	2022-02-04	3457.00	13
868	2018-08-06	408.00	11
76	2021-08-01	176.00	7
852	2021-11-16	9425.00	1
507	2019-11-19	1221.00	9
162	2020-01-27	4178.00	9
951	2021-10-07	1144.00	3
263	2019-08-05	9487.00	4
883	2018-03-27	5677.00	7
366	2019-01-11	9902.00	12
438	2018-01-12	1784.00	11
575	2019-01-29	4707.00	8
379	2018-10-31	9019.00	9
940	2022-03-18	6106.00	13
554	2020-11-12	79.00	5
643	2021-03-24	5592.00	11
440	2018-06-03	2356.00	5
772	2019-03-01	8405.00	7
582	2020-07-17	4531.00	6
822	2022-04-16	6985.00	8
445	2022-04-06	1457.00	6
677	2018-03-24	5253.00	6
932	2022-06-03	180.00	13
453	2018-11-29	1945.00	2
861	2018-04-11	6318.00	2
323	2018-03-13	8175.00	1
92	2019-09-16	8139.00	5
294	2018-07-27	1669.00	5
24	2019-10-17	7994.00	11
527	2018-11-06	584.00	3
484	2018-06-30	3874.00	11
749	2021-03-04	6565.00	10
32	2021-08-04	9877.00	9
691	2019-03-08	2052.00	4
457	2020-09-11	1831.00	8
550	2022-09-26	5149.00	1
83	2019-05-12	5213.00	6
990	2022-04-26	9427.00	2
533	2020-05-22	7095.00	8
416	2022-06-03	6793.00	5
62	2022-07-04	2803.00	11
877	2019-09-25	1139.00	11
685	2019-03-19	2474.00	1
926	2021-12-25	9997.00	8
559	2019-10-15	7289.00	11
812	2022-10-15	1835.00	10
626	2020-07-22	7666.00	7
152	2021-04-22	9841.00	2
207	2022-10-17	7229.00	13
266	2022-05-19	7188.00	13
106	2021-12-21	1852.00	7
766	2019-07-31	763.00	10
899	2022-03-07	7325.00	4
255	2021-10-18	4640.00	2
546	2020-10-25	8439.00	8
96	2018-05-20	3780.00	7
796	2021-12-02	384.00	6
521	2019-06-16	355.00	8
44	2022-04-19	9090.00	11
258	2020-09-30	2441.00	11
195	2020-04-20	3836.00	2
285	2021-09-28	7660.00	4
593	2022-03-25	7191.00	1
245	2020-10-23	8925.00	6
887	2018-02-24	897.00	1
869	2018-08-24	2055.00	5
647	2022-09-17	137.00	5
134	2022-02-13	9650.00	3
836	2018-06-19	826.00	7
867	2019-08-03	4521.00	6
420	2019-05-04	4409.00	7
780	2019-05-25	8354.00	11
674	2020-10-31	7616.00	12
848	2020-08-31	1853.00	3
342	2018-05-13	5073.00	4
735	2019-04-24	323.00	7
374	2021-02-26	3805.00	2
752	2018-03-05	7620.00	11
900	2020-06-09	445.00	7
140	2022-01-23	1027.00	9
27	2021-11-07	1508.00	10
646	2021-11-06	295.00	13
497	2018-10-20	861.00	12
399	2019-10-11	5517.00	4
261	2022-07-18	6051.00	8
193	2018-09-07	8972.00	10
128	2020-03-25	9253.00	13
20	2022-01-07	637.00	10
952	2020-07-02	8973.00	6
211	2020-03-20	2100.00	8
557	2018-06-11	7227.00	1
59	2022-10-22	8637.00	13
234	2020-01-15	3676.00	10
712	2020-02-05	6911.00	2
324	2022-03-22	5868.00	5
262	2019-11-10	4972.00	8
29	2022-05-15	5969.00	6
209	2021-08-30	3298.00	12
508	2022-07-24	279.00	2
351	2020-06-21	6072.00	3
907	2018-07-16	9693.00	6
267	2018-01-25	506.00	13
90	2019-01-08	1018.00	3
770	2021-11-06	6130.00	11
975	2018-05-28	1916.00	2
212	2021-01-13	5812.00	10
545	2020-08-07	9726.00	5
702	2021-12-22	7588.00	10
864	2022-01-09	462.00	3
684	2018-05-14	3288.00	6
711	2022-12-21	2585.00	7
758	2018-08-25	727.00	2
919	2019-03-29	6727.00	2
467	2018-03-25	8858.00	9
682	2018-05-18	9452.00	5
690	2019-03-30	6738.00	3
949	2021-05-07	2512.00	13
730	2018-11-12	6608.00	6
93	2018-11-08	7499.00	1
571	2018-04-29	7676.00	2
630	2019-12-21	2661.00	14
716	2022-03-26	9019.00	14
34	2018-10-01	2906.00	14
549	2021-01-04	5240.00	14
290	2020-03-29	497.00	14
\.


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: sales_dm_user
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: sales_dm_user
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: sales_dm_user
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sales_id);


--
-- PostgreSQL database dump complete
--

