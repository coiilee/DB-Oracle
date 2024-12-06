--질문 MAX()를 붙인 값과 붙이지 않고 SALARY 만 쓴 결과가 같은데 MAX()가 어떤 역할을 하는지 궁금합니다! 

--2. EMPLOYEE 테이블에서 각 직급마다 급여가 가장 높은 사원의 이름과 급여 MAX(SALARY)
--GROUP BY ORDER BY JOB_CODE, EMP_NAME, 가장 높은 사원의 급여 
SELECT EMP_NAME, JOB_CODE, MAX(SALARY) AS "가장 높은 급여"
FROM EMPLOYEE
GROUP BY JOB_CODE ,EMP_NAME 
ORDER BY MAX(SALARY) DESC; 

SELECT EMP_NAME, JOB_CODE, SALARY 
FROM EMPLOYEE
GROUP BY JOB_CODE ,EMP_NAME , SALARY
ORDER BY SALARY DESC; 





--------------------------------------실습과제------------------------------------------------

-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.

	SELECT e.emp_name, d.dept_title 
	FROM EMPLOYEE e , DEPARTMENT d
	WHERE e.dept_code = d.dept_id 
	AND e.email IS NOT NULL;

	
-- 2. 각 부서의 최고 급여를 출력하시오.
	SELECT DEPT_CODE, EMP_NAME, MAX(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPT_CODE, EMP_NAME
	ORDER BY dept_code, MAX(SALARY) DESC;

--2-1 각 부서의 최고 급여 출력 (한사람만)
	SELECT emp_name, dept_code, salary
	FROM employee 
	WHERE(DEPT_CODE,salary)
	IN(SELECT dept_code,  MAX(salary) FROM employee GROUP BY dept_code)
	ORDER BY DEPT_CODE;
	

-- 3. 각 급여 등급별 직원 수를 출력하시오.
	SELECT COUNT(*) , SAL_LEVEL
	FROM EMPLOYEE
	GROUP BY SAL_LEVEL;
	

-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
	SELECT dept_title, FLOOR(AVG(SALARY))
	FROM EMPLOYEE,DEPARTMENT
	GROUP BY DEPT_title
	ORDER BY FLOOR(AVG(SALARY)) DESC;

-- 5. 지역별 부서 수를 출력하시오.
--distinct : 특정 컬럼에서 중복 값을 제외한 행의 개수 반환 
	SELECT COUNT(DISTINCT DEPT_ID), LOCATION_ID 
	FROM DEPARTMENT
	GROUP BY LOCATION_ID;

-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
--부서의 평균 급여와 평균 보너스 비율을 계산한 뒤 
--보너스 평균 값 기준으로 오름차순으로 정렬하는 작업 
	SELECT DEPT_CODE,AVG(BONUS) 
	FROM EMPLOYEE
	GROUP BY DEPT_CODE 
	ORDER BY AVG(BONUS);

-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
	SELECT E.DEPT_CODE, D.DEPT_TITLE , FLOOR(AVG(E.SALARY)), FLOOR(AVG(E.BONUS))
	FROM EMPLOYEE E, DEPARTMENT D
	GROUP BY E.DEPT_CODE ,D.DEPT_TITLE
	ORDER BY D.DEPT_TITLE;

-- 8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
    SELECT DEPT_CODE, COUNT(*) AS 퇴사자
    FROM EMPLOYEE
    WHERE ENT_YN = UPPER('Y')
    GROUP BY DEPT_CODE 
    ORDER BY 퇴사자 DESC;
    
   CREATE TABLE Cafe (
    cafe_id NUMBER PRIMARY KEY,        -- 카페의 고유 ID
    cafe_name VARCHAR2(100) NOT NULL,  -- 카페 이름
    location VARCHAR2(255),            -- 카페 위치
    contact_number VARCHAR2(20)        -- 카페 연락처
);


CREATE TABLE Menu (
    menu_id NUMBER PRIMARY KEY,        -- 메뉴의 고유 ID
    cafe_id NUMBER,                    -- 카페 ID (외래키)
    menu_name VARCHAR2(100) NOT NULL,  -- 메뉴 이름
    description VARCHAR2(255),         -- 메뉴 설명
    price NUMBER(10, 2),               -- 메뉴 가격
    FOREIGN KEY (cafe_id) REFERENCES Cafe(cafe_id) -- 카페 테이블과의 관계
);