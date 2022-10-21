--DQL(Data Query Language) 질 의 어 : Data를 조회하는 명령어
--SELECT (컬럼명)
--FROM (테이블명)

desc emp;  --테이블의 컬럼구조

--전체데이터
Select empno,ename,job,mgr,hiredate,sal,comm,deptno
    from emp;

select*
from emp;

--부분컬럼 데이터
select ename,empno,sal
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
--ORDER BY [열이름] or ASC; 오름차순으로 정렬   // ORDER BY [열이름] DESC; 내림차순으로 정렬
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
WHERE SAL !=3000;  -- < >=3000

SELECT*
FROM EMP
WHERE NOT SAL = 3000;

--AND 두가지 이상의 조건이 모두 참인경우
SELECT*
FROM emp
WHERE deptno = 30 AND JOB = 'SALESMAN' and EMPNO = 7499; --(Table에 있는 data중에 문자값은 대소문자 구분 필수)

-- OR 두개 이상의 조건중에 하나 이상 참인 경우
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


--==F=U=N=C=T=I=O=N====S=T=A=R=T================================================================
--함수
--문자함수 upper lower initcap length substr instr replace lpad,rpad concat trim,ltrim,rtrim
--숫자함수 round trunc ceil,floor mod  
--날짜함수 add_months months_between next_day,last_day round trunc
--자료형변환함수 to_char to_number to_date

--=문=자=함=수= 

--UPPER : 괄호 안 문자 데이터 대문자로 변경
SELECT 'Welcome',UPPER('Welcome')
FROM DUAL;

SELECT *
FROM EMP
WHERE LOWER(ENAME) = 'scott';    --(문자열을 대문자로 변경하여 'SCOTT' 찾기)

--LOWER : 괄호 안 문자 데이터를 모두 소문자로 변경
SELECT 'Welcome',LOWER('Welcome')
FROM DUAL;

SELECT LOWER(ENAME),UPPER(ENAME)   --(각각 소문자와 대문자로 출력하기)
FROM EMP;

--INITCAP : 괄호 안 문자 데이터 중 첫 글자는 대문자, 나머지 문자는 소문자로 변경
SELECT 'WELCOME',INITCAP('WELCOME')
FROM DUAL;

--LENGTH : 특정 문자열의 길이를 구할 때 사용
SELECT ENAME,LENGTH(ENAME)
FROM EMP;

--SUBSTR : 문자열 일부를 추출
SELECT 'WELCOME TO ORACLE',SUBSTR('WELCOME TO ORACLE',2,3) 
FROM DUAL;

--INSTR : 문자열 데이터 안에서 특정 문자 위치를 찾아서 출력  (두개이상 네개이하)
SELECT INSTR('Welcome to Oracle','e',3,2)
FROM DUAL;

--REPLACE : 특정문자를 다른문자로 변경
SELECT 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
FROM DUAL;

--LPAD,RPAD : 데이터 빈 공간을 특정 문자로 채우거나 공백을 삭제(Leftpad, Rightpad)
SELECT 'oracle',LPAD('oracle',10,'#'),RPAD('oracle',10,'*'),LPAD('oracle',10)
FROM DUAL;

SELECT RPAD('990103-',14,'*')
FROM DUAL;

--CONCAT : 두 문자열 데이터를 합침
SELECT CONCAT(empno,ename), empno ||' + '|| ename
FROM EMP;

--TRIM,LTRIM,RTRIM : 특정 문자를 지움


--=숫=자=함=수=

--ROUND : 특정 위치에서 반올림
SELECT ROUND(1234.5678), 
ROUND(1234.5678,0), 
ROUND(1234.5678,3),
ROUND(1234.5678,-3) 
FROM DUAL;

--TRUNC : 특정 위치에서 버림
SELECT TRUNC(1234.5678), 
TRUNC(1234.5678,0), 
TRUNC(1234.5678,3),
TRUNC(1234.5678,-3) 
FROM DUAL;

--CEIL,FLOOR : 큰 정수 중 가장 작은수 , 작은 정수 중 가장 큰 정수 반환
SELECT CEIL(5.167824),FLOOR(3.13244),
CEIL(-5.123),FLOOR(-3.13244)
FROM DUAL;

--MOD : 지정된 숫자를 나눈 나머지 값을 반환
SELECT MOD (15, 6),
MOD(100,14),
MOD(6,2)
FROM DUAL;

SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 1;

--=날=짜=함=수= 

--SYSDATE : 현재에 년/월/일/시/분/초
SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE - HIREDATE AS 근무일수 
FROM EMP;

SELECT TRUNC((SYSDATE - HIREDATE) / 365) AS 근속년수
FROM EMP; 

--ADD_MONTHS : 몇 개월 이후 날짜를 구함
SELECT SYSDATE,
ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

--MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이를 구함
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
MONTHS_BETWEEN(HIREDATE,SYSDATE) AS M1,
MONTHS_BETWEEN(SYSDATE,HIREDATE) AS M2,
TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS M3 
FROM EMP;

--NEXY_DAY,LAST_DAY : 돌아오는 요일, 달의 마지막 날짜를 구함 
SELECT SYSDATE,
NEXT_DAY(SYSDATE, '월요일'),LAST_DAY(SYSDATE)
FROM DUAL;

--ROUND,TRUNC : 날짜의 반올림,버림을 함
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


--=자=료=형=변=환=함=수=

--TO_CHAR : 날짜,숫자->문자
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS 현재시간     --날짜->문자
FROM DUAL;
SELECT hiredate , TO_CHAR(HIREDATE,'YYYY-MM-DD HH24:MI:SS') AS 입사일자
FROM EMP;

SELECT TO_CHAR(123456,'L999,999')                                                          --숫자->문자
FROM DUAL;
SELECT SAL, TO_CHAR(SAL, 'L999,999'),TO_CHAR(SAL,'$9,9999.9')                       
FROM EMP;

--TO_NUMBER : 문자->숫자
SELECT '20000' - 10000   --문자형인 숫자는 자동으로 숫자데이터로 형변환이 일어남 <<암시적 형변환>>
FROM DUAL;

SELECT TO_NUMBER('2,400', '999,999') - TO_NUMBER('5,000', '999,999')
FROM DUAL;                      

--TO_DATE : 문자 -> 날짜
SELECT TO_DATE('2022-05-21',  'YYYY-MM-DD') AS 과거
FROM DUAL;

SELECT*
FROM EMP
WHERE HIREDATE > TO_DATE('19820101', 'YYYY/MM/DD');


--=N=U=L=L=처=리=함=수=

--NVL함수 :  NULL이 아닐 경우 데이터를 그대로 반환, NULL인 경우 지정한 데이터 반환
--NVL은 NULL 데이터의 타입과 같은 타입을 변경해야 한다.  ( NVL(숫자,숫자) NVL(문자,문자)  )
SELECT ENAME 사원명,SAL,SAL*12+NVL(COMM,0)AS 연봉, COMM
FROM EMP;


SELECT ENAME,JOB,NVL(TO_CHAR(MGR,'9999') , 'CEO') AS MGR
FROM EMP
WHERE MGR IS NULL;

--NVL2함수 : NULL이 아닐 경우 데이터반환 OR 계산식 , NULL인 경우 지정한 데이터 반환 OR 계산식
--NVL2은 NULL 데이터 타입과 같은 타입이 아니여도 상관없다.
SELECT COMM, NVL2(COMM,'O','X')
FROM EMP;

--=조=건=문=함=수=

--DECODE 함수 : 특정조건에 반환할 데이터를 설정 (SWTICH-CASE)
--단순비교
SELECT ENAME,JOB,DEPTNO,
             DECODE(DEPTNO,10,'AAA',20,'BBB',30,'CCC','기타') AS 부서명
FROM EMP;
             

--CASE문 : 특정조건에 반환할 데이터를 설정 (IF문)
--범위를 조건으로 설정 할 수 있다.
SELECT EMPNO,ENAME,JOB,DEPTNO,
CASE 
             WHEN DEPTNO=10 THEN 'AAA'
             WHEN DEPTNO=20 THEN 'BBB'
             WHEN DEPTNO=30 THEN 'CCC'
             ELSE '기타'
END AS 부서명
FROM EMP;

SELECT ENAME,JOB,SAL,
CASE
             WHEN SAL BETWEEN 3000 AND 5000 THEN '임원'
             WHEN SAL >= 2000 AND SAL < 3000 THEN '관리자'
             WHEN SAL >= 500 AND SAL <2000 THEN '사원'
             ELSE '기타'
