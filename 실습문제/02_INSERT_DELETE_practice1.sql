CREATE TABLE EATS AS SELECT * FROM CAFE;

SELECT * FROM EATS; 

CREATE TABLE EATS_MENU AS SELECT * FROM MENU;

SELECT * FROM EATS_MENU;


--11번째 빠나프레쏘 '경기도 고양시' 031-123-4567 

INSERT INTO EATS 
		VALUES(11,'빠나쁘레쏘','경기도 고양시','031-123-4567'); 
	COMMIT; -- INSERT UPDATE DELETE 추가 수정 삭제 한 기록 저장하기 !!! 
	
--	DELETE FROM EATS 
--	WHERE CAFE_NAME = '빠나쁘레쏘';
--COMMIT;
	
--12번째 : 로맨틱블루 부산 해운대구 051-987-6543 카페 추가하기 
INSERT INTO EATS 
	VALUES(12,'로맨틱블루','부산 해운대구','051-987-6543');
	COMMIT;

--	
--13'티하우스' 카페  인천 남동구에 위치, 연락처 032-345-6789
INSERT INTO eats 
VALUES (13,'티하우스','인천 남동구','032-345-6789');
COMMIT;

--14'라떼아트' 카페  경기도 성남시에 위치, 연락처 031-654-3210
INSERT INTO EATS 
VALUES (14,'라떼아트','경기도 성남','031-654-3210');
COMMIT;

--15'커피클럽' 카페 대구 중구에 위치, 연락처 053-222-1111
INSERT INTO EATS 
VALUES (15,'커피클럽','대구 중구','053-222-1111');
COMMIT;

--2번 방법 이용해서 선택적으로 데이터 추가하기 
----주의할점 : NOT NULL은 선택적으로 작성 불가. 필수로 작성해야하는 컬럼 
--16'브루윙랩'카페 대전 서구에 위치, 연락처 042-333-4444
---PRIMARY KEY -> 고유의 숫자값을 가지는 키 가입한 명단 순서 NULL
---TRIGGER SEQUENCER -> ORACLE PRIMARY KEY 는 자동으로 번호를 측정해주는 동작을 설정해줘야함 

--빈 포레스트라는 cafe-name을 찾아서 삭제하기 
--DELETE FROM EATS WHERE CAFE_NAME = '빈포레스트';

--INSERT INTO EATS(CAFE_ID,CAFE_NAME,LOCATION,CONTACT_NUMBER) 
----VALUE(16번부터 18번까지 추가해주기)
--16'브루윙랩'카페 대전 서구에 위치, 연락처 042-333-4444
INSERT INTO EATS(CAFE_ID,CAFE_NAME,LOCATION,CONTACT_NUMBER) VALUES (16,'브루윙랩','대전 서구','042-333-4444');
COMMIT;

--DELETE FROM EATS WHERE CAFE_ID = 16;
--COMMIT;

--17'스윗빈즈' 카페 광주 북구에 위치, 연락처 062-567-8901
INSERT INTO EATS(CAFE_ID,CAFE_NAME,LOCATION,CONTACT_NUMBER) VALUES (17,'스윗빈즈','광주 북구','062-567-8901');
COMMIT;

--DELETE FROM EATS WHERE CAFE_ID = 17;
--COMMIT;

--18'카페 블랙' 울산 남구에 위치, 연락처 052-444-5555
INSERT INTO EATS(CAFE_ID,CAFE_NAME,LOCATION,CONTACT_NUMBER) VALUES (18,'카페 블랙','울산 남구','052-444-5555');
COMMIT;

--DELETE FROM EATS WHERE CAFE_ID = 18;
--COMMIT;

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (19, '비바라떼', '전주시 덕진구', '063-111-2222');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (20, '바닐라하우스', '경기도 안양시', '031-987-1234');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (21, '카페 베르디', '서울 은평구', '010-2345-6780');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (22, '샌드커피', '경상남도 창원시', '055-765-4321');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (23, '헤이조이', '제주특별자치도 제주시', '064-987-6543');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (24, '스마일빈즈', '강원도 춘천시', '033-654-7890');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (25, '모닝커피', '충청북도 청주시', '043-876-5432');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (26, '빈하우스', '전라남도 목포시', '061-654-1234');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (27, '핸드드립존', '경기도 수원시', '031-765-8765');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (28, '어반커피', '서울 서대문구', '010-5432-9876');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (29, '테라스카페', '서울 동작구', '010-9876-1234');

INSERT INTO EATS (CAFE_ID, CAFE_NAME, LOCATION, CONTACT_NUMBER)
VALUES (30, '그린티라떼', '서울 송파구', '010-1234-5678');


