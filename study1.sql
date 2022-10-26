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

SELECT * FROM DEPT_TEMP;

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
WHERE 1 != 1;    --항상 FALSE가 되어 행은 만들어 지지 않는다.

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

--====데이터사전(Data dictionary) : 데이터베이스 운영에 중요한 데이터 보관(windows개념) <=> 사용자 데이터(program files)
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


--====VIEW : 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
--SELECT문의 복잡도를 완화 (편리성) 
--테이블의 특정 열을 노출하고 싶지 않을 경우(보안성) 사용한다.

--CREATE OR REPLACE VIEW 뷰테이블명([ALIAS])
--AS
--서브쿼리(SELECT)
--[WITH CHECK OPTION]
--[WITH READ ONLY]

CREATE TABLE DEPT_COPY
AS SELECT *FROM DEPT;

CREATE TABLE EMP_COPY--복사되는 테이블은 제약조건이 안 넘어온다.
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

GRANT CREATE VIEW --VIEW테이블을 생성 할 수 있는 권한 부여(시스템계정에서)
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
WHERE DEPTNO = 30 WITH CHECK OPTION;  --현재 조건절의 컬럼을 수정을 못하게 한다.

UPDATE VIEW_CHK30
SET DEPTNO = 10;
--뷰의 WITH CHECK OPTION 의 조건에 위배 됩니다.

CREATE OR REPLACE VIEW VIEW_READ30
AS SELECT EMPNO,ENAME,SAL,COMM,DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30 WITH READ ONLY;   --모든 컬럼에 대한 C U D가 불가능(R : 조회만가능)

UPDATE VIEW_READ30
SET DEPTNO = 10;
--읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다.

--=VIEW의 활용
--TOP - N 조회하기
--ex)입사일이 가장 빠른 5명의 사원을 조회
SELECT*FROM EMP
ORDER BY HIREDATE ASC;   --빠른 순서대로나열
SELECT*FROM EMP
WHERE HIREDATE <= '81-05=01';--5번째 차례에 조건절을 제시해서 조회

--ROWNUM 사용하기
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
WHERE ROMNUM BETWEEN 2 AND 5 ; --ROWNUM은 조건절에 직접 사용시 반드시 1을 포함해야한다.

CREATE OR REPLACE VIEW VIEW_HIREDATE_RM
AS SELECT ROWNUM RM, EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE;
SELECT RM,EMPNO,ENAME,HIREDATE
FROM VIEW_HIREDATE_RM;
SELECT ROWNUM, EMPNO,ENAME,HIREDATE   --별칭을 사용하면 1을 포함하지 않은 값을 얻을 수 있다.
FROM VIEW_HIREDATE_RM
WHERE RM BETWEEN 2 AND 5 ;

--인라인뷰 
SELECT RM, B.*
FROM (SELECT ROWNUM RM,A.*
         FROM (SELECT EMPNO,ENAME,HIREDATE
         FROM EMP ORDER BY HIREDATE ASC) A   ) B
WHERE RM >= 2 AND RM <= 5 ;

--입사일이 가장 빠른 5명 조회
SELECT ROWNUM, EMPNO,ENAME,HIREDATE
FROM (SELECT EMPNO,ENAME,HIREDATE FROM EMP ORDER BY HIREDATE ASC)
WHERE ROWNUM <=5;


--DML *[C]reate(insert) 
--DQL *[R]ead(select)
--DML *[U]pdate 
--DML *[D]elete 

--====시퀀스 : 자동으로 번호를 증가시키는 기능수행

--CREATE SEQUENCE 시퀀스명
--[INCREMENT BY n] : 번호의 증가값
--[START WITH n] : 번호의 시작값
--[MAXVALUE n NOMAXVALUE] : 최댓값
--[MINVALUE n NOMINVALUE] : 최솟값

CREATE SEQUENCE DEPT_DEPTNO_SEQ
INCREMENT BY 10 
START WITH 10;

SELECT DEPT_DEPTNO_SEQ.NEXTVAL --다음번호를 생성
FROM DUAL;

SELECT DEPT_DEPTNO_SEQ.CURRVAL --마지막 생성한 번호 확인
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
VALUES('PID' || IDX_PRODUCT_ID.NEXTVAL, '치즈' , 2000);

SELECT *FROM PRODUCT;

DROP SEQUENCE IDX_PRODUCT_ID;

--====동의어 : 


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

