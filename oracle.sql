CREATE TABLE topic (
	id NUMBER NOT NULL,
	title VARCHAR2(50) NOT NULL,
	description VARCHAR2(4000) NULL,
	created DATE NOT NULL
);

SELECT table_name FROM all_tables WHERE OWNER = 'MINSUNG';

INSERT INTO topic
	(id, title, description, created)
	VALUES
	(1, 'ORACLE', 'ORACLE is ...', SYSDATE);

INSERT INTO topic
	(id, title, description, created)
	VALUES
	(2, 'MySQL', 'MySQL is ...', SYSDATE);
	
INSERT INTO topic
	(id, title, description, created)
	VALUES
	(3, 'SQL Server', 'SQL Server is ...', SYSDATE);

commit;

SELECT * FROM topic;

SELECT id, title, created FROM topic;

SELECT * FROM topic WHERE id = 1;

SELECT * FROM topic WHERE id > 1;

SELECT id, title, created FROM topic WHERE id = 1;

SELECT * FROM topic ORDER BY id DESC;

SELECT * FROM topic ORDER BY id ASC;

SELECT * FROM topic ORDER BY title ASC;

SELECT * FROM topic OFFSET 1 ROWS;

SELECT * FROM topic OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

UPDATE topic 
	SET 
	title = 'MSSQL', 
	description = 'MSSQL is ...'
	WHERE
		id = 3;

commit;

DELETE FROM topic WHERE id = 3;

commit;

DROP TABLE topic;

CREATE TABLE topic (
	id NUMBER NOT NULL,
 	title VARCHAR2(50) NOT NULL,
  	description VARCHAR2(4000) NULL,
  	created DATE NOT NULL,
    CONSTRAINT PK_TOPIC PRIMARY KEY(id)
);

INSERT INTO topic
	(id, title, description, created)
	VALUES
	(1, 'ORACLE', 'ORACLE is ...', SYSDATE);

INSERT INTO topic
	(id, title, description, created)
	VALUES
	(2, 'MySQL', 'MySQL is ...', SYSDATE);
	
INSERT INTO topic
	(id, title, description, created)
	VALUES
	(3, 'SQL Server', 'SQL Server is ...', SYSDATE);

commit;

CREATE SEQUENCE SEQ_TOPIC;

DELETE FROM topic;

commit;

INSERT INTO topic
	(id, title, description, created)
	VALUES
	(SEQ_TOPIC.NEXTVAL, 'ORACLE', 'ORACLE is ...', SYSDATE);
	
INSERT INTO topic
	(id, title, description, created)
	VALUES
	(SEQ_TOPIC.NEXTVAL, 'MySQL', 'MySQL is ...', SYSDATE);
	
INSERT INTO topic
	(id, title, description, created)
	VALUES
	(SEQ_TOPIC.NEXTVAL, 'SQL Server', 'SQL Server is ...', SYSDATE);

commit;

SELECT SEQ_TOPIC.CURRVAL FROM topic;

SELECT SEQ_TOPIC.CURRVAL FROM DUAL;

CREATE TABLE author (
	id NUMBER NOT NULL,
	name VARCHAR2(20) NOT NULL,
	profile VARCHAR2(50),
	CONSTRAINT PK_AUTHOR PRIMARY KEY(id)
);

CREATE SEQUENCE SEQ_AUTHOR;

INSERT INTO author (id, name, profile) VALUES (SEQ_AUTHOR.nextval, 'egoing', 'developer');
INSERT INTO author (id, name, profile) VALUES (SEQ_AUTHOR.nextval, 'duru', 'DBA');
INSERT INTO author (id, name, profile) VALUES (SEQ_AUTHOR.nextval, 'taeho', 'data scientist');

commit;

ALTER TABLE TOPIC ADD (AUTHOR_ID NUMBER);

UPDATE TOPIC SET AUTHOR_ID = 1 WHERE id = 1;
UPDATE TOPIC SET AUTHOR_ID = 2 WHERE id = 2;
UPDATE TOPIC SET AUTHOR_ID = 3 WHERE id = 3;

commit;

SELECT * FROM topic LEFT JOIN author ON topic.author_id = author.id;

SELECT topic.id, title, name FROM topic LEFT JOIN author ON topic.author_id = author.id;

SELECT topic.id TOPIC_ID, title, name FROM topic LEFT JOIN author ON topic.author_id = author.id;

SELECT T.id TOPIC_ID, title, name FROM topic T LEFT JOIN author ON T.author_id = author.id;
