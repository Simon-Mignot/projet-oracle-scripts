-- Supression Tables pour créer de nouvelles 
DROP TABLE DISPONIBILITE; 
DROP TABLE AVOIRDIFFERENTELANGUE; 
DROP TABLE ORDREDEMISSION; 
DROP TABLE PAIEMENT; 
DROP TABLE FACTURE; 
DROP TABLE DEVIS; 
DROP TABLE RESERVATION; 
DROP TABLE SERVICELANGUE; 
DROP TABLE SERVICE;
DROP TABLE TYPESERVICE; 
DROP TABLE TYPEDEVISE; 
DROP TABLE UTILISATEUR; 
DROP TABLE LANGUE; 

-- Ajout des différentes tables 
 
CREATE TABLE LANGUE ( 
    id_langue NUMBER(10) not null,
    libelle_langue VARCHAR2(20), 
    CONSTRAINT pk_langue PRIMARY KEY (id_langue)
); 
 
CREATE TABLE UTILISATEUR ( 
    id_utilisateur NUMBER(10) not null, 
    nom_utilisateur VARCHAR2(50), 
    prenom_utilisateur VARCHAR2(50), 
    mail_utilisateur VARCHAR2(50), 
    numeroTelephone_utilisateur VARCHAR2(20), 
    sexe_utilisateur VARCHAR2(20) CHECK(sexe_utilisateur IN ('Masculin', 'Féminin', 'Autre', 'Non Renseigné')), 
    dateNaissance_utilisateur DATE, 
    description_utilisateur VARCHAR2(250), 
    travail_utilisateur VARCHAR2(20), 
    pseudoLogin_utilisateur VARCHAR2(20), 
    mdpLogin_utilisateur VARCHAR2(100), 
    langueDefaut_utilisateur NUMBER(10), 
    adresse_utilisateur VARCHAR2(50), 
    ville_utilisateur VARCHAR2(50), 
    codePostal_utilisateur VARCHAR2(10), 
    pays_utilisateur VARCHAR2(30), 
    timeZone_utilisateur TIMESTAMP, 
    CONSTRAINT fk_utilisateur_langue foreign key (langueDefaut_utilisateur) references LANGUE (id_langue), 
    CONSTRAINT pk_utilisateur PRIMARY KEY (id_utilisateur) 
); 

CREATE TABLE DISPONIBILITE ( 
    id_disponibilite NUMBER(10) not null, 
    idUtilisateur_disponibilite NUMBER(10) not null, 
    jour_disponibilite VARCHAR2(20) CHECK(jour_disponibilite IN ('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche')), 
    heureDebut_disponibilite DATE, 
    heureFin_disponibilite DATE, 
    CONSTRAINT fk_disponibilite_utilisateur foreign key (idUtilisateur_disponibilite) references UTILISATEUR (id_utilisateur), 
    CONSTRAINT pk_disponibilite PRIMARY KEY (id_disponibilite) 
); 
 
CREATE TABLE TYPESERVICE ( 
    id_typeService NUMBER(10) not null, 
    libelle_typeService VARCHAR2(50), 
    CONSTRAINT pk_typeService PRIMARY KEY (id_typeService) 
); 
 
CREATE TABLE TYPEDEVISE ( 
    id_typeDevise NUMBER(10) not null, 
    libelle_typeDevise VARCHAR2(50), 
    CONSTRAINT pk_typeDevise PRIMARY KEY (id_typeDevise) 
); 
 
CREATE TABLE SERVICE ( 
    id_service NUMBER(10) not null, 
    idUtilisateur_service NUMBER(10) not null, 
    type_service NUMBER(10), 
    titre_service VARCHAR2(30), 
    description_service VARCHAR2(250), 
    prix_service NUMBER(10), 
    numeroTelephone_service VARCHAR2(20), 
    typeDevise_service NUMBER(10), 
    pays_service VARCHAR2(10), 
    CONSTRAINT fk_service_utilisateur foreign key (idUtilisateur_service) references UTILISATEUR (id_utilisateur), 
    CONSTRAINT fk_service_typeService foreign key (type_service) references TYPESERVICE (id_typeService), 
    CONSTRAINT fk_service_typeDevise foreign key (typeDevise_service) references TYPEDEVISE (id_typeDevise), 
    CONSTRAINT pk_service PRIMARY KEY (id_service) 
); 

