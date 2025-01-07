CREATE or REPLACE VIEW VueProduitsParAge AS
SELECT 
    p.id AS id_produit,
    p.nom_produit,
    p.description,
    p.prix,
    ta.id AS id_age,
    ta.libele AS tranche_age
FROM 
    Produits p
JOIN 
    Produits_TypeAge pta ON p.id = pta.id_produit
JOIN 
    TypeAge ta ON pta.id_age = ta.id;




CREATE or REPLACE VIEW VueProduitsParCorpsEtSymptome AS
SELECT 
    p.id AS id_produit,
    p.nom_produit,
    p.description,
    p.prix,
    m.nom_maladie,
    m.symptomes,
    c.partie AS corps,
    ca.specialiste AS categorie_specialiste
FROM 
    Produits p
JOIN 
    Maladies_Produits mp ON p.id = mp.id_produit
JOIN 
    Maladies m ON mp.id_maladie = m.id
JOIN 
    Corps c ON m.id_corps = c.id
JOIN 
    Categorie ca ON c.id_categorie = ca.id;


CREATE or REPLACE VIEW VueProduitsMulticritaire AS
SELECT 
    p.id AS id_produit,
    p.nom_produit,
    p.description,
    p.prix,
    m.nom_maladie,
    m.symptomes,
    c.partie AS corps,
    c.id AS id_corps,
    ca.specialiste AS categorie_specialiste,
    ta.id AS id_age,
    ta.libele AS tranche_age
FROM 
    Produits p
JOIN 
    Maladies_Produits mp ON p.id = mp.id_produit
JOIN 
    Maladies m ON mp.id_maladie = m.id
JOIN 
    Corps c ON m.id_corps = c.id
JOIN 
    Categorie ca ON c.id_categorie = ca.id
JOIN 
    Produits_TypeAge pta ON p.id = pta.id_produit
JOIN 
    TypeAge ta ON pta.id_age = ta.id;
