--DQL(Data Query Language) �� �� �� : Data�� ��ȸ�ϴ� ��ɾ�
--SELECT (�÷���)
--FROM (���̺��)

desc emp;  --���̺��� �÷�����

--��ü������
Select empno,ename,job,mgr,hiredate,sal,comm,deptno
    from emp;

select*
from emp;

--�κ��÷� ������
select ename,empno,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--   +,-,*,/ ������ �����ڴ� ����
-- �÷��� ������� �����Ѵ�.
--null ���� ����Ұ�
--�÷��� ��Ī�� ����� �� �ִ�. (as ����)
select ename,sal,sal*12+ nvl(comm,0)as ����,comm
from emp;

--����������
--select �÷���
--from ���̺��
--ORDER BY [���̸�] or ASC; ������������ ����   // ORDER BY [���̸�] DESC; ������������ ����
--ORDER BY [���̸�] ASC, [�ٸ����̸�] DESC; // ���������� �������� ���ÿ� ���

select *
from emp
order by sal desc;

--=W=H=E=R=E=====S=T=A=R=T=================================================================================

--���ǰ˻�
--SELECT �÷���
--FROM ���̺��
--WHERE ���ǽ�(�÷��� = ��);    <, >, =, != / <> , <= , >= , and, or     (�ʿ��� �����͸� ������ ���)

SELECT*
FROM EMP
WHERE sal >=3000; --(�޿��� 3000 �̻��� ����� ���)

SELECT *
FROM EMP
WHERE deptno = 30; --(�μ� ��ȣ�� 30�� ����� ���)

--��¥�� �������� ����� ��
--' '
--��¥�� ũ�Ⱑ �ִ�
SELECT *
FROM EMP
WHERE HIREDATE < '1982/01/01';

--NOT ������ ������
SELECT*
FROM EMP
WHERE SAL !=3000;  -- < >=3000

SELECT*
FROM EMP
WHERE NOT SAL = 3000;

--AND �ΰ��� �̻��� ������ ��� ���ΰ��
SELECT*
FROM emp
WHERE deptno = 30 AND JOB = 'SALESMAN' and EMPNO = 7499; --(Table�� �ִ� data�߿� ���ڰ��� ��ҹ��� ���� �ʼ�)

-- OR �ΰ� �̻��� �����߿� �ϳ� �̻� ���� ���
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR SAL >= 2000;

--AND , OR
--���� ������ ǥ�� �� �� ���
SELECT*
FROM EMP
WHERE SAL >= 1000 AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL <= 1000 OR SAL >= 3000;

--IN ������
--Ư�� ���� �ش��ϴ� ������ ���� �� ����
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK'); --(IN �����ڿ� NOT�����ڸ� Ȱ��)

--BETWEEN A AND B ������
SELECT *
FROM EMP
WHERE SAL BETWEEN 100 AND 3000;

SELECT*
FROM EMP
WHERE SAL NOT BETWEEN 100 AND 3000;  --(BETWEEN�����ڿ� NOT�����ڸ� Ȱ��)

--LIKE ������(���ϵ�ī��)
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
--���ϵ� ī�带 ����Ѵ� ( %, _ )
-- % : ���̿� ������� ��� ���� �����͸� �ǹ�    
-- _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�
SELECT*
FROM EMP
WHERE ENAME LIKE 'F%';            -- _F , %F% ,  \ , _ ESCAPE '\' , '_'

SELECT*
FROM EMP
WHERE ENAM LIKE 'F\_A%' ESCAPE '\';           --ESCAPE���� ����ϸ� ���ϵ�ī�� _,%�� ������ ���ڷμ� ��밡��

--IS NULL ������ (IS NOT NULL)
--NULL�� �������� �ʱ� ������ ������ �Ұ� �ϹǷ�, ���翡 ������ ��ȸ�ϴµ� ����Ѵ�.
SELECT*
FROM EMP
WHERE MGR IS NULL;        --���� ����� ���� ��� ������ ���

SELECT*
FROM EMP
WHERE MGR IS NOT NULL;      --���� ����� �ִ� ��� ������ ���

--���� ������
--SELECT���� ���� �����͸� ��ȸ�� ����� �ϳ��� ���հ� ���� ����Ѵ�.
--�� �� �̻��� SELECT���� ������ �� ����Ѵ�. �÷��� Ÿ���� �����ؾ� �Ѵ�(�÷��� �̸��� �������)
--UNION = ������(�ߺ�����)
--UNION ALL = ������(�ߺ�����)
--MINUS = �� SELECT������ ���� SELECT�� ��� ���� �������� ���� �����͸� ���(������)
--INTERSECT = SELECT���� ��� ���� ���� ���� ��� (������)

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION   --UNION ALL , MINUS, INTERSECT
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;

SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 10
MINUS
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE DEPTNO = 20;

--�񱳿�����/��������/LIKE/IS NULL,IS NOT NULL/���տ����� `0- -0` 

--=W=H=E=R=E==========E=N=D==============================================================================

--Q1 

SELECT *
FROM EMP
WHERE ENAME LIKE '%S';
 
--Q2

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP 
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

--Q3

--���տ����ڸ� ���X
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO 
IN (20, 30) AND SAL > 2000;

--���տ����ڸ� ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20 AND SAL > 2000
UNION ALL
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND SAL > 2000;

--Q4

SELECT * 
FROM EMP
WHERE SAL <= 2000 OR SAL >= 3000;
 
--Q5

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30 
AND SAL NOT BETWEEN 1000 AND 2000;

--Q6

SELECT *
FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';


--==F=U=N=C=T=I=O=N====S=T=A=R=T================================================================
--�Լ�
--�����Լ� upper lower initcap length substr instr replace lpad,rpad concat trim,ltrim,rtrim
--�����Լ� round trunc ceil,floor mod  
--��¥�Լ� add_months months_between next_day,last_day round trunc
--�ڷ�����ȯ�Լ� to_char to_number to_date

--=��=��=��=��= 

--UPPER : ��ȣ �� ���� ������ �빮�ڷ� ����
SELECT 'Welcome',UPPER('Welcome')
FROM DUAL;

SELECT *
FROM EMP
WHERE LOWER(ENAME) = 'scott';    --(���ڿ��� �빮�ڷ� �����Ͽ� 'SCOTT' ã��)

--LOWER : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ����
SELECT 'Welcome',LOWER('Welcome')
FROM DUAL;

SELECT LOWER(ENAME),UPPER(ENAME)   --(���� �ҹ��ڿ� �빮�ڷ� ����ϱ�)
FROM EMP;

--INITCAP : ��ȣ �� ���� ������ �� ù ���ڴ� �빮��, ������ ���ڴ� �ҹ��ڷ� ����
SELECT 'WELCOME',INITCAP('WELCOME')
FROM DUAL;

--LENGTH : Ư�� ���ڿ��� ���̸� ���� �� ���
SELECT ENAME,LENGTH(ENAME)
FROM EMP;

--SUBSTR : ���ڿ� �Ϻθ� ����
SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',2,3) 
FROM DUAL;

--INSTR : ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ�� ã�Ƽ� ���  (�ΰ��̻� �װ�����)
SELECT INSTR('Welcome to Oracle','e',3,2)
FROM DUAL;

--REPLACE : Ư�����ڸ� �ٸ����ڷ� ����
SELECT 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
FROM DUAL;

--LPAD,RPAD : ������ �� ������ Ư�� ���ڷ� ä��ų� ������ ����(Leftpad, Rightpad)
SELECT 'oracle',LPAD('oracle',10,'#'),RPAD('oracle',10,'*'),LPAD('oracle',10)
FROM DUAL;

SELECT RPAD('990103-',14,'*')
FROM DUAL;

--CONCAT : �� ���ڿ� �����͸� ��ħ
SELECT CONCAT(empno,ename), empno ||' + '|| ename
FROM EMP;

--TRIM,LTRIM,RTRIM : Ư�� ���ڸ� ����


--=��=��=��=��=

