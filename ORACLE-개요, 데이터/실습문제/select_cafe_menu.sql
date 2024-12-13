--CAFE TABLE 데이터 모두 조회 
SELECT * FROM cafe;

--MENU TABLE 데이터 모두 조회 
SELECT * FROM menu;

--지역이 서울로 시작하는 카페 이름과 카페 지역/위치 조회 
SELECT cafe_name, location
FROM cafe 
WHERE location LIKE '서울%';

--가격이 5500원인 메뉴 조회 
SELECT menu_name, price 
FROM menu 
WHERE price=5500;

-----------------------------------------------SELECT CAFE MENU 실습문제-----------------------------------------------------------
-- 1. 각 카페의 이름과 등록된 메뉴 개수를 조회하세요.
SELECT c.cafe_name, count(m.MENU_ID) AS 메뉴개수
FROM menu m, CAFE C
WHERE c.cafe_id = m.cafe_id
GROUP BY CAFE_NAME;

-- 2. 각 카페에서 가장 비싼 메뉴의 가격을 조회하세요. ----> 비싼 메뉴 하나만 출력하는거 해보기 
SELECT c.CAFE_NAME , max(m.PRICE)
FROM menu m , CAFE C
GROUP BY c.CAFE_NAME;

-- 3. 메뉴 가격이 5,000원 이상인 메뉴를 가진 카페의 이름을 조회하세요.
SELECT DISTINCT c.cafe_name
FROM cafe c , menu m 
WHERE c.CAFE_ID = m.CAFE_ID AND m.PRICE >=5000;

SELECT c.cafe_name, m.menu_name , m.price 
FROM menu m , cafe c 
WHERE m.price >=5000
ORDER BY m.price;

-- 4. 특정 카페 (cafe_id = 3)의 모든 메뉴 이름과 가격을 조회하세요.
SELECT m.menu_name, m.price , c.CAFE_ID
FROM cafe c, menu m
WHERE c.cafe_id 
LIKE '3';

-- 5. 모든 메뉴의 가격을 합산한 결과를 조회하세요.
SELECT SUM(price) AS 합산가격
FROM MENU;

-- 6. '아메리카노'를 판매하는 카페의 이름을 중복 없이 조회하세요.
SELECT DISTINCT(c.cafe_name), m.menu_name
FROM cafe c, menu m 
WHERE m.menu_name
LIKE '아메리카노';


-- 7. 메뉴 이름에 '라떼'가 포함된 모든 메뉴의 이름과 가격을 조회하세요.
SELECT menu_name, price 
FROM menu m
WHERE menu_name 
LIKE '%라떼%';

-- 8. 각 카페에서 메뉴의 평균 가격을 (버림) 계산하여 카페 이름과 함께 조회하세요.
SELECT c.cafe_name , FLOOR(AVG(m.price)) AS 평균가격 
FROM cafe c , menu m
GROUP BY c.CAFE_NAME; 

-- 9. 특정 지역('서울 강남구')의 카페 이름과 해당 카페의 메뉴 개수를 조회하세요.
SELECT c.cafe_name, COUNT(m.menu_name),c.location
FROM cafe c , menu m 
WHERE c.LOCATION
LIKE '서울 강남구'
GROUP BY c.cafe_name,c.location;

-- 10. 모든 카페의 메뉴 개수를 합산하여 조회하세요.
SELECT c.cafe_name , count(m.menu_name) AS 메뉴개수
FROM cafe c , menu m 
GROUP BY c.CAFE_NAME;


-- 11. 특정 지역('서울 서초구')에 위치한 카페에서 판매하는 메뉴들의 총 가격을 조회하세요. 
SELECT c.cafe_name, c.LOCATION, sum(m.price) AS "메뉴들의 총 가격"
FROM cafe c , menu m
WHERE c.LOCATION
LIKE '서울 서초구'
GROUP BY c.cafe_name, c.LOCATION; 

-- 12. 메뉴 이름에 '프라푸치노'가 포함된 메뉴를 판매하는 카페 이름을 조회하세요.
SELECT c.cafe_name , m.menu_name 
FROM cafe c , menu m 
WHERE m.MENU_NAME 
LIKE '%프라푸치노%';

 13. 특정 메뉴 이름('아이스 아메리카노')의 가격을 가진 메뉴를 조회하세요. ---> '아이스 아메리카노' 가격을 불러와서 그 가격과 같은 가격을 가진 메뉴를 조회하는 방법
SELECT menu_name, price 
FROM menu 
WHERE price = (SELECT price FROM menu WHERE menu_name = '아이스 아메리카노');

-- 14. 메뉴 이름에 '녹차'가 포함된 모든 메뉴를 조회하세요.
SELECT menu_name 
FROM menu 
WHERE menu_name 
LIKE '%녹차%';

-- 15. 메뉴 설명(description)이 없는 메뉴의 이름과 가격을 조회하세요.
SELECT menu_name, price 
FROM MENU
WHERE DESCRIPTION IS NULL;

-- 16. 메뉴 설명(description)에 '달콤한'이라는 단어가 포함된 메뉴를 조회하세요.
SELECT menu_name, description 
FROM menu 
WHERE DESCRIPTION
LIKE '%달콤한%';

-- 17. 카페 이름과 해당 카페에서 판매 중인 메뉴의 총 가격 합계를 조회하세요.
SELECT c.cafe_name,  sum(m.price) AS 합계
FROM MENU m , cafe c
GROUP BY c.cafe_name;

-- 18. '서울 용산구'에 위치한 카페들의 평균 메뉴 가격을 조회하세요. (버림) 
SELECT c.cafe_name, c.location, floor(avg(m.price)) AS "평균 메뉴 가격"
FROM cafe c , menu m 
WHERE c.LOCATION ='서울 용산구'
GROUP BY c.cafe_name, c.location;


