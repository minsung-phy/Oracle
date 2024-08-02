-- 데이터 삽입 : 전체 컬럼 데이터 입력시
INSERT INTO EMP VALUES ('1', '홍길동', '영등포');

-- 데이터 삽입 : 특정 컬럼 데이터 입력시
INSERT INTO EMP (NO, NAME) VALUES ('1', '홍길동');

-- 여러 행을 한번에 삽입
INSERT INTO EMP
        SELECT NO, NAME, ADDR FROM EMP2 WHERE ADDR = '영등포';

-- 데이터 수정 
UPDATE EMP SET ADDR = '강남' WHERE NAME = '홍길동';

-- 데이터 일부 삭제
DELETE FROM EMP WHERE NO = '1';

-- 데이터 전체 삭제. 롤백가능, 직접 커밋, 데이터 저장공간은 그대로 살아있음
DELETE FROM EMP;

-- 여러 테이블의 데이터를 한 테이블에 모으기
MERGE INTO 타겟테이블
        USING 소스테이블
        ON (타겟테이블.컬럼1 = 소스테이블.컬럼1)
        WHEN MATCHED THEN
                ... -- ON절 조건이 성립한다면 해당 쿼리 수행
        WHEN NOT MATCHED THEN
                ... -- ON절 조건이 성립하지 않는다면 해당 쿼리 수행
