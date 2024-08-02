-- 테이블 생성 1 : 제약 조건까지 한번에
create table emp (
	no varchar2(100) not null,
	name varchar2(100) default '홍길동' not null,
	addr varchar2(100) null,
	constraint emp_pk primary key (no)
);

-- 테이블 생성 2 : 제약 조건은 ALTER 문으로
create table emp (
	no varchar2(100) not null,
	name varchar2(100) default '홍길동' not null,
	addr varchar2(100) null
);

alter table emp add constraint emp_pk primery key (no);

-- 테이블 생성 3 : PK를 칼럼 선언할 때 한번에
create table emp (
        no varchar2(100) primary key,
        name varchar2(100) default '홍길동' not null,
        addr varchar2(100) null
);

-- 다른 테이블에서 데이터까지 복사해서 만들기
create table emp as select * from emp2; -- 모든 컬럼
create table emp as select name from emp2; -- 특정 컬럼
create table emp as select * from emp2 where 1 = 2; -- 데이터를 제외한 테이블 구조만 (1 = 2 하는 항상 거짓인 조건을 사용해 데이터를 선택하지 않음)

-- 참조 관계 정의
--- 1. 부모
create table 부서 (
	부서번호 char(10), 
	부서명 char(10),
	constraint 제약조건이름 primary key (부서번호)
);

--- 2. 자식
create table 직원 (
	직원번호 char(10), 
	부서명 char(10), 
	constraint 제약조건이름 primary key (직원번호), 
	constraint 제약조건이름 foreign key (부서명) references 부서 (부서명) on delete cascade 
	--- on delete cascade : 옵션으로 부서 테이블의 특정 부서가 삭제되면, 해당 부서를 참조하는 직원 테이블의 모든 행도 자동으로 삭제됨
);

-- 인덱스 생성
create index idx_emp on emp (name);
--- 이 구문은 emp 테이블의 name 컬럼에 대해 인덱스를 생성한다.
--- create index idx_emp : idx_emp라는 이름의 인덱스를 생성한다.
--- on emp (name) : emp 테이블의 name 컬럼에 대해 인덱스를 생성한다.
--- 인덱스를 통해 검색 속도를 향상시키고, 정렬 및 집계 성능을 개선하고 join 성능을 향상시킨다.

-- 제약조건 생성
ALTER TABLE EMP ADD CONSTRAINT EMP_PK PRIMARY KEY (NO);

ALTER TABLE EMP ADD CONSTRAINT EMP_CK CHECK(LENGTH(NAME) > 2);  
--- name 컬럼의 값이 2자 이하인 행을 삽입하거나 업데이트하려고 할 때 오류가 발생한다.

-- 컬럼 추가
alter table emp add (phone varchar2(100));

-- 칼럼 명 변경
ALTER TABLE EMP RENAME COLUMN PHONE TO PHONE_NUM;

-- 칼럼 타입 변경
ALTER TABLE EMP MODIFY (PHONE_NUM VARCHAR2(200));

-- 칼럼 삭제
ALTER TABLE EMP DROP COLUMN PHONE_NUM; 


-- 테이블 전체 삭제
DROP TABLE EMP;

-- 테이블은 삭제하지 않음. 데이터 전체 삭제. 롤백 불가능, 자동 커밋, 데이터 저장공간 모두 Release
TRUNCATE FROM EMP;

-- 테이블 이름 변경
RENAME EMP TO EMP_AFTER;

