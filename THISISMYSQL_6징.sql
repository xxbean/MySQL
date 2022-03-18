-- 6장 기본구문에 대한 것

-- SELECT 문

-- USE 데이터베이스 (이 구문을 사용하겠다. 여기서 실행해라)
-- SELECT 열이름 FROM 테이블이름 WHERE 조건 (조건이 없으면 열을 모두 조회. 모든 열을 조회하려면 *)
-- 만약에 USE 를 사용하지 않고 선택을 하려고 하면, SELECT 열이름 FROM 데이터베이스이름.테이블이름
-- INSERT INTO 테이블 VALUES(데이터)

-- 하이픈 두개는 주석 /* (내용 넣기) */ 요렇게도 사용가능

SHOW DATABASES ;
-- 지금 있는 데이터 베이스 목록을 보여줌
SHOW TABLE STATUS ;
-- use로 선택한 데이터 베이스 안에 있는 table 내용조회 


-- 수업 전반에서 활용할 DB를 만들어 봅시다.

CREATE DATABASE sqldb ;
USE sqldb ; 
CREATE TABLE usertbl(
userid CHAR(8) NOT NULL PRIMARY KEY, -- char는 내부적으로도 8자리
name VARCHAR(10) NOT NULL, -- varchar 는 그냥 개수대로 내부적으로 정리
birthyear INT NOT NULL,
addr CHAR(2) NOT NULL,
mobile1 CHAR(3),
mobile2 CHAR(8),
height SMALLINT, -- 정수의 범위에 따라서 int small int 나뉨
mDate DATE
) ;

CREATE TABLE buytbl(
num INT AUTO_INCREMENT NOT NULL PRIMARY KEY , -- 자동으로 생성
userid CHAR(8) NOT NULL,
prodname CHAR(6) not null , 
groupname CHAR(4),
price INT not null,
amount SMALLINT NOT NULL,
FOREIGN KEY (userid) REFERENCES usertbl(userid)
);

-- 테이블 만들었구
-- insert 합시다.

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM usertbl;
SELECT * FROM buytbl;

-- where 절은 특정한 조건의 데이터를 선택하는 것에 이용
-- SELECT * FROM 테이블 WHERE 뭐 = '뭐'
-- WHRER 이후에 조건문도 가능 OR AND 도 이용가능 , IN (어디,어디,어디) 도 가능
-- WHERE 열 like 김 이러면 김이 들어가는 모든 이름

-- 서브쿼리문 쿼리안에 쿼리
-- 서브쿼리는 쿼리문 안에 또 다른 쿼리문을 포함할 수 있는 쿼리 문장이며, 서브 쿼리문은 소괄호를 감싸둬야하는데 그 이유는 소괄호를 먼저 실행해야 하기 때문입니다.
-- select ename, sal from emp where sal=(select min(sal) from emp);
-- 여기서 한건만 나와야하는데 만약 그 경우가 아닌 경우 ANY를 사용함으로써 해결가능함.
-- ANY를 ALL로 바꾸면 두 조건을 모두 만족해야해

-- SELECT * FROM 테이블 이름 ORDER BY 열이름 (기본은 오름차순 DESC(요거 넣으면 내림차순))
-- 결과에 상관은 없고 정렬만 해줌

-- SELECT distinct 열이름 FROM 테이블 ; 이렇게 하면 하나씩만 나오는 유니크 값이 출력
-- limit 문은 나중에 추가해주면댐 limit 100 이런식으로 

-- CREATE TABLE 만들 테이블 이름 (SELECT 복사할 열 FROM 복사할 테이블)
-- 이렇게 하면 copy 입니다 , 제약조건은 복사하지 않음

-- SELECT FROM WHERE GROUP BY, HAVING , ORDER BY 요게 기본 순서고 필요에 따라 생략가능

USE sqldb;
SELECT userid, amount FROM buytbl ORDER BY userid ; 
-- 근데 이거에 대해서 합계를 알고 싶어요 ! user id 기준 sum 을 이용합시다.

SELECT userid, sum(amount) FROM buytbl GROUP BY userid ; 
-- 여기서 열 이름을 임시로 바꾸고 싶으면 AS 이용
SELECT userid AS '사용자아이디', sum(amount) FROM buytbl GROUP BY userid ; 
SELECT userid AS '사용자아이디', sum(price*amount) FROM buytbl GROUP BY userid ;
-- AVR, MAX, MIN 등 함수와 자주 쓰는 함수니까 알고 있기 
-- 다 나오게 하려면 서브쿼리와 함꼐 사용합시다.
SELECT userid AS '사용자아이디', sum(price*amount) FROM buytbl GROUP BY userid HAVING sum(price*amount)>1000;
-- 이중에서 특정 조건만 보고 싶은데 group fun 쓰면 where 가 아닌 having
-- 마지막에 with rollup 을 통해서 각각에 대한 합계와 총합계까지 함께

SELECT COUNT(*) FROM usertbl;
SELECT COUNT(mobile1) FROM usertbl;
-- 개수를 셀수 있고 () 안에 원하는 것을 넣어주면댐 . 아래 구문 같은 경우에는 모바일1있는사람이 8명이다



-- SQL 문의 종류
-- DML (데이터 조작) DDL(데이터정의어 create alter delete) DCL(사용자 관리)

INSERT INTO 테이블 이름 VALUES (값1, 값2, ...) ;
INSERT INTO 특정 열1, 2 VALUES (값1, 값2) ; -- 이러면 나머지는 알아서 들어가요

-- 테이블 생성시 항목 AUTO INCREMENT(=초기값 지정 원하면 여기 넣어주기) 치면 자동으로 1부터 증가하는 값을 가진다. 이떄 pk 나 유니크 지정 필수
-- SET @@ AUTO INCREMENT = 3 (이러면 삼 등차로)

/*
INSERT INTO 어디에
INSERT IGNORE INTO -- 이렇게 하면 오류가 난건 무시하고 넘어가고 다른거는 입력해라 !
ON DUPLICATE KEY 어쩌구 이렇게 insert 뒤에 붙여주면 pk 에서 중복이 있는 것에 대한 처리가능
SELECT 선택함 -- 이러면 select를 통해 선택한 것을 insert 할 수잇다.
*/

-- 데이터 수정
/*
UPDATE 테이블이름 SET 열=값, 열2 = 값3 WHERE 조건 ; (이떄 where 은 생략 가능하지만 거의 같이 쓰인다.)
DELETE FROM 테이블이름 WHERE 조건 LIMIT 개수 (where 이후로 생략가능 , 보통 이용합니다. )
DROP 테이블 -- 이건 테이블이 완전 날라감
*/

