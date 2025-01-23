CREATE TABLE TypeAge(
   id SERIAL,
   libele VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);


CREATE TABLE Categorie(
   id SERIAL,
   specialiste VARCHAR(250)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE LesMois(
   id SERIAL,
   libele VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);



CREATE TABLE Corps(
   id SERIAL,
   partie VARCHAR(250)  NOT NULL,
   id_categorie INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_categorie) REFERENCES Categorie(id) ON DELETE CASCADE
);

CREATE TABLE Laboratoires(
   id SERIAL,
   nom_laboratoire VARCHAR(255)  NOT NULL,
   adresse VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);


CREATE TABLE Maladies(
   id SERIAL,
   nom_maladie VARCHAR(255)  NOT NULL,
   symptomes VARCHAR(255) ,
   id_corps INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_corps) REFERENCES Corps(id) ON DELETE CASCADE
);


CREATE TABLE Produits(
   id SERIAL,
   nom_produit VARCHAR(255)  NOT NULL,
   description VARCHAR(255) ,
   prix NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE MvtStocks(
   id SERIAL,
   date_mvt TIMESTAMP NOT NULL,
   entree INTEGER,
   sortie INTEGER,
   id_produit INTEGER NOT NULL,
   id_laboratoire INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_produit) REFERENCES Produits(id)  ON DELETE CASCADE,
   FOREIGN KEY(id_laboratoire) REFERENCES Laboratoires(id)  ON DELETE CASCADE
);

CREATE TABLE Maladies_Produits(
   id_maladie INTEGER,
   id_produit INTEGER,
   PRIMARY KEY(id_maladie, id_produit),
   FOREIGN KEY(id_maladie) REFERENCES Maladies(id)  ON DELETE CASCADE,
   FOREIGN KEY(id_produit) REFERENCES Produits(id)  ON DELETE CASCADE
);

CREATE TABLE Produits_TypeAge(
   id_produit INTEGER,
   id_age INTEGER,
   PRIMARY KEY(id_produit, id_age),
   FOREIGN KEY(id_produit) REFERENCES Produits(id),
   FOREIGN KEY(id_age) REFERENCES TypeAge(id)
);

CREATE TABLE Vente(
   id SERIAL,
   date_vente TIMESTAMP NOT NULL,
   quantite INTEGER,
   id_laboratoire INTEGER NOT NULL,
   id_produits INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_laboratoire) REFERENCES Laboratoires(id),
   FOREIGN KEY(id_produits) REFERENCES Produits(id)
);
-- Ajouter la colonne id_client
ALTER TABLE Vente ADD COLUMN id_client INTEGER;

-- Ajouter la contrainte de clé étrangère pour id_client
ALTER TABLE Vente ADD CONSTRAINT fk_vente_client FOREIGN KEY (id_client) REFERENCES Client(id);

CREATE TABLE TypeProduits(
   id SERIAL,
   libele VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);



CREATE TABLE Produits_Type(
   id_produits INTEGER,
   id_typeProduit INTEGER,
   PRIMARY KEY(id_produits, id_typeProduit),
   FOREIGN KEY(id_produits) REFERENCES Produits(id),
   FOREIGN KEY(id_typeProduit) REFERENCES TypeProduits(id)
);


CREATE TABLE ConseilProduits(
   id_produits INTEGER,
   id_mois INTEGER,
   annees INTEGER NOT NULL,
   PRIMARY KEY(id_produits, id_mois),
   FOREIGN KEY(id_produits) REFERENCES Produits(id),
   FOREIGN KEY(id_mois) REFERENCES LesMois(id)
);

CREATE TABLE Client(
   id SERIAL,
   nom VARCHAR(255)  NOT NULL,
   telephone VARCHAR(255) ,
   adresse VARCHAR(255) ,
   PRIMARY KEY(id)
);

CREATE TABLE Commission(
   id SERIAL,
   date_maj TIMESTAMP NOT NULL,
   pourcentage NUMERIC(4,2)   NOT NULL,
   PRIMARY KEY(id)
);












