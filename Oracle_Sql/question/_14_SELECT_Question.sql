
1) 평점이 3.0에서 4.0사이의 학생을 검색하라
SELECT *
FROM student
WHERE avr BETWEEN '3.0' AND '4.0'
ORDER BY avr DESC;

2) 1994년에서 1995년까지 부임한 교수의 명단을 검색하라

ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';

SELECT *
FROM professor
WHERE hiredate BETWEEN '1994/01/01:00:00:00' AND '1995/12/31:23:59:59';

3) 화학과와 물리학과, 생물학과 학생을 검색하라
SELECT *
FROM student
WHERE major='화학' OR major='물리' OR major='생물'
ORDER BY major;

4) 정교수와 조교수를 검색하라
SELECT *
FROM professor
WHERE orders='정교수' OR orders='부교수'
ORDER BY orders;

5) 학점수가 1학점, 2학점인 과목을 검색하라
SELECT *
FROM course
WHERE st_num=1 OR st_num=2
ORDER BY st_num;

6) 1, 2학년 학생 중에 평점이 2.0에서 3.0사이인 학생을 검색하라
SELECT *
FROM student
WHERE (syear=1 OR syear=2) AND avr BETWEEN '2.0' AND '3.0'
ORDER BY syear;

7) 화학, 물리학과 학생 중 1, 2 학년 학생을 성적순으로 검색하라
SELECT *
FROM student
WHERE (major='화학' OR major='물리') AND (syear=1 OR syear=2) AND avr IS NOT NULL
ORDER BY major, syear, avr DESC;