--====FOREIGN KEY : 다른 컬럼에 존재하는 값만 입력 가능(참조키)
--부모와 자식의 관계를 가지는 자식쪽 테이블에 컬럼에 설정한다.
--부모쪽 테이블의 컬럼은 반드시 primary key 또는 unique해야 한다
--NULL데이터를 허용한다.
CREATE TABLE EMP07(
           EMPNO NUMBER(4) CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY, 
           ENAME VARCHAR2(9) CONSTRAINT EMP07_EMPNO_NN NOT NULL, 
           JOP VARCHAR2(9), 
           DEPTNO NUMBER(2) CONSTRAINT EMP07_DEPTNO_FK REFERENCES DEPT07(DEPTNO) );

CREATE TABLE DEPT07(
           DEPTNO NUMBER(2) CONSTRAINT DEPT07_DEPTNO_PK PRIMARY KEY,
           DNAME VARCHAR2(20) CONSTRAINT DEPT07_DNAME_NN NOT NULL,
           LOC VARCHAR2(20)   );


--====CHECK : 설정한 조건식을 만족하는 데이터만 입력 가능


--====DEFUALT : 값이 지정되지 않았을 경우 기본값(DEFAULT)을 지정

CREATE TABLE DEPT08(
          DEPTNO NUMBER(2) PRIMARY KEY,
          DNAME VARCHAR2(10) NOT NULL,
          LOC VARCHAR(15) DEFAULT 'SEOUL'      );

INSERT INTO DEPT08(DEPTNO,DNAME)
VALUES(10,'SALES') ;

SELECT* FROM DEPT08;
DROP TABLE EMP08;

--제약조건 설정방식
--컬럼 레벨의 설정(NOT NULL은 컬럼 레벨에서만 가능)
--테이블 레벨의 설정(NOT NULL 을 적용할 수 없다)

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

--복합키(기본키를 두개의 컬럼을 사용하는 경우)
--테이블 레벨 방식으로만 적용 가능
--   1. 테이블안에서 정의하는 방식
--   2. Alter 명령어 사용방식
 

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

--NOT NULL은 변경의 개념(NULL -> NOT NULL)
ALTER TABLE EMP10
MODIFY JOB CONSTRAINT EMP10_JOB_NN NOT NULL;

ALTER TABLE EMP10
MODIFY ENAME CONSTRAINT EMP_10_ENAME_NN NOT NULL;

--DROP
ALTER TABLE EMP10
DROP CONSTRAINT EMP10_EMPNO_PK;   -- 제약조건명(CONSTRAINT)&제약조건(PRIMARY KEY)


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

--Q1몺 
CREATE TABLE DEPT_CONST ( 
   DEPTNO NUMBER(2)    CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY, 
   DNAME  VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE, 
   LOC    VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL 
);

--Q2몼 
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


--==사=용=자=, =권=한=, =롤= =관=리===S=T=A=R=T=======================================

--====사용자관리
--CREATE USER 계정명 IDENTIFIED BY 패스워드

CREATE USER USER01  IDENTIFIED BY 1234;   --계정 생성
ALTER USER USER01 IDENTIFIDE BY TIGER; --비밀번호 변경
DROP USER USER01 CASCADE; -- 삭제

--DCL (Data Control Language)(제어어)
--GRANT(권한부여), REVOKE(권한회수)
GRANT CREATE SESSION TO USER01;  --접속 권한 부여
GRANT CREATE TABLE TO USER01;  -- 테이블 생성 권한 부여

REVOKE CREATE TABLE FROM USER01; -- 테이블 생성 권한 회수

CREATE TABLE TEST
(   ID VARCHAR2(10)
);

ALTER USER USER01
QUOTA 2M ON USERS;  --테이블 스페이스의 영역 할당

INSERT INTO TEST
VALUES('AAA');

--==롤 : 여러 종류의 권한을 묶어놓은 그룹
--CONNECT / RESOURCE / DBA 
--사용자 정의 롤
--CREATE ROLE문으로 롤 생성 -> GRANT 명령어로 생성한 롤에 권한 포함 -> 특정사용자에게 부여 


--CONNECT
CREATE USER USER02 IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO USER02;

