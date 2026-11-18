CREATE TABLE Patient (
    patient_id INT PRIMARY KEY IDENTITY(1,1),
    patient_name VARCHAR(100) NOT NULL,
    patient_age INT,
    patient_gender VARCHAR(10),
    patient_contact VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY IDENTITY(1,1),
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    doctor_contact VARCHAR(100)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY IDENTITY(1,1),
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY IDENTITY(1,1),
    appointment_id INT,
    treatment_description VARCHAR(255),
    treatment_cost DECIMAL(10,2),
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);

SELECT 
    p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date,
    t.treatment_description,
    t.treatment_cost,
    t.treatment_date
FROM Treatment as t
INNER JOIN Appointment as a ON t.appointment_id = a.appointment_id
INNER JOIN Patient as p ON a.patient_id = p.patient_id
INNER JOIN Doctor as d ON a.doctor_id = d.doctor_id;