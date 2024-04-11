
1) 화학과 학생과 평점이 동일한 학생들을 검색하세요
SELECT major, sname, avr
FROM student
WHERE major='화학';

SELECT *
FROM student
WHERE major = '화학'
AND avr IN (
    SELECT avr
    FROM student
    WHERE major = '화학'
    GROUP BY avr
    HAVING COUNT(*) > 1
);


2) 화학과 교수와 부임일이 같은 직원을 검색하세요
SELECT *
FROM professor
WHERE section = '화학'
AND hiredate IN (
    SELECT hiredate
    FROM professor
    WHERE section = '화학'
    GROUP BY hiredate
    HAVING COUNT(*) > 1
);


3) 화학과 학생과 같은 학년에서 평점이 동일한 학생들을 검색하세요

SELECT *
FROM student
WHERE major = '화학'
AND avr IN (
    SELECT avr
    FROM student
    WHERE major = '화학'
    GROUP BY avr, syear
    HAVING COUNT(*) > 1
);