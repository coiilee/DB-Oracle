/* SELECT (조회) 
    - 지정된 테이블에서 원하는 데이터를 선택해서 조회하는 SQL
    - 작성된 구문에 맞는 행, 열 데이터가 조회됨
     -> 조회된 결과 행의 집합 == RESULt SET(결과 집합)
    
    - 결과는 0 행 이상이 포함될 수 있다
     -> 왜냐하면 조건에 맞는 행이 없을 수 있기 때문

 SELECT 작성하는 방법
1. SELECT       *            FROM              테이블이름;
   조회하다  모든내용을   어디서조회할 것인가?   조회할테이블이름;

2. SELECT 컬럼명, 컬럼명, ... FROM 테이블이름;
테이블 내부에 있는 모든 컬럼을 조회하는 것이 아니라 조회하고 싶은 컬럼명만 선택해서 조회


-- AS : AliaS = 별명 = 별칭
특정 테이블이나 컬럼명에 대해서 개발자가 원하는 표기로 조회할 수 있도록 설정해주는 별칭 
별칭 지정 SELECT FROM ORDER BY 절에서 가능 

GROUP BY와 WHERE 절은 작성된 별칭 사용만 가능함 

별칭 지정하기 
1) 컬럼명 AS 별칭   : 문자O, 띄어쓰기X, 특수문자X  이럴경우 _ 이용해서 띄어쓰기 표기 
2) 컬럼명 AS "별칭" : 문자O, 띄어쓰기O, 특수문자O 
3) 컬럼명 별칭      : 문자O, 띄어쓰기X, 특수문자X 
4) 컬럼명 "별칭"    : 문자O, 띄어쓰기O, 특수문자O 

-- ""의미(""사이 글자 그대로 인식)
-- 1)대/소문자 구분 
-- 2) 특수문자, 띄어쓰기 인식 



-- ORACLE에서 문자열은 ''  

SELECT 컬럼명 AS 별칭 
FROM 테이블명; 

SELECT 컬럼명 AS 별칭 
FROM 테이블명에 대한 별칭; 






 SYSDATE     SYSTIMESTAMP 
--(시스템이 나타내고 있는) 현재 시간

-- SYSDATE      : 현재 시간(년, 월, 일, 시, 분, 초) 조회
-- SYSTIMESTAMP : 현재 시간(년, 월, 일, 시, 분, 초, ms + 지역(local)) 조회

DUAL (DUmmy tAbLe) 가짜 테이블 
-- 기능이나 단순 데이터 조회를 위해 SQL에서 제공하는 존재하지 않는 가짜 테이블



-- 현재시간           한 시간 후,                     1분 후,                  10초 후 조회
   SYSDATE      SYSDATE + 1/24           SYSDATE + 1/24/60     SYSDATE +1/24/60/60 * 10
                24시간 중 1시간 후   24시간에서 60분 중 1분 후     24시간 중 60분 60초 중에 (1 * 10) 초 후

-- TO_DATE('문자열', '패턴');
-- 문자열을 패턴 형태로 해석해서 DATE 타입으로 변경하는 함수
 
3. SELECT 특정 기준에 부합한 컬럼을 조회

SELECT 조회할 컬럼명
FROM 테이블명
WHERE 조건작성;


************************
*******WHERE 절*********
************************

--테이블에서 조건을 충족하는 행을 조회할 때 사용 
--WHERE 절에는 조건식(true/false)만 작성 

--비교연산자 : >,<,>=,<=,=(같다),!=,<>(같지않다)
--논리연산자 : AND, OR NOT 

--컬럼 존재 여부 : 컬럼명 IS NULL                   /  컬럼명 IS NOT NULL 
                   컬럼 값이 존재하지 않는 경우         컬럼값이 존재하는 경우 

-- 컬럼명 IN (값1,값2,값3,....)=컬럼의 값이 ()안에 작성된 값과 일치하면 TRUE 

-- 컬럼명 NOT IN (값1,값2,값3,....)=컬럼의 값이 ()안에 작성된 값과 일치하면 FALSE 일치하지않으면 TRUE 


*****LIKE*****

비교하려는 값이 특정한 패턴을 만족 시키면 (TRUE) 조회하는 연산자 

[작성법]
WHERE 컬럼명 LIKE '패턴'; 

'%' (포함하다)
- %A : A라는 문자로 끝나는 문자열 찾기 
- A% : A라는 문자로 시작하는 문자열 찾기 
- %A% : A라는 문자가 어디에서든지 포함된 문자열 찾기 



*/




/*WHERE에서 존재 유무 확인 
IS NOT NULL = 빈 값이 아닌 칸
ex ) 이름이 비어있는 사원 조회    
    select emp_name 
    from  employee 
    where emp_name is null;
ex ) 이름이 비어있지 않은 사원 조회    
    select emp_name 
    from  employee 
    where emp_name is not null;*/


/* ***** ORDER BY절 ***** 
- SELECT문의 조회 결과(Result SET)을 정렬할 때 사용하는 구문 
SELECT 구문에서 제일 마지막에 해석됨 

[작성법]

3.SELECT 컬럼명 AS별칭, 컬럼명 , 컬럼명, ... 
1.FROM 테이블명 
2.WHERE 조건식 
4.ORDER BY 컬럼명| 별칭 | 컬럼순서 [오름/내림차순]

오름차순 : ASC(ascending)
내림차순 : DESC(descending)

ORDER BY  컬럼명;으로 오름차순 내림차순 아무것도 작성을 안해주면 기본으로 오름차순 정렬임 

NULLS FIRST / NULLS LAST
null 값을 어디에 배치할지 설정 
NULLS FIRST : null값을 맨 위에 설정 
NULLS LAST : null 값을 맨 아래에 설정 
ORDER BY에서 맨 뒤에 작성 

ORDER BY 뒤에 NULL에 대한 배치 표기가 없다면 기본값으로 맨 뒤에 배치됨 



*/



























