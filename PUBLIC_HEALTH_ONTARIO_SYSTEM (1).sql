----START------

CREATE TABLE medication (
    medicationid   INT PRIMARY KEY,
    medicationname VARCHAR(255),
    dosageform     VARCHAR(100),
    medmfr         VARCHAR(255)
);

CREATE TABLE administration (
    administrationid INT PRIMARY KEY,
    adminname        VARCHAR(255),
    admincontact     VARCHAR(20)
);

CREATE TABLE medicalequipment (
    equipmentid     INT PRIMARY KEY,
    equipmentname   VARCHAR(255),
    manufacturer    VARCHAR(255),
    meddateacquired DATE
);

CREATE TABLE healthcareprovider (
    providerid        INT PRIMARY KEY,
    administrationid  INT,
    hplname           VARCHAR(255),
    speciality        VARCHAR(100),
    healthcarecontact VARCHAR(20),
    FOREIGN KEY ( administrationid )
        REFERENCES administration ( administrationid )
);

CREATE TABLE doctor (
    doctorid   INT PRIMARY KEY,
    providerid INT,
    docfname   VARCHAR(255),
    doclname   VARCHAR(255),
    docemail   VARCHAR(100),
    doccontact VARCHAR(20),
    FOREIGN KEY ( providerid )
        REFERENCES healthcareprovider ( providerid )
);

CREATE TABLE insuranceprovider (
    insuranceid      INT PRIMARY KEY,
    administrationid INT,
    insurancename    VARCHAR(255),
    insurancecontact VARCHAR(20),
    FOREIGN KEY ( administrationid )
        REFERENCES administration ( administrationid )
);

CREATE TABLE patient (
    patientid    INT PRIMARY KEY,
    doctorid     INT,
    patientfname VARCHAR(255),
    patientlname VARCHAR(255),
    patientdob   DATE,
    pgender      VARCHAR(1),
    pcontact     VARCHAR(20),
    paddress     VARCHAR(255),
    insuranceid  INT,
    FOREIGN KEY ( insuranceid )
        REFERENCES insuranceprovider ( insuranceid ),
    FOREIGN KEY ( doctorid )
        REFERENCES doctor ( doctorid )
);

CREATE TABLE integratedcaredepartment (
    icdepartmentid    INT PRIMARY KEY,
    providerid        INT,
    departmentcontact VARCHAR(20),
    FOREIGN KEY ( providerid )
        REFERENCES healthcareprovider ( providerid )
);

CREATE TABLE department (
    departmentid      INT PRIMARY KEY,
    icdepartmentid    INT,
    departmentname    VARCHAR(255),
    departmentcontact VARCHAR(20),
    FOREIGN KEY ( icdepartmentid )
        REFERENCES integratedcaredepartment ( icdepartmentid )
);

CREATE TABLE laboratory (
    labid               INT PRIMARY KEY,
    equipmentid         INT,
    departmentid        INT,
    laboratoriescontact VARCHAR(20),
    labname             VARCHAR(255),
    FOREIGN KEY ( equipmentid )
        REFERENCES medicalequipment ( equipmentid ),
    FOREIGN KEY ( departmentid )
        REFERENCES department ( departmentid )
);

CREATE TABLE appointment (
    appointmentid  INT PRIMARY KEY,
    patientid      INT,
    providerid     INT,
    appdateandtime DATE,
    apptpurpose    VARCHAR2(255),
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid ),
    FOREIGN KEY ( providerid )
        REFERENCES healthcareprovider ( providerid )
);

CREATE TABLE prescription (
    prescriptionid INT PRIMARY KEY,
    patientid      INT,
    doctorid       INT,
    medicationid   INT,
    dosage         VARCHAR(50),
    dateprescribed DATE,
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid ),
    FOREIGN KEY ( doctorid )
        REFERENCES doctor ( doctorid ),
    FOREIGN KEY ( medicationid )
        REFERENCES medication ( medicationid )
);

CREATE TABLE dischargesummary (
    dischargeid     INT PRIMARY KEY,
    patientid       INT,
    dateofdischarge DATE,
    summary         VARCHAR(250),
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid )
);

CREATE TABLE medicalrecord (
    recordid    INT PRIMARY KEY,
    patientid   INT,
    diagnosis   VARCHAR(255),
    dateofvisit DATE,
    notes       VARCHAR(250),
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid )
);

CREATE TABLE surgery (
    surgeryid   INT PRIMARY KEY,
    patientid   INT,
    doctorid    INT,
    surgerytype VARCHAR(255),
    surgerydate DATE,
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid ),
    FOREIGN KEY ( doctorid )
        REFERENCES doctor ( doctorid )
);

CREATE TABLE billing (
    billid         INT PRIMARY KEY,
    patientid      INT,
    providerid     INT,
    billamount     DECIMAL(10, 2),
    billdateissued DATE,
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid ),
    FOREIGN KEY ( providerid )
        REFERENCES healthcareprovider ( providerid )
);

