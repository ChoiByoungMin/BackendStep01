
1) 송강 교수가 강의하는 과목을 검색한다
SELECT professor.pno, course.pno, pname, cno, cname
FROM professor, course
WHERE professor.pno = course.pno AND pname='송강';

2) 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT professor.pno, course.pno, pname, cno, cname
 FROM professor, course
 WHERE professor.pno = course.pno AND cname LIKE '%화학%'
 ORDER BY professor.pno;

3) 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT professor.pno, course.pno, pname, cno, cname, st_num
FROM professor, course
WHERE professor.pno = course.pno AND st_num=2
ORDER BY professor.pno;

4) 화학과 교수가 강의하는 과목을 검색한다
SELECT professor.pno, course.pno, pname, cno, cname, section
FROM professor, course
WHERE professor.pno = course.pno AND section='화학'
ORDER BY professor.pno;

5) 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT student.sno, score.sno, score.cno, course.cno, sname, result, cname , major
FROM course, score, student
WHERE student.sno = score.sno AND score.cno = course.cno AND syear=1 AND major='화학'
ORDER BY student.sno;

6) 일반화학 과목의 기말고사 점수를 검색한다
SELECT student.sno, score.sno, score.cno, course.cno, sname, result, cname
FROM course, score, student
WHERE student.sno = score.sno AND score.cno = course.cno AND cname='일반화학'
ORDER BY student.sno;

7) 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT student.sno, score.sno, score.cno, course.cno, sname, result, cname
FROM course, score, student
WHERE student.sno = score.sno AND score.cno = course.cno AND syear=1 AND major='화학' AND cname='일반화학'
ORDER BY student.sno;

8) 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT student.sno, score.sno, score.cno, course.cno, sname, cname
FROM course, score, student
WHERE student.sno = score.sno AND score.cno = course.cno AND syear=1 AND major='화학'
ORDER BY student.sno;

9) 유기화학 과목의 평가점수가 F인 학생의 명단을 검색한다
SELECT student.sno, score.sno, score.cno, course.cno, sname, result, cname, grade
FROM course, score, student, scgrade
WHERE student.sno = score.sno AND score.cno = course.cno AND cname='유기화학'
 AND result BETWEEN loscore AND hiscore AND grade='F'
ORDER BY result DESC;