--ROUND : Ư�� ��ġ���� �ݿø�
SELECT ROUND(1234.5678), 
ROUND(1234.5678,0), 
ROUND(1234.5678,3),
ROUND(1234.5678,-3) 
FROM DUAL;

--TRUNC : Ư�� ��ġ���� ����
SELECT TRUNC(1234.5678), 
TRUNC(1234.5678,0), 
TRUNC(1234.5678,3),
TRUNC(1234.5678,-3) 
FROM DUAL;

--CEIL,FLOOR : ū ���� �� ���� ������ , ���� ���� �� ���� ū ���� ��ȯ
SELECT CEIL(5.167824),FLOOR(3.13244),
CEIL(-5.123),FLOOR(-3.13244)
FROM DUAL;

--MOD : ������ ���ڸ� ���� ������ ���� ��ȯ
SELECT MOD (15, 6),
MOD(100,14),
MOD(6,2)
FROM DUAL;

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 1;

--=��=¥=��=��= 

--SYSDATE : ���翡 ��/��/��/��/��/��
SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE - HIREDATE AS �ٹ��ϼ� 
FROM EMP;

SELECT TRUNC((SYSDATE - HIREDATE) / 365) AS �ټӳ��
FROM EMP; 

--ADD_MONTHS : �� ���� ���� ��¥�� ����
SELECT SYSDATE,
ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

--MONTHS_BETWEEN : �� ��¥ ���� ���� �� ���̸� ����
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE,SYSDATE) AS M1,
MONTHS_BETWEEN(SYSDATE,HIREDATE) AS M2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS M3 
FROM EMP;

--NEXY_DAY,LAST_DAY : ���ƿ��� ����, ���� ������ ��¥�� ���� 
SELECT SYSDATE,
NEXT_DAY(SYSDATE, '������'),LAST_DAY(SYSDATE)
FROM DUAL;

--ROUND,TRUNC : ��¥�� �ݿø�,������ ��
SELECT SYSDATE,
ROUND(SYSDATE,'CC') AS FORMAT_CC,
ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY,
ROUND(SYSDATE,'Q') AS FORMAT_Q,
ROUND(SYSDATE,'DDD') AS FORMAT_DDD,
ROUND(SYSDATE,'HH')AS FORMAT_HH
FROM DUAL;

SELECT SYSDATE,
TRUNC(SYSDATE,'CC') AS FORMAT_CC,
TRUNC(SYSDATE,'YYYY') AS FORMAT_YYYY,
TRUNC(SYSDATE,'Q') AS FORMAT_Q,
TRUNC(SYSDATE,'DDD') AS FORMAT_DDD,
TRUNC(SYSDATE,'HH')AS FORMAT_HH
FROM DUAL;


--=��=��=��=��=ȯ=��=��=

--TO_CHAR : ��¥,����->����
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS ����ð�     --��¥->����
FROM DUAL;
SELECT hiredate , TO_CHAR(HIREDATE,'YYYY-MM-DD HH24:MI:SS') AS �Ի�����
FROM EMP;

SELECT TO_CHAR(123456,'L999,999')                                                          --����->����
FROM DUAL;
SELECT SAL, TO_CHAR(SAL, 'L999,999'),TO_CHAR(SAL,'$9,9999.9')                       
FROM EMP;

--TO_NUMBER : ����->����
SELECT '20000' - 10000   --�������� ���ڴ� �ڵ����� ���ڵ����ͷ� ����ȯ�� �Ͼ <<�Ͻ��� ����ȯ>>
FROM DUAL;

SELECT TO_NUMBER('2,400', '999,999') - TO_NUMBER('5,000', '999,999')
FROM DUAL;                      

--TO_DATE : ���� -> ��¥
SELECT TO_DATE('2022-05-21',  'YYYY-MM-DD') AS ����
FROM DUAL;

SELECT*
FROM EMP
WHERE HIREDATE > TO_DATE('19820101', 'YYYY/MM/DD');


--=N=U=L=L=ó=��=��=��=

--NVL�Լ� :  NULL�� �ƴ� ��� �����͸� �״�� ��ȯ, NULL�� ��� ������ ������ ��ȯ
--NVL�� NULL �������� Ÿ�԰� ���� Ÿ���� �����ؾ� �Ѵ�.  ( NVL(����,����) NVL(����,����)  )
SELECT ENAME �����,SAL,SAL*12+NVL(COMM,0)AS ����, COMM
FROM EMP;


SELECT ENAME,JOB,NVL(TO_CHAR(MGR,'9999') , 'CEO') AS MGR
FROM EMP
WHERE MGR IS NULL;

--NVL2�Լ� : NULL�� �ƴ� ��� �����͹�ȯ OR ���� , NULL�� ��� ������ ������ ��ȯ OR ����
--NVL2�� NULL ������ Ÿ�԰� ���� Ÿ���� �ƴϿ��� �������.
SELECT COMM, NVL2(COMM,'O','X')
FROM EMP;

--=��=��=��=��=��=

--DECODE �Լ� : Ư�����ǿ� ��ȯ�� �����͸� ���� (SWTICH-CASE)
--�ܼ���
SELECT ENAME,JOB,DEPTNO,
             DECODE(DEPTNO,10,'AAA',20,'BBB',30,'CCC','��Ÿ') AS �μ���
FROM EMP;
             

--CASE�� : Ư�����ǿ� ��ȯ�� �����͸� ���� (IF��)
--������ �������� ���� �� �� �ִ�.
SELECT EMPNO,ENAME,JOB,DEPTNO,
CASE 
             WHEN DEPTNO=10 THEN 'AAA'
             WHEN DEPTNO=20 THEN 'BBB'
             WHEN DEPTNO=30 THEN 'CCC'
             ELSE '��Ÿ'
END AS �μ���
FROM EMP;

SELECT ENAME,JOB,SAL,
CASE
             WHEN SAL BETWEEN 3000 AND 5000 THEN '�ӿ�'
             WHEN SAL >= 2000 AND SAL < 3000 THEN '������'
             WHEN SAL >= 500 AND SAL <2000 THEN '���'
             ELSE '��Ÿ'
END AS ����
FROM EMP;


--==F=U=N=C=T=I=O=N====E=N=D==================================================================

SELECT DATE_OF_BIRTH ,TO_CHAR(DATE_OF_BIRTH,'YYYY/MM/DD'),
            ROUND((SYSDATE - DATE_OF_BIRTH) /365) ||'��' AS ����
FROM CUSTOMERS;


SELECT DATE_OF_BIRTH ,ROUND((SYSDATE - DATE_OF_BIRTH) /365) ||'��' AS ����,
CASE   
          WHEN  ROUND((SYSDATE - DATE_OF_BIRTH) /365) >=10 AND ROUND((SYSDATE - DATE_OF_BIRTH) /365) <30 THEN '10��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 20 AND 29 THEN '20��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 30 AND 39 THEN '30��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 40 AND 49 THEN '40��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 50 AND 59 THEN '50��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 60 AND 69 THEN '60��'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 70 AND 79 THEN '70��'
          ELSE '��Ÿ'
END AS ���ɴ�
FROM CUSTOMERS;

--Q1
SELECT EMPNO, RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
       ENAME, RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5  AND LENGTH(ENAME) < 6; 

--Q2
SELECT EMPNO, ENAME, SAL, TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP; 

--Q3
SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '�� �� ��'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
  FROM EMP; 

--Q4
SELECT EMPNO, ENAME, MGR,
CASE
          WHEN MGR IS NULL THEN '0000'
          WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
          WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
          WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
          WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
          ELSE TO_CHAR(MGR)
END AS CHG_MGR
FROM EMP;

--=MULTI-ROW=F=U=N=C=T=I=O=N====S=T=A=R=T====================================================

--=��=��=��= =��=��=
--�������� �������� �ϳ��� ��� ���� ����
--�Ϲ��÷��� ���� ��� �Ұ�
--ũ�� �񱳰� ������ ��� Ÿ�Կ� ��밡��

--SUM : �հ�
SELECT SUM(SAL)
FROM EMP;

--AVG : ���
SELECT AVG(SAL)
FROM EMP;

--COUNT : ������ ����
SELECT COUNT(SAL),COUNT(COMM)
FROM EMP;

