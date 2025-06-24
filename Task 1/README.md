# 🏥 Hospital Management System – SQL Developer Internship Task

## 📌 Overview
This project is part of the SQL Developer Internship – Task 1. It involves designing a relational database schema for a Hospital Management System using SQL (DDL) and ER concepts. The goal is to model hospital entities like departments, doctors, patients, appointments, and medical records using proper relationships and constraints. It includes the schema, sample data entry, queries, ER diagram code, and instructions for setting it up.

## 🗂 Database Schema & Structure

### Tables and Their Columns:

**1. Department**
- `DepartmentID`: INT, Primary Key, Auto Increment
- `Name`: Name of the department (e.g., Cardiology)

**2. Doctor**
- `DoctorID`: INT, Primary Key, Auto Increment
- `Name`: Doctor's full name
- `DepartmentID`: Foreign Key referencing Department

**3. Patient**
- `PatientID`: INT, Primary Key, Auto Increment
- `Name`: Patient's full name
- `Email`: Unique email
- `DOB`: Date of birth

**4. Appointment**
- `AppointmentID`: INT, Primary Key, Auto Increment
- `PatientID`: Foreign Key referencing Patient
- `DoctorID`: Foreign Key referencing Doctor
- `Date`: Date of appointment
- `Reason`: Reason for visit

**5. MedicalRecord**
- `RecordID`: INT, Primary Key, Auto Increment
- `AppointmentID`: Foreign Key referencing Appointment
- `Diagnosis`: Diagnosis description
- `Prescription`: Treatment/Medicine prescribed

## 🔗 Relationships
- One Department has many Doctors
- One Doctor can have many Appointments
- One Patient can have many Appointments
- One Appointment leads to one Medical Record

## ⚙️ Usage Instructions

### Create the Database
```sql
CREATE DATABASE HospitalDB;
USE HospitalDB;
````

### Create All Tables

```sql
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DOB DATE
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Date DATE NOT NULL,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE MedicalRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    AppointmentID INT,
    Diagnosis TEXT,
    Prescription TEXT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
```

## 🧪 Sample Data Entry

```sql
INSERT INTO Department (Name) VALUES ('Cardiology'), ('Neurology');

INSERT INTO Doctor (Name, DepartmentID) VALUES 
('Dr. A Kumar', 1),
('Dr. B Nair', 2);

INSERT INTO Patient (Name, Email, DOB) VALUES 
('John Doe', 'john@example.com', '1990-05-12'),
('Jane Smith', 'jane@example.com', '1985-09-23');

INSERT INTO Appointment (PatientID, DoctorID, Date, Reason) VALUES 
(1, 1, '2025-06-24', 'Chest Pain'),
(2, 2, '2025-06-25', 'Headache');

INSERT INTO MedicalRecord (AppointmentID, Diagnosis, Prescription) VALUES 
(1, 'Mild Hypertension', 'Amlodipine'),
(2, 'Migraine', 'Paracetamol + rest');
```

## 🔍 Sample SQL Queries

```sql
-- Get all doctors with their departments
SELECT d.Name AS Doctor, dp.Name AS Department
FROM Doctor d
JOIN Department dp ON d.DepartmentID = dp.DepartmentID;

-- Show all appointments with patient and doctor names
SELECT a.Date, p.Name AS Patient, d.Name AS Doctor, a.Reason
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID;

-- Fetch all medical records of a patient
SELECT p.Name AS Patient, m.Diagnosis, m.Prescription
FROM MedicalRecord m
JOIN Appointment a ON m.AppointmentID = a.AppointmentID
JOIN Patient p ON a.PatientID = p.PatientID
WHERE p.PatientID = 1;
```

## 🖼 ER Diagram Code (for dbdiagram.io)

```dbml
Table Department {
  DepartmentID int [pk, increment]
  Name varchar(100)
}

Table Doctor {
  DoctorID int [pk, increment]
  Name varchar(100)
  DepartmentID int
}

Table Patient {
  PatientID int [pk, increment]
  Name varchar(100)
  Email varchar(100) [unique]
  DOB date
}

Table Appointment {
  AppointmentID int [pk, increment]
  PatientID int
  DoctorID int
  Date date
  Reason varchar(255)
}

Table MedicalRecord {
  RecordID int [pk, increment]
  AppointmentID int
  Diagnosis text
  Prescription text
}

Ref: Doctor.DepartmentID > Department.DepartmentID
Ref: Appointment.PatientID > Patient.PatientID
Ref: Appointment.DoctorID > Doctor.DoctorID
Ref: MedicalRecord.AppointmentID > Appointment.AppointmentID
```

## 💡 Concepts Covered

* SQL DDL (CREATE TABLE)
* Primary & Foreign Keys
* AUTO\_INCREMENT
* Constraints (UNIQUE, NOT NULL)
* One-to-Many Relationships
* Basic SQL joins
* Normalized schema
* Data population and queries

## 🛠 Tools Used

* MySQL Workbench / SQLiteStudio for schema execution
* dbdiagram.io for ER diagram generation
* GitHub for code hosting and submission

