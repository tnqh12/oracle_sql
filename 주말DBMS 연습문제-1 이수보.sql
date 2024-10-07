--01. 모든테이블의 값을 조회해라.
SELECT *FROM ALL_TABLES;

SELECT * FROM DEPARTMENTS;

--02. department_id, department_name, location_id를 조회해라.
SELECT 
DEPARTMENT_ID,
DEPARTMENT_NAME,
LOCATION_ID
FROM DEPARTMENTS;

--03. 부서id와 위치id, 부서명을 조회해라.
SELECT 
DEPARTMENT_ID AS "부서ID",
DEPARTMENT_NAME AS "부서명",
LOCATION_ID AS "위치ID"
FROM DEPARTMENTS;

--04. 위치id의 중복값을 삭제하고, 모든 컬럼 값을 조회해라.
SELECT  DISTINCT 
LOCATION_ID AS "위치ID"
FROM DEPARTMENTS;

--05. 위치id의 오름차순으로 모든 항목을 조회해
SELECT
LOCATION_ID AS "위치ID"
FROM DEPARTMENTS
ORDER BY 위치ID ASC;

--06. 위치 id가 1500이상을 조회하시오.
SELECT
LOCATION_ID  AS "위치ID"
FROM DEPARTMENTS
WHERE LOCATION_ID >=1500;


--07. 위치 ID의 총 합계를 조회하시오.
SELECT
SUM(LOCATION_ID)  AS "위치ID"
FROM DEPARTMENTS
ORDER BY 위치ID ASC;

--08. 위치 ID의 평균 값을 조회하시오.
SELECT
AVG(LOCATION_ID)  AS "위치ID"
FROM DEPARTMENTS;

--09. 부서id가 50이상이고 위치id가 1600이상인 값을 모두 추출하시오.
SELECT 
DEPARTMENT_ID AS "부서ID",
LOCATION_ID AS "위치ID"
FROM DEPARTMENTS
WHERE DEPARTMENT_ID >=50 AND LOCATION_ID >=1600;

--10. 부서명과 위치id를 연결해서 하나의 컬럼으로 조회하시오.
SELECT 
DEPARTMENT_ID ||'_'|| LOCATION_ID AS "부서명&위치ID"
FROM DEPARTMENTS;

--11. 연결할 때 부서명과 위치id 중간에 언더바(_)를 추가하시오. ex). 장그레_이다.
SELECT 
DEPARTMENT_ID || '_' || LOCATION_ID AS "부서명&위치ID"
FROM DEPARTMENTS;


--12. 위치 id값에서 100을 더 한 값을 조회하고, 내림차순으로 정렬하시오.
SELECT
LOCATION_ID + 100 AS "위치ID"
FROM DEPARTMENTS
ORDER BY 위치ID DESC;

--13. 현재PC의 시간을 조회하시오.
select sysdate from dual;

--14. 숫자 150 + 250의 결과값을 추출하시오.
SELECT 
150+250
FROM DUAL;


--15. 현재 날짜, 연도, 월, 일, 시간, 분, 초를 출력하시오.
select 
TO_CHAR(SYSDATE,'YYYY') as  "연도",
TO_CHAR(SYSDATE,'MM') as "월",
TO_CHAR(SYSDATE,'DD') as "일",
TO_CHAR(SYSDATE,'HH24') as "시간",
TO_CHAR(SYSDATE,'MI') as "분",
TO_CHAR(SYSDATE,'SS') as "초"
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DL') FROM DUAL;
------------------------------------------------------------

--16. 위치 id가 1000이하인 값을 조회하시오.(부정문 not을 이용하여 조회)
SELECT
LOCATION_ID AS "위치ID"
FROM DEPARTMENTS
WHERE  NOT LOCATION_ID > 1000;


--17. manager id가 null인 값을 조회하시오. 
SELECT * 
FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL;

--18. manager id가 null인 아닌 정보를 조회하시오.
SELECT * 
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL;

--19. 부서명이 s로 끝나는 정보를 조회하시오.
SELECT 
DEPARTMENT_NAME AS "부서명"
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%s';

--20. 부서명이 8자리이고, s로 끝나는 부서명을 조회하시오.
SELECT 
DEPARTMENT_NAME AS "부서명"
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '________'AND DEPARTMENT_NAME LIKE '%s';

--21. 위치id가 1500이상, 부서명은 s로 끝나는 데이터를 조회하고, 컬럼 명칭은 부서명과 위치id로 표기한다. 최종 조회는 위치id기준으로 오름차순으로 정렬한다.

SELECT
DEPARTMENT_NAME AS "부서명",
LOCATION_ID  AS "위치ID"
FROM DEPARTMENTS
WHERE LOCATION_ID >=1500 AND DEPARTMENT_NAME LIKE '%s'
ORDER BY LOCATION_ID ASC;




