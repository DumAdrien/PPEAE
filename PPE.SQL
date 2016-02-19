DROP DATABASE AUTOECOLE;
CREATE DATABASE AUTOECOLE;
USE AUTOECOLE;

CREATE TABLE MOIS
(Annee char(32) NOT NULL,
Num_Mois char(32) NOT NULL,
PRIMARY KEY (Annee, Num_Mois)
);

CREATE TABLE MODELE
(ID_Modele char(5) NOT NULL,
NOM_Modele varchar(20) NOT NULL, 
CYL_Modele integer(2) NOT NULL,
PUISS_Modele integer(2) NOT NULL,
PRIMARY KEY (ID_Modele)
);

CREATE TABLE CONCESSION
(ID_Con char(5) NOT NULL,
NOM_Con varchar(32) NOT NULL, 
ADR_Con varchar(32) NOT NULL,
TEL_Con char(10) NOT NULL, 
PRIMARY KEY (ID_Con)
);

CREATE TABLE VOITURE
(ID_Voiture char(5) NOT NULL,
ID_Modele char(5) NOT NULL, 
IMMAT_Voiture varchar(7) NOT NULL, 
ACHAT_Voiture date NOT NULL, 
KM_Voiture integer (6) NOT NULL,
ID_Con char(5) NOT NULL, 
PRIMARY KEY (ID_Voiture),
FOREIGN KEY (ID_Modele) references MODELE(ID_Modele),
FOREIGN KEY (ID_Con) references CONCESSION(ID_Con)
);

CREATE TABLE MONITEUR 
(ID_Moniteur char(5) NOT NULL,
NOM_Moniteur varchar(30) NOT NULL,
DATE_Embauche date NOT NULL,
PRIMARY KEY (ID_Moniteur)
);

CREATE TABLE CLIENT 
(ID_CLient char(5) NOT NULL, 
ID_Moniteur char(5) NOT NULL,
ID_MODELE char(5) NOT NULL,
NOM_Client varchar(30),
PRENOM_Client varchar(30),
ADR_Client varchar(50),
DATE_Naiss date NOT NULL,
TEL_Client char(10) NULL,
PRIMARY KEY (ID_CLient),
FOREIGN KEY (ID_Moniteur) references MONITEUR(ID_Moniteur),
FOREIGN KEY (ID_Modele) references MODELE(ID_Modele)
);

CREATE TABLE LECON
(ID_Lecon char(5) NOT NULL, 
ID_VOITURE char(50) NOT NULL, 
ID_CLient char(5) NOT NULL, 
ID_Moniteur char(5) NOT NULL,
DATE_Lecon date NULL, 
HEURE_Lecon time NULL,
PRIMARY KEY (ID_Lecon),
FOREIGN KEY (ID_Voiture) references VOITURE(ID_Voiture),
FOREIGN KEY (ID_Client) references CLIENT(ID_Client),
FOREIGN KEY (ID_Moniteur) references MONITEUR(ID_Moniteur)
);

CREATE TABLE ROULER
(Annee char(32) NOT NULL, 
Num_Mois char(32) NOT NULL, 
ID_Voiture char(5) NOT NULL, 
KM_Parcouru_Mois char(32) NULL,
PRIMARY KEY (Annee, Num_Mois, ID_Voiture),
FOREIGN KEY (Annee, Num_Mois) references MOIS(Annee, Num_Mois),
FOREIGN KEY (ID_Voiture) references VOITURE(ID_Voiture)
);

v