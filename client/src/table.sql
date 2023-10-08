CREATE TABLE business
(
  ID VARCHAR(50) NOT NULL,
  Name VARCHAR(100) NOT NULL,
  Industry VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE freelancer
(
  ID VARCHAR(50) NOT NULL,
  Username VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  PhoneNo INT NOT NULL,
  Password VARCHAR(100) NOT NULL,
  Location VARCHAR(100),
  FirstName VARCHAR(100) NOT NULL,
  LastName VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Username),
  UNIQUE (Email),
  UNIQUE (PhoneNo)
);

CREATE TABLE project
(
  ID VARCHAR(50) NOT NULL,
  completionStatus VARCHAR(100) NOT NULL,
  payStatus VARCHAR(100) NOT NULL,
  startDate DATE NOT NULL,
  deadline DATE NOT NULL,
  projectOwner VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (projectOwner) REFERENCES business(ID)
);

CREATE TABLE skills
(
  ID VARCHAR(50) NOT NULL,
  skillName VARCHAR(100) NOT NULL,
  proficiency VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE worked_on
(
  FID VARCHAR(50) NOT NULL,
  PID VARCHAR(50) NOT NULL,
  PRIMARY KEY (FID, PID),
  FOREIGN KEY (FID) REFERENCES freelancer(ID),
  FOREIGN KEY (PID) REFERENCES project(ID)
);

CREATE TABLE has_skill
(
  SID VARCHAR(50) NOT NULL,
  FID VARCHAR(50) NOT NULL,
  PRIMARY KEY (SID, FID),
  FOREIGN KEY (SID) REFERENCES skills(ID),
  FOREIGN KEY (FID) REFERENCES freelancer(ID)
);

CREATE TABLE job_post
(
  Duration INT NOT NULL,
  WorkingHours INT NOT NULL,
  Salary INT NOT NULL,
  Description VARCHAR(5000),
  JobName VARCHAR NOT NULL,
  ID VARCHAR(1000) NOT NULL,
  DatePosted DATE NOT NULL,
  Industry VARCHAR NOT NULL,
  JobPostOwner VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (JobPostOwner) REFERENCES business(ID)
);

CREATE TABLE hiring_manager
(
  ID VARCHAR(1000) NOT NULL,
  UserName VARCHAR(1000) NOT NULL,
  Password VARCHAR NOT NULL,
  First_Name VARCHAR NOT NULL,
  Last_Name VARCHAR NOT NULL,
  worksFor VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (worksFor) REFERENCES business(ID),
  UNIQUE (UserName)
);

CREATE TABLE application
(
  YearsOfExperience INT NOT NULL,
  CVURL NODATATYPE NOT NULL,
  Additional_information VARCHAR NOT NULL,
  Date_of_application DATE NOT NULL,
  FID VARCHAR(50) NOT NULL,
  JID VARCHAR(1000) NOT NULL,
  PRIMARY KEY (FID, JID),
  FOREIGN KEY (FID) REFERENCES freelancer(ID),
  FOREIGN KEY (JID) REFERENCES job_post(ID)
);

CREATE TABLE offer
(
  ClientStatus VARCHAR(100) NOT NULL,
  FreelancerStatus VARCHAR(100) NOT NULL,
  Salary INT NOT NULL,
  FID VARCHAR(50) NOT NULL,
  HID VARCHAR(1000) NOT NULL,
  PRIMARY KEY (FID, HID),
  FOREIGN KEY (FID) REFERENCES freelancer(ID),
  FOREIGN KEY (HID) REFERENCES hiring_manager(ID)
);

CREATE TABLE requires
(
  SID VARCHAR(50) NOT NULL,
  JID VARCHAR(1000) NOT NULL,
  PRIMARY KEY (SID, JID),
  FOREIGN KEY (SID) REFERENCES skills(ID),
  FOREIGN KEY (JID) REFERENCES job_post(ID)
);

CREATE TABLE hire
(
  HID VARCHAR(1000) NOT NULL,
  JID VARCHAR(1000) NOT NULL,
  PRIMARY KEY (HID, JID),
  FOREIGN KEY (HID) REFERENCES hiring_manager(ID),
  FOREIGN KEY (JID) REFERENCES job_post(ID)
);

CREATE TABLE job_post_locations
(
  JLocation VARCHAR(100) NOT NULL,
  JID VARCHAR(1000) NOT NULL,
  PRIMARY KEY (JLocation, JID),
  FOREIGN KEY (JID) REFERENCES job_post(ID)
);