CREATE TABLE allergy (
    allergyid INT PRIMARY KEY,
    patientid INT,
    allergen  VARCHAR(255),
    reaction  VARCHAR(255),
    FOREIGN KEY ( patientid )
        REFERENCES patient ( patientid )
);


------insert queries-----
---Medication---
-- Inserting record 1
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    1,
    'Aspirin',
    'Tablet',
    'Bayer'
);

-- Inserting record 2
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    2,
    'Lisinopril',
    'Capsule',
    'Generic'
);

-- Inserting record 3
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    3,
    'Amoxicillin',
    'Liquid',
    'Pfizer'
);

-- Inserting record 4
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    4,
    'Simvastatin',
    'Tablet',
    'Merck'
);

-- Inserting record 5
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    5,
    'Omeprazole',
    'Capsule',
    'AstraZeneca'
);

-- Inserting record 6
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    6,
    'Metformin',
    'Tablet',
    'Novartis'
);

-- Inserting record 7
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    7,
    'Atorvastatin',
    'Tablet',
    'Pfizer'
);

-- Inserting record 8
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    8,
    'Citalopram',
    'Tablet',
    'Generic'
);

-- Inserting record 9
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    9,
    'Ibuprofen',
    'Tablet',
    'JohnsonAndJohnson'
);

-- Inserting record 10
INSERT INTO medication (
    medicationid,
    medicationname,
    dosageform,
    medmfr
) VALUES (
    10,
    'Levothyroxine',
    'Tablet',
    'AbbVie'
);

------administration----
-- Inserting record 1
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    1,
    'AdminName1',
    'Contact1'
);

-- Inserting record 2
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    2,
    'AdminName2',
    'Contact2'
);

-- Inserting record 3
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    3,
    'AdminName3',
    'Contact3'
);

-- Inserting record 4
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    4,
    'AdminName4',
    'Contact4'
);

-- Inserting record 5
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    5,
    'AdminName5',
    'Contact5'
);

-- Inserting record 6
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    6,
    'AdminName6',
    'Contact6'
);

-- Inserting record 7
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    7,
    'AdminName7',
    'Contact7'
);

-- Inserting record 8
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    8,
    'AdminName8',
    'Contact8'
);

-- Inserting record 9
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    9,
    'AdminName9',
    'Contact9'
);

-- Inserting record 10
INSERT INTO administration (
    administrationid,
    adminname,
    admincontact
) VALUES (
    10,
    'AdminName10',
    'Contact10'
);

------medicalequipment-----
 -- Inserting record 1
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    50,
    'EquipmentName50',
    'Manufacturer50',
    '2023-01-01'
);

-- Inserting record 2
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    2,
    'EquipmentName2',
    'Manufacturer2',
    '2023-02-01'
);

-- Inserting record 3
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    3,
    'EquipmentName3',
    'Manufacturer3',
    '2023-03-01'
);

-- Inserting record 4
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    4,
    'EquipmentName4',
    'Manufacturer4',
    '2023-04-01'
);

-- Inserting record 5
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    5,
    'EquipmentName5',
    'Manufacturer5',
    '2023-05-01'
);

-- Inserting record 6
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    6,
    'EquipmentName6',
    'Manufacturer6',
    '2023-06-01'
);

-- Inserting record 7
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    7,
    'EquipmentName7',
    'Manufacturer7',
    '2023-07-01'
);

-- Inserting record 8
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    8,
    'EquipmentName8',
    'Manufacturer8',
    '2023-08-01'
);

-- Inserting record 9
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    9,
    'EquipmentName9',
    'Manufacturer9',
    '2023-09-01'
);

-- Inserting record 10
INSERT INTO medicalequipment (
    equipmentid,
    equipmentname,
    manufacturer,
    meddateacquired
) VALUES (
    10,
    'EquipmentName10',
    'Manufacturer10',
    '2023-10-01'
);

---healthcareprovider----
-- Inserting record 1
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    1,
    1,
    'HPLName1',
    'Speciality1',
    'Contact1'
);

-- Inserting record 2
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    2,
    8,
    'HPLName2',
    'Speciality2',
    'Contact2'
);

-- Inserting record 3
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    3,
    1,
    'HPLName3',
    'Speciality3',
    'Contact3'
);

-- Inserting record 4
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    4,
    1,
    'HPLName4',
    'Speciality4',
    'Contact4'
);

-- Inserting record 5
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    5,
    1,
    'HPLName5',
    'Speciality5',
    'Contact5'
);

-- Inserting record 6
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    6,
    2,
    'HPLName6',
    'Speciality6',
    'Contact6'
);

-- Inserting record 7
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    7,
    2,
    'HPLName7',
    'Speciality7',
    'Contact7'
);

