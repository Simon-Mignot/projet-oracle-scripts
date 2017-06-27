CREATE OR REPLACE PROCEDURE InsertNouveauUtilisateur
(
    nom_Utilisateur UTILISATEUR.NOM_UTILISATEUR%TYPE, 
    prenom_Utilisateur UTILISATEUR.PRENOM_UTILISATEUR%TYPE,
    mail_Utilisateur UTILISATEUR.MAIL_UTILISATEUR%TYPE,
    numeroTelephone_Utilisateur UTILISATEUR.NUMEROTELEPHONE_UTILISATEUR%TYPE,
    sexe_Utilisateur UTILISATEUR.SEXE_UTILISATEUR%TYPE,
    dateNaissance_Utilisateur UTILISATEUR.DATENAISSANCE_UTILISATEUR%TYPE,
    description_Utilisateur UTILISATEUR.DESCRIPTION_UTILISATEUR%TYPE,
    travail_Utilisateur UTILISATEUR.TRAVAIL_UTILISATEUR%TYPE,
    pseudoLogin_Utilisateur UTILISATEUR.PSEUDOLOGIN_UTILISATEUR%TYPE,
    mdpLogin_Utilisateur UTILISATEUR.MDPLOGIN_UTILISATEUR%TYPE,
    langueDefaut_Utilisateur UTILISATEUR.LANGUEDEFAUT_UTILISATEUR%TYPE,
    adresse_Utilisateur UTILISATEUR.ADRESSE_UTILISATEUR%TYPE,
    ville_Utilisateur UTILISATEUR.VILLE_UTILISATEUR%TYPE,
    codePostal_Utilisateur UTILISATEUR.CODEPOSTAL_UTILISATEUR%TYPE,
    pays_Utilisateur UTILISATEUR.PAYS_UTILISATEUR%TYPE,
    timeZone_Utilisateur UTILISATEUR.TIMEZONE_UTILISATEUR%TYPE
)

AS
  testUtilisateur NUMBER;
  indexUtilisateur NUMBER;

BEGIN
  SELECT count(*) INTO testUtilisateur 
  FROM UTILISATEUR 
  WHERE pseudoLogin_Utilisateur = InsertNouveauUtilisateur.pseudoLogin_Utilisateur 
  AND mdpLogin_Utilisateur = InsertNouveauUtilisateur.mdpLogin_Utilisateur 
  AND nom_Utilisateur = InsertNouveauUtilisateur.nom_Utilisateur 
  AND prenom_Utilisateur = InsertNouveauUtilisateur.prenom_Utilisateur;
    IF testUtilisateur > 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Utilisateur déjà existant');
    ELSE
      SELECT MAX(M.ID_UTILISATEUR)+1 INTO indexUtilisateur FROM UTILISATEUR M;
    
      INSERT INTO UTILISATEUR
      (
        id_utilisateur, 
        nom_Utilisateur, 
        prenom_Utilisateur,
        mail_Utilisateur,
        numeroTelephone_Utilisateur,
        sexe_Utilisateur,
        dateNaissance_Utilisateur, 
        description_Utilisateur, 
        travail_Utilisateur, 
        pseudoLogin_Utilisateur,
        mdpLogin_Utilisateur,
        langueDefaut_Utilisateur,
        adresse_Utilisateur,
        ville_Utilisateur,
        codePostal_Utilisateur,
        pays_Utilisateur,
        timeZone_Utilisateur 
      )
      VALUES 
      (
        indexUtilisateur, 
        InsertNouveauUtilisateur.nom_Utilisateur, 
        InsertNouveauUtilisateur.prenom_Utilisateur,
        InsertNouveauUtilisateur.mail_Utilisateur,
        InsertNouveauUtilisateur.numeroTelephone_Utilisateur,
        InsertNouveauUtilisateur.sexe_Utilisateur,
        InsertNouveauUtilisateur.dateNaissance_Utilisateur,
        InsertNouveauUtilisateur.description_Utilisateur,
        InsertNouveauUtilisateur.travail_Utilisateur,
        InsertNouveauUtilisateur.pseudoLogin_Utilisateur,
        InsertNouveauUtilisateur.mdpLogin_Utilisateur,
        InsertNouveauUtilisateur.langueDefaut_Utilisateur,
        InsertNouveauUtilisateur.adresse_Utilisateur,
        InsertNouveauUtilisateur.ville_Utilisateur,
        InsertNouveauUtilisateur.codePostal_Utilisateur,
        InsertNouveauUtilisateur.pays_Utilisateur,
        InsertNouveauUtilisateur.timeZone_Utilisateur
      );
    END IF;
END;
/

CALL InsertNouveauUtilisateur
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
    63,
    'Villa del Pachino',
    'Paris',
    '79021',
    'France',
    '12:03:00'
);