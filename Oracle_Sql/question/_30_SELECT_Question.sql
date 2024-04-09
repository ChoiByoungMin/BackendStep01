
1) 3학년 학생의 학과별 평점 평균과 분산 및 편차를 검색하세요
SELECT major, syear "학년", ROUND(AVG(avr),2) "학과별 평점 평균"
                  ,ROUND(VARIANCE(avr),2) "분산"
                  ,ROUND(STDDEV(avr),2) "표준편차"
FROM student
WHERE syear=3
GROUP BY major, syear;
2) 화학과 학년별 평균 평점을 검색하세요
SELECT syear "학년", ROUND(AVG(avr),2) "학년별 평점 평균"
FROM student
WHERE major='화학'
GROUP BY syear;

3) 각 학생별 기말고사 평균을 검색하세요
SELECT sno, sname, ROUND(AVG(result),2)
FROM score
FULL JOIN student USING (sno)
GROUP BY sno, sname;
4) 각 학과별 학생 수를 검색하세요
SELECT major, COUNT(major) "학과별 학생수"
FROM student
GROUP BY major;

5) 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하세요
SELECT major, ROUND(AVG(avr*4.5/4.0),2) "환산 평점 평균"
FROM student
WHERE major='화학' OR  major='생물'
GROUP BY major;
6) 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수) 교수의 수를 
   검색하세요
SELECT orders "직급", COUNT(orders) "직급별 수"
FROM professor
WHERE TRUNC(sysdate, 'YY')-TRUNC(hiredate,'YY')+1 >=10
GROUP BY orders;
7) 과목명에 화학이 포함된 과목의 학점수 총합을 검색하세요
SELECT COUNT(cname) "화학과목 수", SUM(st_num) "화학과목 학점총합"
FROM course
WHERE cname LIKE '%화학%';

8) 화학과 학생들의 기말고사 성적을 성적순으로 검색하세요
SELECT sno, sname, result
FROM student
FULL JOIN score USING (sno)
WHERE major='화학'
ORDER BY result DESC;

9) 학과별 기말고사 평균을 성적순으로 검색하세요
SELECT sno, sname, major, result
FROM student
FULL JOIN score USING (sno)
ORDER BY major, result DESC;