-- Inserting record 8
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    8,
    9,
    'HPLName8',
    'Speciality8',
    'Contact8'
);

-- Inserting record 9
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    9,
    2,
    'HPLName9',
    'Speciality9',
    'Contact9'
);

-- Inserting record 10
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    10,
    2,
    'HPLName10',
    'Speciality10',
    'Contact10'
);

-- Inserting record 11
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    11,
    10,
    'HPLName11',
    'Speciality11',
    'Contact11'
);

-- Inserting record 12
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    12,
    3,
    'HPLName12',
    'Speciality12',
    'Contact12'
);

-- Inserting record 13
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    13,
    3,
    'HPLName13',
    'Speciality13',
    'Contact13'
);

-- Inserting record 14
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    14,
    3,
    'HPLName14',
    'Speciality14',
    'Contact14'
);

-- Inserting record 15
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    15,
    6,
    'HPLName15',
    'Speciality15',
    'Contact15'
);

-- Inserting record 16
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    16,
    4,
    'HPLName16',
    'Speciality16',
    'Contact16'
);

-- Inserting record 17
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    17,
    4,
    'HPLName17',
    'Speciality17',
    'Contact17'
);

-- Inserting record 18
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    18,
    4,
    'HPLName18',
    'Speciality18',
    'Contact18'
);

-- Inserting record 19
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    19,
    4,
    'HPLName19',
    'Speciality19',
    'Contact19'
);

-- Inserting record 20
INSERT INTO healthcareprovider (
    providerid,
    administrationid,
    hplname,
    speciality,
    healthcarecontact
) VALUES (
    20,
    5,
    'HPLName20',
    'Speciality20',
    'Contact20'
);

----doctor------
-- Inserting record 1
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    1,
    1,
    'John',
    'Doe',
    'john.doe@example.com',
    'Contact1'
);

-- Inserting record 2
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    2,
    1,
    'Jane',
    'Smith',
    'jane.smith@example.com',
    'Contact2'
);

-- Inserting record 3
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    3,
    1,
    'Michael',
    'Johnson',
    'michael.johnson@example.com',
    'Contact3'
);

-- Inserting record 4
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    4,
    2,
    'Emily',
    'Williams',
    'emily.williams@example.com',
    'Contact4'
);

-- Inserting record 5
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    5,
    2,
    'Daniel',
    'Jones',
    'daniel.jones@example.com',
    'Contact5'
);

-- Inserting record 6
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    6,
    2,
    'Olivia',
    'Brown',
    'olivia.brown@example.com',
    'Contact6'
);

-- Inserting record 7
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    7,
    3,
    'Liam',
    'Miller',
    'liam.miller@example.com',
    'Contact7'
);

-- Inserting record 8
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    8,
    3,
    'Ava',
    'Davis',
    'ava.davis@example.com',
    'Contact8'
);

-- Inserting record 9
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    9,
    3,
    'Lucas',
    'Garcia',
    'lucas.garcia@example.com',
    'Contact9'
);

-- Inserting record 10
INSERT INTO doctor (
    doctorid,
    providerid,
    docfname,
    doclname,
    docemail,
    doccontact
) VALUES (
    10,
    4,
    'Sophia',
    'Rodriguez',
    'sophia.rodriguez@example.com',
    'Contact10'
);

---insurance provider----
-- Inserting record 1
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    1,
    1,
    'InsuranceProvider1',
    'Contact1'
);

-- Inserting record 2
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    2,
    1,
    'InsuranceProvider2',
    'Contact2'
);

-- Inserting record 3
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    3,
    1,
    'InsuranceProvider3',
    'Contact3'
);

-- Inserting record 4
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    4,
    2,
    'InsuranceProvider4',
    'Contact4'
);

-- Inserting record 5
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    5,
    2,
    'InsuranceProvider5',
    'Contact5'
);

-- Inserting record 6
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    6,
    2,
    'InsuranceProvider6',
    'Contact6'
);

-- Inserting record 7
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    7,
    3,
    'InsuranceProvider7',
    'Contact7'
);

-- Inserting record 8
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    8,
    3,
    'InsuranceProvider8',
    'Contact8'
);

-- Inserting record 9
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    9,
    3,
    'InsuranceProvider9',
    'Contact9'
);

-- Inserting record 10
INSERT INTO insuranceprovider (
    insuranceid,
    administrationid,
    insurancename,
    insurancecontact
) VALUES (
    10,
    4,
    'InsuranceProvider10',
    'Contact10'
);

------patient-----

-- Inserting record 1
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    1,
    1,
    1,
    'Alice',
    'Johnson',
    '1990-05-15',
    'F',
    'Contact1',
    'Address1'
);

-- Inserting record 2
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    2,
    1,
    2,
    'Bob',
    'Smith',
    '1985-08-20',
    'M',
    'Contact2',
    'Address2'
);

