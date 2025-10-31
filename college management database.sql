select * from DEPARTMENTS d;

select * from FACULTY f;

select * from STUDENTS s;

select * from COURSES c;

select * from ENROLLMENTS e;


-- Create DEPARTMENTS table
CREATE TABLE DEPARTMENTS (
    department_id TEXT PRIMARY KEY,
    department_name TEXT NOT NULL,
    hod_id TEXT  -- Will be updated after faculty insertion
);

-- Create FACULTY table
CREATE TABLE FACULTY (
    faculty_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    department TEXT,
    email TEXT,
    phone TEXT,
    designation TEXT,
    FOREIGN KEY (department) REFERENCES DEPARTMENTS(department_id)
);

-- Create STUDENTS table
CREATE TABLE STUDENTS (
    student_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    address TEXT,
    gender TEXT,
    enrollment_date TEXT,
    department_id TEXT,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id)
);

-- Create COURSES table
CREATE TABLE COURSES (
    course_id TEXT PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INTEGER,
    semester INTEGER,
    department_id TEXT,
    faculty_id TEXT,
    max_capacity INTEGER,
    FOREIGN KEY (department_id) REFERENCES DEPARTMENTS(department_id),
    FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
);

-- Create ENROLLMENTS table
CREATE TABLE ENROLLMENTS (
    enrollment_id TEXT PRIMARY KEY,
    student_id TEXT,
    course_id TEXT,
    enrollment_date TEXT,
    semester INTEGER,
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES STUDENTS(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSES(course_id)
);


-- Insert departments with HOD IDs directly
INSERT INTO DEPARTMENTS VALUES 
('CS', 'Computer Science', 'F001'),
('EC', 'Electronics', 'F003'),
('ME', 'Mechanical', 'F005'),
('CE', 'Civil', 'F007'),
('MA', 'Mathematics', 'F009'),
('PH', 'Physics', 'F010');

INSERT INTO FACULTY VALUES 
('F001', 'Dr. Rajesh Kumar', 'CS', 'rajesh.kumar@college.edu', '9876543210', 'Professor'),
('F002', 'Dr. Priya Sharma', 'CS', 'priya.sharma@college.edu', '9876543211', 'Associate Professor'),
('F003', 'Prof. Amit Singh', 'EC', 'amit.singh@college.edu', '9876543212', 'Professor'),
('F004', 'Dr. Anjali Patel', 'EC', 'anjali.patel@college.edu', '9876543213', 'Assistant Professor'),
('F005', 'Dr. Sanjay Verma', 'ME', 'sanjay.verma@college.edu', '9876543214', 'Professor'),
('F006', 'Prof. Neha Gupta', 'ME', 'neha.gupta@college.edu', '9876543215', 'Associate Professor'),
('F007', 'Dr. Ravi Menon', 'CE', 'ravi.menon@college.edu', '9876543216', 'Professor'),
('F008', 'Dr. Sunita Reddy', 'CE', 'sunita.reddy@college.edu', '9876543217', 'Assistant Professor'),
('F009', 'Dr. Arun Joshi', 'MA', 'arun.joshi@college.edu', '9876543218', 'Professor'),
('F010', 'Prof. Kavita Das', 'PH', 'kavita.das@college.edu', '9876543219', 'Associate Professor'),
('F011', 'Dr. Vikram Malhotra', 'CS', 'vikram.malhotra@college.edu', '9876543220', 'Assistant Professor'),
('F012', 'Prof. Geeta Nair', 'EC', 'geeta.nair@college.edu', '9876543221', 'Assistant Professor');

INSERT INTO STUDENTS VALUES 
('S001', 'Aarav Sharma', 'aarav.sharma@student.edu', '9123456701', 'Bangalore', 'M', '2022-08-01', 'CS'),
('S002', 'Priya Patel', 'priya.patel@student.edu', '9123456702', 'Mumbai', 'F', '2022-08-01', 'CS'),
('S003', 'Rohan Kumar', 'rohan.kumar@student.edu', '9123456703', 'Delhi', 'M', '2022-08-01', 'EC'),
('S004', 'Ananya Singh', 'ananya.singh@student.edu', '9123456704', 'Chennai', 'F', '2022-08-01', 'EC'),
('S005', 'Vikram Joshi', 'vikram.joshi@student.edu', '9123456705', 'Hyderabad', 'M', '2022-08-01', 'ME'),
('S006', 'Neha Gupta', 'neha.gupta@student.edu', '9123456706', 'Pune', 'F', '2022-08-01', 'ME'),
('S007', 'Arun Reddy', 'arun.reddy@student.edu', '9123456707', 'Bangalore', 'M', '2022-08-01', 'CE'),
('S008', 'Sneha Nair', 'sneha.nair@student.edu', '9123456708', 'Kochi', 'F', '2022-08-01', 'CE'),
('S009', 'Rahul Verma', 'rahul.verma@student.edu', '9123456709', 'Kolkata', 'M', '2023-08-01', 'CS'),
('S010', 'Pooja Mehta', 'pooja.mehta@student.edu', '9123456710', 'Ahmedabad', 'F', '2023-08-01', 'CS'),
('S011', 'Karan Malhotra', 'karan.malhotra@student.edu', '9123456711', 'Delhi', 'M', '2023-08-01', 'EC'),
('S012', 'Divya Iyer', 'divya.iyer@student.edu', '9123456712', 'Chennai', 'F', '2023-08-01', 'EC'),
('S013', 'Amit Das', 'amit.das@student.edu', '9123456713', 'Kolkata', 'M', '2023-08-01', 'ME'),
('S014', 'Sunita Rao', 'sunita.rao@student.edu', '9123456714', 'Bangalore', 'F', '2023-08-01', 'ME'),
('S015', 'Rajesh Nair', 'rajesh.nair@student.edu', '9123456715', 'Kochi', 'M', '2023-08-01', 'CE'),
('S016', 'Anjali Kapoor', 'anjali.kapoor@student.edu', '9123456716', 'Mumbai', 'F', '2023-08-01', 'CE'),
('S017', 'Sanjay Kumar', 'sanjay.kumar@student.edu', '9123456717', 'Hyderabad', 'M', '2022-08-01', 'MA'),
('S018', 'Latha Menon', 'latha.menon@student.edu', '9123456718', 'Chennai', 'F', '2022-08-01', 'PH'),
('S019', 'Deepak Sharma', 'deepak.sharma@student.edu', '9123456719', 'Delhi', 'M', '2023-08-01', 'MA'),
('S020', 'Meera Patel', 'meera.patel@student.edu', '9123456720', 'Ahmedabad', 'F', '2023-08-01', 'PH');


INSERT INTO COURSES VALUES 
('CS101', 'Programming Fundamentals', 4, 1, 'CS', 'F001', 60),
('CS201', 'Data Structures', 4, 2, 'CS', 'F002', 50),
('CS301', 'Database Systems', 4, 3, 'CS', 'F011', 45),
('CS401', 'Algorithms', 4, 4, 'CS', 'F001', 40),
('EC101', 'Circuit Theory', 4, 1, 'EC', 'F003', 55),
('EC201', 'Digital Electronics', 4, 2, 'EC', 'F004', 50),
('EC301', 'Signals & Systems', 4, 3, 'EC', 'F012', 45),
('ME101', 'Engineering Mechanics', 4, 1, 'ME', 'F005', 60),
('ME201', 'Thermodynamics', 4, 2, 'ME', 'F006', 50),
('CE101', 'Civil Engineering Basics', 4, 1, 'CE', 'F007', 55),
('CE201', 'Structural Analysis', 4, 2, 'CE', 'F008', 45),
('MA101', 'Calculus I', 3, 1, 'MA', 'F009', 100),
('MA201', 'Linear Algebra', 3, 2, 'MA', 'F009', 80),
('PH101', 'Physics I', 3, 1, 'PH', 'F010', 90),
('PH201', 'Modern Physics', 3, 2, 'PH', 'F010', 70);

INSERT INTO ENROLLMENTS VALUES 
('ENR001', 'S001', 'CS101', '2022-08-15', 1, 'A'),
('ENR002', 'S001', 'CS201', '2023-01-15', 2, 'B+'),
('ENR003', 'S001', 'CS301', '2023-08-15', 3, 'A'),
('ENR004', 'S002', 'CS101', '2022-08-15', 1, 'B'),
('ENR005', 'S002', 'CS201', '2023-01-15', 2, 'A'),
('ENR006', 'S003', 'EC101', '2022-08-15', 1, 'B+'),
('ENR007', 'S003', 'EC201', '2023-01-15', 2, 'A'),
('ENR008', 'S004', 'EC101', '2022-08-15', 1, 'A'),
('ENR009', 'S004', 'EC201', '2023-01-15', 2, 'B+'),
('ENR010', 'S005', 'ME101', '2022-08-15', 1, 'B'),
('ENR011', 'S005', 'ME201', '2023-01-15', 2, 'A'),
('ENR012', 'S006', 'ME101', '2022-08-15', 1, 'A'),
('ENR013', 'S007', 'CE101', '2022-08-15', 1, 'B+'),
('ENR014', 'S008', 'CE101', '2022-08-15', 1, 'A'),
('ENR015', 'S009', 'CS101', '2023-08-15', 1, NULL),
('ENR016', 'S010', 'CS101', '2023-08-15', 1, NULL),
('ENR017', 'S011', 'EC101', '2023-08-15', 1, NULL),
('ENR018', 'S012', 'EC101', '2023-08-15', 1, NULL),
('ENR019', 'S013', 'ME101', '2023-08-15', 1, NULL),
('ENR020', 'S014', 'ME101', '2023-08-15', 1, NULL),
('ENR021', 'S017', 'MA101', '2022-08-15', 1, 'A'),
('ENR022', 'S018', 'PH101', '2022-08-15', 1, 'B+'),
('ENR023', 'S019', 'MA101', '2023-08-15', 1, NULL),
('ENR024', 'S020', 'PH101', '2023-08-15', 1, NULL);