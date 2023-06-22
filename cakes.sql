--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-22 11:28:20

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

--
-- TOC entry 6 (class 2615 OID 16507)
-- Name: cakes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cakes;


ALTER SCHEMA cakes OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 16836)
-- Name: 22(integer); Type: FUNCTION; Schema: cakes; Owner: postgres
--

CREATE FUNCTION cakes."22"(ee integer) RETURNS TABLE("Номер_заказа" integer, id integer, "ФИО" text, "Вид_торта" text, "Дизайн" text)
    LANGUAGE sql
    AS $$  
SELECT Номер_заказа, id, ФИО, Вид_торта, Вид_дизайна
FROM cakes."Заказы"
LEFT JOIN cakes."Клиенты" ON id = Клиент
LEFT JOIN cakes."Торты" ON Номер_торта = Торт
LEFT JOIN cakes."Дизайн" ON Дизайн = Номер_дизайна
WHERE id IN ( SELECT Клиент FROM cakes."Заказы" WHERE Номер_заказа = ee );  
$$;


ALTER FUNCTION cakes."22"(ee integer) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 16605)
-- Name: cakes_one(); Type: PROCEDURE; Schema: cakes; Owner: postgres
--

CREATE PROCEDURE cakes.cakes_one()
    LANGUAGE sql
    AS $$ 
UPDATE cakes."Заказы"  
SET Номер_заказа = '0' 
WHERE Клиент IS NULL; 
$$;


ALTER PROCEDURE cakes.cakes_one() OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 16830)
-- Name: cakes_one_2(); Type: PROCEDURE; Schema: cakes; Owner: postgres
--

CREATE PROCEDURE cakes.cakes_one_2()
    LANGUAGE sql
    AS $$  
UPDATE cakes."Заказы"   
SET Номер_дизайна = '2'  
WHERE Клиент IS NULL;  
$$;


ALTER PROCEDURE cakes.cakes_one_2() OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 16606)
-- Name: cakes_one_delete(integer); Type: PROCEDURE; Schema: cakes; Owner: postgres
--

CREATE PROCEDURE cakes.cakes_one_delete(IN z_id integer)
    LANGUAGE sql
    AS $$ 
DELETE FROM cakes."Дизайн" 
WHERE Дизайн = z_id; 
DELETE FROM cakes."Заказы" 
WHERE Номер_дизайна = z_id; 
$$;


ALTER PROCEDURE cakes.cakes_one_delete(IN z_id integer) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 16787)
-- Name: dell(); Type: FUNCTION; Schema: cakes; Owner: postgres
--

CREATE FUNCTION cakes.dell() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE i integer;
BEGIN
UPDATE cakes."Заказы" SET Клиент = null WHERE 
Клиент=OLD.id;

RETURN OLD;
END;
$$;


ALTER FUNCTION cakes.dell() OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 16785)
-- Name: sky(integer); Type: FUNCTION; Schema: cakes; Owner: postgres
--

CREATE FUNCTION cakes.sky(ee integer) RETURNS TABLE(id integer, name text)
    LANGUAGE sql
    AS $$ 
SELECT Номер_торта, Вид_торта 
FROM cakes."Торты" 
WHERE Номер_торта IN ( SELECT Торт FROM cakes."Заказы" WHERE Клиент = ee ); 
$$;


ALTER FUNCTION cakes.sky(ee integer) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 16781)
-- Name: sun(integer); Type: FUNCTION; Schema: cakes; Owner: postgres
--

CREATE FUNCTION cakes.sun(perc integer) RETURNS integer
    LANGUAGE sql
    AS $$
SELECT (Номер_заказа)*(100-perc)
FROM cakes."Заказы"; 
$$;


ALTER FUNCTION cakes.sun(perc integer) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 16815)
-- Name: sun_2(integer); Type: FUNCTION; Schema: cakes; Owner: postgres
--

CREATE FUNCTION cakes.sun_2(col integer) RETURNS integer
    LANGUAGE sql
    AS $$ 
SELECT (Цена)*col
FROM cakes."Размер";  
$$;


ALTER FUNCTION cakes.sun_2(col integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16551)
-- Name: Адрес ; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Адрес " (
    "ID_адреса" integer NOT NULL,
    "Улица" character varying(100) NOT NULL,
    "Дом" integer NOT NULL,
    "Квартира" integer NOT NULL
);