-- Inserting record 3
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    3,
    1,
    3,
    'Catherine',
    'Davis',
    '1992-03-10',
    'F',
    'Contact3',
    'Address3'
);

-- Inserting record 4
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    4,
    2,
    1,
    'David',
    'Wilson',
    '1988-12-05',
    'M',
    'Contact4',
    'Address4'
);

-- Inserting record 5
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    5,
    2,
    2,
    'Emma',
    'Jones',
    '1995-01-25',
    'F',
    'Contact5',
    'Address5'
);

-- Inserting record 6
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    6,
    2,
    3,
    'Frank',
    'Brown',
    '1980-07-18',
    'M',
    'Contact6',
    'Address6'
);

-- Inserting record 7
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    7,
    3,
    1,
    'Grace',
    'Miller',
    '1998-09-30',
    'F',
    'Contact7',
    'Address7'
);

-- Inserting record 8
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    8,
    3,
    2,
    'Henry',
    'Garcia',
    '1987-06-12',
    'M',
    'Contact8',
    'Address8'
);

-- Inserting record 9
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    9,
    3,
    3,
    'Isabella',
    'Taylor',
    '1994-11-08',
    'F',
    'Contact9',
    'Address9'
);

-- Inserting record 10
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    10,
    4,
    1,
    'Jack',
    'Rodriguez',
    '1983-04-03',
    'M',
    'Contact10',
    'Address10'
);

-- Inserting record 11
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    11,
    4,
    2,
    'Katherine',
    'Lopez',
    '1991-02-14',
    'F',
    'Contact11',
    'Address11'
);

-- Inserting record 12
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    12,
    4,
    3,
    'Liam',
    'Martinez',
    '1989-07-22',
    'M',
    'Contact12',
    'Address12'
);

-- Inserting record 13
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    13,
    5,
    1,
    'Mia',
    'Hernandez',
    '1996-10-05',
    'F',
    'Contact13',
    'Address13'
);

-- Inserting record 14
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    14,
    5,
    2,
    'Noah',
    'Flores',
    '1986-08-29',
    'M',
    'Contact14',
    'Address14'
);

-- Inserting record 15
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    15,
    5,
    3,
    'Olivia',
    'Perez',
    '1993-12-17',
    'F',
    'Contact15',
    'Address15'
);

-- Inserting record 16
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    16,
    6,
    1,
    'Patrick',
    'Sanchez',
    '1984-06-08',
    'M',
    'Contact16',
    'Address16'
);

-- Inserting record 17
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    17,
    6,
    2,
    'Quinn',
    'Rivera',
    '1997-03-01',
    'F',
    'Contact17',
    'Address17'
);

-- Inserting record 18
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    18,
    6,
    3,
    'Ryan',
    'Torres',
    '1982-09-14',
    'M',
    'Contact18',
    'Address18'
);

-- Inserting record 19
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    19,
    7,
    1,
    'Sophia',
    'Gomez',
    '1999-04-27',
    'F',
    'Contact19',
    'Address19'
);

-- Inserting record 20
INSERT INTO patient (
    patientid,
    doctorid,
    insuranceid,
    patientfname,
    patientlname,
    patientdob,
    pgender,
    pcontact,
    paddress
) VALUES (
    20,
    7,
    2,
    'Tyler',
    'Diaz',
    '1981-11-10',
    'M',
    'Contact20',
    'Address20'
);

------integrated department---
-- Inserting record 1
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    1,
    1,
    'Contact1'
);

-- Inserting record 2
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    2,
    1,
    'Contact2'
);

-- Inserting record 3
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    3,
    1,
    'Contact3'
);

-- Inserting record 4
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    4,
    2,
    'Contact4'
);

-- Inserting record 5
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    5,
    2,
    'Contact5'
);

-- Inserting record 6
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    6,
    2,
    'Contact6'
);

-- Inserting record 7
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    7,
    3,
    'Contact7'
);

-- Inserting record 8
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    8,
    3,
    'Contact8'
);

-- Inserting record 9
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    9,
    3,
    'Contact9'
);

-- Inserting record 10
INSERT INTO integratedcaredepartment (
    icdepartmentid,
    providerid,
    departmentcontact
) VALUES (
    10,
    4,
    'Contact10'
);

------department----
-- Inserting record 1
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    1,
    1,
    'Department1',
    'Contact1'
);

-- Inserting record 2
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    2,
    1,
    'Department2',
    'Contact2'
);

-- Inserting record 3
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    3,
    1,
    'Department3',
    'Contact3'
);

-- Inserting record 4
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    4,
    2,
    'Department4',
    'Contact4'
);

-- Inserting record 5
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    5,
    2,
    'Department5',
    'Contact5'
);

-- Inserting record 6
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    6,
    2,
    'Department6',
    'Contact6'
);

-- Inserting record 7
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    7,
    3,
    'Department7',
    'Contact7'
);