--빠나쁘레쏘 카페에 메뉴 추가 
-- 메뉴이름 : 화이트 모카 
-- 메뉴설명 : 화이트 초콜릿과 에스프레소의 조화 
-- 메뉴가격 : 5500원 

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (31, 11, '화이트 모카','화이트 초콜릿과 에스프레소의 조화',5500);

SELECT * FROM EATS_MENU EM;


INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (32, 12, '얼그레이 티','향긋한 얼그레이 티',4500);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (33, 13, '밀크티','부드러운 우유와 홍차의 조화',5000);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (34, 14, '초코칩 프라페','달콤한 초코칩과 커피의 만남',6000);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (35, 15, '코코럿 라떼','코코넛 향이 가미된 독특한 라떼',5800);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (36, 16, '복숭아 에이드','상큼한 복숭아와 탄산수',5500);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (37, 17, '라즈베리 티','상큼한 라즈베리 향의 티',5000);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (38, 18, '오렌지 주스','신선한 오렌지를 착즙한 주스',4500);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (39, 19, '헤이즐넛 라떼','헤이즐넛 향이 풍부한 라떼',5500);

INSERT INTO EATS_MENU (MENU_ID,CAFE_ID,MENU_NAME,DESCRIPTION,PRICE)
VALUES (40, 20, '그린티 프라페','녹차와 우유의 달콤한 음료',6000);

--DEPARTMENT 테이블에서 DEPT_ID가 'D9'인 부서 정보 조회 
SELECT * FROM DEPARTMENT 
WHERE DEPT_ID = 'D9' ; --총무부 

--DEPARTMENT 테이블에서 DEPT_ID가 'D9'인 행의 DEPT_TITLE을 전략기획팀으로 수정하기 
UPDATE DEPARTMENT 
SET DEPT_TITLE = '전략기획팀'
WHERE DEPT_ID = 'D9'; 

SELECT * FROM EATS;
--로맨틱 블루라는 카페의 전화번호를 010-0000-1111로 변경하기
UPDATE EATS 
SET CONTACT_NUMBER = '010-0000-1111'
WHERE CAFE_NAME = '로맨틱블루';

--EATS_MENU 테이블에서 MENU_NAME = 화이트 모카인 메뉴의 가격을 6000원으로 업데이트 하기 
--메뉴이름은 정확히 화이트 모카 
SELECT * FROM EATS_MENU; 

UPDATE EATS_MENU 
SET PRICE = 6000
WHERE MENU_NAME = '화이트 모카';

--EATS_MUNU 테이블에서 MENU_NAME이 밀크티인 메뉴의 설명을 홍차와 우유가 어우러진 진한 맛 으로 수정 
UPDATE EATS_MENU 
SET DESCRIPTION= '홍차와 우유가 어우러진 진한 맛'
WHERE MENU_NAME = '밀크티';

--EATS_MENU 테이블에서 PRICE가 5500원 이하인 모든 메뉴 가격 10% 인상하여업데이트 
--PRICE가 5500원 이하인 메뉴만 수정 
-- SET PRICE = PRICE * 1.1 
UPDATE EATS_MENU 
SET PRICE = PRICE * 1.1 
WHERE PRICE <=5500;

SELECT * FROM EATS; 
--그린빈 카페 서울시 종로구 010-2345-6789 에서 경기도 안양시 주소 변경 전화번호 제거 
--제거 = NULL 을 사용함 
UPDATE EATS 
SET LOCATION = '경기도 안양시', CONTACT_NUMBER = NULL 
WHERE CAFE_NAME = '그린빈 카페'; 


--------------------------------12/10 실습과제 UPDATE문------------------------------
--
--문제 1: EATS 테이블에서 CAFE_ID가 11인 카페의 이름을 "빠나쁘레쏘 리뉴얼"로 변경
UPDATE EATS 
SET CAFE_NAME = '빠나쁘레쏘 리뉴얼'
WHERE CAFE_ID = 11;
--
--문제 2: EATS_MENU 테이블에서 MENU_ID가 31인 메뉴의 가격을 5800원으로 수정
UPDATE EATS_MENU
SET PRICE = 5800 
WHERE MENU_ID = 31;
--문제 3: EATS 테이블에서 CAFE_ID가 14인 카페의 위치를 "경기도 성남시 수정구"로 변경
UPDATE EATS 
SET LOCATION = '경기도 성남시 수정구'
WHERE CAFE_ID = 14;
--문제 4: EATS 테이블에서 CAFE_ID가 15인 카페의 연락처를 "010-1111-2222"로 수정
UPDATE EATS 
SET CONTACT_NUMBER = '010-1111-2222'
WHERE CAFE_ID = 15;
--문제 5: EATS_MENU 테이블에서 MENU_ID가 34인 메뉴의 설명을 "진한 초콜릿 향과 부드러운 크림이 어우러진 프라페"로 변경
UPDATE EATS_MENU
SET DESCRIPTION = '진한 초콜릿 향과 부드러운 크림이 어우러진 프라페'
WHERE MENU_ID = 34;
--문제 6: EATS_MENU 테이블에서 CAFE_ID가 12인 카페의 모든 메뉴 가격에 500원을 추가
UPDATE EATS_MENU
SET PRICE = PRICE+500 
WHERE CAFE_ID = 12; 

