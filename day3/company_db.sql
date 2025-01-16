# UPDATE 또는 DELETE 쿼리를 실행할 때 삭제 또는 수정 제어에 대한 안전 장치이다.
SET SQL_SAFE_UPDATES = 0;

# company_db DB 생성
CREATE DATABASE company_db;

# company DB 사용
USE company_db;

# employees(직원) 테이블 생성
CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2)	# 연봉
);

# employees(직원) 테이블에 직원 데이터 추가
INSERT INTO employees (name, position, salary)
VALUES
('혜린', 'PM', 90000),
('은우', 'Frontend', 80000),
('가을', 'Backend', 92000),
('지수', 'Frontend', 78000),
('민혁', 'Frontend', 96000),
('하온', 'Backend', 130000);

# employees(직원) 테이블 조회
SELECT * FROM employees;

# 직책이 Frontent 인 직원 중 연봉이 90000 원 이하인 직원의 이름과 연봉 조회
SELECT name, salary FROM employees WHERE salary <= 90000;
-- return : 혜린 : 90000 / 은우: 80000 / 지수 : 780000

# 직책이 PM 인 모든 직원의 연봉을 10% 인상 후 그 결과를 확인
UPDATE employees
SET salary = salary + (salary / 100 * 10)
WHERE position = 'PM';

SELECT * FROM employees WHERE position = 'PM';
-- 혜린 연봉 : 90000 -> 99000


# 모든 Backend 직책인 직원의 연봉을 5% 인생
UPDATE employees
SET salary = salary + (salary / 100 * 5)
WHERE position = 'Backend';

SELECT * FROM employees WHERE position = 'Backend';
-- 가을 연봉 : 92,000 -> 96,600원 / 하온 연봉 : 130,000 -> 136,500원

# 민혁 사원의 데이터 삭제
DELETE FROM employees WHERE name = '민혁';

SELECT * FROM employees;

# 모든 직원의 직책 별로 그룹화하여 각 직책의 평균 연봉 계산
SELECT position, AVG(salary) AS average FROM employees GROUP BY position;
-- PM: 99,000원 / Frontend: 79,000원 / Banckend: 116,550원

# employees(직원) 테이블 삭제
DROP TABLE employees;

# company_db 안의 Tables 조회
SHOW TABLES;