
DROP DATABASE IF exists medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;


CREATE TABLE hospitals (
    hospital_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    hospital_id INT NOT NULL REFERENCES hospitals
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(15) NOT NULL
);

CREATE TABLE diagnosis (
    diagnosis_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patient_doctor (
    patient_id INT NOT NULL REFERENCES patients,
    doctor_id INT NOT NULL REFERENCES doctors
);

CREATE TABLE patient_diagnosis (
    patient_id INT NOT NULL REFERENCES patients,
    diagnosis_id INT NOT NULL REFERENCES diagnosis
);

INSERT INTO hospitals (hospital_id, name)
VALUES (1, 'Salem Hospital'),  (2, 'St. Anthony Summit Hospital');

INSERT INTO doctors (doctor_id, first_name, last_name, hospital_id)
VALUES (1, 'Paul', 'Nemeskal', 1), (2, 'Julie', 'McKenzie', 2), (3, 'Ron', 'Lewis', 1);

INSERT INTO patients (patient_id, first_name, last_name)
VALUES (1, 'Gloria', 'Taylor'),  (2, 'Heather', 'Konz'),  (3, 'Cooper', 'Konz');

INSERT INTO diagnosis (diagnosis_id, name)
VALUES (1, 'Acne'), (2, 'Hypothyroidism'), (3, 'Arthritis');

INSERT INTO patient_doctor (patient_id, doctor_id) 
VALUES (1, 1), (2, 1), (2, 2), (3, 3);

INSERT INTO patient_diagnosis (patient_id, diagnosis_id)
VALUES (1, 3), (2, 2), (3, 1);


-- 1. What diagnosis does "Gloria" have?
-- SELECT patients.first_name AS patient_first_name, patients.last_name AS patient_last_name, diagnosis.name AS diagnosis_name     
-- FROM patients
-- JOIN patient_diagnosis
-- ON patients.patient_id=patient_diagnosis.patient_id
-- JOIN diagnosis
-- ON patient_diagnosis.diagnosis_id = diagnosis.diagnosis_id
-- WHERE patients.first_name='Gloria';

--2. What doctors does "Heather" see?
-- SELECT patients.first_name AS patient_first_name, patients.last_name AS patient_last_name, doctors.first_name AS doctor_first_name, doctors.last_name AS doctor_last_name                                          FROM doctors
-- JOIN patient_doctor
-- ON doctors.doctor_id=patient_doctor.doctor_id
-- JOIN patients
-- ON patients.patient_id = patient_doctor.patient_id
-- WHERE patients.first_name='Heather';






