    SELECT * FROM department; --department 라는 테이블에 있는 모든 내용 조회하기 

    SELECT * FROM location; --LOCATION 테이블 모두 조회하기 

    SELECT * FROM job; -- JOB 테이블 모두 조회하기 

    SELECT * FROM national; -- NATIONAL 테이블 모두 조회하기 

    SELECT * FROM sal_grade; -- SAL_GRADE 테이블 모두 조회하기 

    --EMPLOYEE 테이블에서 사번 이름 급여 조회 
    SELECT emp_id, emp_name, salary FROM employee; 
    
    --EMPLOYEE 테이블에서 이름(emp_name)만 조회 
    SELECT emp_name FROM employee;
    
    --EMPLOYEE 테이블에서 emp_name hire_date 조회 
    SELECT emp_name, hire_date FROM employee;
    
    --DEPARTMENT 테이블에서 부서코드, 부서명 조회 (DEPT_ID, DEPT_TITLE)
    SELECT dept_id,dept_title FROM  department;
    
    --DEPARTMENT 테이블에서 모든 데이터 조회 
    SELECT * FROM department;
    
/* 컬럼 값 산술 연산 */
-- 컬럼 값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 갑 
-- select문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가 반영되어 조회된다. 

--EMPLOYEE 테이블에서 모든 사원의 이름, 급여, 급여*12를 해서 연봉 조회 

SELECT emp_id , emp_name , salary*12 FROM employee;

SELECT emp_id , emp_name , salary, salary*12 FROM employee;

--SALARY *12에 별칭을 붙여서 연봉이라고 표기하기 
--SALARY*12에 별칭을 붙여서 컬럼명이 조회되길 원한다면 AS 직접장성하면 됨. 

SELECT emp_id, emp_name, salary, salary*12 AS 연봉 FROM employee; 

--employee 테이블에서 emp_id ad 직원아이디, emp_name=직원이름, salary=월급으로 표기해 출력 
SELECT emp_id AS 직원아이디, emp_name AS 직원이름 , salary AS 월급 FROM employee; 
    


SELECT SYSDATE FROM DUAL; 
SELECT SYSTIMESTAMP FROM DUAL ; 24/12/04 14:28:21.918000000 +09:00

/*
날짜 데이터 연산하기 ( + , - 만 가능) 
--> +1 == 1일 추가 
--> -1 == 1일 감소 
--> 일 단위로 계산 
*/

--가짜테이블을 이용해서 AS 어제, AS 현재, AS 내일, AS 모레 조회하기 
SELECT SYSDATE -1 AS 어제, SYSDATE AS 현재 , SYSDATE +1 AS 내일 , SYSDATE +2 AS 모레 FROM DUAL;



SELECT TO_DATE ('2024-12-04' , 'YYYY-MM-DD')FROM DUAL; 

--EMPLOYEE 에서 모든 사원의 이름, 입사일, 근무일수 (SYSDATE - 입사일 ) 조회하기 
SELECT emp_name, hire_date , SYSDATE - hire_date FROM employee; 

--3. select 특정 기준에 부합한 컬럼을 조회 
/*
SELECT 조회할 컬럼명 
FROM 테이블명 
WHERE 조건작성; 

WHERE에서 존재 유무 확인은 IS NOT NULL = 빈 값이 아닌 칸 

ex) 이름이 비어있는 사원 조회 
select emp_name from employee where emp_name is null; 

ex) 이름이 비어있지 않은 사원 조회 : 
select emp_name from employee where emp_name is not null; 
*/

--퇴사 여부가 y인 사원의 이름과 퇴사일 조회 
SELECT EMP_NAME, ENT_DATE 
FROM EMPLOYEE 
WHERE ENT_YN='Y'; 

--보너스가 잇는 사원의 이름고 ㅏ보너스 금액 조회 where bonus is not null ; 
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL; 


--급여가 300만원 이상인 사원의 이름과 급여 조회하기 
SELECT emp_name, salary 
FROM employee 
WHERE salary >=3000000 ;

--department 테이블에서 location_Id가 'L1' 지역에 위치한 부서의 모든 정보 조회 
SELECT * 
FROM department 
WHERE LOCATION_ID = 'L1';

--employee 테이블에서 이메일 주소가 없는 사원의 이름 조회 
SELECT emp_name, email 
FROM employee
WHERE email is null;

--employee 테이블에서 관리자가 없는 사원의 정보 조회 
SELECT * 
FROM EMPLOYEE
WHERE MANAGER_ID is null;


--employee 테이블에서 모든 사원의 이름, 입사일, 근무일수(현재시간-입사일) 조회 
SELECT emp_name , hire_date , SYSDATE  - hire_date 
FROM employee;

--포맷팅을 활용해서 보기좋게 정리하자 
--FLOOR (소수점 아래 모두 버리기) 이용해서 정리 
--CEIL (올림 처리)
--ROUND(반올림 처리) 
--로또 번호 생성하기 MATH.FLOOR(MATH.RANDOM()); 

SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE-HIRE_DATE)
FROM EMPLOYEE; 
--FLOOR(SYSDATE-HIRE_DATE) 입사일부터 현재까지의 차이를 계산하고 소수점 아래는 모두 버려 점수로 나타냄 
--소수점 아래를 버림하는 이유는 반올림 할 경우 입사일이 하루 추가되므로 현재 입사해서 근무한 일자에 어긋남 