--MAX, MIN : �ִ�,�ּڰ�
SELECT MAX(SAL),MIN(SAL)
FROM EMP;

SELECT MIN(HIREDATE),MAX(HIREDATE)
FROM EMP
WHERE deptno =20;

--=G=R=O=U=P= =B=Y=��=
--Ư�� �� �Ǵ� �����͸� �������� �����͸� �׷����� ���´�.

--SELECT [�÷���]
--FROM   [���̺��]
--WHERE  [���ǽ�]
--GROUP BY [�÷��� �׷�ȭ]  =>SELECT���� �׷��Լ��� ���� ����� �� �ִ�.
--ORDER BY [�÷��� ����(�����ҷ��� ��)]  ==>�� �������� �ۼ�

SELECT AVG(SAL), DEPTNO 
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO, JOB DESC;

--=H=A=V=I=N=G=��=
--GROUP BY���� �ִ� �������� ��� �����ϴ�.
--�׷�ȭ�� ��� ���� ������ �����ϴµ� ����Ѵ�. 
--���ǽ��� �ۼ��Ҷ� �׷��Լ��� ����Ѵ�.

--SELECT [�÷���]
--FROM   [���̺��]
--WHERE  [���ǽ�]   => �׷��Լ� ���Ұ�/GROUP BY, HAVING ���� ���� ����ȴ�***
--GROUP BY [�÷��� �׷�ȭ]  =>SELECT���� �׷��Լ��� ���� ����� �� �ִ�.
--HAVING  [��� �׷��� �����ϴ� ���ǽ�] => �׷��Լ��� ����Ѵ�
--ORDER BY [�÷��� ����(�����ҷ��� ��)]  ==>�� �������� �ۼ�


SELECT AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <=3000
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >=2000
ORDER BY DEPTNO, JOB;

--=MULTI-ROW=F=U=N=C=T=I=O=N====E=N=D========================================================


--=J=O=I=N==S=T=A=R=T===========================================================================

--JOIN : �ΰ� �̻��� ���̺��� �����͸� ��ȸ
--FROM���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�.
--WHERE���� JOIN ������ �ۼ��ؾ� �Ѵ�.



--==CROSS join : WHERE�� ���� ���


--==EQUI join(�����)== : WHERE ������� => =
SELECT EMP.ENAME,EMP.JOB,EMP.DEPTNO,DEPT.DNAME,DEPT.LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
--�������� ���� �÷��� �Ҽ��� ���� �ʾƵ� �ȴ�.
SELECT ENAME,JOB,E.DEPTNO,DNAME,LOC
FROM EMP E,DEPT D     --���̺� ��Ī�ο�(�ο��� �ڷδ� ���� ���̺���� ����� �� ����)
WHERE E.DEPTNO = D.DEPTNO;


--==NON EQUI join(������)== : WHERE ���������� => AND , OR
SELECT ENAME, SAL, GRADE, LOSAL, HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
--WHERE E.SAL >= S.LOSAL AND E.SAL <=S.HISAL;

--��� , �̸�, �޿�, �μ���ȣ, �μ���, �޿����
--EMP               DEPT              SALGRADE
SELECT EMPNO,ENAME,SAL,D.DEPTNO,DNAME,GRADE
FROM EMP E , DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;


--==SELF join(��ü����)=INNER join== : WHERE �ϳ��� ���̺��� ����Ѵ�
SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME
FROM EMP E, EMP M --�ݵ�� ��Ī �ο�
WHERE E.MGR = M.EMPNO;
 
SELECT WORK.ENAME, FRIEND.ENAME
FROM EMP WORK, EMP FRIEND
WHERE WORK.DEPTNO= FRIEND.DEPTNO
AND WORK.ENAME = 'SCOTT' 
AND FRIEND.ENAME != 'SCOTT';


--==OUTER join(�ܺ�����)== : WHERE�� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���� ����Ѵ�. => (+)
SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME
FROM EMP E, EMP M 
WHERE E.MGR = M.EMPNO(+);      --�����Ͱ� ���� ���̺��ʿ� (+)�� ���δ�.

SELECT ENAME,SAL,D.DEPTNO,DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

--------------------------------------
--=====ANSI JOIN====(ǥ�� ���� ���)
--CROSS JOIN
--INNER JOIN(EQUI, NON EQUI, SELF)
--OUTER JOIN( (+) ) // [LEFT, RIGHT, FULL] OUTER JOIN
--NATURAL JOIN

SELECT ENAME,SAL,DNAME,LOC
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT ENAME,SAL,DNAME,LOC
FROM EMP E INNER JOIN DEPT D
USING(DEPTNO) -- ���� ���̺��� �÷����� ������ ��� 
WHERE ENAME = 'SCOTT';

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E INNER JOIN EMP M
ON E.MGR = M.EMPNO;

SELECT EMPNO,ENAME,SAL,GRADE
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E LEFT OUTER JOIN EMP M       --�����Ͱ� �ִ� ���� �����Ѵ�.
ON E.MGR = M.EMPNO;

SELECT EMPNO,ENAME,SAL,D.DEPTNO,DNAME,GRADE
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
INNER JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT ENAME,SAL,D.DEPTNO,DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

--=J=O=I=N==E=N=D=========================================================================

-- Q1
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
  FROM EMP E NATURAL JOIN DEPT D
 WHERE E.SAL > 2000;

-- Q2
SELECT DEPTNO,
       D.DNAME,
       TRUNC(AVG(SAL)) AS AVG_SAL,
       MAX(SAL) AS MAX_SAL,
       MIN(SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E JOIN DEPT D USING (DEPTNO)
GROUP BY DEPTNO, D.DNAME;

--Q3
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY D.DEPTNO, E.ENAME;

--Q4
SELECT D.DEPTNO, D.DNAME,
       E.EMPNO, E.ENAME, E.MGR, E.SAL, E.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E RIGHT OUTER JOIN DEPT D
                ON (E.DEPTNO = D.DEPTNO)
              LEFT OUTER JOIN SALGRADE S
                ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
              LEFT OUTER JOIN EMP E2
                ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO; 

--=S=U=B=Q=U=E=R=Y==S=T=A=R=T==========================================
--==��������
--SELECT ������ ��ø�ؼ� ����ϴ°�(WHERE)


SELECT ENAME, MAX(SAL)
FROM EMP;                    --��������

SELECT ENAME,SAL
FROM EMP
WHERE SAL = ( SELECT MAX(SAL) FROM EMP );        --��������

SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SCOTT';

SELECT DNAME
FROM DEPT
WHERE DEPTNO = 20;

SELECT DNAME
FROM DEPT
WHERE DEPTNO =(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME = 'SCOTT');
                       
SELECT ENAME,DEPTNO
FROM EMP
WHERE DEPTNO = (  SELECT DEPTNO
                           FROM DEPT
                           WHERE LOC = 'DALLAS' );
 
SELECT ENAME,SAL
FROM EMP
WHERE MGR = (
                         SELECT EMPNO
                         FROM EMP
                         WHERE ENAME = 'KING' );                

--==������ ��������==    
--IN / ANY / ALL / (SOME, EXISTS �߻������ �ʴ´�.)

--IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� ������ TRUE
SELECT*
FROM EMP
WHERE SAL IN (5000,3000,2850);

SELECT*
FROM EMP
WHERE SAL IN (
                     SELECT MAX(SAL)
                     FROM EMP
                     GROUP BY DEPTNO );


--ANY,SOME : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE                         
SELECT *
FROM EMP
WHERE SAL = ANY (
                     SELECT MAX(SAL)
                     FROM EMP
                     GROUP BY DEPTNO );
                     
SELECT *
FROM EMP
WHERE SAL > SOME (
                     SELECT MAX(SAL)
                     FROM EMP
                     GROUP BY DEPTNO );                     
                     

--ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE
SELECT*
FROM EMP
WHERE SAL > ALL (SELECT SAL
                         FROM EMP
                         WHERE DEPTNO = 30);


--EXISTS : ���������� ����� �����ϸ�(����1�� �̻�) TRUE
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 10);
                    
