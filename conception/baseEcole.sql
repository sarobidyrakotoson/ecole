
CREATE TABLE Eleve (
    id int   NOT NULL,
     nom  varchar(40)   NOT NULL,
     prenom  varchar(40)   NOT NULL,
     niveauid  int   NOT NULL,
    CONSTRAINT  pk_Eleve  PRIMARY KEY (
         id 
     )
);


CREATE TABLE  Niveau  (
     id  int   NOT NULL,
     nom  varchar(40)   NOT NULL,
     eco double precision,
    CONSTRAINT  pk_Niveau  PRIMARY KEY (
         id 
     )
);

CREATE TABLE  Ecolage  (
     eleveid  int   NOT NULL,
     montant  double precision  NOT NULL,
     mois  int   NOT NULL,
     annee  int   NOT NULL,
     date  date   NOT NULL,
     niveauid  int   NOT NULL,
     ecolage  double precision  NOT NULL
);


CREATE TABLE  Matiere  (
     id  int   NOT NULL,
     nom  varchar(40)   NOT NULL,
    CONSTRAINT  pk_Matiere  PRIMARY KEY (
         id 
     )
);

CREATE TABLE  Coefficient  (
     matiereid  int   NOT NULL,
     niveauid  int   NOT NULL,
     coef  int   NOT NULL
);


CREATE TABLE  TypeNote  (
     id  int   NOT NULL,
     nom  varchar(40)   NOT NULL,
    CONSTRAINT  pk_TypeNote  PRIMARY KEY (
         id 
     )
);


CREATE TABLE  TypeTrimestre  (
     id  int   NOT NULL,
     nom  varchar(40)   NOT NULL,
    CONSTRAINT  pk_TypeTrimestre  PRIMARY KEY (
         id 
     )
);

CREATE TABLE  Trimestre  (
     id  int   NOT NULL,
     typeid  int   NOT NULL,
     date_debut  date   NOT NULL,
     date_fin  date   NOT NULL,
     annee_scolaireid  int   NOT NULL,
    CONSTRAINT  pk_Trimestre  PRIMARY KEY (
         id 
     )
);


CREATE TABLE  Note  (
     id  int   NOT NULL,
     eleveid  int   NOT NULL,
     matiereid  int   NOT NULL,
     niveauid  int   NOT NULL,
     note  double precision NOT NULL,
     typenoteid  int   NOT NULL,
     trimestreid  int   NOT NULL,
     session  date   NOT NULL,
    CONSTRAINT  pk_Note  PRIMARY KEY (
         id 
     )
);


CREATE TABLE  Annee_scolaire  (
     id  int   NOT NULL,
     date_debut  date   NOT NULL,
     date_fin  date   NOT NULL,
    CONSTRAINT  pk_Annee_scolaire  PRIMARY KEY (
         id 
     )
);



ALTER TABLE  Eleve  ADD CONSTRAINT  fk_Eleve_niveauid  FOREIGN KEY( niveauid )
REFERENCES  Niveau  ( id );

ALTER TABLE  Coefficient  ADD CONSTRAINT  fk_Coefficient_matiereid  FOREIGN KEY( matiereid )
REFERENCES  Matiere  ( id );

ALTER TABLE  Coefficient  ADD CONSTRAINT  fk_Coefficient_niveauid  FOREIGN KEY( niveauid )
REFERENCES  Niveau  ( id );

ALTER TABLE  Trimestre  ADD CONSTRAINT  fk_Trimestre_typeid  FOREIGN KEY( typeid )
REFERENCES  TypeTrimestre  ( id );

ALTER TABLE  Trimestre  ADD CONSTRAINT  fk_Trimestre_annee_scolaireid  FOREIGN KEY( annee_scolaireid )
REFERENCES  Annee_scolaire  ( id );

ALTER TABLE  Ecolage  ADD CONSTRAINT  fk_Ecolage_eleveid  FOREIGN KEY( eleveid )
REFERENCES  Eleve  ( id );

ALTER TABLE  Ecolage  ADD CONSTRAINT  fk_Ecolage_niveauid  FOREIGN KEY( niveauid )
REFERENCES  Niveau  ( id );

ALTER TABLE  Note  ADD CONSTRAINT  fk_Note_eleveid  FOREIGN KEY( eleveid )
REFERENCES  Eleve  ( id );

ALTER TABLE  Note  ADD CONSTRAINT  fk_Note_matiereid  FOREIGN KEY( matiereid )
REFERENCES  Matiere  ( id );

ALTER TABLE  Note  ADD CONSTRAINT  fk_Note_typenoteid  FOREIGN KEY( typenoteid )
REFERENCES  TypeNote  ( id );

ALTER TABLE  Note  ADD CONSTRAINT  fk_Note_trimestreid  FOREIGN KEY( trimestreid )
REFERENCES  Trimestre  ( id );


CREATE TABLE  Salaire  (
     id  int   NOT NULL,
     profid  int   NOT NULL,
     mois  int   NOT NULL,
     annee  int   NOT NULL,
     montant  double precision  NOT NULL,
     datepaiement  date   NOT NULL,
     horaire  double precision  NOT NULL,
     salairehoraire  double precision  NOT NULL,
    CONSTRAINT  pk_Salaire  PRIMARY KEY (
         id 
     )
);

CREATE TABLE  Prof  (
     id  int   NOT NULL,
     nom  varchar(40)   NOT NULL,
     email  varchar(40)   NOT NULL,
     mdp  varchar(20)   NOT NULL,
    CONSTRAINT  pk_Prof  PRIMARY KEY (
         id 
     )
);

CREATE TABLE  Horaire  (
     id  int   NOT NULL,
     profid  int   NOT NULL,
     horaire  int   NOT NULL,
     salairehoraire  double precision  NOT NULL,
    CONSTRAINT  pk_Horaire  PRIMARY KEY (
         id 
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
CREATE TABLE  PointageProf  (
     idProf  int   NOT NULL,
     type  varchar(10)   NOT NULL,
     entree  date   NOT NULL,
     sortie  date   NOT NULL
);

ALTER TABLE  Salaire  ADD CONSTRAINT  fk_Salaire_profid  FOREIGN KEY( profid )
REFERENCES  Prof  ( id );

ALTER TABLE  Horaire  ADD CONSTRAINT  fk_Horaire_id  FOREIGN KEY( id )
REFERENCES  Prof  ( id );

ALTER TABLE  PointageProf  ADD CONSTRAINT  fk_PointageProf_idProf  FOREIGN KEY( idProf )
REFERENCES  Prof  ( id );
