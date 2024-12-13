-- 카페 테이블 조회 
SELECT * FROM CAFE; 

--메뉴 테이블 조회 
SELECT * FROM menu; 

--메뉴 가격 오름차순 정렬 
SELECT * FROM MENU ORDER BY PRICE; 

--내림차순 
SELECT * FROM MENU ORDER BY PRICE DESC; 

SELECT description , menu_name, price
FROM MENU M 
WHERE PRICE >= 5000
ORDER BY PRICE; 

SELECT menu_name 
FROM MENU 
WHERE menu_name LIKE '%라떼%'; 


-- 1. menu 테이블에서 메뉴 이름에 '아이스'가 포함된 메뉴의 이름과 가격 출력 
SELECT menu_name, price 
FROM MENU M 
WHERE menu_name 
LIKE '%아이스%';

-- 2. menu 테이블에서 4000원 이상 6000원 이하인 메뉴를 출력하기 
SELECT menu_name, price 
FROM MENU M 
WHERE 4000<= price AND price <=6000;

--2번째 간단 표현 방법
SELECT menu_name, price 
FROM MENU M 
WHERE PRICE BETWEEN 4000 AND 6000;

-- 3. 배달의민족에서 카페라떼 메뉴가 존재하는 카페 이름을 조회하기 
-------카페라떼 메뉴가 들어간 카페이름 조회 cafe 테이블 menu테이블 
SELECT c.CAFE_NAME , m.MENU_NAME
FROM CAFE C, MENU M 
WHERE m.MENU_NAME LIKE '%카페라떼%';
--WHERE m.MENU_NAME='카페라떼';
--oracle의 경우 like를 사용하지 않아도 원하는 검색을 통해 조회가 가능함 


-- 4. menu 테이블에서 메뉴 설명에 달콤이 포함된 메뉴의 이름과 설명 조회하기 
SELECT menu_name , DESCRIPTION
FROM MENU M 
WHERE DESCRIPTION 
LIKE '%달콤%';

-- 5. 메뉴 설명이 없는 메뉴 출력 
SELECT menu_name , DESCRIPTION
FROM menu 
WHERE MENU.DESCRIPTION IS NULL; --> 다행히 메뉴설명이 모두 존재함을 확인 !    

--6. cafe 테이블 카페 이름이 '로스터 카페'인 카페의 위치 출력 
SELECT LOCATION 
FROM CAFE 
WHERE CAFE_NAME = '로스터리 카페';

--7. cafe menu 서울 강남구에 위치한 카페에서 판매하는 메뉴 이름 출력하기 
SELECT m.menu_name
FROM CAFE C, MENU M 
WHERE c.location = '서울 강남구'; 

--group by, having 절 
-- cafe menu 테이블 
---1. 각 카페에서 판매하는 메뉴의 평균 가격 출력 
---WHERE절 존재 X = 모두 더하고 모든 결과 조회 
SELECT CAFE_NAME, FLOOR(AVG(M.PRICE))
FROM CAFE C, MENU M 
GROUP BY C.CAFE_NAME;

---WHERE절 존재 O = 카페테이블과 메뉴 테이블에서 CAFE_ID가 일치하는 행만 고려해서 평균 가격 계산 
---모든 조합에 대한 결과 모두 더하고 모두 평균 
---카페테이블에 존재하는 카페 아이디와 메뉴테이블에 존재하는 카페아이디 일치여부 상관 없이!! 
SELECT C.CAFE_NAME, FLOOR(AVG(M.PRICE))
FROM CAFE C, MENU M 
WHERE C.CAFE_ID = M.CAFE_ID
GROUP BY C.CAFE_NAME;

---2. 메뉴 가격의 합계가 15000원 이상인 카페 이름 출력 
SELECT CAFE_NAME , SUM(M.PRICE)
FROM MENU M, CAFE C
GROUP BY C.CAFE_NAME;
--HAVING 쓰기 
SELECT CAFE_NAME , SUM(M.PRICE)
FROM MENU M, CAFE C
WHERE C.CAFE_ID = M.CAFE_ID
GROUP BY C.CAFE_NAME
HAVING SUM(PRICE) >= 15000;

---3. 카페별 메뉴의 최고 가격 출력 CAFE_NAME, MAX PRICE 
SELECT C.CAFE_NAME, MAX(M.PRICE)
FROM CAFE C, MENU M 
WHERE C.CAFE_ID = M.CAFE_ID
GROUP BY C.CAFE_NAME;  -SUB QUERY 를 작성하면 더 상세한 조회가 가능함 

