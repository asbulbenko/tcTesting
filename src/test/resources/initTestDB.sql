DROP DATABASE IF EXISTS test ;
CREATE DATABASE test;

USE test;

CREATE TABLE student_groups (
	id int NOT NULL,
	group_name varchar(40) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE students (
	id int NOT NULL AUTO_INCREMENT,
	fio varchar(100),
	group_id int,
	enter_date DATE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (group_id) REFERENCES student_groups(id)
);

CREATE TABLE grades (
	id int NOT NULL AUTO_INCREMENT,
	class_id int NOT NULL,
	student_id int NOT NULL,
	grade int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE department (
	id int NOT NULL,
	department_name varchar(80) NOT NULL,
	department_chief varchar(80) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE teachers (
	id int NOT NULL AUTO_INCREMENT,
	fio varchar(100) NOT NULL,
	department_id int(50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE classes (
	id int NOT NULL AUTO_INCREMENT,
	class_name varchar(50) NOT NULL,
	teacher_id int NOT NULL,
	decade bit(1) NOT NULL DEFAULT b'0',
	year bit(1) NOT NULL DEFAULT b'1',
	PRIMARY KEY (id),
	FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);





INSERT INTO department (id, department_name, department_chief) VALUES (1, 'Aeronautics', 'Korolev S.I');
INSERT INTO department (id, department_name, department_chief) VALUES (2, 'Biological Engineering', 'Gamov G.A.');
INSERT INTO department (id, department_name, department_chief) VALUES (3, 'Computer Science', 'Torvalds L.T.');
INSERT INTO department (id, department_name, department_chief) VALUES (4, 'Chemical Engineering', 'Faraday M.M');

INSERT INTO teachers (id, fio, department_id) VALUES (1, 'Smith I.I.', 1);
INSERT INTO teachers (id, fio, department_id) VALUES (2, 'Johnson B.B.', 2);
INSERT INTO teachers (id, fio, department_id) VALUES (3, 'Allen A.T.', 2);
INSERT INTO teachers (id, fio, department_id) VALUES (4, 'Miller R.A.', 1);
INSERT INTO teachers (id, fio, department_id) VALUES (5, 'Moore M.M.', 3);
INSERT INTO teachers (id, fio, department_id) VALUES (6, 'Scott S.F.', 3);
INSERT INTO teachers (id, fio, department_id) VALUES (7, 'Faraday M.M', 4);

INSERT INTO classes (id, class_name, teacher_id) VALUES (1, 'Aeronautical physics', 1);
INSERT INTO classes (id, class_name, teacher_id) VALUES (2, 'Aerodynamics', 1 );
INSERT INTO classes (id, class_name, teacher_id) VALUES (3, 'Contemporary aeronautical engineering', 4);
INSERT INTO classes (id, class_name, teacher_id) VALUES (4, 'Aviation law', 4);
INSERT INTO classes (id, class_name, teacher_id) VALUES (5, 'Thermodynamics', 2);
INSERT INTO classes (id, class_name, teacher_id) VALUES (6, 'Bio-mechanics', 2);
INSERT INTO classes (id, class_name, teacher_id) VALUES (7, 'Genetic engineering', 3);
INSERT INTO classes (id, class_name, teacher_id) VALUES (8, 'Computing', 5);
INSERT INTO classes (id, class_name, teacher_id) VALUES (9, 'Fundamental Programming Concepts', 6);
INSERT INTO classes (id, class_name, teacher_id) VALUES (10, 'Discrete Structures', 6);
INSERT INTO classes (id, class_name, teacher_id) VALUES (11, 'Differential Equations', 7);
INSERT INTO classes (id, class_name, teacher_id) VALUES (12, 'Physical Chemistry', 7);
INSERT INTO classes (id, class_name, teacher_id) VALUES (13, 'Mechanics', 7);

INSERT INTO student_groups (id, group_name) VALUES (1, 'AE-1');
INSERT INTO student_groups (id, group_name) VALUES (2, 'AE-2');
INSERT INTO student_groups (id, group_name) VALUES (3, 'BE-1');
INSERT INTO student_groups (id, group_name) VALUES (4, 'BE-2');
INSERT INTO student_groups (id, group_name) VALUES (5, 'CS-1');
INSERT INTO student_groups (id, group_name) VALUES (6, 'CS-2');
INSERT INTO student_groups (id, group_name) VALUES (7, 'CE-1');
INSERT INTO student_groups (id, group_name) VALUES (8, 'CE-2');

INSERT INTO students (fio, group_id, enter_date) VALUES ('Bryant Smith', 5, '2017-06-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Ben Harley', 8, '2017-07-25');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Joe Sullivan', 3, '2017-07-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Donna Kauffman', 2, '2017-06-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Rosa Grasman', 3, '2018-08-11');
INSERT INTO students (fio, group_id, enter_date) VALUES ('John Wikat', 7, '2018-01-20');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Ronald Betty', 6, '2018-01-10');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Brandon Spitfingher', 4, '2015-06-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Kyle Freeman', 4, '2019-06-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Greg Flannely', 8, '2018-06-01');
INSERT INTO students (fio, group_id, enter_date) VALUES ('John Walker', 5, '2018-06-20');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Donny Salmon', 6, '2019-06-22');
INSERT INTO students (fio, group_id, enter_date) VALUES ('Igor Baranov', 1, '2019-06-10');

INSERT INTO grades (class_id, student_id, grade) VALUES (1, 13, 100);
INSERT INTO grades (class_id, student_id, grade) VALUES (6, 5, 90);
INSERT INTO grades (class_id, student_id, grade) VALUES (5, 6, 88);
INSERT INTO grades (class_id, student_id, grade) VALUES (8, 1, 85);
INSERT INTO grades (class_id, student_id, grade) VALUES (9, 1, 93);
INSERT INTO grades (class_id, student_id, grade) VALUES (11, 10, 75);
INSERT INTO grades (class_id, student_id, grade) VALUES (12, 10, 80);
INSERT INTO grades (class_id, student_id, grade) VALUES (5, 6, 88);
INSERT INTO grades (class_id, student_id, grade) VALUES (8, 11, 100);
INSERT INTO grades (class_id, student_id, grade) VALUES (13, 2, 86);
INSERT INTO grades (class_id, student_id, grade) VALUES (9, 11, 86);
INSERT INTO grades (class_id, student_id, grade) VALUES (12, 2, 90);









