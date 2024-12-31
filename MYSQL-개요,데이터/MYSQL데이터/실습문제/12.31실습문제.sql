USE KHTCAFE;

SELECT * FROM MENU;

SELECT * FROM TABLES;

SELECT * FROM CAFE_ORDER_ITEM;
SELECT * FROM CAFE_ORDER;

-- 1. 메뉴 목록 조회 모든 메뉴의 이름과 가격 조회하기 
select name, price 
from menu;

-- 2. 메뉴 테이블 카테고리에서 desert 에 해당하는 메뉴 조회하기 
select name, category 
from menu 
where category = 'dessert';

-- 3. 메뉴 테이블 평균 가격 계산, 평균값 출력 
SELECT  AVG(PRICE) AS '평균값'
FROM MENU; 

-- 4. tables 테이블에서 테이블의 상태별로 몇개의 테이블이 있는지 조회 group by , STATUS NULL 값은 0으로 대체하기 
SELECT * FROM TABLES;
SELECT STATUS, SUM(STATUS)
FROM TABLES 
GROUP BY STATUS; 

-- 5. cafe_order 테이블에서 총 주문금액 합산 
SELECT * FROM CAFE_ORDER;
SELECT SUM(COALESCE (TOTAL_AMOUNT,0)) AS '총주문금액'
FROM CAFE_ORDER; 

-- 6. cafe_order_item과 menu 테이블을 조인해서 주문 항목별 메뉴 이름과 가격 수량 조회 
SELECT * FROM CAFE_ORDER_ITEM;
SELECT * FROM MENU;

SELECT M.NAME, M.PRICE, C.QUANTITY 
FROM CAFE_ORDER_ITEM C 
JOIN MENU M 
WHERE M.MENU_ID = C.ITEM_ID;

-- 7. CAFE_ORDER TABLE에서 가장 최근에 이루어진 주문의 주문 ID와 테이블번호, 총 금액을 조회 ORDER BY LIMIT 
SELECT * FROM CAFE_ORDER;
SELECT ORDER_ID, TABLE_ID, TOTAL_AMOUNT, ORDER_DATE 
FROM CAFE_ORDER 
ORDER BY ORDER_DATE
LIMIT 10;

-- 8. CAFE_ORDER_ITEM CAFE_ORDER MENU TABLES 조인해서 각 테이블 번호 별로 주문한 메뉴이름, 수량, 해당 항목의 총 금액(가격X수량)조회 
SELECT M.NAME, C.QUANTITY, SUM(O.PRICE*O.QUANTITY)
FROM CAFE_ORDER_ITEM O 
JOIN CAFE_ORDER C JOIN  MENU M
WHERE O.ORDER_ID = C.ORDER_ID = M.ORDER_ID;


-- 9. 8번 문제에서 조인한 결과를 VIEW 테이블로 생성 테이블명 ALL_CAFE_INFO 

-- VIEW 테이블을 이용해서 view_status_null 가상 테이블명칭을 사용해서 , 
-- view 테이블로 위에 작성한 합계를 저장하기. 
CREATE VIEW view_status_null AS 
SELECT STATUS, COALESCE(STATUS,'없음'), SUM(COALESCE(QUANTITY, 0))
FROM SNACK_ORDER GROUP BY STATUS; 
-- error code 1050 Table view status null already exists. 

CREATE VIEW ALL_CAFE_INFO 
SELECT 

-- 10. VIEW 테이블을 다시 생성했더니 ERROR CODE: 1050 발생 문제 해결하기. 

-- REPLACE로 다시 생성 
CREATE OR REPLACE VIEW view_status_null AS 
SELECT STATUS, COALESCE(STATUS,'없음'), SUM(COALESCE(QUANTITY, 0))
FROM SNACK_ORDER GROUP BY STATUS; 
