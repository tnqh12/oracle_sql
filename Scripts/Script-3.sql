SELECT *FROM EMP_DETAILS_VIEW;


SELECT TEXT FROM USER_VIEWS;


SELECT *FROM ALL_TABLES;


SELECT * FROM DEPARTMENTS;

CREATE  OR REPLACE VIEW DEPT_EMP_VIEW
AS
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_NAME
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID;

SELECT * FROM DEPT_EMP_VIEW;

DROP VIEW DEPT_EMP_VIEW;

?????