-- Inserting record 8
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    8,
    3,
    'Department8',
    'Contact8'
);

-- Inserting record 9
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    9,
    3,
    'Department9',
    'Contact9'
);

-- Inserting record 10
INSERT INTO department (
    departmentid,
    icdepartmentid,
    departmentname,
    departmentcontact
) VALUES (
    10,
    4,
    'Department10',
    'Contact10'
);

---------laboratory------
-- Inserting record 1
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    1,
    1,
    1,
    'LabContact1',
    'LabName1'
);

-- Inserting record 2
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    2,
    1,
    2,
    'LabContact2',
    'LabName2'
);

-- Inserting record 3
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    3,
    1,
    3,
    'LabContact3',
    'LabName3'
);

-- Inserting record 4
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    4,
    2,
    1,
    'LabContact4',
    'LabName4'
);

-- Inserting record 5
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    5,
    2,
    2,
    'LabContact5',
    'LabName5'
);

-- Inserting record 6
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    6,
    2,
    3,
    'LabContact6',
    'LabName6'
);

-- Inserting record 7
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    7,
    3,
    1,
    'LabContact7',
    'LabName7'
);

-- Inserting record 8
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    8,
    3,
    2,
    'LabContact8',
    'LabName8'
);

-- Inserting record 9
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    9,
    3,
    3,
    'LabContact9',
    'LabName9'
);

-- Inserting record 10
INSERT INTO laboratory (
    labid,
    departmentid,
    equipmentid,
    laboratoriescontact,
    labname
) VALUES (
    10,
    4,
    1,
    'LabContact10',
    'LabName10'
);

-------appointment----
-- Inserting record 1
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    1,
    1,
    1,
    TO_DATE('2023-01-15 10:00', 'YYYY-MM-DD HH24:MI'),
    'Checkup'
);

-- Inserting record 2
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    2,
    2,
    1,
    TO_DATE('2023-02-20 14:30', 'YYYY-MM-DD HH24:MI'),
    'Follow-up'
);

-- Inserting record 3
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    3,
    3,
    2,
    TO_DATE('2023-03-10 11:45', 'YYYY-MM-DD HH24:MI'),
    'Consultation'
);

-- Inserting record 4
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    4,
    4,
    2,
    TO_DATE('2023-04-05 09:15', 'YYYY-MM-DD HH24:MI'),
    'Checkup'
);

-- Inserting record 5
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    5,
    5,
    3,
    TO_DATE('2023-05-25 13:00', 'YYYY-MM-DD HH24:MI'),
    'Follow-up'
);

-- Inserting record 6
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    6,
    6,
    3,
    TO_DATE('2023-06-18 15:30', 'YYYY-MM-DD HH24:MI'),
    'Consultation'
);

-- Inserting record 7
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    7,
    7,
    4,
    TO_DATE('2023-07-30 10:45', 'YYYY-MM-DD HH24:MI'),
    'Checkup'
);

-- Inserting record 8
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    8,
    8,
    4,
    TO_DATE('2023-08-15 14:00', 'YYYY-MM-DD HH24:MI'),
    'Follow-up'
);

-- Inserting record 9
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    9,
    9,
    5,
    TO_DATE('2023-09-05 12:30', 'YYYY-MM-DD HH24:MI'),
    'Consultation'
);

-- Inserting record 10
INSERT INTO appointment (
    appointmentid,
    patientid,
    providerid,
    appdateandtime,
    apptpurpose
) VALUES (
    10,
    10,
    5,
    TO_DATE('2023-10-20 09:00', 'YYYY-MM-DD HH24:MI'),
    'Checkup'
);

-----prescription----
-- Inserting record 1
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    1,
    1,
    1,
    '10mg once a day',
    TO_DATE('2023-01-15', 'YYYY-MM-DD')
);

-- Inserting record 2
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    2,
    1,
    2,
    '20mg twice a day',
    TO_DATE('2023-02-20', 'YYYY-MM-DD')
);

-- Inserting record 3
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    3,
    3,
    3,
    '5mg three times a day',
    TO_DATE('2023-03-10', 'YYYY-MM-DD')
);

-- Inserting record 4
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    4,
    4,
    3,
    '15mg once a day',
    TO_DATE('2023-04-05', 'YYYY-MM-DD')
);

-- Inserting record 5
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    5,
    5,
    5,
    '25mg twice a day',
    TO_DATE('2023-05-25', 'YYYY-MM-DD')
);

-- Inserting record 6
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    6,
    6,
    6,
    '10mg three times a day',
    TO_DATE('2023-06-18', 'YYYY-MM-DD')
);

-- Inserting record 7
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    7,
    7,
    7,
    '30mg once a day',
    TO_DATE('2023-07-30', 'YYYY-MM-DD')
);

-- Inserting record 8
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    8,
    8,
    8,
    '15mg twice a day',
    TO_DATE('2023-08-15', 'YYYY-MM-DD')
);

