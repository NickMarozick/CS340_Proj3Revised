CREATE TABLE Nation (
ID int NOT NULL AUTO_INCREMENT, 
NationName varchar(60) NOT NULL. 
PRIMARY KEY (NationID)
)ENGINE=InnoDB; 

CREATE TABLE Olympians (
ID int NOT NULL AUTO_INCREMENT,
OlympianName varchar(90) NOT NULL,
NationID int NOT NULL,
Gender char(1) NOT NULL, 
DOB date, 
Hometown varchar(255) NOT NULL,
PRIMARY KEY (OlympianID),
FOREIGN KEY (NationID) REFERENCES Nation(ID)
)ENGINE=InnoDB;

CREATE TABLE TeamEvents (
ID int NOT NULL AUTO_INCREMENT, 
EventName varchar(255) NOT NULL,
PRIMARY KEY (ID)
)ENGINE=InnoDB; 

CREATE TABLE IndividualEvents (
ID int NOT NULL AUTO_INCREMENT, 
EventName varchar(255) NOT NULL,
PRIMARY KEY (ID)
)ENGINE=InnoDB; 

CREATE TABLE NationTeam (
ID int NOT NULL AUTO_INCREMENT,
NationTeamName varchar(255) NOT NULL,
NationID int NOT NULL,
EventID int NOT NULL
PRIMARY KEY (NationTeamID),
FOREIGN KEY (NationID) REFERENCES Nation(ID), 
FOREIGN KEY (EventID) REFERENCES TeamEvents(ID)
)ENGINE=InnoDB;

CREATE TABLE Medals (
ID int NOT NULL AUTO_INCREMENT, 
Type char(1) NOT NULL. 
PRIMARY KEY (ID)
)ENGINE=InnoDB; 

CREATE TABLE IndividualPodium (
ID int NOT NULL AUTO_INCREMENT, 
IndividualEventID int NOT NULL, 
OlympianID int NOT NULL,
MedalID int NOT NULL, 
PRIMARY KEY (ID), 
FOREIGN KEY (IndividualEventID) REFERENCES IndividualEvents(ID), 
FOREIGN KEY (OlympianID) REFERENCES Olympians(ID), 
FOREIGN KEY (MedalID) REFERENCES Medals(ID)
)ENGINE=InnoDB;

CREATE TABLE TeamPodium (
ID int NOT NULL AUTO_INCREMENT, 
TeamEventID int NOT NULL, 
NationTeamID int NOT NULL,
MedalID int NOT NULL, 
PRIMARY KEY (ID), 
FOREIGN KEY (TeamEventID) REFERENCES TeamEvents(ID), 
FOREIGN KEY (NationTeamID) REFERENCES NationTeam(ID), 
FOREIGN KEY (MedalID) REFERENCES Medals(ID)
)ENGINE=InnoDB;

