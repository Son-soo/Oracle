--DQL(Data Query Language) �� �� �� : Data�� ��ȸ�ϴ� ��ɾ�
--SELECT (�÷���)
--FROM (���̺��)

desc emp;

--��ü������
Select empno,ename,job,mgr,hiredate,sal,comm,deptno
    from emp;

select*
from emp;

--�κ��÷� ������
select empno,ename,sal
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
--ORDR BY [���̸�]; or ASC; ������������ ����   // ORDER BY [���̸�] DESC; ������������ ����
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
WHERE SAL !=3000;  --( < >=3000)

SELECT*
FROM EMP
WHERE NOT SAL = 3000;

--AND �ΰ��� �̻��� ������ ��� ���ΰ��
SELECT*
FROM emp
WHERE deptno = 30 AND JOB = 'SALESMAN' and EMPNO = 7499; --(Table�� �ִ� data�߿� ���ڰ��� ��ҹ��� ���� �ʼ�)

-- OR �ΰ� �̻��� �����߿� �ϳ��̻� ���� ���
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
SELECT CONCAT(empno,ename), empno ||''|| ename
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


