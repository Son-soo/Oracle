--DQL(Data Query Language) 질 의 어 : Data를 조회하는 명령어
--SELECT (컬럼명)
--FROM (테이블명)

desc emp;

--전체데이터
Select empno,ename,job,mgr,hiredate,sal,comm,deptno
    from emp;

select*
from emp;

--부분컬럼 데이터
select empno,ename,sal
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--   +,-,*,/ 나머지 연산자는 없다
-- 컬럼을 대상으로 연산한다.
--null 값은 연산불가
--컬럼에 별칭을 사용할 수 있다. (as 문자)
select ename,sal,sal*12+ nvl(comm,0)as 연봉,comm
from emp;

--데이터정렬
--select 컬럼명
--from 테이블명
--ORDR BY [열이름]; or ASC; 오름차순으로 정렬   // ORDER BY [열이름] DESC; 내림차순으로 정렬
--ORDER BY [열이름] ASC, [다른열이름] DESC; // 오름차순과 내림차순 동시에 사용

select *
from emp
order by sal desc;

--=W=H=E=R=E=====S=T=A=R=T=================================================================================

--조건검색
--SELECT 컬럼명
--FROM 테이블명
--WHERE 조건식(컬럼명 = 값);    <, >, =, != / <> , <= , >= , and, or     (필요한 데이터만 꺼내서 출력)

SELECT*
FROM EMP
WHERE sal >=3000; --(급여가 3000 이상인 사원만 출력)

SELECT *
FROM EMP
WHERE deptno = 30; --(부서 번호가 30인 사원만 출력)

--날짜를 조건절에 사용할 때
--' '
--날짜도 크기가 있다
SELECT *
FROM EMP
WHERE HIREDATE < '1982/01/01';

--NOT 논리부정 연산자
SELECT*
FROM EMP
WHERE SAL !=3000;  --( < >=3000)

SELECT*
FROM EMP
WHERE NOT SAL = 3000;

--AND 두가지 이상의 조건이 모두 참인경우
SELECT*
FROM emp
WHERE deptno = 30 AND JOB = 'SALESMAN' and EMPNO = 7499; --(Table에 있는 data중에 문자값은 대소문자 구분 필수)

-- OR 두개 이상의 조건중에 하나이상 참인 경우
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR SAL >= 2000;

--AND , OR
--범위 조건을 표현 할 때 사용
SELECT*
FROM EMP
WHERE SAL >= 1000 AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL <= 1000 OR SAL >= 3000;

--IN 연산자
--특정 열에 해당하는 조건을 여러 개 지정
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK'); --(IN 연산자와 NOT연산자를 활용)

--BETWEEN A AND B 연산자
SELECT *
FROM EMP
WHERE SAL BETWEEN 100 AND 3000;

SELECT*
FROM EMP
WHERE SAL NOT BETWEEN 100 AND 3000;  --(BETWEEN연산자와 NOT연산자를 활용)

--LIKE 연산자(와일드카드)
--값의 일부만 가지고 데이터를 조회한다.
--와일드 카드를 사용한다 ( %, _ )
-- % : 길이와 상관없이 모든 문자 데이터를 의미    
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미
SELECT*
FROM EMP
WHERE ENAME LIKE 'F%';            -- _F , %F% ,  \ , _ ESCAPE '\' , '_'

SELECT*
FROM EMP
WHERE ENAM LIKE 'F\_A%' ESCAPE '\';           --ESCAPE절을 사용하면 와일드카드 _,%를 데이터 문자로서 사용가능

--IS NULL 연산자 (IS NOT NULL)
--NULL은 존재하지 않기 때문에 연산이 불가 하므로, 존재에 유무를 조회하는데 사용한다.
SELECT*
FROM EMP
WHERE MGR IS NULL;        --직속 상관이 없는 사원 데이터 출력

SELECT*
FROM EMP
WHERE MGR IS NOT NULL;      --직속 상관이 있는 사원 데이터 출력

--집합 연산자
--SELECT문을 통해 데이터를 조회한 결과를 하나의 집합과 같이 사용한다.
--두 개 이상의 SELECT문을 연결할 때 사용한다. 컬럼의 타입이 동일해야 한다(컬럼의 이름은 상관없다)
--UNION = 합집합(중복제거)
--UNION ALL = 합집합(중복포함)
--MINUS = 앞 SELECT문에서 다음 SELECT문 결과 값에 존재하지 않은 데이터만 출력(차집합)
--INTERSECT = SELECT끼리 결과 값이 같은 값만 출력 (교집합)

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

--비교연산자/논리연산자/LIKE/IS NULL,IS NOT NULL/집합연산자 `0- -0` 

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

--집합연산자를 사용X
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO 
IN (20, 30) AND SAL > 2000;

--집합연산자를 사용
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


