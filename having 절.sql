--- 부서별 평균 급여라 3000000원 이상인 부서를 조회하여 부서코드 오름차순 정렬

----WHERE 절과 HAVING절 비교 ------

------1. WHERE 절 : 급여가 300만원 이상인 사원만 조회하는 것 
SELECT dept_code, AVG(salary)
FROM EMPLOYEE E
WHERE salary >= 3000000
GROUP BY DEPT_CODE, EMP_NAME; 
---SQL Error [937][42000] : ORA-00937 : 단일 그룹의 그룹 함수가 아닙니다. 
-----SELECT에 작성한 컬렴명을 GROUP BY에 컬럼명을 작성해서 표기하면 에러 해결 

------2. HAVING 절 : 그룹 급여 평균이 300만원 이상인 그룹만 조회 
SELECT dept_code, AVG(salary)
FROM EMPLOYEE E
--WHERE salary >= 3000000
GROUP BY DEPT_CODE, EMP_NAME
HAVING AVG(salary) >=3000000; 

---having절로 cafe 테이블과 menu 테이블 확인하기 

--평균 메뉴 가격이 5000원 이상인 카페의 이름과 평균 메뉴 가격을 출력 
SELECT c.cafe_name, avg(m.price) 
FROM cafe c , menu m
GROUP BY c.CAFE_NAME
HAVING avg(m.PRICE) >= 5000; 
---> 카페들로 그룹화 한 다음, 평균 가격이 5000원 이상인 카페만 필터링 해줌 
------>A카페(10~9000) B카페(2000~100000) C카페(10000~100000) 
--------->A카페 평균가격은 5000원이 안되므로 탈락함 


SELECT c.cafe_name, avg(m.price) 
FROM cafe c , menu m
WHERE m.PRICE >= 5000
GROUP BY c.CAFE_NAME;
---> 메뉴들에서 5000원 이하인 메뉴들은 모두 제외시킴 
-----> A카페 : 9000 B카페: 10000 C카페 : 10000, 100000

----- having 절의 경우 0원부터 최대 금액까지 모두 가져온 후 합산의 결과가 5000원 이상인 카페만 OK한 것 
----- where 절의 경우 각 카페에서 5000원 미만인 메뉴는 제외한 다음, 합산의 결과를 보여줌 / 따라서 where절의 평균이 더 높음 













