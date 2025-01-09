INSERT INTO TypeAge (libele) VALUES
('Enfant'), 
('Adolescent'), 
('Adulte'), 
('Sénior');

INSERT INTO TypeProduits (libele) VALUES
('Pommade'),
('Crème'),
('Gel'),
('Sirop'),
('Capsule'),
('Goutte oculaire'),
('Inhalateur'),
('Suppositoire'),
('Patch transdermique'),
('Spray nasal'),
('Mousse'),
('Shampooing médicamenteux'),
('Solution buvable'),
('Baume'),
('Huile essentielle'),
('Ampoule injectable'),
('Bandage médicamenteux'),
('Pastille à sucer'),
('Emulsion'),
('Poudre à reconstituer');

INSERT INTO Produits_Type (id_produits, id_typeProduit) VALUES
(1, 2), -- Aspirine (Comprimé)
(2, 2), -- Bêtabloquants (Comprimé)
(3, 7), -- Inhalateur Ventoline (Inhalateur)
(4, 2), -- Antibiotiques pour pneumonie (Comprimé)
(5, 3), -- Crème hydratante (Crème)
(6, 1), -- Corticoïdes locaux (Injectable)
(7, 2), -- Anti-épileptiques (Comprimé)
(8, 2), -- Anti-coagulants (Comprimé)
(9, 2), -- Anti-acides (Comprimé)
(10, 8), -- Probiotiques (Capsule)
(11, 2), -- Antibiotiques urinaires (Comprimé)
(12, 1), -- Médicament lithotritique (Injectable)
(13, 1), -- Insuline (Injectable)
(14, 2), -- Levothyrox (Comprimé)
(15, 2), -- Pilule contraceptive (Comprimé)
(16, 2), -- Traitement hormonal (Comprimé)
(17, 6), -- Collyre anti-inflammatoire (Goutte oculaire)
(18, 9), -- Lunettes spéciales glaucome (Équipement médical)
(19, 10), -- Spray nasal (Spray nasal)
(20, 2), -- Antibiotiques ORL (Comprimé)
(21, 2), -- Suppléments de fer (Comprimé)
(22, 2), -- Chimiothérapie orale (Comprimé)
(23, 2), -- Antidépresseurs (Comprimé)
(24, 2), -- Stabilisateurs de l’humeur (Comprimé)
(25, 11), -- Dentifrice anti-caries (Dentifrice)
(26, 12); -- Bain de bouche antiseptique (Solution buvable)



INSERT INTO Categorie (specialiste) VALUES
('Cardiologie'),        -- Cœur et système cardiovasculaire
('Pneumologie'),        -- Poumons et système respiratoire
('Dermatologie'),       -- Peau et annexes cutanées
('Neurologie'),         -- Système nerveux central et périphérique
('Rhumatologie'),       -- Os et articulations
('Orthopédie'),         -- Os et blessures musculo-squelettiques
('Gastro-entérologie'), -- Système digestif
('Urologie'),           -- Système urinaire et reproducteur masculin
('Endocrinologie'),     -- Glandes et système endocrinien
('Gynécologie'),        -- Système reproducteur féminin
('Ophtalmologie'),      -- Yeux
('ORL'),                -- Oreilles, nez et gorge
('Hématologie'),        -- Maladies du sang
('Immunologie'),        -- Système immunitaire
('Psychiatrie'),        -- Santé mentale
('Odontologie');        -- Dents et bouche


INSERT INTO Corps (partie, id_categorie) VALUES
('Cœur', 1),                -- Cardiologie
('Poumons', 2),             -- Pneumologie
('Peau', 3),                -- Dermatologie
('Cerveau', 4),             -- Neurologie
('Articulations', 5),       -- Rhumatologie
('Os', 6),                  -- Orthopédie
('Estomac', 7),             -- Gastro-entérologie
('Intestins', 7),           -- Gastro-entérologie
('Reins', 8),               -- Urologie
('Vessie', 8),              -- Urologie
('Thyroïde', 9),            -- Endocrinologie
('Ovaires', 10),            -- Gynécologie
('Yeux', 11),               -- Ophtalmologie
('Oreilles', 12),           -- ORL
('Nez', 12),                -- ORL
('Gorge', 12),              -- ORL
('Sang', 13),               -- Hématologie
('Système immunitaire', 14),-- Immunologie
('Esprit', 15),             -- Psychiatrie
('Dents', 16),              -- Odontologie
('Langue', 16),             -- Odontologie
('Gencives', 16);           -- Odontologie