END AS 직무
FROM EMP;


--==F=U=N=C=T=I=O=N====E=N=D==================================================================

SELECT DATE_OF_BIRTH ,TO_CHAR(DATE_OF_BIRTH,'YYYY/MM/DD'),
            ROUND((SYSDATE - DATE_OF_BIRTH) /365) ||'살' AS 나이
FROM CUSTOMERS;


SELECT DATE_OF_BIRTH ,ROUND((SYSDATE - DATE_OF_BIRTH) /365) ||'살' AS 나이,
CASE   
          WHEN  ROUND((SYSDATE - DATE_OF_BIRTH) /365) >=10 AND ROUND((SYSDATE - DATE_OF_BIRTH) /365) <30 THEN '10대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 20 AND 29 THEN '20대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 30 AND 39 THEN '30대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 40 AND 49 THEN '40대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 50 AND 59 THEN '50대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 60 AND 69 THEN '60대'
          WHEN ROUND((SYSDATE - DATE_OF_BIRTH) /365) BETWEEN 70 AND 79 THEN '70대'
          ELSE '기타'
END AS 연령대
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
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), 'ㅁ ㅁ ㅁ'), 'YYYY-MM-DD') AS R_JOB,
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

--=다=중=행= =함=수=
--여러행을 바탕으로 하나의 결과 값을 도출
--일반컬럼과 같이 사용 불가
--크기 비교가 가능한 모든 타입에 사용가능

--SUM : 합계
SELECT SUM(SAL)
FROM EMP;

--AVG : 평균
SELECT AVG(SAL)
FROM EMP;

--COUNT : 데이터 개수
SELECT COUNT(SAL),COUNT(COMM)
FROM EMP;

--MAX, MIN : 최댓값,최솟값
SELECT MAX(SAL),MIN(SAL)
FROM EMP;

SELECT MIN(HIREDATE),MAX(HIREDATE)
FROM EMP
WHERE deptno =20;

--=G=R=O=U=P= =B=Y=절=
--특정 열 또는 데이터를 기준으로 데이터를 그룹으로 묶는다.

--SELECT [컬럼명]
--FROM   [테이블명]
--WHERE  [조건식]
--GROUP BY [컬럼명 그룹화]  =>SELECT문에 그룹함수와 같이 사용할 수 있다.
--ORDER BY [컬럼명 정렬(정렬할려는 열)]  ==>맨 마지막에 작성

SELECT AVG(SAL), DEPTNO 
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO,JOB,AVG(SAL)
FROM EMP
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO, JOB DESC;

--=H=A=V=I=N=G=절=
--GROUP BY절이 있는 곳에서만 사용 가능하다.
--그룹화된 결과 값의 범위를 제한하는데 사용한다. 
--조건식을 작성할때 그룹함수를 사용한다.

--SELECT [컬럼명]
--FROM   [테이블명]
--WHERE  [조건식]   => 그룹함수 사용불가/GROUP BY, HAVING 보다 먼저 실행된다***
--GROUP BY [컬럼명 그룹화]  =>SELECT문에 그룹함수와 같이 사용할 수 있다.
--HAVING  [출력 그룹을 제한하는 조건식] => 그룹함수를 사용한다
--ORDER BY [컬럼명 정렬(정렬할려는 열)]  ==>맨 마지막에 작성


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

--JOIN : 두개 이상의 테이블에서 데이터를 조회
--FROM절에 두개 이상의 테이블을 작성한다.
--WHERE절에 JOIN 조건을 작성해야 한다.



--==CROSS join : WHERE절 없이 사용


--==EQUI join(등가조인)== : WHERE 등가연산자 => =
SELECT EMP.ENAME,EMP.JOB,EMP.DEPTNO,DEPT.DNAME,DEPT.LOC
FROM EMP,DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;
--동일하지 않은 컬럼은 소속을 적지 않아도 된다.
SELECT ENAME,JOB,E.DEPTNO,DNAME,LOC
FROM EMP E,DEPT D     --테이블에 별칭부여(부여한 뒤로는 기존 테이블명을 사용할 수 없다)
WHERE E.DEPTNO = D.DEPTNO;


--==NON EQUI join(비등가조인)== : WHERE 범위연산자 => AND , OR
SELECT ENAME, SAL, GRADE, LOSAL, HISAL
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
--WHERE E.SAL >= S.LOSAL AND E.SAL <=S.HISAL;

