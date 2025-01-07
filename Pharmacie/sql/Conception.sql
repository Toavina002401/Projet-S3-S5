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
   PRIMARY KEY(id)
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