--EMPLOYEE 테이블에서 부서 코드가 D9 부서가 아닌 사원들만 조회 
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE != 'D9'; 

--employee테이블에서 연봉이 5000만원 이하인 사원의 사번, 이름,연봉 조회 
--emp_id emp_name salary*12 AS 연봉 
--QUIZ1 : where 절을 요구사항에 맞게 작성하기 

SELECT EMP_NAME, EMP_ID, SALARY*12 AS 연봉 
FROM EMPLOYEE 
WHERE SALARY*12 <= 50000000;

--QUIZ2 : EMPLOYEE 테이블에서 부소코드가 D6이 아닌 사원의 이름, 부서코드, 전화번호 조회하기 
SELECT EMP_NAME,DEPT_CODE,PHONE
FROM EMPLOYEE
WHERE DEPT_CODE !=  'D6';

--employee 테이블에서 부서코드가 d1 d3 이 아닌 사원의 이름, 부서코드 조회 
SELECT EMP_NAME, DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE != 'D1'
AND DEPT_CODE != 'D3';


--EMPLOYEE 테이블에서 부서코드가 D1 , D3가 아닌 사원 조회 
SELECT EMP_NAME , DEPT_CODE
FROM EMPLOYEE 
WHERE DEPT_CODE NOT IN ('D1','D3');



--D5 부서에 속한 사원의 사원번호 사원이름 부서코드 조회 
SELECT EMP_NAME, EMP_NO, DEPT_CODE 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D5';

--입사일이 2000년 이후인 직원들의 정보 조회 employee 
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('2000-01-01','YYYY-MM-DD'); 

--퇴직 여부가 Y 이고 퇴사일이 2015년 이후인 직원들의 정보 조회하기 
SELECT *
FROM EMPLOYEE
WHERE ENT_YN = 'Y'
AND ENT_DATE >= TO_DATE('2015-01-01','YYYY-MM-DD'); 

--EMPLOYEE 테이블에서 성씨가 '전'씨인 사원 이름 조회 
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '전%';

--EMPLOYEE 테이블에서 이름이 수로 끝나는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '%수';

--1. 
SELECT * FROM EMPLOYEE;
--2. 
SELECT LOCATION_ID, DEPT TITLE FROM DEPARTMENT; 
--3. 
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;
--4. 
SELECT *
FROM DEPARTMENT 
WHERE LOCATION_ID = 'L1'; 
--5 
SELECT * 
FROM EMPLOYEE
WHERE BONUS IS NULL; 
--6 //AND 부분을 LIKE 로 적었었음 
SELECT EMP_NAME 
FROM EMPLOYEE
WHERE SALARY>=2500000
AND BONUS >= 0.2 ;
--7. 
SELECT * 
FROM EMPLOYEE 
WHERE JOB_CODE = 'J6' 
OR JOB_CODE = 'J7';
-- WHERE JOB_CODE IN('J6','J7'); 
--8
SELECT DEPT_TITLE
FROM DEPARTMENT 
WHERE DEPT_TITLE
LIKE '%영업%';
--9
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('2000-01-01','YYYY-MM-DD')
ORDER BY HIRE_DATE;
--10
SELECT * 
FROM EMPLOYEE
WHERE ENT_YN = 'Y' 
AND ENT_DATE >= TO_DATE('2015-01-01','YYYY-MM-DD');
--11 
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '김%';
--12 IN으로도 쓸 수 있음 
SELECT * 
FROM EMPLOYEE
WHERE JOB_CODE = 'J1'
OR JOB_CODE = 'J2'
OR JOB_CODE = 'J3' ;
--13 
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D1', 'D5', 'D9');
--14 
SELECT EMP_NAME , DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;
--15
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '%김%';
--16 
SELECT * 
FROM EMPLOYEE
WHERE EMAIL 
LIKE '%gmail%';
--17 
SELECT * 
FROM EMPLOYEE
WHERE PHONE 
LIKE '010%';
--18
SELECT * 
FROM EMPLOYEE
WHERE PHONE
LIKE '%1234';
--19 영업으로 끝나는 ....? '%영업' 인가 그럼 해외영업1부는 ? 
SELECT DEPT_TITLE
FROM DEPARTMENT 
WHERE DEPT_TITLE 
LIKE '%영업';
--20 
SELECT DEPT_TITLE
FROM DEPARTMENT 
WHERE DEPT_TITLE 
LIKE '%관리%';
--21 
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '이%'; 
--22 이거다시하자아아아 문자 위치별로 조회도 되는지 
SELECT EMP_NAME, JOB_CODE
FROM EMPLOYEE 
WHERE JOB_CODE 
LIKE 'J1%';
--WHERE JOB_CODE LIKE '

--23 
SELECT *
FROM EMPLOYEE
WHERE EMAIL 
LIKE  '%com';
--24  
SELECT * 
FROM EMPLOYEE
WHERE HIRE_DATE 
LIKE '2021%';
--25 
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '%호';
--26 
SELECT * 
FROM EMPLOYEE
WHERE EMAIL 
LIKE '%company%';
--27 
SELECT * 
FROM EMPLOYEE
WHERE EMP_NAME 
LIKE '수%' 
OR EMP_NAME 
LIKE '%수';

SELECT * FROM EMPLOYEE;




































