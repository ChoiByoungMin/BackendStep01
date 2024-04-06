
1) 각 학생의 평점을 검색하라(별명을 사용)
SELECT sno 학번, sname "학생 이름", syear 학년, major 학과,  avr 평점
FROM student;

2) 각 과목의 학점수를 검색하라(별명을 사용)
SELECT cno "과목 번호", cname "과목 이름", st_num 학점
FROM course;

3) 각 교수의 지위를 검색하라(별명을 사용)
SELECT pno "교수 번호", pname "교수 이름" orders 지위
FROM professor;

4) 급여를 10%인상했을 때 연간 지급되는 급여를 검색하라(별명을 사용)
SELECT eno 사번, ename 이름, job 부서, sal*1.1*12 "10%인상 연간 급여"
FROM emp;

5) 현재 학생의 평균 평점은 4.0만점이다. 이를 4.5만점으로 환산해서 검색하라(별명을 사용)
SELECT sno, sname, avr*4.5/4.0 환산평점
FROM student;




