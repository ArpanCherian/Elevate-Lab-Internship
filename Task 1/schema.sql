-- Hospital Management System SQL Schema for Internship Task 1

-- Creating Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

-- Creating Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Creating Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DOB DATE
);

-- Creating Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Date DATE NOT NULL,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Creating MedicalRecord table
CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    Diagnosis TEXT,
    Prescription TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