--���߿� ��������
SELECT *
FROM EMP
WHERE (DEPTNO , SAL) IN ( SELECT DEPTNO , MAX(SAL)
                                   FROM EMP
                                   GROUP BY DEPTNO);
                                   
--=S=U=B=Q=U=E=R=Y==E=N=D=============================================          


--=D=M=L==S=T=A=R=T====================================================

--DML(Data Manipulation Language) : ���̺� �����͸� �߰�, ����, ���� �Ҷ� ���
--INSERT, UPDATE, DELETE


--====INSERT==== : ���̺� DATA ����

--INSERT INTO ���̺�� (�÷���1, �÷���2,........)
--VALUES (��1 , ��2,....)

--�÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�
--�ۼ� ������� 1 : 1 ��Ī�ȴ�.

CREATE TABLE DEPT_TEMP
AS
SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP --����÷��� �Է��� �� �÷����� ���� (DEPTNO,DNAME,LOC)
VALUES(50,'DATABASE','SEOUL');

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO,DNAME)
VALUES(60,'JSP');

INSERT INTO DEPT_TEMP 
VALUES(70,'HTML','SEOUL');

INSERT INTO DEPT_TEMP (DEPTNO,DNAME) 
VALUES(50,'DATABASE');--�Ͻ��� NULL ������ ����

INSERT INTO DEPT_TEMP  (DEPTNO,DNAME,LOC)
VALUES(50,'DATABASE',NULL); --����� NULL ������ ����

--�� ¥ �� �� �� ���� 

CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1 != 1;    --�׻� FALSE�� �Ǿ� ���� ����� ���� �ʴ´�.

SELECT* FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999, 'ȫ�浿' , 'PRESIDENT' , NULL , '2001/01/01', 5000, 1000, 10);

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(3111, '��û��' , 'MANAGER' , 9999 , SYSDATE , 4000, NULL, 30);


--====UPDATE==== : ���̺� DATA�� ����(����)

--UPDATE ���̺��
--SET �÷��� = ��, �÷��� = ��, ....
--WHERE ���ǽ�

--���ǽ��� ������� ������ ��� ���� �����Ͱ� ���� ��
--ROLLBACK; �� ����ؼ� ������ ������ �ǵ��� �� �ִ�.

CREATE TABLE DEPT_TEMP2
AS SELECT *FROM DEPT;

SELECT*FROM DEPT_TEMP2;

DROP TABLE DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL' , DNAME = 'DATABASE'
WHERE DEPTNO = 40;


--====DELETE==== : ���̺� DATA�� ����

--DELETE FROM ���̺��
--WHERE ���ǽ�

--�������� ������� ������ ��� �����Ͱ� ���� �ȴ�.

CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

DROP TABLE EMP_TEMP2;

SELECT*FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
WHERE JOB = 'PRESIDENT';

DELETE FROM EMP_TEMP2
WHERE ENAME = 'SCOTT';

ROLLBACK;

--DROP TABLE [���̺��̸�]; ���̺� ��ü ����
--DELETE FROM [���̺��̸�]; ���̺� �� ������ ����


--=D=M=L==E=N=D========================================================


--=T=R=A=N=S=A=C=T=I=O=N==S=T=A=R=T===================================

--TCL : Transaction Control Language : �������� �������� �Ǵ� ��� (Ʈ�����)
---COMMIT, ROLLBACK, SAVEPOINT

--====COMMIT : ���������� ���� ����(���̺��� ������ �ݿ�) Ʈ����� ����
--====ROLLBACK : ���������� ���� ���(���̺��� ������ �� �ݿ�) ���� Ŀ�� �ܰ�� ȸ��
--====SAVEPOINT : ROLLBACK �� ����Ʈ ���� (ANSI ǥ�� SQL �ƴ�)

CREATE TABLE DEPT01
AS SELECT * FROM DEPT;

SELECT*FROM DEPT01;

DELETE FROM DEPT01;

COMMIT;
ROLLBACK;


-- Ʈ����� ���� ����
DELETE FROM DEPT01; -- �ѹ� ����

TRUNCATE TABLE DEPT01; -- �ѹ��� �Ұ��� 


--=T=R=A=N=S=A=C=T=I=O=N==E=N=D=======================================


--==D=D=L=======S=T=A=R=T===============================================

--DDL(Data Definition Language) : �����͸� ����,����,�����ϴ� ��ɾ�
--CREATE(����), ALTER(����), DROP(����), RENAME, TRUNCATE

--==CREATE
--CREATE TABLE ���̺�� (
--            �÷���1 Ÿ��,
--            �÷���2 Ÿ��,
--            �÷���3 Ÿ��    );


CREATE TABLE EMP_DDL(
                --���,�̸�,��å,������,�Ի���,����,������,�μ���ȣ
                EMPNO NUMBER(4), ENAME VARCHAR2(10), JOB VARCHAR2(9), 
                MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7,2), COMM NUMBER(7,2) , 
                DEPTNO NUMBER (2)        );

DESC EMP_DDL;


INSERT INTO EMP_DDL
VALUES(9999,'ȫ�浿','MANAGER',0001,SYSDATE,1000,NULL,10);

SELECT* FROM EMP_DDL;

CREATE TABLE DEPT_DDL  --���̺� ����
AS SELECT *FROM DEPT;

CREATE TABLE DEPT_30 --�κ� ����
AS SELECT* FROM DEPT
WHERE DEPTNO = 30;

--==ALTER 
--���̺� �� ���� �߰� �Ǵ� ���� ���� �ڷ��� �Ǵ� ���̸� ����

CREATE TABLE EMP_ALTER
AS SELECT *FROM EMP;

SELECT * FROM EMP_ALTER;

--RENAME : �� �̸� ����
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT*FROM EMP_ALTER;

--MODIFY : ���� �ڷ��� ����
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

--DROP : Ư�� ���� ����
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT*FROM EMP_ALTER;

--==RENAME : ���̺� �̸� ����
RENAME EMP_ALTER TO EMP_RENAME;
SELECT*FROM EMP_RENAME;

--==TRUNCATE : ���̺��� �����͸� ����
TRUNCATE TABLE EMP_RENAME;
SELECT * FROM EMP_RENAME;

--==DROP : ���̺� ����
DROP TABLE EMP_RENAME;

DESC EMP_RENAME;

--==D=D=L=======E=N=D===============================================



-- Q1
CREATE TABLE EMP_HW        ( 
     EMPNO    NUMBER(4), 
     ENAME    VARCHAR2(10), 
     JOB      VARCHAR2(9), 
     MGR      NUMBER(4), 
     HIREDATE DATE, 
     SAL      NUMBER(7, 2), 
     COMM     NUMBER(7, 2), 
     DEPTNO   NUMBER(2)        ); 

-- Q2
ALTER TABLE EMP_HW 
  ADD BIGO VARCHAR2(20);

-- Q3
ALTER TABLE EMP_HW 
MODIFY BIGO VARCHAR2(30); 

-- Q4
ALTER TABLE EMP_HW 
RENAME COLUMN BIGO TO REMARK; 

-- Q5
INSERT INTO EMP_HW 
SELECT EMPNO, ENAME, JOB, MGR, 
HIREDATE, SAL, COMM, DEPTNO, NULL 
FROM EMP; 

SELECT*
FROM EMP_HW;

-- Q6
DROP TABLE EMP_HW;


--=O=B=J=E=C=T==S=T=A=R=T============================================================

--�����ͻ���, �ε���, ��, ������, ���Ǿ�

--====�����ͻ���(Data dictionary) : �����ͺ��̽� ��� �߿��� ������ ����(windows����) <=> ����� ������(program files)
select owner, table_name
from all_tables;


--====�ε��� : �˻� ������ ����� ���� ����ϴ� ��ü
--SELECT ������ �˻� �ӵ��� ��� ��Ų��.(��ü ���ڵ��� 3%~5% ������ ��)
--INDEX��ü�� �÷��� �����ؼ� ����Ѵ�

--CREATE INDEX �ε�����
--     ON ���̺��    ( �÷��� ASC OR DESC,
--                         �÷��� ASC OR DESC,
--                         ...                      );