-- Inserting record 9
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    9,
    9,
    9,
    '20mg three times a day',
    TO_DATE('2023-09-05', 'YYYY-MM-DD')
);

-- Inserting record 10
INSERT INTO prescription (
    prescriptionid,
    patientid,
    doctorid,
    dosage,
    dateprescribed
) VALUES (
    10,
    10,
    10,
    '10mg once a day',
    TO_DATE('2023-10-20', 'YYYY-MM-DD')
);

---dischare summary---
-- Inserting record 1
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    1,
    5,
    TO_DATE('2023-01-15', 'YYYY-MM-DD'),
    'Patient was discharged after successful treatment.'
);

-- Inserting record 2
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    2,
    2,
    TO_DATE('2023-02-20', 'YYYY-MM-DD'),
    'Patient recovered well and was discharged.'
);

-- Inserting record 3
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    3,
    3,
    TO_DATE('2023-03-10', 'YYYY-MM-DD'),
    'Discharge summary for patient.'
);

-- Inserting record 4
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    4,
    9,
    TO_DATE('2023-04-05', 'YYYY-MM-DD'),
    'Patient discharged with post-operative care instructions.'
);

-- Inserting record 8
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    8,
    8,
    TO_DATE('2023-08-15', 'YYYY-MM-DD'),
    'Patient released from the hospital.'
);

-- Inserting record 9
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    9,
    9,
    TO_DATE('2023-09-05', 'YYYY-MM-DD'),
    'Detailed discharge summary for the patient.'
);

-- Inserting record 10
INSERT INTO dischargesummary (
    dischargeid,
    patientid,
    dateofdischarge,
    summary
) VALUES (
    10,
    3,
    TO_DATE('2023-10-20', 'YYYY-MM-DD'),
    'Patient successfully discharged after treatment.'
);

-----medicalrecord----
-- Inserting record 1
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    1,
    1,
    'Common cold',
    TO_DATE('2023-01-15', 'YYYY-MM-DD'),
    'Prescribed rest and fluids.'
);

-- Inserting record 2
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    2,
    2,
    'Fractured arm',
    TO_DATE('2023-02-20', 'YYYY-MM-DD'),
    'Applied cast and prescribed pain medication.'
);

-- Inserting record 3
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    3,
    3,
    'Allergies',
    TO_DATE('2023-03-10', 'YYYY-MM-DD'),
    'Prescribed antihistamines.'
);

-- Inserting record 4
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    4,
    4,
    'Appendicitis',
    TO_DATE('2023-04-05', 'YYYY-MM-DD'),
    'Performed appendectomy.'
);

-- Inserting record 5
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    5,
    5,
    'High blood pressure',
    TO_DATE('2023-05-25', 'YYYY-MM-DD'),
    'Prescribed medication and advised lifestyle changes.'
);

-- Inserting record 6
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    6,
    6,
    'Diabetes',
    TO_DATE('2023-06-18', 'YYYY-MM-DD'),
    'Started insulin therapy and dietary recommendations.'
);

-- Inserting record 7
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    7,
    7,
    'Influenza',
    TO_DATE('2023-07-30', 'YYYY-MM-DD'),
    'Prescribed antiviral medication and bed rest.'
);

-- Inserting record 8
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    8,
    8,
    'Sprained ankle',
    TO_DATE('2023-08-15', 'YYYY-MM-DD'),
    'Applied ice pack and recommended rest.'
);

-- Inserting record 9
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    9,
    9,
    'Migraine',
    TO_DATE('2023-09-05', 'YYYY-MM-DD'),
    'Prescribed pain relievers and advised stress management.'
);

-- Inserting record 10
INSERT INTO medicalrecord (
    recordid,
    patientid,
    diagnosis,
    dateofvisit,
    notes
) VALUES (
    10,
    10,
    'Gastritis',
    TO_DATE('2023-10-20', 'YYYY-MM-DD'),
    'Prescribed antacids and dietary modifications.'
);

------surgery----
-- Inserting record 1
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    1,
    1,
    1,
    'Appendectomy',
    TO_DATE('2023-01-15', 'YYYY-MM-DD')
);

-- Inserting record 2
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    2,
    2,
    2,
    'Fracture Repair',
    TO_DATE('2023-02-20', 'YYYY-MM-DD')
);

-- Inserting record 3
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    3,
    3,
    3,
    'Allergy Testing',
    TO_DATE('2023-03-10', 'YYYY-MM-DD')
);

-- Inserting record 4
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    4,
    4,
    4,
    'Appendectomy',
    TO_DATE('2023-04-05', 'YYYY-MM-DD')
);

-- Inserting record 5
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    5,
    5,
    5,
    'Cardiac Bypass',
    TO_DATE('2023-05-25', 'YYYY-MM-DD')
);

