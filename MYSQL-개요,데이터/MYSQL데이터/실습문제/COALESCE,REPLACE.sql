use khtuser;
select * from user;
select * from order_item;

-- null data 생성하기 
use khtcafe;

select * from snack;

-- COALESCE 
-- 컬럼에 NULL값이 존재할 경우 NULL을 0으로 대체해서 합계 계산 

SELECT STOCK FROM SNACK;
/*
50
30
NULL -> 0으로 변경해서 합 계산 
40
20
*/
SELECT COALESCE(STOCK,0) FROM SNACK; 
-- > COALESCE 이용해 STOCK 합을 조회 (SUM 이용)
SELECT SUM( COALESCE (STOCK,0) ) FROM SNACK;

-- > NULL 값을 5로 대체해서 SNACK_ORDER QUANTITY SUM(합) 조회 
SELECT SUM(COALESCE(QUANTITY,5)) FROM SNACK_ORDER;

-- SNACK 테이블에서 카테고리별 재고 합계 
-- SELECT CATEGORY , STOCK (NULL값 0으로 대체) 
SELECT CATEGORY, SUM(COALESCE(STOCK,0)) FROM SNACK GROUP BY CATEGORY;

-- SNACK_ORDER 테이블에서 상태별 주문량 합계 
-- SELECT STATUS QUANTITY 에서 NULL값은 0으로 대체 
SELECT STATUS, SUM(COALESCE(QUANTITY, 0))
FROM SNACK_ORDER GROUP BY STATUS;

-- VIEW 테이블을 이용해서 view_status_null 가상 테이블명칭을 사용해서 , 
-- view 테이블로 위에 작성한 합계를 저장하기. 
CREATE VIEW view_status_null AS 
SELECT STATUS, COALESCE(STATUS,'없음'), SUM(COALESCE(QUANTITY, 0))
FROM SNACK_ORDER GROUP BY STATUS; 
-- error code 1050 Table view status null already exists. 

-- REPLACE로 다시 생성 
CREATE OR REPLACE VIEW view_status_null AS 
SELECT STATUS, COALESCE(STATUS,'없음'), SUM(COALESCE(QUANTITY, 0))
FROM SNACK_ORDER GROUP BY STATUS; 

-- ORACLE에서는 COALESCE 대신 NVL NULL 값을 특정 값을 대체
USE KHTSHOPPING;
SELECT * FROM PRODUCT;
 -- 한으로 시작하는 상품명 찾아 조회하기 
 SELECT NAME FROM PRODUCT WHERE NAME LIKE '한%';
 
 -- 한으로 끝나는 상품명 찾아 조회하기 
 SELECT NAME FROM PRODUCT WHERE NAME LIKE '%한';
 
 -- 한이 중간에 존재하는 상품명 찾아 조회 
 SELECT NAME FROM PRODUCT WHERE NAME LIKE '%한%';

-- LIKE는 글자수도 지정해서 조회 가능함. --->  '_'
-- ex) 끝말잇기 2글자 제한 
select name from product where name like '한________' ;
-- > 한국산 유기농 쌀 
select name from product where name like '한_________' ;
-- > 한정판 고급 텀블러 

USE KHTUSER;
SELECT * FROM USER;

-- @앞에 글자가 9글자인 USERNAME 조회하기 
SELECT USERNAME FROM USER WHERE LENGTH(substring_index(EMAIL,'@',1))=9;

SELECT USERNAME FROM USER WHERE EMAIL LIKE '_________@%';

































