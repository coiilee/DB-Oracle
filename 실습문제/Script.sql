SELECT * FROM EMPLOYEE;

SELECT emp_name,salary*12 AS 연봉 
FROM EMPLOYEE
ORDER BY 연봉 DESC;

SELECT emp_name FROM EMPLOYEE 
ORDER BY emp_name DESC;

-- EMPLOYEE 테이블에서 사원들의 급여를 오름차순으로 정렬 
----SELECT emp_id, emp_name, salary 
SELECT emp_id, emp_name, salary 
FROM EMPLOYEE 
ORDER BY salary ASC ; 

-- EMPLOYEE 테이블에서 사원들의 입사일을 내림차순으로 정렬 
----SELECT emp_id, emp_name, hire_date 
SELECT emp_id, emp_name, hire_date 
FROM EMPLOYEE 
ORDER BY hire_date DESC ;

--DEPARTMENT 테이블의 부서명을 오름차순으로 출력 
----SELECT DEPT_ID, DEPT_TITLEs

SELECT dept_id, dept_title
FROM DEPARTMENT 
ORDER BY dept_title ASC;

--employee테이블에서 부서코드 없는 사원들 이름 내림차순 출력 
SELECT emp_id, emp_name ,dept_code
FROM EMPLOYEE E
WHERE dept_code IS NULL 
ORDER BY emp_name DESC;

-- employee 테이블에서 급여가 300만원 이상인 사원들의 급여 등금(salary_level)
--내림차순으로 정렬하고 
SELECT emp_id,emp_name,sal_level,salary
FROM EMPLOYEE E
WHERE salary >=3000000 
ORDER BY SAL_LEVEL DESC ;

--employee 테이블에서 오름차순 + NULLS FIRST (NULL값을 제일 위에 배치)
SELECT emp_name, phone 
FROM EMPLOYEE 
ORDER BY PHONE NULLS FIRST; 

--employee 테이블에서 오름차순 + NULLS LAST (NULL값을 제일 아래에 배치)
SELECT emp_name, phone 
FROM EMPLOYEE 
ORDER BY PHONE /*ASC NULLS LAST*/; 

--EMPLOYEE 테이블에서 내림차순 + NULLS 가장 위로 배치 
SELECT emp_name, phone 
FROM EMPLOYEE E
ORDER BY phone DESC NULLS FIRST ;