CREATE TABLE EMP01
AS SELECT*FROM EMP;

INSERT INTO EMP01
SELECT*FROM EMP01;

INSERT INTO EMP01(EMPNO,ENAME)
VALUES (1111,'BTS');

--INDEX ��ü�� �����ϱ� �� ( 0.035�� )
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME = 'BTS';

--INDEX ��ü ����
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

--INDEX ��ü�� ���� �� ( 0.001�� )
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME = 'BTS';

--INDEX ����
DROP INDEX IDX_EMP01_ENAME;

--���̺� ���� �� ���󺹱�
--SHOW RECYCLEBIN; (������� ������ Ȯ��)

--FLASHBACK TABLE [���� �� ���̺��]   (���󺹱�)
--TO BEFORE DROP;

--PURGE RECYCLEBIN; (������ ����)


--====VIEW : �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü
--SELECT���� ���⵵�� ��ȭ (����) 
--���̺��� Ư�� ���� �����ϰ� ���� ���� ���(���ȼ�) ����Ѵ�.

--CREATE OR REPLACE VIEW �����̺��([ALIAS])
--AS
--��������(SELECT)
--[WITH CHECK OPTION]
--[WITH READ ONLY]

CREATE TABLE DEPT_COPY
AS SELECT *FROM DEPT;

CREATE TABLE EMP_COPY--����Ǵ� ���̺��� ���������� �� �Ѿ�´�.
AS SELECT * FROM EMP;

ALTER TABLE EMP_COPY
ADD CONSTRAINT EMP_COPY_DEPTNO_FK 
FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

SELECT*FROM EMP_COPY;

CREATE OR REPLACE VIEW EMP_VIEW30
AS
SELECT EMPNO,ENAME,SAL,DEPTNO 
FROM EMP_COPY
WHERE DEPTNO = 30;

GRANT CREATE VIEW --VIEW���̺��� ���� �� �� �ִ� ���� �ο�(�ý��۰�������)
TO SCOTT;

SELECT*FROM EMP_VIEW30;

INSERT INTO EMP_VIEW30
VALUES(1111,'HONG',1000,30);

SELECT*FROM EMP_COPY;

INSERT INTO EMP_VIEW30(EMPNO,ENAME,SAL)
VALUES(2222,'HONG',2000);

CREATE OR REPLACE VIEW VIEW_CHK30
AS SELECT EMPNO,ENAME,SAL,COMM,DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30 WITH CHECK OPTION;  --���� �������� �÷��� ������ ���ϰ� �Ѵ�.

UPDATE VIEW_CHK30
SET DEPTNO = 10;
--���� WITH CHECK OPTION �� ���ǿ� ���� �˴ϴ�.

CREATE OR REPLACE VIEW VIEW_READ30
AS SELECT EMPNO,ENAME,SAL,COMM,DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30 WITH READ ONLY;   --��� �÷��� ���� C U D�� �Ұ���(R : ��ȸ������)

UPDATE VIEW_READ30
SET DEPTNO = 10;
--�б� ���� �信���� DML �۾��� ������ �� �����ϴ�.

--=VIEW�� Ȱ��
--TOP - N ��ȸ�ϱ�
--ex)�Ի����� ���� ���� 5���� ����� ��ȸ
SELECT*FROM EMP
ORDER BY HIREDATE ASC;   --���� ������γ���
SELECT*FROM EMP
WHERE HIREDATE <= '81-05=01';--5��° ���ʿ� �������� �����ؼ� ��ȸ

--ROWNUM ����ϱ�
SELECT ROWNUM EMPNO,ENAME,HIREDATE
FROM EMP
WHERE ROWNUM <=5;

CREATE OR REPLACE VIEW VIEW_HIREDATE
AS SELECT EMPNO,ENAME,HIREDATE
FROM EMP ORDER BY HIREDATE ASC;

SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE;
SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE
WHERE ROWNUM <=7;

SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE
WHERE ROMNUM BETWEEN 2 AND 5 ; --ROWNUM�� �������� ���� ���� �ݵ�� 1�� �����ؾ��Ѵ�.

CREATE OR REPLACE VIEW VIEW_HIREDATE_RM
AS SELECT ROWNUM RM, EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE;
SELECT RM,EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE_RM;
SELECT ROWNUM, EMPNO,ENAME,HIREDATE   --��Ī�� ����ϸ� 1�� �������� ���� ���� ���� �� �ִ�.
FROM VIEW_HIREDATE_RM
WHERE RM BETWEEN 2 AND 5 ;

--�ζ��κ� 
SELECT RM, B.*
FROM (SELECT ROWNUM RM,A.*
         FROM (SELECT EMPNO,ENAME,HIREDATE
         FROM EMP ORDER BY HIREDATE ASC) A   ) B
WHERE RM >= 2 AND RM <= 5 ;

--�Ի����� ���� ���� 5�� ��ȸ
SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM (SELECT EMPNO,ENAME,HIREDATE FROM EMP ORDER BY HIREDATE ASC)
WHERE ROWNUM <=5;


--DML *[C]reate(insert) 
--DQL *[R]ead(select)
--DML *[U]pdate 
--DML *[D]elete 

--====������ : �ڵ����� ��ȣ�� ������Ű�� ��ɼ���

--CREATE SEQUENCE ��������
--[INCREMENT BY n] : ��ȣ�� ������
--[START WITH n] : ��ȣ�� ���۰�
--[MAXVALUE n NOMAXVALUE] : �ִ�
--[MINVALUE n NOMINVALUE] : �ּڰ�

CREATE SEQUENCE DEPT_DEPTNO_SEQ
INCREMENT BY 10 
START WITH 10;

SELECT DEPT_DEPTNO_SEQ.NEXTVAL --������ȣ�� ����
FROM DUAL;

SELECT DEPT_DEPTNO_SEQ.CURRVAL --������ ������ ��ȣ Ȯ��
FROM DUAL;
--
CREATE SEQUENCE EMP_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

CREATE TABLE EMP_01
AS SELECT EMPNO,ENAME,HIREDATE FROM EMP WHERE 1 != 1;

SELECT * FROM EMP_01;

INSERT INTO EMP_01
VALUES(EMP_SEQ.NEXTVAL, 'HONG' , SYSDATE );
--
CREATE TABLE PRODUCT(
        PID VARCHAR2(10),
        PNAME VARCHAR2(10),
        PRICE NUMBER(5),           
    
        CONSTRAINT PRODUCT_PID_PK PRIMARY KEY(PID) );
      
CREATE SEQUENCE IDX_PRODUCT_ID
START WITH 1000;

INSERT INTO PRODUCT 
VALUES('PID' || IDX_PRODUCT_ID.NEXTVAL, 'ġ��' , 2000);

SELECT *FROM PRODUCT;

DROP SEQUENCE IDX_PRODUCT_ID;

--====���Ǿ� : 


--=O=B=J=E=C=T==E=N=D=============================================================

--==C=O=N=S=T=R=A=I=N=T====S=T=A=R=T==============================================


