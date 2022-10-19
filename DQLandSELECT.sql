--DQL(Data Query Language) �� �� �� : Data�� ��ȸ�ϴ� ���ɾ�
--SELECT (�÷���)
--FROM (���̺���)

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
--from ���̺���
--ORDR BY [���̸�]; or ASC; ������������ ����   // ORDER BY [���̸�] DESC; ������������ ����
--ORDER BY [���̸�] ASC, [�ٸ����̸�] DESC; // ���������� �������� ���ÿ� ���

select *
from emp
order by sal desc;

--=W=H=E=R=E=====S=T=A=R=T=================================================================================

--���ǰ˻�
--SELECT �÷���
--FROM ���̺���
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

--NOT �������� ������
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

--�񱳿�����/����������/LIKE/IS NULL,IS NOT NULL/���տ����� `0- -0` 

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