SELECT * FROM EATS_MENU EM;
--문제 7:EATS 테이블에서 CAFE_ID가 12인 카페의 이름을 "로맨틱블루 리뉴얼"로, 위치를 "부산 수영구"로 동시에 변경
UPDATE EATS 
SET CAFE_NAME='로맨틱블루 리뉴얼', LOCATION = '부산 수영구'
WHERE CAFE_ID = 12; 

--문제 8: EATS_MENU 테이블에서 가격이 5000원 이하인 메뉴의 가격을 300원 인상
UPDATE EATS_MENU
SET PRICE = PRICE+300 
WHERE PRICE <=5000;
--문제 9: EATS_MENU 테이블에서 MENU_ID가 13인 메뉴의 이름을 "더치 라떼"로 변경
UPDATE EATS_MENU
SET MENU_NAME = '더치 라떼'
WHERE MENU_ID= 13;
--문제 10: EATS_MENU 테이블에서 MENU_ID가 27인 메뉴의 설명을 NULL로 변경하여 설명을 제거
UPDATE EATS_MENU 
SET DESCRIPTION = NULL
WHERE MENU_ID = 27; 
--문제 11: EATS 테이블에서 CAFE_ID가 20인 카페의 이름을 "바닐라하우스 프리미엄"으로, 연락처를 "031-1234-5678"로 변경
UPDATE EATS 
SET CAFE_NAME = '바닐라하우스 프리미엄', CONTACT_NUMBER = '031-1234-5678'
WHERE CAFE_ID = 20;
--문제 12: EATS_MENU 테이블에서 MENU_ID가 38인 메뉴의 가격을 200원 인상
UPDATE EATS_MENU
SET PRICE = PRICE+200 
WHERE MENU_ID = 38; 
--
--문제 13: EATS_MENU 테이블에서 DESCRIPTION이 NULL이 아닌 모든 메뉴에 " - 추천 음료"라는 공통 문구를 추가
--UPDATE EATS_MENU
--SET description = description || ' - 추천 음료'
--WHERE description IS NOT NULL;
UPDATE EATS_MENU
SET DESCRIPTION = DESCRIPTION || '- 추천 음료'
WHERE DESCRIPTION IS NOT NULL;

SELECT * FROM EATS_MENU EM;
--
--문제 14: EATS 테이블에서 CAFE_ID가 9인 카페의 위치를 "서울 강남구 삼성동"으로 변경
UPDATE EATS 
SET LOCATION = '서울 강남구 삼성동'
WHERE CAFE_ID = 9;
--문제 15: EATS_MENU 테이블에서 MENU_ID가 31인 메뉴의 이름을 "White Mocha"로 변경
UPDATE EATS_MENU
SET MENU_NAME = 'White Mocha'
WHERE MENU_ID = 31;
--문제 16: EATS_MENU 테이블에서 CAFE_ID가 13인 카페의 모든 메뉴 가격에 10% 할인을 적용
UPDATE EATS_MENU
SET PRICE = PRICE*0.1 
WHERE CAFE_ID = 13; 
--문제 18: EATS_MENU 테이블에서 CAFE_ID가 19인 카페의 모든 메뉴 설명을 NULL로 변경
UPDATE EATS_MENU
SET DESCRIPTION = NULL
WHERE CAFE_ID = 19; 
--문제 19: EATS_MENU 테이블에서 가격이 6000원 이상인 메뉴의 설명에 "프리미엄 음료: "라는 태그 추가
UPDATE EATS_MENU
SET DESCRIPTION = '프리미엄 음료 : '||DESCRIPTION
WHERE PRICE >= 6000;
SELECT * FROM EATS_MENU EM;
--문제 20: EATS_MENU 테이블에서 CAFE_ID가 16이고 MENU_ID가 36인 메뉴의 가격을 5500원으로 동결
UPDATE EATS_MENU 
SET PRICE = 5500 
WHERE CAFE_ID = 16 AND MENU_ID= 36;



SELECT MENU_ID, CAFE_ID FROM EATS_MENU;


























































