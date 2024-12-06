--EMPLOYEE 테이블에서 부서코드, 부서(그룹)별 급여 합계 조회 
--			/*어떤 그룹을 묶어서 조회할 것인지를 추가로 작성해줌 !! */
SELECT DEPT_CODE, SUM(SALARY),AVG(SALARY)  --그룹별로 월급합계/ 평균월급 조회 
FROM EMPLOYEE							   --EMPLOYEE 테이블에서 
GROUP BY DEPT_CODE; 					   --DEPT_CODE 컬럼 값이 같은 행들끼리 묶어서 

--EMPLOYEE 테이블에서 
--부서코드. 부서별 급여의 합계, 부서별 급여의 평균(정수처리), 인원수 조회하고 
--부서코드 오름차순으로 정렬 

SELECT DEPT_CODE, SUM(SALARY), FLOOR(AVG(SALARY)), COUNT(*) AS 사원수
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE; 

--EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고 
--부서코드 오름차순으로 정렬 
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
WHERE bonus IS NOT null
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;  
--이렇게 쓰면 안되는 이유 ? 
--SELECT dept_code, bonus, count(*) AS 사원수 
--FROM EMPLOYEE
--GROUP BY DEPT_CODE 
--ORDER BY DEPT_CODE; 


--EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고 
--부서코드 오름차순 정렬 NULL 인 행 빼고 카운트 

SELECT DEPT_CODE ,COUNT(BONUS)
FROM EMPLOYEE
WHERE bonus IS NOT null
GROUP BY dept_code
ORDER BY dept_code;

--– 1. EMPLOYEE 테이블에서 부서코드가 'D5', 'D6'인 부서의 평균 급여 조회
SELECT FLOOR(AVG(salary)), dept_code
FROM EMPLOYEE
WHERE UPPER(DEPT_CODE) IN('D5','D6')
GROUP BY DEPT_CODE;


--– 2. EMPLOYEE 테이블에서 직급 별 2000년도 이후 입사자들의 급여 합을 조회
------ WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE)>= 2000 
GROUP BY JOB_CODE;
--
--– 3. EMPLOYEE 테이블에서 부서 별로 같은 직급인 사원의 급여 합계를 조회하고
---- 부서 코드 오름차순으로 정렬
--SUM이나 AVG 같이 특정 함수로 계산한 결과를 나타낼때 조회하고자 하는 컬럼명 작성해줄 경우 
--GROUP BY 절에 SUM,AVG같이 계산 함수가 적용되지 않은 컬럼명을 모두 작성해줘야함. 
SELECT SUM(SALARY), JOB_CODE, DEPT_CODE 
FROM EMPLOYEE
GROUP BY JOB_CODE , DEPT_CODE 
ORDER BY DEPT_CODE;
--
--– 4. EMPLOYEE 테이블에서 부서 별로 급여 등급이 같은 직원의 수를 조회하고
---- 부서코드, 급여 등급 오름차순으로 정렬
SELECT DEPT_CODE , SAL_LEVEL, COUNT(*)
FROM EMPLOYEE
GROUP BY SAL_LEVEL, DEPT_CODE 
--첫번째로 부서코드를 ABCD순으로 정렬, 부서내 존재하는 급여 레벨을 ABCD순으로 정렬 
ORDER BY DEPT_CODE; 
--
--– 5. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
------ 부서코드 오름차순 정렬
--
--– 6. EMPLOYEE 테이블에서 부서코드와 부서별 보너스를 받는 사원의 수를 조회하고
------ 부서코드 오름차순 정렬 null 인 행 빼고 카운트


--EMPLOYEE테이블과 DEPARTMENT 테이블에서 부서코드 조회하기 
SELECT * FROM EMPLOYEE; --emp_id, emp_name, dept_code 
SELECT * FROM DEPARTMENT; --dept_id, dept_title, locaiton_id 

SELECT EMPLOYEE.emp_id, EMPLOYEE.emp_name, EMPLOYEE.dept_code, DEPARTMENT.dept_title 
FROM EMPLOYEE, DEPARTMENT--테이블 조회 2개이상 가능 
WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID; --oracle에서는 안됨 

SELECT DEPT_CODE 
FROM EMPLOYEE;

SELECT DEPT_ID
FROM DEPARTMENT;

--emp_id, emp_name, job_code, jo_name 출력 
SELECT EMPLOYEE.emp_id, EMPLOYEE.emp_name, EMPLOYEE.JOB_CODE,JOB.JOB_NAME
FROM EMPLOYEE, JOB;

--DEPT_ID, DEPT_TITLE ,LOCATION_ID, LOCAL_NAME 출력하기 
SELECT D.DEPT_ID,D.DEPT_TITLE,D.LOCATION_ID,L.LOCAL_NAME 
FROM DEPARTMENT D, LOCATION L;


--DEPARTMENT 테이블과 LOCATION 테이블 NATIONAL 테이블을 이용해서 
--DEPT_ID, DEPT_TITLE, LOCATION_ID, NATIONAL_CODE, NATIONAL_NAME 출력하기 
--where절 사용 -> 서로 같다는 표기를 2개이상의 테이블에서 진행해야 할때는 WHERE절을 필수로 사용해야함 
--DEPARTMENT 테이블에서 LOCATION_ID와 LOCATION 테이블에서 LOCAL_CODE가 일치하고 
--LOCATION 테이블에서 NATIONAL_CODE와 NATIONAL테이블에서 NATIONAL_CODE가 일치할 경우를 써주는 것 
SELECT D.DEPT_ID, D.DEPT_TITLE , D.LOCATION_ID, L.NATIONAL_CODE, N.NATIONAL_NAME
FROM DEPARTMENT D, LOCATION L, NATIONAL N 
WHERE D.LOCATION_ID = L.LOCAL_CODE  
AND L.LOCAL_NAME = N.NATIONAL_CODE;


--1. EMPLOYEE 테이블에서 각 부서에 속한 사원들의 평균 급여 
SELECT DEPT_CODE, FLOOR(AVG(SALARY)) "평균 급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

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

--급여가 가장 높은 사원 하나만 출력하는 방법 
SELECT EMP_NAME, JOB_CODE, SALARY 
FROM EMPLOYEE
WHERE (SALARY, JOB_CODE) IN (SELECT MAX(SALARY), JOB_CODE FROM EMPLOYEE GROUP BY JOB_CODE)
ORDER BY JOB_CODE; 


--3. 부서별로 입사한 직원들의 평균 급여 
SELECT EMP_NAME, DEPT_CODE, FLOOR(AVG(SALARY)) 
FROM EMPLOYEE
GROUP BY DEPT_CODE ,EMP_NAME ;

--4. 부서이름이 인사관리부인 직원의 이름 출력 
--WHERE AND 
--TABLE : EMPLOYEE DEPARTMENT 
SELECT E.EMP_NAME, D.DEPT_TITLE 
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DEPT_TITLE = '인사관리부';

SELECT emp_name 
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DEPT_ID = E.DEPT_CODE 
AND D.DEPT_TITLE = '인사관리부';

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





--------------------------------------------------실습과제-------------------------------------------------------------

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
   
   
   
   
 