CREATE TABLE TEST( ID VARCHAR2(10 );
INSERT INTO TEST VALUES('AAA');
--DBA
CREATE USER NBAC IDENTIFIED BY 1234;
GRANT DBA TO NBAC;  --SYSTEM == NBAC

CREATE USER USER03 IDENTIFIED BY 1234;

--사용자 정의 롤
--관리자 계정에서만 가능

--CREATE ROLE 롤명
--GRANT 권한 TO 롤명
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
CREATE ROLE MROLE2;   --관리자 권한

GRANT SELECT ON DEPT TO MROLE2;    --객체 권한은 해당 사용자 계정(EMP = SCOTT계정에 있음)

GRANT MROLE2 TO USER04;--롤권한은 관리자 계정에서만 가능

SELECT*FROM SCOTT.DEPT;

--롤 권한 회수
REVOKE MROLE2 FROM USER04;
--롤 삭제
DROP ROLE MROLE2;
--계정 객체 활성화/비활성화
SET ROLE ALL;


--==사=용=자=, =권=한=, =롤= =관=리===E=N=D=======================================


--==P=L=/=S=Q=L=====S=T=A=R=T================================================
--Procedural Language / SQL
--확장되어진 SQL언어(ORACLE 전용)
--변수, 조건문, 반복문 등을 수행

--==스칼라 방식
--==레퍼런스 방식싟
--    1. EMP.EMPNO%TYPE
--    2. EMP%ROWTYPE

--==사용자 정의 변수 타입
--    1. 테이블 TYPE
--    2. 레코드 TYPE

  
DECLARE--선택
        변수 정의
        --스칼라 방식
        --VEMPNO NUMBER(4);
        레퍼런스 방식
        VEMPNO EMP.EMPNO%TYPE;  --기본 테이블의 컬럼의 타입을 참조한다.
BEGIN--필수
        SQL구문 작성   
        출력구문 작성 --쿼리문의 수행결과를 반드시 출력함수를 통해서 확인해야 한다.
EXCEPTION--선택
        예외처리 구문
END;
/
--
SET SERVEROUTPUT ON;  --결과물 출력
--
BEGIN
       DBMS_OUTPUT.PUT_LINE('HIHIHIHIHI, ORACLE');  --출력함수
       END;
       /
--
DECLARE
--       VEMPNO NUMBER(4);  --변수의 선언
--       VENAME VARCHAR2(10);
          VEMPNO CONSTANT NUMBER(4) := 7777;  --(변수명 CONSTANT 자료형 => 상수의 정의)
          VENAME VARCHAR2(10) := 'SCOTT'; --변수의 선언과 동시에 초기화
--       VENAME VARCHAR2(10) NOT NULL := 'SCOTT'; -- NULL 값을 변수의 값으로 사용 할 수 없다.
--       VENAME VARCHAR2(10) DEFAULT := 'SCOTT';   --(변수명 자료형 DEFAULT =>변수에 저장할 기본값 지정)
BEGIN       
--       VEMPNO := 7777;   --변수의 초기화
--       VENAME :='SCOTT';
       
       DBMS_OUTPUT.PUT_LINE(' 사원 / 이름 ');
       DBMS_OUTPUT.PUT_LINE(VEMPNO ||'  '|| VENAME);
       END;
       /
--       
DECLARE
                 VEMPNO EMP.EMPNO%TYPE;
                 VENAME EMP.ENAME%TYPE;
BEGIN
                 SELECT EMPNO,ENAME 
                 INTO VEMPNO , VENAME  --INTO절 필수
                 FROM EMP
                 WHERE EMPNO = 7788;     --WHERE절 필수
                 
                 DBMS_OUTPUT.PUT_LINE('사번 / 이름 ');
                 DBMS_OUTPUT.PUT_LINE(VEMPNO ||' '|| VENAME);
END;
/
--예외처리(EXCEPTION)
DECLARE
                 VEMPNO EMP.EMPNO%TYPE;
                 VENAME EMP.ENAME%TYPE;
BEGIN
                 SELECT EMPNO,ENAME 
                 INTO VEMPNO,VENAME 
                 FROM EMP
                 WHERE EMPNO = 7788;    
                 
                 DBMS_OUTPUT.PUT_LINE('사번 / 이름 ');
                 DBMS_OUTPUT.PUT_LINE(VEMPNO ||' '|| VENAME);
EXCEPTION 
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('행의 수가 여러개 입니다.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('모든 예외에 대한 처리');
END;
/
--배열
DECLARE
            --테이블 TYPE(사용자 정의 변수 타입)
            --배열의 형식
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
            
            enameArr ENAME_TABLE_TYPE;   --배열형식의 변수 선언
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
--레코드타입
DECLARE
        --레코드 TYPE(여러개의 변수를 묶어서 사용한다) => 사용자 정의 변수 타입
        --클래스랑 유사하다.
            
            TYPE EMP_RECORD_TYPE IS RECORD(
                   V_EMPNO EMP.EMPNO%TYPE,
                   V_ENAME EMP.ENAME%TYPE,
                   V_JOB EMP.JOB%TYPE,
                   V_DEPTNO EMP.DEPTNO%TYPE    );
                   
             EMP_RECORD EMP_RECORD_TYPE ; --레코드 타입의 변수 선언;      
BEGIN
           SELECT EMPNO,ENAME,JOB,DEPTNO
           INTO EMP_RECORD FROM EMP
           WHERE EMPNO = 7788;
           
           DBMS_OUTPUT.PUT_LINE(EMP_RECORD.V_EMPNO || ' ' ||  EMP_RECORD.V_ENAME 
           || ' ' || EMP_RECORD.V_JOB || ' ' || EMP_RECORD.V_DEPTNO);
END;
/
--묶기(RECORD)
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
--추가(UPDATE)
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
--삭제(DELETE)
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
  --%ROWTYPE : 테이블의 모든 컬럼의 이름과 변수를 참조하겠다.
  --컬럼명과 컬럼의 타입을 변수명과 변수의 타입으로 사용한다.
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

--====조건문
-- IF THEN END IF;
-- IF THEN ELSE END IF;
-- IF THEN ELSIF THEN END IF;

--조건문(IF)
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
             
             IF (VDEPTNO = 10/*조건식*/) THEN 
                        VDNAME := 'AAA'/*실행문*/;
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
             
             DBMS_OUTPUT.PUT_LINE('부서명 : ' || VDNAME);
END;
/
--IF & ROWTYPE
DECLARE
              VEMP EMP%ROWTYPE;
              ANNSAL/*연봉*/ NUMBER(7,2);
BEGIN
              SELECT * INTO VEMP 
              FROM EMP
              WHERE EMPNO = 7788; 
                            
              IF ( VEMP.COMM IS NULL) THEN
                   VEMP.COMM := 0;
              END IF;
              
              ANNSAL := VEMP.SAL*12+VEMP.COMM;
              
              DBMS_OUTPUT.PUT_LINE('사번 : ' || VEMP.EMPNO || ' 번 '  || ' 이름 : ' || VEMP.ENAME || ' 연봉 : ' || ANNSAL || '$');
END;
/
--IF ELSE문
DECLARE
              VEMP EMP%ROWTYPE;
              ANNSAL/*연봉*/ NUMBER(7,2);
BEGIN
              SELECT * INTO VEMP 
              FROM EMP
              WHERE EMPNO = 7788; 
                            
              IF ( VEMP.COMM IS NULL) THEN
                    ANNSAL := VEMP.SAL*12;
              ELSE 
                    ANNSAL := VEMP.SAL*12 +VEMP.COMM;
              END IF;      
              
              DBMS_OUTPUT.PUT_LINE('사번 : ' || VEMP.EMPNO || ' 번 '  || ' 이름 : ' || VEMP.ENAME || ' 연봉 : ' || ANNSAL || '$');
END;
/
--다중IF문
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
             
             DBMS_OUTPUT.PUT_LINE('부서명 : ' || VDNAME);
END;
/

--====반복문
--LOOP
--     실행문 (무한 반복문)
--     무한반복문의 제어
--     1. EXIT-WHEN : 반복 종료를 위한 조건식 지정
--     2.IF THEN END IF;
--END LOOP;

--LOOP AND LOOP;
--FOR IN LOOP END LOOP;
-- WHILE LOOP END LOOP;


--반복 제어문(EXIT-WHEN)
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
       --IN 구문 뒤에 작성되는 값이 반복의 횟수를 결정
       FOR N IN 1..10 LOOP    --IN 시작값..종료값 1씩 증가 (1 ~ 10) ->  10회 반복
               DBMS_OUTPUT.PUT_LINE(N);
       END LOOP;
END;
/
--역순 FOR LOOP
BEGIN
       FOR N IN REVERSE 1..10 LOOP
               DBMS_OUTPUT.PUT_LINE(N);
       END LOOP;
END;
/
--FOR SELECT문에서
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
--     WHILE 조건식 LOOP
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


