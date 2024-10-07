-- 5/21 퀄리 실습 1

--1. 직원의 풀네임 을 내림차 순으로 정렬

SELECT 
FIRST_NAME || '_' || LAST_NAME AS "풀네임"
FROM EMPLOYEES
ORDER BY 풀네임 DESC;

--2. 직원 중에서 2005년 이후 입사자 수를 조회
SELECT 
COUNT(FIRST_NAME) AS "입사자 수"
FROM EMPLOYEES
WHERE HIRE_DATE > TO_DATE('2005/01/01', 'YYYY/MM/DD') ;



--3.연봉이 전체 평균 연봉보다 높은 직원 정보 를  연봉이 많은 순으로 조회(NULL이아닌 경우)
SELECT *
FROM EMPLOYEES
WHERE SALARY  > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY  DESC;



--4. 모든 직원의 월급 , 커미션, 월급 + 커미션 으로 많은 순으로 조회

SELECT 
FIRST_NAME || '_' || LAST_NAME AS "직원명",
SALARY AS "월급",
COMMISSION_PCT AS "커미션",
SALARY + COMMISSION_PCT AS "월급 + 커미션"
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY DESC,COMMISSION_PCT DESC,  SALARY + COMMISSION_PCT DESC;

--****5.부서별로 연봉을 가장 많이 받는 직원의 정보 조회
SELECT *
FROM employees e
INNER JOIN (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
) d ON e.department_id = d.department_id AND e.salary = d.max_salary
ORDER BY e.department_id;



--****6.job_id가 sa_rep인 직원들 중에서 ㅇ비사일이 가장 빠른 직원의 정보 조회

--7.MANAGER_ID가 149 인 직원들 의 아이디, 풀네임, 월급을 조회
SELECT 
EMPLOYEE_ID AS "직원 ID",
FIRST_NAME || '_' || LAST_NAME AS "풀네임",
SALARY AS "월급"
FROM EMPLOYEES
WHERE MANAGER_ID IN(149);

*--8.job_id가 S로  시작하는 직원들 중 최저 월급을 받는 직원의 정보를 조회
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%' AND SALARY = MIN(SALARY);


--9.FIRST_NAME이나 LAST_NAME이 5문자 이하인 직원의 정보 조회

SELECT * 
FROM EMPLOYEES
WHERE  LENGTH(FIRST_NAME)<=5
OR LENGTH(LAST_NAME)<=5;

--10.짝수 년도에 고용된 직원 들 중에서 COMMISSION_PCT가 있는 직원의 정보 조회
SELECT * 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
AND MOD(TO_NUMBER(TO_CHAR(hire_date, 'YYYY')), 2) = 0;


--11.월급의 10000이상이라면 고소득자 10000미만 5000이상이라면 일반 소득자,
	--5000미만이라면 저소득자로 직원의 정보 조회
SELECT E.*,
	CASE 
		WHEN SALARY >= 10000 THEN '고소득자'
		WHEN SALARY >= 5000 AND SALARY < 10000 THEN '일반 소득자'
		WHEN SALARY < 5000 THEN '저소득자'
	END 
FROM EMPLOYEES E;

--12.월급이 2000달러에서 3000달러 사이 (양쪽다 포함)인 직원 의 정보를 월급 많은 순으로 조회
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 2000 AND 3000
ORDER BY SALARY DESC;

--13.매니저가 없는 부서의 부서명을 오름차순으로 조회
SELECT
DEPARTMENT_NAME AS "부서명"
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL 
ORDER BY DEPARTMENT_NAME ASC;

--14.매니저의 아이디가 201~205인 부서의 부서명을 오름차 순으로 조회
SELECT
DEPARTMENT_NAME AS "부서명"
FROM DEPARTMENTS
WHERE MANAGER_ID BETWEEN 201 AND 205
ORDER BY DEPARTMENT_NAME ASC;

--15.부서명에 'a'가 포함 되어 있는 부서의 정보를 조회
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%a%';
--16.부서명에 'p'가 포함 되어 있고 's'로 끝나는 부서의 정보를 조회
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%p%' AND DEPARTMENT_NAME LIKE '%s';

--17.직원들의 job_id를 12자리에 맞춰 오른 쪽으로 정렬해서 조회
SELECT LPAD(JOB_ID,12,' ')
FROM EMPLOYEES;

--18.직원들의 job_id 를 AC는 ACC로 ST는 S로 변경해서 조회
SELECT REPLACE (REPLACE (JOB_ID,'AC','ACC'),'ST','STT')
FROM EMPLOYEES;

--19.직원들의 근무 개월수, 근무 주수, 근무 일수를 조회
SELECT
(TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIRE_DATE,'YYYY')) *12 "근무 개월 수" , 
(TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIRE_DATE,'YYYY')) *52"근무 주 수", 
(TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIRE_DATE,'YYYY')) *52 *5"근무일 수"  
FROM EMPLOYEES;


-- 20. 직원들의 직무시작일과 직무종료일을 '0000년 00월 00일 00시 00분 00초'로 조회
SELECT TO_CHAR()
FROM JOB_HISTORY;

-- 21. 직원들의 직무시작일은 한달 전으로 직무종료일은 한달 후로 변경해 조회
SELECT TO_CHAR() 
FROM JOB_HISTORY;

-- 22. 직원들의 직무종료일이 포함된 달의 마지막 일자를 조회
SELECT ZB      

-- 23. JOB_ID가 IT_PROG 또는 AC_ACCOUNT 또는 AC_MGR인 것에 대해
--      IT_PROG이면 "정보부", AC_ACCOUNT이면 "회계부", AC_MGR이면 "관리부"로 조회
SELECT V.*,
       CASE 
           WHEN JOB_ID = 'IT_PROG' THEN '정보부'
           WHEN JOB_ID = 'AC_ACCOUNT' THEN '회계부'
           WHEN JOB_ID = 'AC_MGR' THEN '관리부'
       END AS "부서"
FROM EMPLOYEES V
WHERE JOB_ID IN ('IT_PROG', 'AC_ACCOUNT', 'AC_MGR');

SELECT * FROM EMPLOYEES;



-- 24. 부서별로 부서아이디, 직원의 월급합계를 조회
SELECT DISTINCT 
DEPARTMENT_ID AS "부서ID", 
SUM(SALARY) AS "직원월급 합계"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- 25. 부서별로 부서아이디, 최대급여와 최소급여의 차를 조회
SELECT 
DEPARTMENT_ID AS "부서ID",
MAX(SALARY) AS "최대 급여", 
MIN(SALARY) AS "최소 급여" 
FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID 
HAVING MAX(SALARY) != MIN(SALARY);



-- 26. 부서별로 직원의 수가 5 이상인 부서의 부서아이디, 직원수를 조회
SELECT 
DEPARTMENT_ID AS "부서ID",
COUNT(*) AS "직원수" 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
HAVING COUNT(*)>=5;

-- 27. 전체 직원의 평균월급보다 부서의 평균월급이 높은 부서의 부서아이디, 평균월급을 조회


-- 28. 직무아이디, 직무별 소속지원의 수, 부서아이디, 부서별 소속직원의 수를 조회




SELECT *
FROM EMPLOYEES, DEPARTMENTS
ORDER BY EMP;