-- Inserting record 6
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    6,
    6,
    6,
    'Knee Replacement',
    TO_DATE('2023-06-18', 'YYYY-MM-DD')
);

-- Inserting record 7
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    7,
    7,
    7,
    'Appendectomy',
    TO_DATE('2023-07-30', 'YYYY-MM-DD')
);

-- Inserting record 8
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    8,
    8,
    8,
    'Appendectomy',
    TO_DATE('2023-08-15', 'YYYY-MM-DD')
);

-- Inserting record 9
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    9,
    9,
    9,
    'Spinal Fusion',
    TO_DATE('2023-09-05', 'YYYY-MM-DD')
);

-- Inserting record 10
INSERT INTO surgery (
    surgeryid,
    patientid,
    doctorid,
    surgerytype,
    surgerydate
) VALUES (
    10,
    10,
    10,
    'Appendectomy',
    TO_DATE('2023-10-20', 'YYYY-MM-DD')
);

-----billing----
-- Inserting record 1
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    1,
    1,
    1,
    500.00,
    TO_DATE('2023-01-15', 'YYYY-MM-DD')
);

-- Inserting record 2
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    2,
    2,
    2,
    750.00,
    TO_DATE('2023-02-20', 'YYYY-MM-DD')
);

-- Inserting record 3
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    3,
    3,
    3,
    300.00,
    TO_DATE('2023-03-10', 'YYYY-MM-DD')
);

-- Inserting record 4
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    4,
    4,
    4,
    1200.00,
    TO_DATE('2023-04-05', 'YYYY-MM-DD')
);

-- Inserting record 5
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    5,
    5,
    5,
    1000.00,
    TO_DATE('2023-05-25', 'YYYY-MM-DD')
);

-- Inserting record 6
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    6,
    6,
    6,
    450.00,
    TO_DATE('2023-06-18', 'YYYY-MM-DD')
);

-- Inserting record 7
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    7,
    7,
    7,
    600.00,
    TO_DATE('2023-07-30', 'YYYY-MM-DD')
);

-- Inserting record 8
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    8,
    8,
    8,
    800.00,
    TO_DATE('2023-08-15', 'YYYY-MM-DD')
);

-- Inserting record 9
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    9,
    9,
    9,
    900.00,
    TO_DATE('2023-09-05', 'YYYY-MM-DD')
);

-- Inserting record 10
INSERT INTO billing (
    billid,
    patientid,
    providerid,
    billamount,
    billdateissued
) VALUES (
    10,
    10,
    10,
    350.00,
    TO_DATE('2023-10-20', 'YYYY-MM-DD')
);

---allergy-----
-- Inserting record 1
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    1,
    1,
    'Pollen',
    'Sneezing and itchy eyes.'
);

-- Inserting record 2
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    2,
    2,
    'Peanuts',
    'Swelling and difficulty breathing.'
);

-- Inserting record 3
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    3,
    3,
    'Penicillin',
    'Rash and itching.'
);

-- Inserting record 4
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    4,
    4,
    'Dust Mites',
    'Coughing and shortness of breath.'
);

-- Inserting record 5
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    5,
    3,
    'Shellfish',
    'Nausea and hives.'
);

-- Inserting record 6
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    6,
    6,
    'Mold',
    'Headache and fatigue.'
);

-- Inserting record 7
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    7,
    7,
    'Eggs',
    'Abdominal pain and vomiting.'
);

-- Inserting record 8
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    8,
    9,
    'Latex',
    'Skin rash and itching.'
);

-- Inserting record 9
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    9,
    9,
    'Insect Bites',
    'Swelling and redness.'
);

-- Inserting record 10
INSERT INTO allergy (
    allergyid,
    patientid,
    allergen,
    reaction
) VALUES (
    10,
    5,
    'Milk',
    'Diarrhea and stomach cramps.'
);

-----indexing----
-- Indexing for Medication table
CREATE INDEX idx_Medication_MedicationID ON Medication(MedicationID);
--CREATE INDEX idx_Medication_MedicationName ON Medication(MedicationName);

-- Indexing for Administration table
CREATE INDEX idx_Administration_AdministrationID ON Administration(AdministrationID);
--CREATE INDEX idx_Administration_AdminName ON Administration(AdminName);

-- Indexing for Medicalequipment table
CREATE INDEX idx_Medicalequipment_EquipmentID ON Medicalequipment(EquipmentID);
--CREATE INDEX idx_Medicalequipment_EquipmentName ON Medicalequipment(EquipmentName);

-- Indexing for Healthcareprovider table
CREATE INDEX idx_Healthcareprovider_ProviderID ON Healthcareprovider(ProviderID);
--CREATE INDEX idx_Healthcareprovider_HPLName ON Healthcareprovider(HPLName);

-- Indexing for Doctor table
CREATE INDEX idx_Doctor_DoctorID ON Doctor(DoctorID);
--CREATE INDEX idx_Doctor_DocFName ON Doctor(DocFName);

