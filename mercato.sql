--------------------------------------------------------------
--        Script MySQL - SAE BD
--    BEN IBRAHIM Anass
--    REZZOUK Mohamed
--    BOSSE Enzo
--    TD C
--------------------------------------------------------------
DROP SCHEMA IF EXISTS mercato CASCADE;
CREATE SCHEMA mercato;

--------------------------------------------------------------
-- Table: agent
--------------------------------------------------------------

CREATE TABLE mercato.agent(
        idAgent   INT NOT NULL,
        prenom    VARCHAR(50) NOT NULL,
        nom       VARCHAR(50) NOT NULL,
        nomAgence VARCHAR(255),
        CONSTRAINT agent_PK PRIMARY KEY (idAgent)
);


--------------------------------------------------------------
-- Table: joueur
--------------------------------------------------------------

CREATE TABLE mercato.joueur(
        idJoueur      INT NOT NULL ,
        prenom        VARCHAR(50) NOT NULL ,
        nom           VARCHAR(50) NOT NULL ,
        dateNaissance DATE NOT NULL ,
        valeurMarchande FLOAT,
        nationalite   VARCHAR(50) NOT NULL ,
        idAgent       INT,
        CONSTRAINT joueur_PK PRIMARY KEY (idJoueur),
        CONSTRAINT joueur_agent_FK FOREIGN KEY (idAgent) REFERENCES agent(idAgent)
);


--------------------------------------------------------------
-- Table: ligue
--------------------------------------------------------------

CREATE TABLE mercato.ligue(
        idLigue    INT NOT NULL ,
        nom        VARCHAR(50) NOT NULL ,
        pays       VARCHAR(50) NOT NULL ,
        villeSiege VARCHAR(50) NOT NULL,
        CONSTRAINT ligue_PK PRIMARY KEY (idLigue)
);


--------------------------------------------------------------
-- Table: club
--------------------------------------------------------------

CREATE TABLE mercato.club(
        idClub              INT NOT NULL ,
        nom                 VARCHAR(50) NOT NULL ,
        ville               VARCHAR(50) NOT NULL ,
        nomPresident        VARCHAR(50) NOT NULL ,
        nomEntraineurActuel VARCHAR(50),
        idLigue             INT NOT NULL,
        CONSTRAINT club_PK PRIMARY KEY (idClub),
        CONSTRAINT club_ligue_FK FOREIGN KEY (idLigue) REFERENCES ligue(idLigue)
);


--------------------------------------------------------------
-- Table: transfert
--------------------------------------------------------------

CREATE TABLE mercato.transfert(
        idJoueur             INT NOT NULL ,
        idClubVendeur        INT NOT NULL ,
        idClubAcheteur       INT NOT NULL ,
        dateTransfert        Date NOT NULL ,
        montantTransfert     FLOAT NOT NULL,
        CONSTRAINT transfert_PK PRIMARY KEY (idJoueur,idClubVendeur,idClubAcheteur, dateTransfert),
        CONSTRAINT transfert_joueur_FK FOREIGN KEY (idJoueur) REFERENCES joueur(idJoueur),
        CONSTRAINT transfert_club0_FK FOREIGN KEY (idClubVendeur) REFERENCES club(idClub),
        CONSTRAINT transfert_club1_FK FOREIGN KEY (idClubAcheteur) REFERENCES club(idClub)
);

