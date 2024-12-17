use KHTSHOPPING;

SELECT * FROM PRODUCT;

SELECT* FROM `ORDER`;

SELECT* FROM REVIEW;

select* from order_item;


-- PENDING -> 대기 
-- SHIPPED -> 배송중 
-- DELIVERED -> 배송 완료 
-- CANCELLED -> 취소 

-- 변경 
-- 1) SAFE_UPDATE = 0 ; 
-- 2) ALTER STATUS 변경 
-- 3) UPDATE 작성 

SET SQL_SAFE_UPDATES = 0; -- SAFE MODE 해제 
ALTER TABLE `ORDER` 
MODIFY COLUMN STATUS ENUM(
'PENDING','SHIPPED','DELIVERED','CANCELLED','대기','배송중','배송 완료','취소');

UPDATE `ORDER` SET STATUS = '대기' WHERE USER_ID = 5; 

SELECT * FROM `ORDER`; 
COMMIT;

USE KHTUSER;
SELECT * FROM USER; 

-- 이메일주소 도메인이 example.com -> kht.co.kr 로 변경
-- CONCAT SUBSTRING SUBSTRING _INDEX 이용해서 변경 
-- LIKE로 일치하는지 확인 후 변경 

SELECT CONCAT ('Hello',' ','World','!'); -- CONCAT으로 이어붙여 출력되는지 확인하는 것 

SELECT SUBSTRING_INDEX('user@example.com','@','1'); -- 결과 : user 
SELECT SUBSTRING_INDEX('user@example.com','@','-1'); -- 결과 : example.com 

SELECT CONCAT ( SUBSTRING_INDEX('user@example.com','@','1')	,	'@kht.com'			);

/*
ERROR CODE : 1241 잘못된 문법으로 문자열 처리를 시도했기 때문에 발생한 에러코드 
ERROR CODE : 1175 SAFE UPDATE MODE 비활성화 
*/
UPDATE USER 
SET EMAIL = CONCAT( SUBSTRING_INDEX(EMAIL,'@','1')	,	'@kht.com'			);

SELECT * FROM USER;
COMMIT;


SELECT * FROM USER;

UPDATE USER SET PHONE = '010-5678-9012' WHERE USERNAME = '최수지';
-- ('홍길동', 'hong@example.com', 'hashed_password_1', , 'ACTIVE'),
-- ('김영희', 'kim@example.com', 'hashed_password_2', '010-2345-6789', 'ACTIVE'),
-- ('이철수', 'lee@example.com', 'hashed_password_3', '010-3456-7890', 'INACTIVE'),
-- ('박민수', 'park@example.com', 'hashed_password_4', '010-4567-8901', 'ACTIVE'),
-- ('최수지', 'choi@example.com', 'hashed_password_5', '010-5678-9012', 'ACTIVE');

START TRANSACTION; -- 트랜잭션 개념 ACID 개념이해가 더 중요 
-- USER 테이블에서 전화번호 앞에 +82) 를 붙여주기 
-- 최종 PHONE +82) 010-XXXX-XXXX 
UPDATE USER SET PHONE = CONCAT('+082)' , PHONE); 

-- +082) 지우기 
UPDATE USER SET PHONE = SUBSTRING_INDEX (PHONE,')','-1'); 
-- CONCAT 이용하고 ) 기준으로 지우기 

savepoint SP1;
-- KOR)010-XXXX-XXXX 이런식으로 맨앞에 KOR) 붙이기 
UPDATE USER SET PHONE= CONCAT('KOR)',SUBSTRING_INDEX (PHONE,')','-1')); 
-- ROLLBACK 이용해 "SP1" 되돌리기 
SELECT* FROM USER; 
ROLLBACK TO SP1;