--사번 , 이름, 급여, 부서번호, 부서명, 급여등급
--EMP               DEPT              SALGRADE
SELECT EMPNO,ENAME,SAL,D.DEPTNO,DNAME,GRADE
FROM EMP E , DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL;


--==SELF join(자체조인)=INNER join== : WHERE 하나의 테이블을 사용한다
SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME
FROM EMP E, EMP M --반드시 별칭 부여
WHERE E.MGR = M.EMPNO;
 
SELECT WORK.ENAME, FRIEND.ENAME
FROM EMP WORK, EMP FRIEND
WHERE WORK.DEPTNO= FRIEND.DEPTNO
AND WORK.ENAME = 'SCOTT' 
AND FRIEND.ENAME != 'SCOTT';


--==OUTER join(외부조인)== : WHERE에 누락되는 데이터를 같이 조회하기 위해 사용한다. => (+)
SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME
FROM EMP E, EMP M 
WHERE E.MGR = M.EMPNO(+);      --데이터가 없는 테이블쪽에 (+)을 붙인다.

SELECT ENAME,SAL,D.DEPTNO,DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;

--------------------------------------
--=====ANSI JOIN====(표준 조인 방식)
--CROSS JOIN
--INNER JOIN(EQUI, NON EQUI, SELF)
--OUTER JOIN( (+) ) // [LEFT, RIGHT, FULL] OUTER JOIN
--NATURAL JOIN

SELECT ENAME,SAL,DNAME,LOC
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT ENAME,SAL,DNAME,LOC
FROM EMP E INNER JOIN DEPT D
USING(DEPTNO) -- 양쪽 테이블의 컬럼명이 동일할 경우 
WHERE ENAME = 'SCOTT';

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E INNER JOIN EMP M
ON E.MGR = M.EMPNO;

SELECT EMPNO,ENAME,SAL,GRADE
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT E.EMPNO,E.ENAME,E.MGR,M.ENAME
FROM EMP E LEFT OUTER JOIN EMP M       --데이터가 있는 쪽을 지정한다.
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
--==서브쿼리
--SELECT 구문을 중첩해서 사용하는것(WHERE)


SELECT ENAME, MAX(SAL)
FROM EMP;                    --서브쿼리

SELECT ENAME,SAL
FROM EMP
WHERE SAL = ( SELECT MAX(SAL) FROM EMP );        --메인쿼리

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

--==다중행 서브쿼리==    
--IN / ANY / ALL / (SOME, EXISTS 잘사용하지 않는다.)

--IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있으면 TRUE
SELECT*
FROM EMP
WHERE SAL IN (5000,3000,2850);

SELECT*
FROM EMP
WHERE SAL IN (
                     SELECT MAX(SAL)
                     FROM EMP
                     GROUP BY DEPTNO );


--ANY,SOME : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE                         
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
                     

--ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
SELECT*
FROM EMP
WHERE SAL > ALL (SELECT SAL
                         FROM EMP
                         WHERE DEPTNO = 30);


--EXISTS : 서브쿼리의 결과가 존재하면(행이1개 이상) TRUE
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 10);
                    
--다중열 서브쿼리
SELECT *
FROM EMP
WHERE (DEPTNO , SAL) IN ( SELECT DEPTNO , MAX(SAL)
                                   FROM EMP
                                   GROUP BY DEPTNO);
                                   
--=S=U=B=Q=U=E=R=Y==E=N=D=============================================          


--=D=M=L==S=T=A=R=T====================================================

--DML(Data Manipulation Language) : 테이블에 데이터를 추가, 변경, 삭제 할때 사용
--INSERT, UPDATE, DELETE


--====INSERT==== : 테이블에 DATA 삽입

--INSERT INTO 테이블명 (컬럼명1, 컬럼명2,........)
--VALUES (값1 , 값2,....)

--컬럼과 값의 타입과 갯수가 일치해야 한다
--작성 순서대로 1 : 1 매칭된다.

CREATE TABLE DEPT_TEMP
AS
SELECT * FROM DEPT;

SELECT *
FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP --모든컬럼에 입력할 시 컬럼생략 가능 (DEPTNO,DNAME,LOC)
VALUES(50,'DATABASE','SEOUL');

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP(DEPTNO,DNAME)
VALUES(60,'JSP');