--���� ����(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ� ���� ���� �� (�����͸� �����ϴ� Ư���� ��Ģ)

--====NOT NULL :  NULL�� ������� �ʴ´�. �ߺ����
CREATE TABLE EMP02(
           EMPNO NUMBER(4) NOT NULL, 
           ENAME VARCHAR2(10) NOT NULL, 
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );
           
INSERT INTO EMP02
          VALUES (8888,'2SOON','MANEGER',20);

SELECT * FROM EMP02;
DROP TABLE EMP02;
DELETE FROM EMP02;

--====UNIQUE : �ߺ��Ұ� , NULL�� �ߺ� ����
CREATE TABLE EMP02(
           EMPNO NUMBER(4) UNIQUE, 
           ENAME VARCHAR2(10) NOT NULL UNIQUE, --���� ���� ������ ��밡��
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );
           
INSERT INTO EMP02
          VALUES (8888,'2SOON','MANEGER',20);           
           
INSERT INTO EMP02
          VALUES (8238,'SON','MANEGER',20);

SELECT * FROM EMP02;
DROP TABLE EMP02;
DELETE FROM EMP02;

--====PRIMARY KEY : �ߺ��Ұ�, NULL�� �ߺ��Ұ�(���̺� �ѹ��� ��������)
CREATE TABLE EMP02(
           EMPNO NUMBER(4) PRIMARY KEY, 
           ENAME VARCHAR2(10) NOT NULL, 
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );
           
INSERT INTO EMP02
          VALUES (8888,'2SOON','MANEGER',20);           
           
INSERT INTO EMP02
          VALUES (8238,'SON','MANEGER',20);

SELECT * FROM EMP02;
DROP TABLE EMP02;
DELETE FROM EMP02;           

--====FOREIGN KEY : �ٸ� �÷��� �����ϴ� ���� �Է� ����(����Ű)
--�θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺� �÷��� �����Ѵ�.
--�θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique�ؾ� �Ѵ�
--NULL�����͸� ����Ѵ�.
CREATE TABLE EMP07(
           EMPNO NUMBER(4) CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY, 
           ENAME VARCHAR2(9) CONSTRAINT EMP07_EMPNO_NN NOT NULL, 
           JOP VARCHAR2(9), 
           DEPTNO NUMBER(2) CONSTRAINT EMP07_DEPTNO_FK REFERENCES DEPT07(DEPTNO) );

CREATE TABLE DEPT07(
           DEPTNO NUMBER(2) CONSTRAINT DEPT07_DEPTNO_PK PRIMARY KEY,
           DNAME VARCHAR2(20) CONSTRAINT DEPT07_DNAME_NN NOT NULL,
           LOC VARCHAR2(20)   );


--====CHECK : ������ ���ǽ��� �����ϴ� �����͸� �Է� ����


--====DEFUALT : ���� �������� �ʾ��� ��� �⺻��(DEFAULT)�� ����

CREATE TABLE DEPT08(
          DEPTNO NUMBER(2) PRIMARY KEY,
          DNAME VARCHAR2(10) NOT NULL,
          LOC VARCHAR(15) DEFAULT 'SEOUL'      );

INSERT INTO DEPT08(DEPTNO,DNAME)
VALUES(10,'SALES') ;

SELECT* FROM DEPT08;
DROP TABLE EMP08;

--�������� �������
--�÷� ������ ����(NOT NULL�� �÷� ���������� ����)
--���̺� ������ ����(NOT NULL �� ������ �� ����)

CREATE TABLE EMP09  (
   EMPNO NUMBER(4),
   ENAME VARCHAR2(20) CONSTRAINT EMP09_ENAME_NN NOT NULL,
   JOB VARCHAR2(20),
   DEPTNO NUMBER(20),
   
   CONSTRAINT EMP09_EMPNO_PK PRIMARY KEY(EMPNO),
   CONSTRAINT EMP09_JOB_UK UNIQUE(JOB),
   CONSTRAINT EMP09_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)   
   );

INSERT INTO EMP09
VALUES(333,'HONG','PRESIDENT',80);

--����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
--���̺� ���� ������θ� ���� ����
--   1. ���̺�ȿ��� �����ϴ� ���
--   2. Alter ��ɾ� �����
 

CREATE TABLE MEMBER(
         NAME VARCHAR2(10),
         ADDRESS VARCHAR2(30),
         HPHONE VARCHAR2(10),
         
         CONSTRAINT MEMBER_NAME_ADDRESS_PK PRIMARY KEY(NAME,ADDRESS)   );
         
CREATE TABLE EMP10(
      EMPNO NUMBER(4),
      ENAME VARCHAR2(20),
      JOB VARCHAR2(20),
      DEPTNO NUMBER(20) );
      
--ADD      
ALTER TABLE EMP10
ADD CONSTRAINT EMP10_EMPNO_PK PRIMARY KEY(EMPNO);


ALTER TABLE EMP10
ADD CONSTRAINT EMP10_EMPNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

--NOT NULL�� ������ ����(NULL -> NOT NULL)
ALTER TABLE EMP10
MODIFY JOB CONSTRAINT EMP10_JOB_NN NOT NULL;

ALTER TABLE EMP10
MODIFY ENAME CONSTRAINT EMP_10_ENAME_NN NOT NULL;

--DROP
ALTER TABLE EMP10
DROP CONSTRAINT EMP10_EMPNO_PK;   -- �������Ǹ�(CONSTRAINT)&��������(PRIMARY KEY)


CREATE TABLE DEPT11( 
DEPTNO NUMBER(2),
DNAME VARCHAR2(10),
LOC VARCHAR2(15) );

ALTER TABLE DEPT11
ADD CONSTRAINT DEPT11_DEPTNO_PK PRIMARY KEY(DEPTNO);

INSERT INTO DEPT11
SELECT*FROM DEPT;

INSERT INTO EMP11
SELECT EMPNO,ENAME,JOB,DEPTNO
FROM EMP;

DELETE FROM DEPT11
WHERE DEPTNO = 10;

ALTER TABLE DEPT11
DISABLE PRIMARY KEY CASCADE;

--Q1�� 
CREATE TABLE DEPT_CONST ( 
   DEPTNO NUMBER(2)    CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY, 
   DNAME  VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE, 
   LOC    VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL 
);

--Q2�� 
CREATE TABLE EMP_CONST ( 
   EMPNO    NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY, 
   ENAME    VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL, 
   JOB      VARCHAR2(9), 
   TEL      VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE, 
   HIREDATE DATE, 
   SAL      NUMBER(7, 2) CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999), 
   COMM     NUMBER(7, 2), 
   DEPTNO   NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO) 
); 
         
--==C=O=N=S=T=R=A=I=N=T====E=N=D================================================


--==��=��=��=, =��=��=, =��= =��=��===S=T=A=R=T=======================================

--====����ڰ���
--CREATE USER ������ IDENTIFIED BY �н�����

CREATE USER USER01  IDENTIFIED BY 1234;   --���� ����
ALTER USER USER01 IDENTIFIDE BY TIGER; --��й�ȣ ����
DROP USER USER01 CASCADE; -- ����

--DCL (Data Control Language)(�����)
--GRANT(���Ѻο�), REVOKE(����ȸ��)
GRANT CREATE SESSION TO USER01;  --���� ���� �ο�
GRANT CREATE TABLE TO USER01;  -- ���̺� ���� ���� �ο�

REVOKE CREATE TABLE FROM USER01; -- ���̺� ���� ���� ȸ��

CREATE TABLE TEST
(   ID VARCHAR2(10)
);

ALTER USER USER01
QUOTA 2M ON USERS;  --���̺� �����̽��� ���� �Ҵ�

INSERT INTO TEST
VALUES('AAA');

--==�� : ���� ������ ������ ������� �׷�
--CONNECT / RESOURCE / DBA 
--����� ���� ��
--CREATE ROLE������ �� ���� -> GRANT ��ɾ�� ������ �ѿ� ���� ���� -> Ư������ڿ��� �ο� 


--CONNECT
CREATE USER USER02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO USER02;

