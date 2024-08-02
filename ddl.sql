-- ���̺� ���� 1 : ���� ���Ǳ��� �ѹ���
create table emp (
	no varchar2(100) not null,
	name varchar2(100) default 'ȫ�浿' not null,
	addr varchar2(100) null,
	constraint emp_pk primary key (no)
);

-- ���̺� ���� 2 : ���� ������ ALTER ������
create table emp (
	no varchar2(100) not null,
	name varchar2(100) default 'ȫ�浿' not null,
	addr varchar2(100) null
);

alter table emp add constraint emp_pk primery key (no);

-- ���̺� ���� 3 : PK�� Į�� ������ �� �ѹ���
create table emp (
        no varchar2(100) primary key,
        name varchar2(100) default 'ȫ�浿' not null,
        addr varchar2(100) null
);

-- �ٸ� ���̺��� �����ͱ��� �����ؼ� �����
create table emp as select * from emp2; -- ��� �÷�
create table emp as select name from emp2; -- Ư�� �÷�
create table emp as select * from emp2 where 1 = 2; -- �����͸� ������ ���̺� ������ (1 = 2 �ϴ� �׻� ������ ������ ����� �����͸� �������� ����)

-- ���� ���� ����
--- 1. �θ�
create table �μ� (
	�μ���ȣ char(10), 
	�μ��� char(10),
	constraint ���������̸� primary key (�μ���ȣ)
);

--- 2. �ڽ�
create table ���� (
	������ȣ char(10), 
	�μ��� char(10), 
	constraint ���������̸� primary key (������ȣ), 
	constraint ���������̸� foreign key (�μ���) references �μ� (�μ���) on delete cascade 
	--- on delete cascade : �ɼ����� �μ� ���̺��� Ư�� �μ��� �����Ǹ�, �ش� �μ��� �����ϴ� ���� ���̺��� ��� �൵ �ڵ����� ������
);

-- �ε��� ����
create index idx_emp on emp (name);
--- �� ������ emp ���̺��� name �÷��� ���� �ε����� �����Ѵ�.
--- create index idx_emp : idx_emp��� �̸��� �ε����� �����Ѵ�.
--- on emp (name) : emp ���̺��� name �÷��� ���� �ε����� �����Ѵ�.
--- �ε����� ���� �˻� �ӵ��� ����Ű��, ���� �� ���� ������ �����ϰ� join ������ ����Ų��.

-- �������� ����
ALTER TABLE EMP ADD CONSTRAINT EMP_PK PRIMARY KEY (NO);

ALTER TABLE EMP ADD CONSTRAINT EMP_CK CHECK(LENGTH(NAME) > 2);  
--- name �÷��� ���� 2�� ������ ���� �����ϰų� ������Ʈ�Ϸ��� �� �� ������ �߻��Ѵ�.

-- �÷� �߰�
alter table emp add (phone varchar2(100));

-- Į�� �� ����
ALTER TABLE EMP RENAME COLUMN PHONE TO PHONE_NUM;

-- Į�� Ÿ�� ����
ALTER TABLE EMP MODIFY (PHONE_NUM VARCHAR2(200));

-- Į�� ����
ALTER TABLE EMP DROP COLUMN PHONE_NUM; 


-- ���̺� ��ü ����
DROP TABLE EMP;

-- ���̺��� �������� ����. ������ ��ü ����. �ѹ� �Ұ���, �ڵ� Ŀ��, ������ ������� ��� Release
TRUNCATE FROM EMP;

-- ���̺� �̸� ����
RENAME EMP TO EMP_AFTER;

