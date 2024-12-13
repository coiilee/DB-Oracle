/*
USE DATABASE; 명칭은 
한 회사에서 여러 서비스를 제공하고, 
각 서비스에 따른 데이터베이스에 접속할 때 사용하는 기능 

예를들어 KEKEO 회사가 MALON , DEUM, KEKEOTALK 데이터를 관리할 때 
MYSQL 회사 SQL을 이용해서 관리를 하고, 각 데이터 베이스에 유저가 접근하기 위해서는 
1. 유저 아이디, 비밀번호로 접속 
2. DEUM 데이터베이스에 접속해서 회원정보나 게시글관리 테이블 확인하길 원한다면 
   USE DEUM;
   SELECT * FROM DEUM회원정보테이블; 
   
   MALON 데이터베이스에 접속해서 회원정보, 음악목록 테이블 조회하길 원한다면 
   USE MALON; 
   SELECT * FROM MALON테이블; 
   
   KEKEOTALK 데이터베이스 접속해서 회원정보, 대화목록 테이블 조회하길 원한다면 
   USE KEKEOTALK; 
   SELECT * FROM KEKEOTALK_USER; 
   SELECT * FROM TALKLIST테이블;  
*/

-- USE KHTDB접속 
USE KHTDB; -- 로그인 후 확인하고자 하는 데이터베이스 명칭 작성한 후 사용하겠다는 선언 
-- SELECT INSERT UPDATE와 같은 DML DDL DCL 구문은 대소문자 구분 X 
-- 이외 데이터베이스 명칭, 유저명칭, 비밀번호 모두 대소문자 구분 O  
-- 유저가 보고자 하는 데이터베이스가 존재하지 않을 대 발생하는 Error code : 1046. No database selected 

CREATE TABLE USER (
    user_id INT PRIMARY KEY auto_increment,       -- 유저의 가입 순서
    user_name VARCHAR(100) NOT NULL,  		      -- 유저 이름
    location VARCHAR(255),         				  -- 유저 주소 
    contact_number VARCHAR(20)   			 	  -- 유저 연락처 
);
select * from user; 

INSERT INTO USER (USER_NAME, LOCATION, CONTACT_NUMBER) 
VALUES('홍길동', '서울시 강남구', '010-1234-5678');

-- 유저 2명 동시 생성하기 
INSERT INTO USER (USER_NAME, LOCATION, CONTACT_NUMBER) 
VALUES('고말숙','서울시 영등포구','010-2345-6789'),
	  ('김철수','서울시 송파구','010-9876-5432');



COMMIT;

SELECT * FROM USER;

-- SELECET INSERT UPDATE DELETE와 같은 QUERY 작업을 진행할 때 
-- 마침표(.) 대신 세미콜론(;)으로 쿼리 작성 종료임을 나타냄 
-- INSERT 를 이용해서 값 추가 

-- 서울 강남구에 위치한 유저 찾기 
SELECT * 
FROM USER 
WHERE LOCATION = '서울시 강남구'; 

-- 이순신 서울시 종로구 010-4567-8901 
-- 최지훈 서울시 서초구 010-5677-8911 
-- 정수민 서울시 강동구 010-6781-2345 
-- 김태호 경기도 수원시 010-2222-3333 
-- 이광수 인천시 남동구 010-4444-5555 

INSERT INTO USER (USER_NAME,LOCATION,CONTACT_NUMBER) 
VALUES ('이순신', '서울시 종로구', '010-4567-8901'),
('최지훈', '서울시 서초구', '010-5677-8911'),
('정수민','서울시 강동구', '010-6781-2345'),
('김태호','경기도 수원시','010-2222-3333'),
('이광수','인천시 남동구','010-4444-5555');

COMMIT;

SELECT * FROM USER;

-- 서울에 거주하는 사람 조회 
SELECT USER_NAME 
FROM USER 
WHERE LOCATION -- LIKE없이 WHERE LOCATION = '%서울'; 은 서울% 글자와 완전히 일치하는 조건만 조회하기임 !!!!!!!! 
LIKE '%서울%';
-- 전화번호 중간에 4라는 숫자가 들어간 유저 조회 
select USER_NAME, CONTACT_NUMBER 
FROM USER 
WHERE CONTACT_NUMBER 
LIKE '%4%';
-- 서울에 거주하지 않는 사람 조회 NOT LIKE 
SELECT USER_NAME, LOCATION 
FROM USER
WHERE LOCATION 
NOT LIKE '%서울%';