INSERT INTO DEPT_TEMP 
VALUES(70,'HTML','SEOUL');

INSERT INTO DEPT_TEMP (DEPTNO,DNAME) 
VALUES(50,'DATABASE');--암시적 NULL 데이터 삽입

INSERT INTO DEPT_TEMP  (DEPTNO,DNAME,LOC)
VALUES(50,'DATABASE',NULL); --명시적 NULL 데이터 삽입

--날 짜 데 이 터 삽입 

CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1 != 1;

SELECT* FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(9999, '홍길동' , 'PRESIDENT' , NULL , '2001/01/01', 5000, 1000, 10);

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
VALUES(3111, '심청이' , 'MANAGER' , 9999 , SYSDATE , 4000, NULL, 30);


--====UPDATE==== : 테이블에 DATA를 수정(변경)

--UPDATE 테이블명
--SET 컬럼명 = 값, 컬럼명 = 값, ....
--WHERE 조건식

--조건식을 사용하지 않으면 모든 열의 데이터가 변경 됨
--ROLLBACK; 을 사용해서 수정한 내용을 되돌릴 수 있다.

CREATE TABLE DEPT_TEMP2
AS SELECT *FROM DEPT;

SELECT*FROM DEPT_TEMP2;

DROP TABLE DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL' , DNAME = 'DATABASE'
WHERE DEPTNO = 40;


--====DELETE==== : 테이블에 DATA를 삭제

--DELETE FROM 테이블명
--WHERE 조건식

--조건절을 사용하지 않으면 모든 데이터가 삭제 된다.

CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

DROP TABLE EMP_TEMP2;

SELECT*FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
WHERE JOB = 'PRESIDENT';

DELETE FROM EMP_TEMP2
WHERE ENAME = 'SCOTT';

ROLLBACK;

--DROP TABLE [테이블이름]; 테이블 전체 삭제
--DELETE FROM [테이블이름]; 테이블 안 데이터 삭제


--=D=M=L==E=N=D========================================================


--=T=R=A=N=S=A=C=T=I=O=N==S=T=A=R=T===================================

--TCL : Transaction Control Language : 데이터의 영구저장 또는 취소 (트랜잭션)
---COMMIT, ROLLBACK, SAVEPOINT

--====COMMIT : 보류데이터 영구 저장(테이블이 데이터 반영) 트랜잭션 종료
--====ROLLBACK : 보류데이터 변경 취소(테이블이 데이터 미 반영) 직전 커밋 단계로 회귀
--====SAVEPOINT : ROLLBACK 할 포인트 지정 (ANSI 표준 SQL 아님)

CREATE TABLE DEPT01
AS SELECT * FROM DEPT;

SELECT*FROM DEPT01;

DELETE FROM DEPT01;

COMMIT;
ROLLBACK;


-- 트랜잭션 적용 유무
DELETE FROM DEPT01; -- 롤백 가능

TRUNCATE TABLE DEPT01; -- 롤백이 불가능 


--=T=R=A=N=S=A=C=T=I=O=N==E=N=D=======================================


--==D=D=L=======S=T=A=R=T===============================================

--DDL(Data Definition Language) : 데이터를 생성,삭제,변경하는 명령어
--CREATE(생성), ALTER(변경), DROP(삭제), RENAME, TRUNCATE

--==CREATE
--CREATE TABLE 테이블명 (
--            컬럼명1 타입,
--            컬럼명2 타입,
--            컬럼명3 타입    );


CREATE TABLE EMP_DDL(
                --사번,이름,직책,관리자,입사일,급일,성과급,부서번호
                EMPNO NUMBER(4), ENAME VARCHAR2(10), JOB VARCHAR2(9), 
                MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7,2), COMM NUMBER(7,2) , 
                DEPTNO NUMBER (2)        );

DESC EMP_DDL;


INSERT INTO EMP_DDL
VALUES(9999,'홍길동','MANAGER',0001,SYSDATE,1000,NULL,10);

SELECT* FROM EMP_DDL;

CREATE TABLE DEPT_DDL  --테이블 복사
AS SELECT *FROM DEPT;

CREATE TABLE DEPT_30 --부분 복사
AS SELECT* FROM DEPT
WHERE DEPTNO = 30;

