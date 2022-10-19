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

SELECT TO_CHAR(123456,'L999,999')                                                          -����->����
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
--ORDER BY [�÷��� ����]  ==>�� �������� �ۼ�

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
--ORDER BY [�÷��� ����]  ==>�� �������� �ۼ�


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