-- Insertion des laboratoires
INSERT INTO Laboratoires (nom_laboratoire, adresse) VALUES 
('Laboratoire Santé Plus', 'Andoharanofotsy, Antananarivo'),
('Centre Biomédical Madagascar', 'Lotissement Tsaralalana, Fianarantsoa'),
('Laboratoire Médic Pharma', 'Avenue Analakely, Tamatave'),
('BioTest Mahajanga', 'Rue de Manjakaray, Mahajanga'),
('Laboratoire TropicLab', 'Boulevard Rakoto, Antsirabe');


INSERT INTO Maladies (nom_maladie, symptomes, id_corps) VALUES
-- Cardiologie
('Infarctus du myocarde', 'Douleur thoracique, essoufflement, fatigue', 1),
('Hypertension artérielle', 'Maux de tête, vertiges, troubles visuels', 1),

-- Pneumologie
('Asthme', 'Essoufflement, toux, respiration sifflante', 2),
('Pneumonie', 'Fièvre, toux productive, douleur thoracique', 2),

-- Dermatologie
('Eczéma', 'Démangeaisons, rougeurs, plaques sèches', 3),
('Psoriasis', 'Plaques rouges, squames, démangeaisons', 3),

-- Neurologie
('Épilepsie', 'Convulsions, perte de conscience, confusion', 4),
('AVC', 'Paralysie soudaine, troubles de la parole, faiblesse d’un côté du corps', 4),

-- Gastro-entérologie
('Ulceres gastriques', 'Douleurs abdominales, nausées, perte d’appétit', 7),
('Maladie de Crohn', 'Douleurs abdominales, diarrhée, fatigue', 8),

-- Urologie
('Infection urinaire', 'Brûlure à la miction, envie fréquente d’uriner', 9),
('Calculs rénaux', 'Douleur lombaire, nausées, sang dans les urines', 9),

-- Endocrinologie
('Diabète', 'Soif excessive, perte de poids, fatigue', 11),
('Hypothyroïdie', 'Fatigue, prise de poids, peau sèche', 11),

-- Gynécologie
('Endométriose', 'Douleurs pelviennes, règles abondantes, infertilité', 13),
('Syndrome des ovaires polykystiques', 'Troubles menstruels, acné, infertilité', 13),

-- Ophtalmologie
('Cataracte', 'Vision floue, sensibilité à la lumière', 14),
('Glaucome', 'Perte de vision périphérique, douleur oculaire', 14),

-- ORL
('Sinusite', 'Congestion nasale, maux de tête, fièvre', 15),
('Otite', 'Douleur auriculaire, fièvre, perte d’audition', 15);


INSERT INTO Produits (nom_produit, description, prix) VALUES
-- Produits pour Cardiologie
('Aspirine', 'Médicament anti-coagulant pour prévenir les caillots sanguins', 4.99),
('Bêtabloquants', 'Traitement pour réduire la tension artérielle', 8.50),

-- Produits pour Pneumologie
('Inhalateur Ventoline', 'Soulagement rapide des crises d’asthme', 12.99),
('Antibiotiques pour pneumonie', 'Traitement des infections pulmonaires', 25.00),

-- Produits pour Dermatologie
('Crème hydratante', 'Soulage les démangeaisons dues à l’eczéma', 7.99),
('Corticoïdes locaux', 'Traitement pour réduire l’inflammation du psoriasis', 15.75),

-- Produits pour Neurologie
('Anti-épileptiques', 'Traitement des crises convulsives', 30.00),
('Anti-coagulants', 'Réduction des risques après un AVC', 20.99),

-- Produits pour Gastro-entérologie
('Anti-acides', 'Soulage les douleurs des ulcères gastriques', 5.99),
('Probiotiques', 'Aide à la gestion de la maladie de Crohn', 18.50),

-- Produits pour Urologie
('Antibiotiques urinaires', 'Traitement des infections urinaires', 10.50),
('Médicament lithotritique', 'Aide à dissoudre les calculs rénaux', 40.00),

