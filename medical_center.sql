
-- Drop the database if it exists
DROP DATABASE IF EXISTS medical_center;

-- Create the medical_center database
CREATE DATABASE medical_center;

-- Connect to the medical_center database
\c medical_center;

-- Create the Doctor table
CREATE TABLE Doctor (
    DoctorID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Specialty VARCHAR(255),
    ContactInfo VARCHAR(255)
);

-- Create the Patient table
CREATE TABLE Patient (
    PatientID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255),
    DateOfBirth DATE
);

-- Create the Disease table
CREATE TABLE Disease (
    DiseaseID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255),
    Treatment VARCHAR(255)
);

-- Create the Visit table
CREATE TABLE Visit (
    VisitID SERIAL PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    DateTimeOfVisit TIMESTAMPTZ NOT NULL,
    ReasonForVisit VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Create the DoctorPatient junction table for the many-to-many relationship
CREATE TABLE DoctorPatient (
    DoctorPatientID SERIAL PRIMARY KEY,
    DoctorID INT NOT NULL,
    PatientID INT NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Create the PatientDisease junction table for the many-to-many relationship
CREATE TABLE PatientDisease (
    PatientDiseaseID SERIAL PRIMARY KEY,
    PatientID INT NOT NULL,
    DiseaseID INT NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);


-- INSERT INTO DATABASE --

-- Insert an empty record into the Doctor table
INSERT INTO Doctor (Name, Specialty, ContactInfo) 
VALUES 
    ('A. ANDERSON', 'DENTIST', '787-873-9030'),
    ('D. PUELLO', 'PSYCHOLOGIST', '888-332-8167'), 
    ('k. WATERFIELD', 'SURGEON', '920-183-1111');

-- Insert an empty record into the Patient table
INSERT INTO Patient (Name, ContactInfo, DateOfBirth) 
VALUES 
    ('J. KARSON', 'JKARSON@EXAMPLE.COM', '1990-05-15'),
    ('K. WILLIAMS', 'KWILLIAMS@EXAMPLE.COM', '1999-07-21');
    ('G. POLO', 'GPOLO@EXAMPLE.COM', '2001-08-10');

-- Insert an empty record into the Disease table
INSERT INTO Disease (Name, Description, Treatment) 
VALUES 
    ('CANCER', 
    'Cancer is a disease characterized by the uncontrollable growth of abnormal cells in the body, often capable of invading surrounding tissues and spreading to other parts of the body. It can manifest in various forms, and its development is associated with genetic mutations and risk factors such as genetics, lifestyle, and environmental exposures.', 
    'surgery, chemotherapy, radiation therapy, immunotherapy, and targeted therapy');
   
    ('CALCULUS', 
    'hardened deposits of dental plaque that accumulate on the teeth over time due to the mineralization of bacteria and food particles',
    'Good oral hygiene practices at home, including regular brushing, flossing, and the use of antimicrobial mouthwash,'),

    ('CARDIOVASCULAR DISEASE',
    'Cardiovascular disease encompasses conditions affecting the heart and blood vessels, including heart disease and stroke, posing a significant global health threat due to its life-threatening nature.',
    'Treatment may include medication, lifestyle changes, and surgical interventions like bypass surgery.'
    );

-- Insert an empty record into the Visit table
INSERT INTO Visit (PatientID, DoctorID, DateTimeOfVisit, ReasonForVisit) 
VALUES 
    ( WILLIAMS, ANDERSON, '2023-02-20' , 'WILLIAMS HAD A CASE OF CALCULUS'),
    ( POLO, PUELLO, '2023-12-19', ' POLO HAD A CASE OF BPD'),
    (KARSON, WATERFIELD, '2022-08-20', 'KARSON HAD A CASE OF CARDIOVASULAR DISEASE ');


-- Insert an empty record into the DoctorPatient junction table
INSERT INTO DoctorPatient (DoctorID, PatientID) 
VALUES 
( ANDERSON, WILLIAMS),
( PUELLO , POLO ),
( WATERFIELD , KARSON) ; 

-- Insert an empty record into the PatientDisease junction table
INSERT INTO PatientDisease (PatientID, DiseaseID) 
VALUES 
( WILLIAMS, CALCULUS),
( POLO, BPD),
( Karson, CARDIOVASCULAR);


