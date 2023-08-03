DESC student;

SELECt name, grade, SUBSTR(birthdate, 6) from student Order by grade desc;


select userid, name, deptno, grade,idnum from student order by deptno desc, grade desc; 

select studno, name, deptno, grade, idnum from student order by 2 desc;
 -- 인덱스 라는게 selec 순서
 
 
 -- initcap(
 select name, userid, INITCAP(userid)
 from student
 where name = '박미경';
 
 
 --Length() 문자수, LengthB() 바이트수
 desc department;
 
 select dname, length(dname), lengthb(dname) from department;
 select length('hello'), LENGTHB('hello') from dual;
--> 한글은 1글자당 3바이트, 영어는 1바이트

--문자 조작 함수
--substr(문자열 or 컬럼이름), 시작, 개수)

select name, idnum, birthdate from student where grade =1;

select name, idnum,substr(idnum,1,6)" 주민등록번호", 
birthdate,substr(birthdate,4,2) "태어난 달"
from student where grade =1;

select 'javascript' 전체 , substr('javascript',1,4) java, substr('javascript',5) script
from dual;

--instr(문자열,문자) : 문자의 index 반환
select substr('https://www.naver.com', instr('https://www.naver.com','w'))
from dual;

desc department;
select * from department;
select dname, instr(dname,'과') from department;
select deptno, instr(deptno,0) from department; --instr(숫자,숫자)도 가능하네여

select name, tel from student;

select name, tel, substr(tel,0,instr(tel,')')-1)
from student;

-- lpad() 문자열이 일정한 크기가 되도록 왼쪽에 지정한 문자를 삽입
-- rpad() 문자열이 일정한 크기가 되도록 오른쪽에 지정한 문자 삼입
desc professor;
select lpad(position,10,'*'), rpad(userid,12,'+')
from professor;

select LPAD(), rpad(userid,12)
from professor;

select Length('백국현') from dual;
select lpad('백국현',length('백국현냐')) from dual;
select lengthb('백국현') from dual;
select lpad('백국현',lengthb('백국현'),'+') from dual;
select lpad('백국현',9,'+') from dual;
select lengthb('백') from dual;


--숫자 반올림,자름,
select Round(123.127,2) from dual; --반올림Round(숫자,소수점반올림어디까지 표현할지
select Round('가나',1) from dual; -- 숫자만 가능
select Trunc(123.123,2) from dual;  -- 숫자만 가능하고 자르기 

--나머지
select mod(123,2) from dual; --(숫자,나눌숫자)
SELECT mod(123,2,1) from dual;
--  올림, 내림 형식은 (숫자만)
select ceil(123.123) from dual;
select floor(123.123) from dual;

desc student;
select idnum from student;
select mod(idnum,2) from student; -- null값은 null만 나오네

desc professor;

select * from professor;

--반올림
select name, sal/22 일급, round(sal/22,1)일급1, round(sal/22,3)일급3, round(sal/22,-1)
from professor;

--절삭
select name, sal/22 일급, trunc(sal/22)일급1, round(sal/22,3)일급3, round(sal/22,-1)
from professor;

--나머지

select name,sal,comm, mod(sal,comm)
from professor;
-- null값은 연산하면 null이기 때문에,
-- null값 처리 방법 NVL(값,지정값)
select name,sal,comm, mod(sal,NVL(comm,1))
from professor;

-- null값 처리 방법 NVL2(값,지정값1,지정값2)
-- 값이 null이 아니라면 지정값1으로 처리 
-- null값이라면 지정값2로 처리
select name, sal,comm, mod(sal,NVL2(comm,20,13))
from professor;

-- 형변환
-- char값으로 TO_CHAR
-- 숫자값을 TO_Number
select * from student where grade = TO_char(2);
select * from student where grade = 2;
select * from student where grade = '2';
    --> 3개 다되긴하네
select * from student where deptno = 101;
select * from student where deptno = '101';
-- 타입확인하고 싶은 DATA_TYPE --> 존나어렵다 그냥 검색하지말자
select DATA_TYPE 
from COLS
where TABLE_NAME = 'PROFESSOR' AND COLUMN_NAME = 'DEPTNO';

--접속한 계정 테이블 조회
select * From tabs;
--컬럼조회
select * from cols; -- 전체컬럼조회
select * from cols where COLUMN_NAME = 'DEPTNO'; --> 소,대문자 맞춰서 검색해야함

desc professor;

SELECT name,sal, comm, TO_CHAR((sal+NVL(comm,0))*12,'9,999') 연봉
--                                                    ㄴ 포켓 마스크라고함
from professor;
SELECT name,sal, comm, (sal+comm)*12 연봉
from professor;

SELECT name,sal, comm, (sal+comm)*12 연봉
from professor
where comm IS NOT NULL;

SELECT name,sal, comm, TO_CHAR((sal+NVL(comm,0))*12,'9,999') 연봉
from professor
where comm is null;

select name,NVL2(comm,sal+comm,sal) 급여총액
from professor
where deptno = 102;

desc professor;

-- nullif(지정값1,지정값2)
-- 만약 지정값1과 지정값2 가 같으면 null값 반환
-- 다르다면 지정값 1 지정
select name,userid, lengthb(userid), 
nullif(lengthb(userid),6)
from professor;

select name,userid, lengthb(userid), 
nullif(6,lengthb(userid))
from professor;

--COALESCE함수
-- NVL함수의 확장 버젼 NVL처럼 사용가능
-- 여러 컬럼의 null을 판별해야할때 사용
-- COALESCE(지정값1,지정값2,지정값3....)
-- 지정값의 순서대로 null이라면 다음 null이 아닌 지정값을 출력해줌
desc professor;

select name, comm,sal,COALESCE(comm,sal,0)
from professor;

--날짜 입력할 때 문자열로 입력해야함
INSERT INTO professor(profno,name,userid,position,hiredate,deptno) VALUES(9909,'백명기','mgbaik','주교수','60/12/20', 203);

-- 날짜 현재 세션 날짝형식에 맞춰 입력 맞춰서 저장되네
Update professor set hiredate= '90-10-20' where name = '백명기';

--현재 세션 날짜형식 검색
select * from nls_session_parameters
where parameter = 'NLS_DATE_FORMAT';

--현재 세션의 날짜형식 바꾸기
alter session set nls_date_format = 'YY-MM-DD ';
alter session set nls_date_format = 'RR/MM/DD';
select * from professor;

--DECODE 함수
--오라클에서 많이 사용된다네
--비록 표준 sql함수는 아니지만 매우유용함
--ifelse역할을 함
--DECODE(컬럼,조건1,결과1,조건2,결과2,조건3,결과3,else 결과...)
-- ㄴ if(컬럼=조건1 return 결과1
-- ㄴ elseif(컬럼=조건2 return 결과2

select name, DECODE(deptno,101,'컴퓨터공학과',102,'멀티미디어학과',201,'전자공학과','기계공학과')
from professor;

desc student;
select * from student;
select name, substr(idnum,1,6), DECODE(substr(idnum,7,1),1,'남',2,'여')
from student
where deptno  =102;