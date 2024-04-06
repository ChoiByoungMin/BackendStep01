

1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT c.pno, cname, pname
 FROM professor p
 JOIN course c ON p.pno= c.pno; 
2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT major, sname, result, c.sno, syear
 FROM student s
 JOIN score c ON s.sno=c.sno
 WHERE major='화학'
 ORDER BY syear;
3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT cname, result, sname, s.sno, syear
 FROM student s
 JOIN score c ON s.sno=c.sno
 JOIN course co ON co.cno = c.cno
 WHERE cname='유기화학'
 ORDER BY syear;

4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT major, sname, p.pno, pname, cname, syear
 FROM student s
 JOIN score c ON s.sno=c.sno
 JOIN course co ON co.cno=c.cno
 JOIN professor p ON p.pno=co.pno
 WHERE major='화학'
 ORDER BY syear;
5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT p.pno, pname, section , cname
FROM professor p
LEFT JOIN course c ON p.pno = c.pno
ORDER BY cname;


6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)

SELECT p.pno, pname, section , cname
FROM professor p
FULL JOIN course c ON p.pno = c.pno
ORDER BY cname;
