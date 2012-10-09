--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: jpsurvey_questions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (4, 2, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Question 1</property>
<property key="it">Domanda 1</property>
</properties>

', 0, 1, 0, 0);
INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (5, 2, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Question two</property>
<property key="it">Seconda domanda</property>
</properties>

', 1, 1, 0, 0);
INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (6, 2, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Last Question</property>
<property key="it">Ultima Domanda</property>
</properties>

', 2, 1, 0, 0);
INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (1, 1, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Question number one</property>
<property key="it">Domanda numero 1</property>
</properties>

', 0, 1, 0, 0);
INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (2, 1, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Question two</property>
</properties>

', 1, 1, 0, 0);
INSERT INTO jpsurvey_questions (id, surveyid, question, pos, singlechoice, minresponsenumber, maxresponsenumber) VALUES (3, 1, '<?xml version="1.0" encoding="UTF-8"?>
<properties>
<property key="en">Question three, multiple choices</property>
</properties>

', 2, 0, 2, 4);


--
-- PostgreSQL database dump complete
--