CREATE TABLE SERVICELANGUE ( 
    id_serviceLangue NUMBER(10) not null, 
    langueUtilisateur_service NUMBER(10) not null, 
    CONSTRAINT fk_serviceLangue_service foreign key (id_serviceLangue) references SERVICE (id_service), 
    CONSTRAINT fk_serviceLangue_langue foreign key (langueUtilisateur_service) references LANGUE (id_langue), 
    CONSTRAINT pk_serviceLangue PRIMARY KEY (id_serviceLangue) 
); 
 
CREATE TABLE AVOIRDIFFERENTELANGUE ( 
    id_langue NUMBER(10) not null, 
    id_service NUMBER(10) not null, 
    CONSTRAINT fk_diffLangue_serviceLangue foreign key (id_service) references SERVICE (id_service), 
    CONSTRAINT fk_diffLangue_langue foreign key (id_langue) references LANGUE (id_langue), 
    CONSTRAINT pk_diffLangue_langue PRIMARY KEY (id_langue) 
); 
 
CREATE TABLE RESERVATION ( 
    id_reservation NUMBER(10) not null, 
    idClient_reservation NUMBER(10) not null, 
    idService_reservation NUMBER(10) not null, 
    heureDebut_reservation DATE, 
    heureFin_reservation DATE, 
    CONSTRAINT fk_reservation_utilisateur foreign key (idClient_reservation) references UTILISATEUR (id_utilisateur), 
    CONSTRAINT fk_reservation_service foreign key (idService_reservation) references SERVICE (id_service), 
    CONSTRAINT pk_reservation PRIMARY KEY (id_reservation) 
); 
 
CREATE TABLE ORDREDEMISSION ( 
    id_ordreDeMission NUMBER(10) not null, 
    idReservation_ordreDeMission NUMBER(10) not null, 
    validePresta_ordreDeMission NUMBER(1,0),
    fichierPresta_ordreDeMission BLOB, 
    CONSTRAINT fk_ordreDeMission_reservation foreign key (idReservation_ordreDeMission) references RESERVATION (id_reservation), 
    CONSTRAINT pk_ordreDeMission PRIMARY KEY (id_ordreDeMission) 
); 
 
CREATE TABLE DEVIS ( 
    id_devis NUMBER(10) not null, 
    idReservation_devis NUMBER(10) not null, 
    valide_devis NUMBER(1,0), 
    fichier_devis BLOB, 
    CONSTRAINT fk_devis_reservation foreign key (idReservation_devis) references RESERVATION (id_reservation), 
    CONSTRAINT pk_devis PRIMARY KEY (id_devis) 
); 
 
CREATE TABLE FACTURE ( 
    id_facture NUMBER(10) not null, 
    idDevis_facture NUMBER(10) not null, 
    montant_facture DECIMAL(30), 
    date_facture DATE, 
    fichier_facture BLOB, 
    CONSTRAINT fk_facture_devis foreign key (idDevis_facture) references DEVIS (id_devis), 
    CONSTRAINT pk_facture PRIMARY KEY (id_facture) 
); 

CREATE TABLE PAIEMENT (
    id_paiement NUMBER(10) not null,
    idFacture_paiement NUMBER(10) not null,
    cout_paiement DECIMAL(30),
    date_paiement DATE,
    CONSTRAINT fk_paiement_facture foreign key (idFacture_paiement) references FACTURE (id_facture),
    CONSTRAINT pk_paiement PRIMARY KEY (id_paiement)
);