--==ALTER 
--테이블에 새 열을 추가 또는 삭제 열의 자료형 또는 길이를 변경

CREATE TABLE EMP_ALTER
AS SELECT *FROM EMP;

SELECT * FROM EMP_ALTER;

--RENAME : 열 이름 변경
ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

SELECT*FROM EMP_ALTER;

--MODIFY : 열의 자료형 변경
ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5);

--DROP : 특정 열을 삭제
ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

SELECT*FROM EMP_ALTER;

--==RENAME : 테이블 이름 변경
RENAME EMP_ALTER TO EMP_RENAME;
SELECT*FROM EMP_RENAME;

--==TRUNCATE : 테이블의 데이터를 삭제
TRUNCATE TABLE EMP_RENAME;
SELECT * FROM EMP_RENAME;

--==DROP : 테이블 삭제
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

--데이터사전, 인덱스, 뷰, 시퀀스, 동의어

--==데이터사전(Data dictionary) : 데이터베이스 운영에 중요한 데이터 보관(windows개념) <=> 사용자 데이터(program files)
select owner, table_name
from all_tables;


--====인덱스 : 검색 성능의 향상을 위해 사용하는 객체
--SELECT 구문의 검색 속도를 향상 시킨다.(전체 레코드의 3%~5% 정도일 때)
--INDEX객체를 컬럼에 생성해서 사용한다

--CREATE INDEX 인덱스명
--     ON 테이블명    ( 컬럼명 ASC OR DESC,
--                         컬럼명 ASC OR DESC,
--                         ...                      );

CREATE TABLE EMP01
AS SELECT*FROM EMP;

INSERT INTO EMP01
SELECT*FROM EMP01;

INSERT INTO EMP01(EMPNO,ENAME)
VALUES (1111,'BTS');

--INDEX 객체를 생성하기 전 ( 0.035초 )
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME = 'BTS';

--INDEX 객체 생성
CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

--INDEX 객체를 생성 후 ( 0.001초 )
SELECT EMPNO,ENAME
FROM EMP01
WHERE ENAME = 'BTS';

--INDEX 삭제
DROP INDEX IDX_EMP01_ENAME;

--테이블 삭제 후 원상복구
--SHOW RECYCLEBIN; (삭제대기 데이터 확인)

--FLASHBACK TABLE [복구 할 테이블명]   (원상복구)
--TO BEFORE DROP;

--PURGE RECYCLEBIN; (휴지통 비우기)


--==VIEW : 
--==시퀀스 :
--==동의어 : 


--=O=B=J=E=C=T==E=N=D=============================================================

--==C=O=N=S=T=R=A=I=N=T====S=T=A=R=T==============================================


--제약 조건(무결성) : 잘못된 값이 데이터로 사용되는 것을 막는 것 (데이터를 제약하는 특수한 규칙)

--====NOT NULL :  NULL을 허용하지 않는다. 중복허용
CREATE TABLE EMP02(
           EMPNO NUMBER(4) NOT NULL, 
           ENAME VARCHAR2(10) NOT NULL, 
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );
           
INSERT INTO EMP02
          VALUES (8888,'2SOON','MANEGER',20);

SELECT * FROM EMP02;
DROP TABLE EMP02;
DELETE FROM EMP02;

--====UNIQUE : 중복불가 , NULL은 중복 제외
CREATE TABLE EMP02(
           EMPNO NUMBER(4) UNIQUE, 
           ENAME VARCHAR2(10) NOT NULL UNIQUE, --제약 조건 여러개 사용가능
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );
           
INSERT INTO EMP02
          VALUES (8888,'2SOON','MANEGER',20);           
           
INSERT INTO EMP02
          VALUES (8238,'SON','MANEGER',20);

SELECT * FROM EMP02;
DROP TABLE EMP02;
DELETE FROM EMP02;

--====PRIMARY KEY : 중복불가, NULL도 중복불가(테이블에 한번만 지정가능)
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

--====FOREIGN KEY : 다른 컬럼에 존재하는 값만 입력 가능

CREATE TABLE EMP02(
           EMPNO NUMBER(4) CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY, 
           ENAME VARCHAR2(10) CONSTRAINT EMP02_ENAME_NN NOT NULL, 
           JOP VARCHAR2(9),  DEPTNO NUMBER(2) );



--====CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능