CREATE TABLE TEST( ID VARCHAR2(10 );
INSERT INTO TEST VALUES('AAA');
--DBA
CREATE USER NBAC IDENTIFIED BY 1234;
GRANT DBA TO NBAC;  --SYSTEM == NBAC

CREATE USER USER03 IDENTIFIED BY 1234;

--����� ���� ��
--������ ���������� ����

--CREATE ROLE �Ѹ�
--GRANT ���� TO �Ѹ�
CREATE ROLE MROLE;
GRANT CREATE SESSION,CREATE TABLE,CREATE VIEW
TO MROLE;

CREATE USER USER04 IDENTIFIED BY 1234;
GRANT MROLE TO USER04;

CREATE TABLE TEST( ID VARCHAR2(10) );
INSERT INTO TEST VALUES('AAA');

ALTER USER USER04 
QUOTA 2M ON USERS;

SELECT *FROM TEST;
--
CREATE ROLE MROLE2;   --������ ����

GRANT SELECT ON DEPT TO MROLE2;    --��ü ������ �ش� ����� ����(EMP = SCOTT������ ����)

GRANT MROLE2 TO USER04;--�ѱ����� ������ ���������� ����

SELECT*FROM SCOTT.DEPT;

--�� ���� ȸ��
REVOKE MROLE2 FROM USER04;
--�� ����
DROP ROLE MROLE2;
--���� ��ü Ȱ��ȭ/��Ȱ��ȭ
SET ROLE ALL;


--==��=��=��=, =��=��=, =��= =��=��===E=N=D=======================================


--==P=L=/=S=Q=L=====S=T=A=R=T================================================
--Procedural Language / SQL
--Ȯ��Ǿ��� SQL���(ORACLE ����)
--����, ���ǹ�, �ݺ��� ���� ����

--==��Į�� ���
--==���۷��� ��Ě�
--    1. EMP.EMPNO%TYPE
--    2. EMP%ROWTYPE

--==����� ���� ���� Ÿ��
--    1. ���̺� TYPE
--    2. ���ڵ� TYPE

  
DECLARE--����
        ���� ����
        --��Į�� ���
        --VEMPNO NUMBER(4);
        ���۷��� ���
        VEMPNO EMP.EMPNO%TYPE;  --�⺻ ���̺��� �÷��� Ÿ���� �����Ѵ�.
BEGIN--�ʼ�
        SQL���� �ۼ�   
        ��±��� �ۼ� --�������� �������� �ݵ�� ����Լ��� ���ؼ� Ȯ���ؾ� �Ѵ�.
EXCEPTION--����
        ����ó�� ����
END;
/
--
SET SERVEROUTPUT ON;  --����� ���
--
BEGIN
       DBMS_OUTPUT.PUT_LINE('HIHIHIHIHI, ORACLE');  --����Լ�
       END;
       /
--
DECLARE
--       VEMPNO NUMBER(4);  --������ ����
--       VENAME VARCHAR2(10);
          VEMPNO CONSTANT NUMBER(4) := 7777;  --(������ CONSTANT �ڷ��� => ����� ����)
          VENAME VARCHAR2(10) := 'SCOTT'; --������ ����� ���ÿ� �ʱ�ȭ
--       VENAME VARCHAR2(10) NOT NULL := 'SCOTT'; -- NULL ���� ������ ������ ��� �� �� ����.
--       VENAME VARCHAR2(10) DEFAULT := 'SCOTT';   --(������ �ڷ��� DEFAULT =>������ ������ �⺻�� ����)
BEGIN       
--       VEMPNO := 7777;   --������ �ʱ�ȭ
--       VENAME :='SCOTT';
       
       DBMS_OUTPUT.PUT_LINE(' ��� / �̸� ');
       DBMS_OUTPUT.PUT_LINE(VEMPNO ||'  '|| VENAME);
       END;
       /
--       
DECLARE
                 VEMPNO EMP.EMPNO%TYPE;
                 VENAME EMP.ENAME%TYPE;
BEGIN
                 SELECT EMPNO,ENAME 
                 INTO VEMPNO , VENAME  --INTO�� �ʼ�
                 FROM EMP
                 WHERE EMPNO = 7788;     --WHERE�� �ʼ�
                 
                 DBMS_OUTPUT.PUT_LINE('��� / �̸� ');
                 DBMS_OUTPUT.PUT_LINE(VEMPNO ||' '|| VENAME);
END;
/
--����ó��(EXCEPTION)
DECLARE
                 VEMPNO EMP.EMPNO%TYPE;
                 VENAME EMP.ENAME%TYPE;
BEGIN
                 SELECT EMPNO,ENAME 
                 INTO VEMPNO,VENAME 
                 FROM EMP
                 WHERE EMPNO = 7788;    
                 
                 DBMS_OUTPUT.PUT_LINE('��� / �̸� ');
                 DBMS_OUTPUT.PUT_LINE(VEMPNO ||' '|| VENAME);
EXCEPTION 
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('���� ���� ������ �Դϴ�.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('��� ���ܿ� ���� ó��');
END;
/
--�迭
DECLARE
            --���̺� TYPE(����� ���� ���� Ÿ��)
            --�迭�� ����
            --VENAME VARCHAR(10)
            TYPE ENAME_TABLE_TYPE IS TABLE OF EMP.ENAME%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE EMPNO_TABLE_TYPE IS TABLE OF EMP.EMPNO%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE MGR_TABLE_TYPE IS TABLE OF EMP.MGR%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE HIREDATE_TABLE_TYPE IS TABLE OF EMP.HIREDATE%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE SAL_TABLE_TYPE IS TABLE OF EMP.SAL%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE COMM_TABLE_TYPE IS TABLE OF EMP.COMM%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE DEPTNO_TABLE_TYPE IS TABLE OF EMP.DEPTNO%TYPE
            INDEX BY BINARY_INTEGER;
            
            TYPE JOB_TABLE_TYPE IS TABLE OF EMP.JOB%TYPE
            INDEX BY BINARY_INTEGER;
            
            enameArr ENAME_TABLE_TYPE;   --�迭������ ���� ����
            jobArr JOB_TABLE_TYPE;
            empnoArr EMPNO_TABLE_TYPE; 
            mgrArr MGR_TABLE_TYPE; 
            hiredateArr HIREDATE_TABLE_TYPE; 
            salArr SAL_TABLE_TYPE; 
            commArr COMM_TABLE_TYPE; 
            deptnoArr DEPTNO_TABLE_TYPE;
            i  BINARY_INTEGER := 0;
BEGIN
            FOR K IN (SELECT ENAME,JOB,EMPNO,MGR,HIREDATE,SAL,COMM,DEPTNO FROM EMP) LOOP
            i := i + 1;
            enameArr(i) := k.ename;
            jobArr(i) := k.job;
            empnoArr(i) := k.empno;
            mgrArr(i) := k.mgr;
            hiredateArr(i) := k.hiredate;
            salArr(i) := k.sal;
            commArr(i) := k.comm;
            deptnoArr(i) := k.deptno;
            END LOOP;
            
            FOR J IN 1..i LOOP
            DBMS_OUTPUT.PUT_LINE(enameArr(j) || ' / ' || jobArr(j) || ' / ' || empnoArr(j) || ' / ' || 
            mgrArr(j) || ' / ' || hiredateArr(j) || ' / ' || salArr(j) || ' / ' || commArr(j) || ' / ' || deptnoArr(j) );
            END LOOP;
END;
/
--���ڵ�Ÿ��
DECLARE
        --���ڵ� TYPE(�������� ������ ��� ����Ѵ�) => ����� ���� ���� Ÿ��
        --Ŭ������ �����ϴ�.
            
            TYPE EMP_RECORD_TYPE IS RECORD(
                   V_EMPNO EMP.EMPNO%TYPE,
                   V_ENAME EMP.ENAME%TYPE,
                   V_JOB EMP.JOB%TYPE,
                   V_DEPTNO EMP.DEPTNO%TYPE    );
                   
             EMP_RECORD EMP_RECORD_TYPE ; --���ڵ� Ÿ���� ���� ����;      
BEGIN
           SELECT EMPNO,ENAME,JOB,DEPTNO
           INTO EMP_RECORD FROM EMP
           WHERE EMPNO = 7788;
           
           DBMS_OUTPUT.PUT_LINE(EMP_RECORD.V_EMPNO || ' ' ||  EMP_RECORD.V_ENAME 
           || ' ' || EMP_RECORD.V_JOB || ' ' || EMP_RECORD.V_DEPTNO);
END;
/
--����(RECORD)
CREATE TABLE DEPT_REC AS SELECT * FROM DEPT;

DECLARE
           TYPE REC_DEPT IS RECORD(V_DEPTNO DEPT_RECORD.DEPTNO%TYPE,
                                               V_DNAME DEPT_RECORD.DNAME%TYPE,
                                               V_LOC DEPT_RECORD.LOC%TYPE ) ;
           DEPT_REC REC_DEPT ;                                    
BEGIN
          DEPT_REC.V_DEPTNO := 50;
          DEPT_REC.V_DNAME := 'DEV';
          DEPT_REC.V_LOC := 'BUSAN';
          
          INSERT INTO DEPT_RECORD
          VALUES DEPT_REC;
END;
/
SELECT*FROM DEPT_RECORD;
--�߰�(UPDATE)
DECLARE
             TYPE REC_DEPT IS RECORD(V_DEPTNO DEPT_RECORD.DEPTNO%TYPE NOT NULL := 99 ,
                                               V_DNAME DEPT_RECORD.DNAME%TYPE,
                                               V_LOC DEPT_RECORD.LOC%TYPE    );
          DEPT_REC REC_DEPT;                                     
BEGIN
          DEPT_REC.V_DEPTNO :=50;
          DEPT_REC.V_DNAME := 'INSA';
          DEPT_REC.V_LOC := 'SEOUL';
          
          UPDATE DEPT_RECORD
          SET DNAME =  DEPT_REC.V_DNAME, LOC = DEPT_REC.V_LOC
          WHERE DEPTNO = DEPT_REC.V_DEPTNO;
END;
/
SELECT*FROM DEPT_RECORD;
--����(DELETE)
DECLARE
      V_DEPTNO DEPT_RECORD.DEPTNO%TYPE := 50;
BEGIN
      DELETE FROM DEPT_RECORD
      WHERE DEPTNO = V_DEPTNO;
END;
/
SELECT*FROM DEPT_RECORD;
--ROWTYPE
DECLARE
  --%ROWTYPE : ���̺��� ��� �÷��� �̸��� ������ �����ϰڴ�.
  --�÷���� �÷��� Ÿ���� ������� ������ Ÿ������ ����Ѵ�.
         VEMP EMP%ROWTYPE;
                      
BEGIN
         SELECT * INTO VEMP 
         FROM EMP
         WHERE EMPNO = 7788;
         
         DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO);       DBMS_OUTPUT.PUT_LINE(VEMP.SAL);
         DBMS_OUTPUT.PUT_LINE(VEMP.ENAME);       DBMS_OUTPUT.PUT_LINE(VEMP.DEPTNO);
         DBMS_OUTPUT.PUT_LINE(VEMP.JOB);           DBMS_OUTPUT.PUT_LINE(VEMP.MGR);
         DBMS_OUTPUT.PUT_LINE(VEMP.HIREDATE);    DBMS_OUTPUT.PUT_LINE(VEMP.COMM);       
END;
/

--====���ǹ�
-- IF THEN END IF;
-- IF THEN ELSE END IF;
-- IF THEN ELSIF THEN END IF;

--���ǹ�(IF)
DECLARE
             VEMPNO NUMBER(4);
             VENAME VARCHAR2(10);
             VDEPTNO VARCHAR2(10);
             VDNAME VARCHAR2(10)  := NULL ;
BEGIN
             SELECT EMPNO,ENAME,DEPTNO
             INTO VEMPNO,VENAME,VDEPTNO
             FROM EMP
             WHERE EMPNO = 7788;
             
             IF (VDEPTNO = 10/*���ǽ�*/) THEN 
                        VDNAME := 'AAA'/*���๮*/;
             END IF;           
             IF (VDEPTNO = 20) THEN 
                        VDNAME := 'BBB'  ;
             END IF;           
             IF (VDEPTNO = 30) THEN 
                        VDNAME := 'CCC'   ;
             END IF;           
             IF (VDEPTNO = 40) THEN 
                        VDNAME := 'DDD'    ;   
             END IF;
             
             DBMS_OUTPUT.PUT_LINE('�μ��� : ' || VDNAME);
END;
/
--IF & ROWTYPE
DECLARE
              VEMP EMP%ROWTYPE;
              ANNSAL/*����*/ NUMBER(7,2);
BEGIN
              SELECT * INTO VEMP 
              FROM EMP
              WHERE EMPNO = 7788; 
                            
              IF ( VEMP.COMM IS NULL) THEN
                   VEMP.COMM := 0;
              END IF;
              
              ANNSAL := VEMP.SAL*12+VEMP.COMM;
              
              DBMS_OUTPUT.PUT_LINE('��� : ' || VEMP.EMPNO || ' �� '  || ' �̸� : ' || VEMP.ENAME || ' ���� : ' || ANNSAL || '$');
END;
/
--IF ELSE��
DECLARE
              VEMP EMP%ROWTYPE;
              ANNSAL/*����*/ NUMBER(7,2);
BEGIN
              SELECT * INTO VEMP 
              FROM EMP
              WHERE EMPNO = 7788; 
                            
              IF ( VEMP.COMM IS NULL) THEN
                    ANNSAL := VEMP.SAL*12;
              ELSE 
                    ANNSAL := VEMP.SAL*12 +VEMP.COMM;
              END IF;      
              
              DBMS_OUTPUT.PUT_LINE('��� : ' || VEMP.EMPNO || ' �� '  || ' �̸� : ' || VEMP.ENAME || ' ���� : ' || ANNSAL || '$');
END;
/
--����IF��
DECLARE
             VEMP EMP%ROWTYPE;
             VDNAME VARCHAR2(10);
BEGIN
             SELECT *
             INTO VEMP
             FROM EMP
             WHERE EMPNO = 7788;
             
             IF (VEMP.DEPTNO = 10) THEN 
                        VDNAME := 'AAA';
             ELSIF (VEMP.DEPTNO = 20) THEN 
                        VDNAME := 'BBB' ; 
             ELSIF (VEMP.DEPTNO = 30) THEN 
                        VDNAME := 'CCC';   
             ELSIF (VEMP.DEPTNO = 40) THEN 
                        VDNAME := 'DDD' ;      
                          
             END IF;
             
             DBMS_OUTPUT.PUT_LINE('�μ��� : ' || VDNAME);
END;
/

--====�ݺ���
--LOOP
--     ���๮ (���� �ݺ���)
--     ���ѹݺ����� ����
--     1. EXIT-WHEN : �ݺ� ���Ḧ ���� ���ǽ� ����
--     2.IF THEN END IF;
--END LOOP;

--LOOP AND LOOP;
--FOR IN LOOP END LOOP;
-- WHILE LOOP END LOOP;


--�ݺ� ���(EXIT-WHEN)
DECLARE
   N NUMBER := 1;
BEGIN
   LOOP
            DBMS_OUTPUT.PUT_LINE(N);
            N :=N+1;
            EXIT WHEN N > 100;
            END LOOP;
END;
/
--FOR LOOP
BEGIN
       --IN ���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� ����
       FOR N IN 1..10 LOOP    --IN ���۰�..���ᰪ 1�� ���� (1 ~ 10) ->  10ȸ �ݺ�
               DBMS_OUTPUT.PUT_LINE(N);
       END LOOP;
END;
/
--���� FOR LOOP
BEGIN
       FOR N IN REVERSE 1..10 LOOP
               DBMS_OUTPUT.PUT_LINE(N);
       END LOOP;
END;
/
--FOR SELECT������
DECLARE
          VDEPT DEPT%ROWTYPE;
BEGIN
    FOR N IN 1..4 LOOP
        SELECT* 
        INTO VDEPT
        FROM DEPT
        WHERE DEPTNO = 10 * N;
        DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' ' || VDEPT.DNAME || ' ' || VDEPT.LOC);
        END LOOP;
END;
/
--WHILE LOOP
--BEGIN 
--     WHILE ���ǽ� LOOP
--END LOOP;

DECLARE
      N NUMBER := 1;
BEGIN
      WHILE N <= 10 LOOP
      DBMS_OUTPUT.PUT_LINE(N);
      N := N + 1 ;
      END LOOP;
      
END;
/
--
DECLARE
          VDEPT DEPT%ROWTYPE;
          N NUMBER := 1;
BEGIN
    WHILE N <=4 LOOP
        SELECT* 
        INTO VDEPT
        FROM DEPT
        WHERE DEPTNO = 10 * N;
        DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' ' || VDEPT.DNAME || ' ' || VDEPT.LOC);
        N := N+1;
        END LOOP;
END;
/

--==P=L=/=S=Q=L=====E=N=D================================================