ALTER TABLE cakes."Адрес " OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16513)
-- Name: Заказы; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Заказы" (
    "Номер_заказа" integer NOT NULL,
    "Торт" integer,
    "Клиент" integer,
    "Размер" integer,
    "не знаю" integer
);


ALTER TABLE cakes."Заказы" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16825)
-- Name: Заказы_клиенты; Type: VIEW; Schema: cakes; Owner: postgres
--

CREATE VIEW cakes."Заказы_клиенты" AS
 SELECT "Заказы"."Клиент",
    count(*) AS count
   FROM cakes."Заказы"
  GROUP BY "Заказы"."Клиент"
 HAVING ("Заказы"."Клиент" IS NOT NULL);


ALTER TABLE cakes."Заказы_клиенты" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16518)
-- Name: Клиенты; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Клиенты" (
    id integer NOT NULL,
    "Адрес " integer,
    "Фамилия " character varying(100),
    "Имя" character varying(100),
    "Отчество " character varying(100)
);


ALTER TABLE cakes."Клиенты" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16868)
-- Name: Пользователь; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Пользователь" (
    "id_пользователя" integer NOT NULL,
    "Логин" character varying,
    "Пароль" integer,
    "Аватарка" character varying,
    "Клиенты" integer NOT NULL
);


ALTER TABLE cakes."Пользователь" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16576)
-- Name: Размер; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Размер" (
    "номер_размера" integer NOT NULL,
    "Цена" integer,
    "Размер" character varying(100)
);


ALTER TABLE cakes."Размер" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16508)
-- Name: Торты; Type: TABLE; Schema: cakes; Owner: postgres
--

CREATE TABLE cakes."Торты" (
    "Номер_торта" integer NOT NULL,
    "Вид_торта" character varying(50)
);


ALTER TABLE cakes."Торты" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16593)
-- Name: Заказы_размер; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."Заказы_размер" AS
 SELECT "Заказы"."Номер_заказа",
    avg("Заказы"."Размер") AS avg
   FROM cakes."Заказы"
  GROUP BY "Заказы"."Номер_заказа";


ALTER TABLE public."Заказы_размер" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16589)
-- Name: Размер_макс; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."Размер_макс" AS
 SELECT "Размер"."номер_размера",
    "Размер"."Цена",
    "Размер"."Размер"
   FROM cakes."Размер"
  WHERE ("Размер"."Цена" = ( SELECT max("Размер_1"."Цена") AS max
           FROM cakes."Размер" "Размер_1"));


ALTER TABLE public."Размер_макс" OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 16551)
-- Dependencies: 218
-- Data for Name: Адрес ; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Адрес " ("ID_адреса", "Улица", "Дом", "Квартира") FROM stdin;
2	Молодежная	22	4
1	Прибалтийская	35	58
3	Профсоюзов	36	26
4	Ленинградская	1	5
5	Ленинградская	99	1
\.


--
-- TOC entry 3378 (class 0 OID 16513)
-- Dependencies: 216
-- Data for Name: Заказы; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Заказы" ("Номер_заказа", "Торт", "Клиент", "Размер", "не знаю") FROM stdin;
1	1	1	3	1
2	2	5	2	2
3	3	3	1	3
4	4	4	1	4
5	6	5	4	2
\.


--
-- TOC entry 3379 (class 0 OID 16518)
-- Dependencies: 217
-- Data for Name: Клиенты; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Клиенты" (id, "Адрес ", "Фамилия ", "Имя", "Отчество ") FROM stdin;
1	1	Головенко	Анастасия	Алексеевна
3	3	Горохов	Петр	Николаевич
4	4	Сидоров	Василий	Владимирович
5	5	Зайцева	Анна	Петровна
\.


--
-- TOC entry 3382 (class 0 OID 16868)
-- Dependencies: 223
-- Data for Name: Пользователь; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Пользователь" ("id_пользователя", "Логин", "Пароль", "Аватарка", "Клиенты") FROM stdin;
1	пирожок	2004	\N	1
2	с картошкой	1245	\N	3
3	наверное	9988	\N	4
4	не точно	1111	\N	5
\.