-- USERPRODILE 테이블 만들기 
/*
-- USER_ID 기본키 자동증가
-- USER_NAME 문자열, 빈값 못들어가게 설정 (50BYTE 설정) 
-- EMAIL 문자열, 빈값 못들어가게 설정 (100 BYTE) 
	BIRTHDATE DATE 
    ACCOUNT_BALANCE DECIMAL(10,2) 정수 10글자, 소수점 2자리까지만 설정 
    GENDER ENUM('MALE' , 'FEMALE') 
    HOBBIES SET('READING','SPORTS','RUNNING') 

*/

CREATE TABLE USERPROFILE (
	USER_ID INT PRIMARY KEY AUTO_INCREMENT, 		-- 기본키, 자동으로 가입 순서대로 번호 증가기입 
    USER_NAME VARCHAR(50)NOT NULL, 					-- 이름 (빈 칸 허용 불가)
    EMAIL VARCHAR(50)NOT NULL, 						-- 이메일 (빈 칸 허용 불가) 
    BIRTHDATE DATE , 								-- 생년월일 ( 날짜 )
    ACCOUNT_BALANCE DECIMAL (10,2), 				-- 계좌 잔액 ( 정수 10자리, 소수자리 2자리 )
    GENDER ENUM('MALE','FEMALE'), 					-- 성별 (남성, 여성 중 택1)
    HOBBIES SET('READING','SPORTS','RUNNING')		-- 취미 (설정된 값 중 다중 선택) 
    );

INSERT INTO USERPROFILE (USER_NAME, EMAIL, BIRTHDATE, ACCOUNT_BALANCE, GENDER, HOBBIES)
VALUES
    ('홍길동', 'hong1@example.com', '1990-01-01', 10000.50, 'MALE', 'READING'),
    ('김영희', 'kim1@example.com', '1995-02-15', 5000.00, 'FEMALE', 'SPORTS'),
    ('이철수', 'lee1@example.com', '1987-03-10', 2000.75, 'MALE', 'RUNNING'),
    ('박민수', 'park1@example.com', '1993-05-20', 7000.25, 'MALE', 'READING,SPORTS'),
    ('최수영', 'choi1@example.com', '1998-07-30', 8000.00, 'FEMALE', 'RUNNING'),
    ('정하나', 'jung1@example.com', '1990-09-10', 3000.40, 'FEMALE', 'READING'),
    ('한상민', 'han1@example.com', '1985-04-25', 6000.30, 'MALE', 'SPORTS,RUNNING'),
    ('안세정', 'oh1@example.com', '1992-12-12', 9000.00, 'MALE', 'READING'),
    ('윤미래', 'yoon1@example.com', '1988-08-08', 4000.00, 'FEMALE', 'SPORTS'),
    ('장동건', 'jang1@example.com', '1991-11-11', 7500.50, 'MALE', 'RUNNING'),
    ('고은아', 'ko1@example.com', '1996-06-06', 3000.00, 'FEMALE', 'READING,SPORTS'),
    ('황보영', 'hwang1@example.com', '1994-03-03', 8500.75, 'FEMALE', 'RUNNING'),
    ('임채연', 'lim1@example.com', '1997-05-15', 2000.25, 'FEMALE', 'READING'),
    ('백승호', 'baek1@example.com', '1989-10-10', 6000.00, 'MALE', 'SPORTS'),
    ('송지효', 'song1@example.com', '1993-02-02', 9500.50, 'FEMALE', 'READING,RUNNING'),
    ('조세호', 'cho1@example.com', '1995-07-07', 1500.75, 'MALE', 'SPORTS'),
    ('이광수', 'lee2@example.com', '1991-09-09', 8000.00, 'MALE', 'RUNNING'),
    ('김나영', 'kim2@example.com', '1986-12-01', 7000.25, 'FEMALE', 'READING'),
    ('박지성', 'park2@example.com', '1988-01-01', 5000.75, 'MALE', 'SPORTS,RUNNING'),
    ('유재석', 'yoo1@example.com', '1987-05-05', 10000.00, 'MALE', 'READING,SPORTS');


select * from userprofile;

/*
-- 테이블 삭제 방법 
DROP TABLE USERPROFILE;
-- 테이블에서 하나의 행 삭제하는 조건 
DELETE FROM 테이블명 WHERE;
*/












