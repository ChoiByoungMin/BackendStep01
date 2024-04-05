

1) 학생중에 동명이인을 검색한다
SELECT DISTINCT s.sno, s.sname, s.sex, s.syear, s.major
FROM student s, student n
WHERE s.sname = n.sname AND s.sno != n.sno;

2) 전체 교수 명단과 교수가 담당하는 과목의 이름을 학과 순으로 검색한다
SELECT professor.pno, course.pno, pname,section
FROM professor, course
WHERE professor.pno = course.pno
ORDER BY section;

3) 이번 학기 등록된 모드 과목과 담당 교수의 학점 순으로 검색한다

SELECT course.pno, pname,section, st_num
FROM professor, course
WHERE professor.pno(+) = course.pno
ORDER BY section, st_num;