--
-- TOC entry 3381 (class 0 OID 16576)
-- Dependencies: 219
-- Data for Name: Размер; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Размер" ("номер_размера", "Цена", "Размер") FROM stdin;
2	1200	1 кг 200х200
4	1100	1 кг 200мм
1	600	0.5 кг 120х120
3	700	0.5 кг 160мм
\.


--
-- TOC entry 3377 (class 0 OID 16508)
-- Dependencies: 215
-- Data for Name: Торты; Type: TABLE DATA; Schema: cakes; Owner: postgres
--

COPY cakes."Торты" ("Номер_торта", "Вид_торта") FROM stdin;
3	Красный бархат
5	Чизкейк
1	Чёрный лес
2	Черемуховый
4	Сицилийский
6	Бананово-клубничный
7	Клубничный
\.


--
-- TOC entry 3220 (class 2606 OID 16555)
-- Name: Адрес  Адрес _pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Адрес "
    ADD CONSTRAINT "Адрес _pkey" PRIMARY KEY ("ID_адреса");


--
-- TOC entry 3216 (class 2606 OID 16534)
-- Name: Заказы Заказы_pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Заказы"
    ADD CONSTRAINT "Заказы_pkey" PRIMARY KEY ("Номер_заказа");


--
-- TOC entry 3218 (class 2606 OID 16540)
-- Name: Клиенты Клиенты_pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Клиенты"
    ADD CONSTRAINT "Клиенты_pkey" PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16874)
-- Name: Пользователь Пользователь_pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Пользователь"
    ADD CONSTRAINT "Пользователь_pkey" PRIMARY KEY ("id_пользователя");


--
-- TOC entry 3222 (class 2606 OID 16582)
-- Name: Размер Размер_pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Размер"
    ADD CONSTRAINT "Размер_pkey" PRIMARY KEY ("номер_размера");


--
-- TOC entry 3214 (class 2606 OID 16546)
-- Name: Торты Торты_pkey; Type: CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Торты"
    ADD CONSTRAINT "Торты_pkey" PRIMARY KEY ("Номер_торта");


--
-- TOC entry 3231 (class 2620 OID 16788)
-- Name: Клиенты remove_user; Type: TRIGGER; Schema: cakes; Owner: postgres
--

CREATE TRIGGER remove_user BEFORE DELETE ON cakes."Клиенты" FOR EACH ROW EXECUTE FUNCTION cakes.dell();


--
-- TOC entry 3229 (class 2606 OID 16556)
-- Name: Клиенты Адрес ; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Клиенты"
    ADD CONSTRAINT "Адрес " FOREIGN KEY ("Адрес ") REFERENCES cakes."Адрес "("ID_адреса") NOT VALID;


--
-- TOC entry 3225 (class 2606 OID 16561)
-- Name: Заказы Клиенты; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Заказы"
    ADD CONSTRAINT "Клиенты" FOREIGN KEY ("Клиент") REFERENCES cakes."Клиенты"(id) NOT VALID;


--
-- TOC entry 3226 (class 2606 OID 16875)
-- Name: Заказы Не знаю; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Заказы"
    ADD CONSTRAINT "Не знаю" FOREIGN KEY ("не знаю") REFERENCES cakes."Пользователь"("id_пользователя") NOT VALID;


--
-- TOC entry 3227 (class 2606 OID 16584)
-- Name: Заказы Размер ; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Заказы"
    ADD CONSTRAINT "Размер " FOREIGN KEY ("Размер") REFERENCES cakes."Размер"("номер_размера") NOT VALID;


--
-- TOC entry 3228 (class 2606 OID 16566)
-- Name: Заказы Торт; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Заказы"
    ADD CONSTRAINT "Торт" FOREIGN KEY ("Торт") REFERENCES cakes."Торты"("Номер_торта") NOT VALID;


--
-- TOC entry 3230 (class 2606 OID 16885)
-- Name: Пользователь клиенты; Type: FK CONSTRAINT; Schema: cakes; Owner: postgres
--

ALTER TABLE ONLY cakes."Пользователь"
    ADD CONSTRAINT "клиенты" FOREIGN KEY ("Клиенты") REFERENCES cakes."Клиенты"(id) NOT VALID;


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA cakes; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA cakes TO read_;
GRANT USAGE ON SCHEMA cakes TO paste_;
GRANT USAGE ON SCHEMA cakes TO update_;
GRANT USAGE ON SCHEMA cakes TO delete_;
GRANT USAGE ON SCHEMA cakes TO "User_";
GRANT USAGE ON SCHEMA cakes TO managers;
GRANT USAGE ON SCHEMA cakes TO logon_user;
GRANT USAGE ON SCHEMA cakes TO moderator;


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 242
-- Name: FUNCTION "22"(ee integer); Type: ACL; Schema: cakes; Owner: postgres
--