-- Produits pour Endocrinologie
('Insuline', 'Traitement pour le diabète', 50.00),
('Levothyrox', 'Traitement pour l’hypothyroïdie', 10.99),

-- Produits pour Gynécologie
('Pilule contraceptive', 'Régule les cycles menstruels', 15.00),
('Traitement hormonal', 'Soulagement de l’endométriose', 25.99),

-- Produits pour Ophtalmologie
('Collyre anti-inflammatoire', 'Soulage les inflammations oculaires', 6.99),
('Lunettes spéciales glaucome', 'Aide à la gestion de la pression oculaire', 150.00),

-- Produits pour ORL
('Spray nasal', 'Décongestionne les voies nasales en cas de sinusite', 8.50),
('Antibiotiques ORL', 'Traitement des infections de l’oreille', 12.99),

-- Produits pour Hématologie
('Suppléments de fer', 'Traitement pour l’anémie', 9.99),
('Chimiothérapie orale', 'Traitement de certaines leucémies', 300.00),

-- Produits pour Psychiatrie
('Antidépresseurs', 'Soulage les symptômes de la dépression', 20.00),
('Stabilisateurs de l’humeur', 'Traitement pour le trouble bipolaire', 35.00),

-- Produits pour Odontologie
('Dentifrice anti-caries', 'Protection renforcée contre les caries', 3.99),
('Bain de bouche antiseptique', 'Prévient les infections des gencives', 5.99);

INSERT INTO Maladies_Produits (id_maladie, id_produit) VALUES
-- Relations pour Cardiologie
(1, 1), -- Infarctus du myocarde → Aspirine
(1, 2), -- Infarctus du myocarde → Bêtabloquants
(2, 2), -- Hypertension artérielle → Bêtabloquants

-- Relations pour Pneumologie
(3, 3), -- Asthme → Inhalateur Ventoline
(4, 4), -- Pneumonie → Antibiotiques pour pneumonie

-- Relations pour Dermatologie
(5, 5), -- Eczéma → Crème hydratante
(6, 6), -- Psoriasis → Corticoïdes locaux

-- Relations pour Neurologie
(7, 7), -- Épilepsie → Anti-épileptiques
(8, 8), -- AVC → Anti-coagulants

-- Relations pour Gastro-entérologie
(9, 9), -- Ulcères gastriques → Anti-acides
(10, 10), -- Maladie de Crohn → Probiotiques

-- Relations pour Urologie
(11, 11), -- Infection urinaire → Antibiotiques urinaires
(12, 12), -- Calculs rénaux → Médicament lithotritique

-- Relations pour Endocrinologie
(13, 13), -- Diabète → Insuline
(14, 14), -- Hypothyroïdie → Levothyrox

-- Relations pour Gynécologie
(15, 15), -- Endométriose → Traitement hormonal
(16, 15), -- Syndrome des ovaires polykystiques → Traitement hormonal
(16, 16), -- Syndrome des ovaires polykystiques → Pilule contraceptive

-- Relations pour Ophtalmologie
(17, 17), -- Cataracte → Collyre anti-inflammatoire
(18, 18), -- Glaucome → Lunettes spéciales glaucome

-- Relations pour ORL
(19, 19), -- Sinusite → Spray nasal
(20, 20);


INSERT INTO Produits_TypeAge (id_produit, id_age) VALUES
-- Produits pour Enfants
(5, 1), -- Crème hydratante adaptée aux enfants atteints d'eczéma
(9, 1), -- Anti-acides doux adaptés aux enfants

-- Produits pour Adolescents
(16, 2), -- Pilule contraceptive pour adolescentes
(23, 2), -- Antidépresseurs adaptés aux adolescents

-- Produits pour Adultes
(1, 3), -- Aspirine pour adultes
(3, 3), -- Inhalateur Ventoline pour adultes asthmatiques
(13, 3), -- Insuline pour adultes diabétiques

-- Produits pour Séniors
(2, 4), -- Bêtabloquants pour seniors souffrant d’hypertension
(8, 4), -- Anti-coagulants pour AVC chez les seniors
(18, 4), -- Lunettes spéciales glaucome pour seniors
(20, 4); -- Suppléments de fer pour anémie chez les seniors
