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



SELECT 
    v.id AS vente_id,
    v.date_vente,
    v.quantite,
    p.nom_produit,
    p.description,
    p.prix,
    ta.id AS type_age_id,
    tp.id AS type_produit_id,
    l.nom AS laboratoire_nom
FROM 
    Vente v
JOIN 
    Produits p ON v.id_produits = p.id
JOIN 
    Produits_TypeAge pta ON p.id = pta.id_produit
JOIN 
    TypeAge ta ON pta.id_age = ta.id
JOIN 
    Produits_Type pt ON p.id = pt.id_produits
JOIN 
    TypeProduits tp ON pt.id_typeProduit = tp.id
JOIN 
    Laboratoires l ON v.id_laboratoire = l.id
WHERE 
    ta.id = ? -- Remplacez le point d'interrogation par l'ID du type d'âge recherché
    AND tp.id = ?; -- Remplacez le point d'interrogation par l'ID du type de produit recherché