GRANT ALL ON FUNCTION cakes."22"(ee integer) TO logon_user;


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE "Адрес "; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT ON TABLE cakes."Адрес " TO read_;
GRANT INSERT ON TABLE cakes."Адрес " TO paste_;
GRANT UPDATE ON TABLE cakes."Адрес " TO update_;
GRANT DELETE ON TABLE cakes."Адрес " TO delete_;
GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Адрес " TO managers;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE "Заказы"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT ON TABLE cakes."Заказы" TO read_;
GRANT INSERT ON TABLE cakes."Заказы" TO paste_;
GRANT UPDATE ON TABLE cakes."Заказы" TO update_;
GRANT DELETE ON TABLE cakes."Заказы" TO delete_;
GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Заказы" TO managers;
GRANT DELETE ON TABLE cakes."Заказы" TO logon_user;
GRANT SELECT ON TABLE cakes."Заказы" TO moderator;


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 216 3391
-- Name: COLUMN "Заказы"."Номер_заказа"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("Номер_заказа") ON TABLE cakes."Заказы" TO "User_";
GRANT SELECT("Номер_заказа") ON TABLE cakes."Заказы" TO logon_user;


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 216 3391
-- Name: COLUMN "Заказы"."Торт"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("Торт"),INSERT("Торт") ON TABLE cakes."Заказы" TO logon_user;


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 216 3391
-- Name: COLUMN "Заказы"."Клиент"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("Клиент") ON TABLE cakes."Заказы" TO "User_";
GRANT SELECT("Клиент"),INSERT("Клиент"),UPDATE("Клиент") ON TABLE cakes."Заказы" TO logon_user;


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 216 3391
-- Name: COLUMN "Заказы"."Размер"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("Размер") ON TABLE cakes."Заказы" TO logon_user;


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE "Заказы_клиенты"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Заказы_клиенты" TO managers;
GRANT DELETE ON TABLE cakes."Заказы_клиенты" TO delete_;


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE "Клиенты"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT ON TABLE cakes."Клиенты" TO read_;
GRANT INSERT ON TABLE cakes."Клиенты" TO paste_;
GRANT UPDATE ON TABLE cakes."Клиенты" TO update_;
GRANT DELETE ON TABLE cakes."Клиенты" TO delete_;
GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Клиенты" TO managers;


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 217 3397
-- Name: COLUMN "Клиенты".id; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT(id) ON TABLE cakes."Клиенты" TO "User_";


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Размер"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT ON TABLE cakes."Размер" TO read_;
GRANT INSERT ON TABLE cakes."Размер" TO paste_;
GRANT UPDATE ON TABLE cakes."Размер" TO update_;
GRANT DELETE ON TABLE cakes."Размер" TO delete_;
GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Размер" TO managers;
GRANT SELECT ON TABLE cakes."Размер" TO moderator;


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 219 3399
-- Name: COLUMN "Размер"."номер_размера"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("номер_размера") ON TABLE cakes."Размер" TO logon_user;


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 219 3399
-- Name: COLUMN "Размер"."Размер"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT("Размер") ON TABLE cakes."Размер" TO logon_user;


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE "Торты"; Type: ACL; Schema: cakes; Owner: postgres
--

GRANT SELECT ON TABLE cakes."Торты" TO read_;
GRANT INSERT ON TABLE cakes."Торты" TO paste_;
GRANT UPDATE ON TABLE cakes."Торты" TO update_;
GRANT DELETE ON TABLE cakes."Торты" TO delete_;
GRANT SELECT ON TABLE cakes."Торты" TO "User_";
GRANT SELECT,INSERT,UPDATE ON TABLE cakes."Торты" TO managers;
GRANT SELECT ON TABLE cakes."Торты" TO logon_user;
GRANT SELECT ON TABLE cakes."Торты" TO moderator;


-- Completed on 2023-06-22 11:28:21

--
-- PostgreSQL database dump complete
--

