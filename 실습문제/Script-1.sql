--모든 사원 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE; 

--EMPLOYEE 테이블 전체 행의 개수 
SELECT COUNT(*) FROM EMPLOYEE E;

--평균 급여 조회(소수점 내림 처리)
SELECT FLOOR(AVG(SALARY))
FROM EMPLOYEE ;

--부서 코드가 'D5'인 사원의 수 
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE E
WHERE DEPT_CODE = 'D5';

--전화번호가 있는 사원의 수
SELECT COUNT(PHONE) FROM EMPLOYEE E;
--전화번호 없는 사원의 수 
SELECT COUNT(PHONE)
FROM EMPLOYEE E
WHERE PHONE IS NULL;
--> NULL이 아닌 행의 수만 카운트 --> 기본 COUNT는 NULL값 제외되고 반환임 
SELECT COUNT(*)
FROM EMPLOYEE E; --WHERE절 IS NOT NULL 앞에 뭘 넣어야 하는지????

--존재하는 부서코드의 수를 조회
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE E;
--부서명이 '영업'으로 끝나는 부서 조회
SELECT DEPT_TITLE 
FROM DEPARTMENT D
WHERE  DEPT_TITLE 
LIKE  '%영업';
--이름이 대문자로 표시된 직원 조회 >>>>>>>>대문자 조회 ........? 
--SELECT EMP_NAME
--FROM EMPLOYEE E
--WHERE UPPER(EMP_NAME)
--LIKE UPPER;
--이름이 '송'으로 시작하는 직원 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME
LIKE '송%';
--급여가 200만 원 이하인 직원의 이름과 급여 조회
SELECT EMP_NAME , SALARY 
FROM EMPLOYEE E
WHERE SALARY <= 2000000;
--'Y'로 퇴사 여부가 표시된 직원의 평균 급여 조회 //AVG를 쓰면 SALARY 값 밖에 못불러오나요 ? 
SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE ENT_YN ='Y';
--. '영업'으로 끝나는 부서에 속한 직원 수 조회
SELECT COUNT(DEPT_TITLE)
FROM DEPARTMENT D
WHERE DEPT_TITLE = '%영업';
--각 부서별 직원 수 조회 ---------------------------> 부서별로 ?? 모르겠음 
SELECT COUNT(DEPT_ID)
FROM DEPARTMENT D
LIKE DEPT_TITLE ;
--급여등급이 'S5' 이상인 직원 이름과 급여 조회
SELECT EMP_NAME,SALARY,SAL_LEVEL
FROM EMPLOYEE E
WHERE SAL_LEVEL >= 'S5';
--전화번호가 '010'으로 시작하지 않는 직원 조회------------>010으로 시작하지 않는것 != 이 안되네요.........
SELECT EMP_NAME,PHONE
FROM EMPLOYEE E
WHERE PHONE !='010%';
--각 부서별 평균 급여 조회 ------------------------> 부서별로 나눠서 하는거 모르겠음 
SELECT AVG(SALARY), DEPT_CODE 
FROM EMPLOYEE E;

--'N'으로 표시된 퇴사 여부 직원 수 조회
SELECT COUNT(ENT_YN)
FROM EMPLOYEE E
WHERE ENT_YN = 'N';
--급여가 300만 원 이상인 직원 이름과 급여 조회
SELECT EMP_NAME,SALARY
FROM EMPLOYEE E
WHERE SALARY >= 3000000;
-- 테이블: JOB
--직급명이 소문자로 표시된 데이터 조회-----------> 소문자로 변환 LOWER 사용하나.. 
SELECT JOB_NAME, JOB_CODE 
FROM JOB J
WHERE LOWER(J.JOB_NAME);



