/*
VIEW 
논리적 가상 테이블 
테이블 모양을 하고 있지만, 실제로 값을 저장하고 있진 않음 

-SELECT 문의 실행 결과(RESULT SET)을 저장하는 객체 

VIEW 사용 목적 

1) 복잡한 SELECT 문을 쉽게 재사용하기 위해 
2) 테이블의 진짜 모습을 감출 수 있어 보안상 유리 

VIEW 사용시 주의사항 
1) 가상의 테이블(실체X)이기 때문에 ALTER 구문사용불가 
2) VIEW 를 이용한 DML(INSERT, UPDATE, DELETE)이 가능한 경우도 있지만, 
   제약이 많이 따르기 때문에 DQL(SELECT) 용도로 대부분 사용 

VIEW 작성법 
CREATE[OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름 [컬럼별칭]
AS 서브쿼리 (SELECT문)
[WITH CHECK OPTION]
[WITH READ ONLY]; 

1) OR REPLACE 옵션 : -- ORACLE 에서만 사용 가능 MYSQL(5.7 버전 이상만 가능 = 우리는 가능)
                    기존에 동일한 이름의 VIEW가 존재하면 덮어쓰기 처럼 현재 작성한 VIEW로 변경 
                     없으면 새로 생성 
2) FORCE | NOFORCE 옵션 : -- ORACLE 에서만 사용 가능
        FORCE : 서브쿼리에 사용된 테이블이 존재하지 않아도 뷰 생성 
        NOFORCE(기본값) : 서브쿼리에 사용된 테이블이 존재해야만 뷰 생성 

3) 컬럼 별칭 옵션 : 조회되는 VIEW 컬럼명을 지정 

4) WITH CHECK OPTION 옵션 : 옵션을 지정한 컬럼의 값을 수정 불가능하게 함 

5) WITH READ ONLY 옵션 : -- ORACLE 에서만 사용 가능
                        뷰에 대해 SELECT만 가능하도록 지정 

-- VIEW 테이블은 JOIN해서 만든 가상의 테이블일 경우 INSERT UPDATE DELETE 가 안됨. 
-- 단일 테이블로 VIEW를 설정하면 INSERT DELETE 가 임시적으로는 가능하지만 
-- 주로 SELECT의 결과를 임시로 저장해놓고 사용하는 용도. 
*/


-- user phone 앞에 작성된 kor) 제거
set sql_safe_updates = 0; -- 안전모드 종료

start transaction;           -- savepoint 를 사용하기 위해서는 start transaction 시작 수동 제어
savepoint sp1;              -- 임시로 되돌릴 위치이름 sp1 설정
use khtuser;              -- khtuser db로 접속
update user set phone = substring_index(phone, ')', 1); -- 수정할 update 작성
select * from user;                                        -- 제대로 수정했는지 확인

rollback to sp1;           -- 원하는대로 결과 수정 X sp1 임시저장한 위치로 되돌리기 
update user set phone = substring_index(phone, ')', -1); -- 수정
select * from user;            -- 올바르게 수정됐는지 확인

commit;                        -- 수정 결과 저장