---4. 메뉴가 3개 이상인 카페의 이름 출력하기  HAVING MENU_ID
SELECT C.CAFE_NAME , COUNT(M.MENU_ID)
FROM CAFE C, MENU M 
WHERE C.CAFE_ID = M.CAFE_ID
GROUP BY C.CAFE_NAME 
HAVING COUNT(M.MENU_ID) >=3 ;

----ORDER BY 문  /  길이 = LENGTH(컬럼명) 사용 
--ㅡMENU 테이블 
--1. 메뉴 가격이 높은 순으로 메뉴이름과 가격 출력 
SELECT  MENU_NAME, PRICE
FROM MENU 
ORDER BY PRICE DESC;

--2. 메뉴 가격이 낮은 순으로 메뉴이름과 가격 출력 
SELECT MENU_NAME, PRICE
FROM MENU M
ORDER BY PRICE;

--3. 메뉴 이름의 길이를 기준으로 오름차순 정렬 
SELECT MENU_NAME 
FROM MENU 
ORDER BY LENGTH(MENU_NAME);

--4. CAFE 이름을 가나다 순으로 정렬해서 출력하기 
SELECT CAFE_NAME
FROM CAFE 
ORDER BY CAFE_NAME; 

--5. 카페 이름의 길이를 기준으로 내림차순 정렬 
SELECT CAFE_NAME
FROM CAFE 
ORDER BY LENGTH(CAFE_NAME) DESC;

---CAFE MENU 
--6. 메뉴 가격이 같은 메뉴는 카페이름순으로 정렬해서 출력 
-- ORDER BY PRICE CAFE_NAME 
SELECT C.CAFE_NAME, M.MENU_NAME, M.PRICE
FROM CAFE C , MENU M  
ORDER BY M.PRICE ASC, C.CAFE_NAME ASC;

--카페이름과 각 카페의 총 메뉴 수 조회 
SELECT C.CAFE_NAME , COUNT(M.MENU_ID) 
FROM MENU M, CAFE C 
--WHERE 없으면 카르테시안 곱으로 인해 모든 행과 열을 합산한 값이 모두 적용됨 
WHERE M.CAFE_ID = C.CAFE_ID
GROUP BY C.CAFE_NAME;

--가격이 6000원 이상인 메뉴의 이름과 카페 이름을 출력하기 
SELECT M.MENU_NAME , C.CAFE_NAME, M.PRICE
FROM MENU M, CAFE C 
WHERE M.CAFE_ID = C.CAFE_ID 
AND M.PRICE >= 6000;


/*********************************************************
 * SUB QUERY 서브 쿼리 
 * ******************************************************
 */

--서브쿼이 예시 1. 
---부서코드가 노옹철사원과 같은 소속의 직원들의 이름과 부서코드 조회하기 

-------1) 사원명이 노옹철인 사람의 부서코드 조회하기 
SELECT dept_code 
FROM EMPLOYEE E
WHERE emp_name = '노옹철'; --'D9'

-------2) 부서코드가 D9인 직원을 조회 
SELECT EMP_NAME, DEPT_CODE 
FROM EMPLOYEE E
WHERE DEPT_CODE='D9'; --- 선동일, 송종기, 노옹철이 해당 

-------3) 부서코드가 노옹철사원과 같은 소속의 직원 명단 조회 
SELECT EMP_NAME, DEPT_CODE 
FROM EMPLOYEE E
--			노옹철 이름으로 D9 부서가 나오게 조회해야함 
WHERE DEPT_CODE = (SELECT dept_code 
				   FROM EMPLOYEE E
				   WHERE emp_name = '노옹철');

				  

--전 직원의 평균 급여보다 많은 급여를 받고 있는 직원의 사번, 이름, 직급코드, 급여 조회하기 
				  
---1) 전 직원의 평균 급여 조회 
	SELECT FLOOR(AVG(SALARY))
	FROM EMPLOYEE E ; 		 
				  
---2) 직원들 중에서 급여가 평균급여 원 이상인 사원들의 
------사번, 이름, 직급코드, 급여 조회 하기 
	SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
	FROM EMPLOYEE E 
	WHERE SALARY >= 3047662;
				  
---3) 전 직원의 평균 급여보다 많은 급여를 받고 있는 직원 조회 
----WHERE절에서 1번 조회결과로 나온 평균급여가 나오면 됨 			
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY 
FROM EMPLOYEE E 
WHERE SALARY = (SELECT FLOOR(AVG(SALARY))
	FROM EMPLOYEE E);