-- Indexing for Patient table
CREATE INDEX idx_Patient_PatientID ON Patient(PatientID);
--CREATE INDEX idx_Patient_PatientFName ON Patient(PatientFName);

-- Indexing for Insuranceprovider table
CREATE INDEX idx_Insuranceprovider_InsuranceID ON Insuranceprovider(InsuranceID);
--CREATE INDEX idx_Insuranceprovider_InsuranceName ON Insuranceprovider(InsuranceName);

-- Indexing for Integratedcaredepartment table
CREATE INDEX idx_Integratedcaredepartment_ICDepartmentID ON Integratedcaredepartment(ICDepartmentID);
--CREATE INDEX idx_Integratedcaredepartment_DepartmentName ON Integratedcaredepartment(DepartmentName);

-- Indexing for Department table
CREATE INDEX idx_Department_DepartmentID ON Department(DepartmentID);
--CREATE INDEX idx_Department_DepartmentName ON Department(DepartmentName);

-- Indexing for Laboratory table
CREATE INDEX idx_Laboratory_LabID ON Laboratory(LabID);
--CREATE INDEX idx_Laboratory_LabName ON Laboratory(LabName);

-- Indexing for Appointment table
CREATE INDEX idx_Appointment_AppointmentID ON Appointment(AppointmentID);

-- Indexing for Prescription table
CREATE INDEX idx_Prescription_PrescriptionID ON Prescription(PrescriptionID);

-- Indexing for Dischargesummary table
CREATE INDEX idx_Dischargesummary_DischargeID ON Dischargesummary(DischargeID);

-- Indexing for MedicalRecord table
CREATE INDEX idx_MedicalRecord_RecordID ON MedicalRecord(RecordID);

-- Indexing for Surgery table
CREATE INDEX idx_Surgery_SurgeryID ON Surgery(SurgeryID);

-- Indexing for Billing table
CREATE INDEX idx_Billing_BillID ON Billing(BillID);

-- Indexing for Allergy table
CREATE INDEX idx_Allergy_AllergyID ON Allergy(AllergyID);

-----access control----

-- Creating roles
CREATE ROLE healthcare_provider_role;
CREATE ROLE doctor_role;
CREATE ROLE patient_role;
CREATE ROLE insurance_provider_role;
CREATE ROLE admin_role;

-- Granting access to roles for Medication table
GRANT SELECT ON Medication TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Medication TO admin_role;

-- Granting access to roles for Administration table
GRANT SELECT, INSERT, UPDATE, DELETE ON Administration TO admin_role;

-- Granting access to roles for Medicalequipment table
GRANT SELECT ON Medicalequipment TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Medicalequipment TO admin_role;

-- Granting access to roles for Healthcareprovider table
GRANT SELECT ON Healthcareprovider TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Healthcareprovider TO admin_role;

-- Granting access to roles for Doctor table
GRANT SELECT ON Doctor TO doctor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Doctor TO admin_role;

-- Granting access to roles for Patient table
GRANT SELECT ON Patient TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Patient TO admin_role;

-- Granting access to roles for Insuranceprovider table
GRANT SELECT ON Insuranceprovider TO insurance_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Insuranceprovider TO admin_role;

-- Granting access to roles for Integratedcaredepartment table
GRANT SELECT ON Integratedcaredepartment TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Integratedcaredepartment TO admin_role;

-- Granting access to roles for Department table
GRANT SELECT ON Department TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Department TO admin_role;

-- Granting access to roles for Laboratory table
GRANT SELECT ON Laboratory TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Laboratory TO admin_role;

-- Granting access to roles for Appointment table
GRANT SELECT, INSERT, UPDATE, DELETE ON Appointment TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Appointment TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Appointment TO admin_role;

-- Granting access to roles for Prescription table
GRANT SELECT, INSERT, UPDATE, DELETE ON Prescription TO doctor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Prescription TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Prescription TO admin_role;

-- Granting access to roles for Dischargesummary table
GRANT SELECT, INSERT, UPDATE, DELETE ON Dischargesummary TO doctor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dischargesummary TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Dischargesummary TO admin_role;

-- Granting access to roles for MedicalRecord table
GRANT SELECT, INSERT, UPDATE, DELETE ON MedicalRecord TO doctor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON MedicalRecord TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON MedicalRecord TO admin_role;

-- Granting access to roles for Surgery table
GRANT SELECT, INSERT, UPDATE, DELETE ON Surgery TO doctor_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Surgery TO admin_role;

-- Granting access to roles for Billing table
GRANT SELECT, INSERT, UPDATE, DELETE ON Billing TO healthcare_provider_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Billing TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Billing TO admin_role;

-- Granting access to roles for Allergy table
GRANT SELECT, INSERT, UPDATE, DELETE ON Allergy TO patient_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON Allergy TO admin_role;

------END-----