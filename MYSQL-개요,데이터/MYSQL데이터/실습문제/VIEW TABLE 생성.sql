-- VIEW 가상의 테이블 사용하기 

USE KHTCAFE;
SELECT * FROM SNACK;
SELECT * FROM SNACK_ORDER;

-- 조회 상품의 이름 및 상태와 주문 목록 조회하기 
SELECT O.ID, S.NAME, O.QUANTITY, O.ORDER_DATE, O.STATUS
FROM SNACK_ORDER O 
LEFT JOIN  
	SNACK S 
    ON O.SNACK_ID = S.ID; 
    -- > 3번 테이블 내에 과자이름이 없고, 포테이토 칩은 배송완료인데 수량이 없음 
    -- > VIEW 테이블로 확인처리를 하면서 테이블을 임시로 만들어 지속적으로 확인 
    -- > VIEW 사용 

CREATE VIEW VIEW_ORDER_SUMMARY 
AS 
SELECT O.ID, S.NAME, O.QUANTITY, O.ORDER_DATE, O.STATUS
FROM SNACK_ORDER O 
LEFT JOIN  
	SNACK S 
    ON O.SNACK_ID = S.ID; 
    
    SELECT * FROM VIEW_ORDER_SUMMARY ;
    
-- 주문상태가 배송완료인 주문 건에 대해 매출 데이터 계산 
-- VIEW_TOTAL_SALES로 해서 VIEW 테이블 생성 
SELECT O.ID, S.NAME, O.QUANTITY , S.PRICE, (O.QUANTITY * S.PRICE) AS 총매출 , O.ORDER_DATE 
FROM SNACK_ORDER O 
JOIN SNACK S 
ON O.SNACK_ID = S.ID 
WHERE O.STATUS = '배송 완료';

CREATE VIEW VIEW_TOTAL_SALES 
AS 
SELECT O.ID, S.NAME, O.QUANTITY , S.PRICE, (O.QUANTITY * S.PRICE) AS 총매출 , O.ORDER_DATE 
FROM SNACK_ORDER O 
JOIN SNACK S 
ON O.SNACK_ID = S.ID 
WHERE O.STATUS = '배송 완료';

SELECT * FROM VIEW_TOTAL_SALES ;
    
-- 주문 상태가 "취소"인 주문만 조회하는 VIEW TABLE 생성 
-- VIEW 테이블명 : VIEW_CANCELLED_ORDERS 
-- SELECT O.ID AS 순번 S.NAME AS 과자이름, O.QUANTITY, O.ORDER_DATE 
-- INNER JOIN 사용 
CREATE VIEW VIEW_CANCELLED_ORDERS 
AS 
SELECT O.ID AS 순번, S.NAME AS 과자이름, O.QUANTITY, O.ORDER_DATE 
FROM SNACK_ORDER O 
LEFT JOIN SNACK S 
ON O.SNACK_ID = S.ID 
WHERE O.STATUS = '취소';

SELECT * FROM VIEW_CANCELLED_ORDERS;
    -- > 취소에 관련된 데이터 존재 X 

DROP VIEW IF exists VIEW_CANCELLED_ORDERS; -- > view 테이블 존재하면 삭제하라는 의미 

-- MYSQL 5.7 버전 이상부터 DROP IF EXISTS 사용하지 않고 한번에 덮어쓰기 하는 방식 사용 가능 
-- > CREATE OR REPLACE 넣어주면 됨 
create OR REPLACE view  VIEW_CANCELLED_ORDERS  
AS
SELECT O.ID AS 순번, S.NAME AS 과자이름, O.QUANTITY, O.ORDER_DATE 
FROM SNACK_ORDER O 
LEFT JOIN SNACK S 
ON O.SNACK_ID = S.ID 
WHERE O.STATUS = '취소';

SELECT * FROM VIEW_CANCELLED_ORDERS ;

-- 과자이름이 NULL 값일 때 특정 값을 넣어주는 구문 
create OR REPLACE view  VIEW_CANCELLED_ORDERS  
AS
SELECT O.ID AS 순번, 
	ifnull(	S.NAME,'알 수 없음' )AS 과자이름, -- 과자이름값이 NULL 값일 때 작성하는 방법 
        O.QUANTITY, 
        O.ORDER_DATE 
FROM SNACK_ORDER O 
LEFT JOIN SNACK S 
ON O.SNACK_ID = S.ID 
WHERE O.STATUS = '취소';
    

SELECT * FROM khtcafe.menu;

-- USE KHTUSER를 사용하지 않고 
-- KHTUSER 내에 있는 USER 테이블 조회 
SELECT * FROM KHTUSER.USER;

-- USER PHONE 앞에 작성된 KOR) 제거 
SELECT PHONE FROM KHTUSER.USER;
 
SET SQL_SAFE_UPDATES = 0; 
START TRANSACTION;  -- SAVEPOINT 를 사용하기 위해서는 START TRANSACTION 시작 수동 제어 
SAVEPOINT sp1 ; -- 임시로 되돌릴 위치이름 sp1으로 설정 
use khtuser; -- khtuser db로 접속 
UPDATE USER SET PHONE = SUBSTRING_INDEX(phone,'-',1); -- 수정할 update 작성 
select * from user; 								  -- 제대로 수정했는지 확인 
rollback to sp1; 		-- 원하는대로 결과 수정 x sp1 임시저장한 위치로 되돌리기 
update user set phone = substring_index(phone, ')', -1); -- 수정 
select * from user ; -- 올바르게 수정 됐는지 확인 

commit ; -- 수정 결과 저장 
    
    
    
    
    
    
    