---부서별 평균 급여 조회 부서 코드 , 평균 급여 조회 
--1) 부서별 직원의 급여 평균 계산 위해 필요한 데이터 조회 
SELECT DEPT_CODE 
FROM EMPLOYEE EM
GROUP BY DEPT_CODE;

--2) 부서별 평균 급여 계산. 각 부서 코드에 알맞는 부서별 평균 급여를 계산해서 모두 조회하기 
SELECT AVG(SALARY) 
FROM EMPLOYEE ES 
WHERE DEPT_CODE='D1'; 

--3) 난이도 최상 
SELECT DEPT_CODE, (
					SELECT AVG(SALARY) 
					FROM EMPLOYEE ES 
					WHERE EM.DEPT_CODE=ES.DEPT_CODE) AS "평균급여" 
FROM EMPLOYEE EM
GROUP BY DEPT_CODE;
				  

---------------------------------------------2024.12.09 SUBQUERY 실습문제----------------------------------------------------------
--1. 특정 사원의 부서명 조회
--문제: 사원명이 노옹철인 사원이 속한 부서명을 조회하세요.

SELECT D.DEPT_TITLE 
FROM DEPARTMENT D
WHERE D.DEPT_ID = (SELECT E.DEPT_CODE FROM EMPLOYEE E WHERE E.EMP_NAME = '노옹철');

--
--2. 특정 직급의 평균 급여보다 높은 급여를 받는 사원
--문제: J2 직급의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여를 조회하세요.
--내가쓴 답 
SELECT EMP_NAME, SALARY 
FROM EMPLOYEE E 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE E2 WHERE E2.JOB_CODE = 'J2');



--
--3. 특정 지역에 속한 부서에 근무하는 사원
--문제: 지역코드 L1에 속한 부서에서 근무하는 사원의 이름을 조회하세요.
--내가 쓴 답 : 
SELECT EMP_NAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE DEPT_CODE IN (SELECT DEPT_ID FROM DEPARTMENT D2 WHERE LOCATION_ID ='L1');

--정답 : 
SELECT EMP_NAME 
FROM EMPLOYEE E 
WHERE DEPT_CODE IN (SELECT DEPT_ID FROM DEPARTMENT D WHERE LOCATION_ID = 'L1');
--
--4. 관리자를 가지고 있는 사원만 조회
--문제: 관리자를 가지고 있는 사원의 이름과 관리자 이름을 조회하세요.
--내가 쓴 답 : 
SELECT EMP_NAME, MANAGER_ID 
FROM EMPLOYEE E 
WHERE MANAGER_ID = (SELECT EMP_NAME FROM EMPLOYEE E2 WHERE MANAGER_ID IS NOT NULL) AS "MANAGER_NAME";

--정답 : 
SELECT EMP_NAME, (SELECT EMP_NAME FROM EMPLOYEE E2 WHERE E2.EMP_ID = E.MANAGER_ID) AS MANAGER_NAME 
FROM EMPLOYEE E 
WHERE MANAGER_ID IS NOT NULL;

--5. 특정 부서에서 가장 높은 급여를 받는 사원
--문제: 부서 코드가 D5인 부서에서 가장 높은 급여를 받는 사원의 이름과 급여를 조회하세요.
SELECT EMP_NAME, SALARY
FROM EMPLOYEE 
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE E WHERE DEPT_CODE = 'D5');

--6. 퇴사하지 않은 직원 중 최소 급여를 받는 직원
--문제: 퇴사 여부가 N인 사원 중 가장 적은 급여를 받는 사원의 이름과 급여를 조회하세요.
SELECT EMP_NAME, SALARY
FROM EMPLOYEE E
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE E2 WHERE ENT_YN = 'N');


--7. 특정 부서에서 가장 오래 근무한 사원
--문제: 부서 코드가 D8인 부서에서 입사일이 가장 빠른 사원의 이름과 입사일을 조회하세요.
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE E
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEE E2 WHERE DEPT_CODE = 'D8');


--8. 모든 사원의 최대 급여와 최소 급여 비교
--문제: 전 사원의 최대 급여와 최소 급여를 조회하세요.
--내가 쓴 답 : 
SELECT (SELECT MAX(SALARY)) AS MAX_SALARY, 
FROM EMPLOYEE E 
WHERE SALARY = (SELECT MIN(SALARY)) AS MIN_SALARY FROM EMPLOYEE E2 WHERE SALARY);

--정답 : 
SELECT (SELECT MAX(SALARY) FROM EMPLOYEE E ) AS MAX_SALARY, 
 	   (SELECT MIN(SALARY) FROM EMPLOYEE E ) AS MIN_SALARY 
 	   FROM DUAL; 










