-- LANGUE
INSERT INTO LANGUE(libelle_langue) VALUES('Français');
INSERT INTO LANGUE(libelle_langue) VALUES('Allemand');

-- UTILISATEUR
INSERT INTO UTILISATEUR
(
    nom_utilisateur, 
    prenom_utilisateur, 
    mail_utilisateur, 
    numeroTelephone_utilisateur, 
    sexe_utilisateur, 
    dateNaissance_utilisateur, 
    description_utilisateur, 
    travail_utilisateur, 
    pseudoLogin_utilisateur, 
    mdpLogin_utilisateur, 
    langueDefaut_utilisateur, 
    adresse_utilisateur, 
    ville_utilisateur, 
    codePostal_utilisateur, 
    pays_utilisateur, 
    timeZone_utilisateur 
)
VALUES
(
    'Jean',
    'Gabin',
    'jeangabin@mailtest.fr',
    '0606060606',
    'Masculin',
    '12/03/1989',
    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
    'Banquier',
    'jeangab',
    '6d11b39b108caac82c684371d719eceb29c180ecffa7be659e2c231ef08492a3',
    1,
    'Villa del Pachino',
    'Paris',
    '79021',
    'France',
    '12:03:00'
);

INSERT INTO UTILISATEUR
(
    nom_utilisateur, 
    prenom_utilisateur, 
    mail_utilisateur, 
    numeroTelephone_utilisateur, 
    sexe_utilisateur, 
    dateNaissance_utilisateur, 
    description_utilisateur, 
    travail_utilisateur, 
    pseudoLogin_utilisateur, 
    mdpLogin_utilisateur, 
    langueDefaut_utilisateur, 
    adresse_utilisateur, 
    ville_utilisateur, 
    codePostal_utilisateur, 
    pays_utilisateur, 
    timeZone_utilisateur 
)
VALUES
(
    'Louis',
    'De Funes',
    'louisdefunes@mailtest.fr',
    '0606060606',
    'Masculin',
    '10/02/1975',
    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
    'Comédien',
    'louisfunes',
    '6d11b39b108caac82c684371d719eceb29c180ecffa7be659e2c231ef08492a3',
    2,
    'Saint Martelemis',
    'Paris',
    '79021',
    'France',
    '12:03:00'
);

-- DISPONIBILITE
INSERT INTO DISPONIBILITE(idUtilisateur_disponibilite, jour_disponibilite, heureDebut_disponibilite, heureFin_disponibilite)
VALUES(1, 'Mardi', to_date('22/06/2017 13:00', 'dd-mm-yyyy hh24:mi'), to_date('22/06/2017 15:00', 'dd-mm-yyyy hh24:mi'));

INSERT INTO DISPONIBILITE(idUtilisateur_disponibilite, jour_disponibilite, heureDebut_disponibilite, heureFin_disponibilite)
VALUES(2, 'Mercredi', to_date('22/06/2017 10:00', 'dd-mm-yyyy hh24:mi'), to_date('22/06/2017 12:00', 'dd-mm-yyyy hh24:mi'));

-- TYPESERVICE
INSERT INTO TYPESERVICE(libelle_typeService)
VALUES('Cours de mathématiques');

INSERT INTO TYPESERVICE(libelle_typeService)
VALUES('Ménages');

-- TYPEDEVISE
INSERT INTO TYPEDEVISE(libelle_typeDevise)
VALUES('Euros');

INSERT INTO TYPEDEVISE(libelle_typeDevise)
VALUES('Franc suisse');

-- SERVICE
INSERT INTO SERVICE
(
    idUtilisateur_service, 
    type_service, 
    titre_service, 
    description_service, 
    prix_service, 
    numeroTelephone_service, 
    typeDevise_service, 
    pays_service
)
VALUES
(
    1,
    1,
    'Aide à domicile',
    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
    12.5,
    '0606060606',
    1,
    'France'
);

INSERT INTO SERVICE
(
    idUtilisateur_service, 
    type_service, 
    titre_service, 
    description_service, 
    prix_service, 
    numeroTelephone_service, 
    typeDevise_service, 
    pays_service
)
VALUES
(
    2,
    2,
    'Aide aux cours',
    'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
    5,
    '0606060606',
    2,
    'Allemagne'
);

-- SERVICELANGUE
INSERT INTO SERVICELANGUE(id_serviceLangue, langueUtilisateur_service)
VALUES(1,1);

INSERT INTO SERVICELANGUE(id_serviceLangue, langueUtilisateur_service)
VALUES(2,2);

-- AVOIRDIFFERENTELANGUE
INSERT INTO AVOIRDIFFERENTELANGUE(id_langue, id_service)
VALUES(1, 1);

INSERT INTO AVOIRDIFFERENTELANGUE(id_langue, id_service)
VALUES(2, 2);

-- RESERVATION
INSERT INTO RESERVATION
(
    idClient_reservation, 
    idService_reservation, 
    heureDebut_reservation, 
    heureFin_reservation
)
VALUES
(
    1,
    2,
    to_date('22/06/2017 10:00', 'dd-mm-yyyy hh24:mi'),
    to_date('22/06/2017 12:00', 'dd-mm-yyyy hh24:mi')
);

INSERT INTO RESERVATION
(
    idClient_reservation, 
    idService_reservation, 
    heureDebut_reservation, 
    heureFin_reservation
)
VALUES
(
    2,
    1,
    to_date('22/06/2017 10:00', 'dd-mm-yyyy hh24:mi'),
    to_date('22/06/2017 12:00', 'dd-mm-yyyy hh24:mi')
);

-- FACTURE
INSERT INTO FACTURE(idDevis_facture, montant_facture, date_facture, fichier_facture)
VALUES(1, 25, '22/06/2017', EMPTY_BLOB());

INSERT INTO FACTURE(idDevis_facture, montant_facture, date_facture, fichier_facture)
VALUES(2, 12, '23/06/2017', EMPTY_BLOB());

-- PAIEMENT
INSERT INTO PAIEMENT(idFacture_paiement, cout_paiement, date_paiement)
VALUES(1, 25, '22/06/2017');

INSERT INTO PAIEMENT(idFacture_paiement, cout_paiement, date_paiement)
VALUES(2, 6, '23/06/2017');

INSERT INTO PAIEMENT(idFacture_paiement, cout_paiement, date_paiement)
VALUES(2, 6, '23/06/2017');