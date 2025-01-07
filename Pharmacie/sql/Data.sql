-- Insertion des laboratoires
INSERT INTO Laboratoires (nom_laboratoire, adresse) VALUES 
('Laboratoire Santé Plus', 'Andoharanofotsy, Antananarivo'),
('Centre Biomédical Madagascar', 'Lotissement Tsaralalana, Fianarantsoa'),
('Laboratoire Médic Pharma', 'Avenue Analakely, Tamatave'),
('BioTest Mahajanga', 'Rue de Manjakaray, Mahajanga'),
('Laboratoire TropicLab', 'Boulevard Rakoto, Antsirabe');

-- Insertion des maladies
INSERT INTO Maladies (nom_maladie, symptomes) VALUES 
('Grippe Aigue', 'Fièvre, toux sèche, maux de tête.'),
('Asthme', 'Difficulté respiratoire, oppression thoracique.'),
('Diabète Type 2', 'Fatigue chronique, soif excessive.'),
('Hypertension', 'Maux de tête persistants, vision floue.'),
('Arthrite Rhumatoïde', 'Douleurs articulaires, gonflement.'),
('Infections Urinaires', 'Douleurs lors de la miction, besoin fréquent d’uriner.'),
('Dermatite Atopique', 'Éruptions cutanées, démangeaisons.'),
('Cholestérol Élevé', 'Aucun symptôme apparent mais risque cardiovasculaire accru.'),
('Migraine Chronique', 'Maux de tête intenses, nausées.'),
('Anémie', 'Fatigue excessive, teint pâle.'),
('Tuberculose', 'Toux persistante, fièvre nocturne.'),
('Grippe Saisonnière', 'Fièvre, frissons, courbatures.'),
('COVID-19', 'Fièvre, toux sèche, perte du goût ou de l’odorat.'),
('Bronchite', 'Toux accompagnée de mucosités, fatigue.'),
('Sinusite', 'Douleurs au visage, congestion nasale.'),
('Gastrite', 'Douleurs abdominales, nausées.'),
('Hépatite B', 'Jaunisse, douleurs au foie.'),
('Allergies Saisonnales', 'Éternuements, yeux qui pleurent.'),
('Insomnie', 'Difficulté à s’endormir, fatigue diurne.'),
('Maladie de Parkinson', 'Tremblements, rigidité musculaire.');

-- Insertion des produits
INSERT INTO Produits (nom_produit, description, prix) VALUES 
('Paracétamol', 'Analgésique et antipyrétique utilisé pour soulager la douleur et réduire la fièvre.', 150.00),
('Ibuprofène', 'Anti-inflammatoire non stéroïdien pour les douleurs et inflammations.', 200.00),
('Amoxicilline', 'Antibiotique à large spectre utilisé contre les infections bactériennes.', 300.00),
('Ventoline', 'Inhalateur pour traiter les crises d’asthme.', 250.00),
('Metformine', 'Médicament oral pour le traitement du diabète de type 2.', 400.00),
('Lisinopril', 'Antihypertenseur pour réduire la tension artérielle.', 350.00),
('Lorazépam', 'Sédatif pour traiter l’insomnie et l’anxiété.', 500.00),
('Oméprazole', 'Médicament pour réduire l’acidité gastrique.', 250.00),
('Erythromycine', 'Antibiotique pour les infections respiratoires.', 350.00),
('Vitamine D', 'Supplément essentiel pour renforcer les os et le système immunitaire.', 100.00),
('Crème Corticoïde', 'Traitement topique pour les inflammations cutanées.', 150.00),
('Statine', 'Médicament pour réduire le cholestérol élevé.', 400.00),
('Antihistaminique', 'Médicament pour soulager les allergies.', 200.00),
('Insuline', 'Hormone pour la gestion du diabète.', 600.00),
('Glycophage', 'Traitement pour contrôler la glycémie.', 450.00),
('Ketoprofène', 'Anti-inflammatoire pour les douleurs musculaires.', 300.00),
('Spray Nasal Salin', 'Solution saline pour hydrater les voies nasales.', 100.00),
('Bétadine', 'Solution antiseptique pour désinfecter les plaies.', 120.00),
('Magnésium', 'Supplément nutritionnel pour réduire la fatigue.', 200.00),
('Probiotique', 'Médicament pour rééquilibrer la flore intestinale.', 300.00),
('Aspirine', 'Anticoagulant et analgésique.', 180.00),
('Antitussif', 'Sirop contre la toux sèche.', 220.00),
('Antispasmodique', 'Médicament pour soulager les crampes abdominales.', 250.00),
('Levothyrox', 'Médicament pour les troubles thyroïdiens.', 350.00),
('Bronchodilatateur', 'Spray pour améliorer la respiration en cas de bronchite.', 300.00),
('Complément Fer', 'Traitement pour corriger l’anémie.', 200.00),
('Gaviscon', 'Antiacide pour les brûlures d’estomac.', 150.00),
('Tamiflu', 'Traitement antiviral pour la grippe.', 400.00),
('Nurofen', 'Antalgique pour soulager les migraines.', 300.00),
('Calcium', 'Supplément pour renforcer les os.', 180.00);

-- Insertion des relations maladies-produits
INSERT INTO Maladies_Produits (id_maladie, id_produit) VALUES 
(1, 2), (1, 28), (1, 22),
(2, 4), (2, 26),
(3, 5), (3, 15), (3, 14),
(4, 6), (4, 13),
(5, 10), (5, 16),
(6, 8), (6, 18),
(7, 11), (7, 3),
(8, 12), (8, 20),
(9, 19), (9, 29),
(10, 27), (10, 30),
(11, 3), (11, 28),
(12, 2), (12, 28),
(13, 3), (13, 8),
(14, 12), (14, 19),
(15, 18), (15, 21),
(16, 17), (16, 10),
(17, 7), (17, 15),
(18, 13), (18, 24),
(19, 16), (19, 22),
(20, 30), (20, 29);

-- Insertion des données dans MvtStocks
INSERT INTO MvtStocks (date_mvt, entree, sortie, id_produit, id_laboratoire) VALUES
('2025-01-01 08:30:00', 100, NULL, 2, 1), -- Ibuprofène ajouté au Laboratoire Santé Plus
('2025-01-02 10:00:00', NULL, 20, 2, 1), -- Ibuprofène vendu au Laboratoire Santé Plus
('2025-01-03 14:15:00', 200, NULL, 2, 2), -- Ibuprofène ajouté au Centre Biomédical Madagascar
('2025-01-04 09:00:00', NULL, 50, 2, 2), -- Ibuprofène vendu au Centre Biomédical Madagascar
('2025-01-05 16:00:00', 150, NULL, 3, 3), -- Amoxicilline ajouté au Laboratoire Médic Pharma
('2025-01-06 11:30:00', NULL, 30, 3, 3), -- Amoxicilline vendu au Laboratoire Médic Pharma
('2025-01-07 08:00:00', 300, NULL, 4, 4), -- Ventoline ajouté à BioTest Mahajanga
('2025-01-08 15:00:00', NULL, 75, 4, 4), -- Ventoline vendu à BioTest Mahajanga
('2025-01-09 12:00:00', 200, NULL, 5, 5), -- Metformine ajouté au Laboratoire TropicLab
('2025-01-10 17:45:00', NULL, 25, 5, 5), -- Metformine vendu au Laboratoire TropicLab
('2025-01-11 09:30:00', 180, NULL, 6, 1), -- Lisinopril ajouté au Laboratoire Santé Plus
('2025-01-12 14:00:00', NULL, 40, 6, 1), -- Lisinopril vendu au Laboratoire Santé Plus
('2025-01-13 10:15:00', 120, NULL, 7, 2), -- Lorazépam ajouté au Centre Biomédical Madagascar
('2025-01-14 13:30:00', NULL, 20, 7, 2), -- Lorazépam vendu au Centre Biomédical Madagascar
('2025-01-15 18:00:00', 220, NULL, 8, 3), -- Oméprazole ajouté au Laboratoire Médic Pharma
('2025-01-16 07:45:00', NULL, 80, 8, 3), -- Oméprazole vendu au Laboratoire Médic Pharma
('2025-01-17 11:00:00', 300, NULL, 9, 4), -- Erythromycine ajouté à BioTest Mahajanga
('2025-01-18 10:30:00', NULL, 90, 9, 4), -- Erythromycine vendu à BioTest Mahajanga
('2025-01-19 16:30:00', 400, NULL, 10, 5), -- Vitamine D ajouté au Laboratoire TropicLab
('2025-01-20 13:15:00', NULL, 100, 10, 5), -- Vitamine D vendu au Laboratoire TropicLab
('2025-01-21 09:45:00', 150, NULL, 11, 1), -- Crème Corticoïde ajouté au Laboratoire Santé Plus
('2025-01-22 15:30:00', NULL, 35, 11, 1), -- Crème Corticoïde vendu au Laboratoire Santé Plus
('2025-01-23 10:15:00', 200, NULL, 12, 2), -- Statine ajouté au Centre Biomédical Madagascar
('2025-01-24 14:45:00', NULL, 50, 12, 2), -- Statine vendu au Centre Biomédical Madagascar
('2025-01-25 08:00:00', 250, NULL, 13, 3), -- Antihistaminique ajouté au Laboratoire Médic Pharma
('2025-01-26 16:00:00', NULL, 75, 13, 3); -- Antihistaminique vendu au Laboratoire Médic Pharma
INSERT INTO MvtStocks (date_mvt, entree, sortie, id_produit, id_laboratoire) VALUES
-- Ajouts supplémentaires
('2025-01-27 09:30:00', 300, NULL, 14, 4), -- Insuline ajouté à BioTest Mahajanga
('2025-01-28 14:00:00', NULL, 50, 14, 4), -- Insuline vendu à BioTest Mahajanga
('2025-01-29 12:15:00', 100, NULL, 15, 5), -- Glycophage ajouté au Laboratoire TropicLab
('2025-01-30 08:45:00', NULL, 20, 15, 5), -- Glycophage vendu au Laboratoire TropicLab
('2025-01-31 10:00:00', 220, NULL, 16, 1), -- Ketoprofène ajouté au Laboratoire Santé Plus
('2025-02-01 15:30:00', NULL, 70, 16, 1), -- Ketoprofène vendu au Laboratoire Santé Plus
('2025-02-02 11:30:00', 300, NULL, 17, 2), -- Spray Nasal Salin ajouté au Centre Biomédical Madagascar
('2025-02-03 17:15:00', NULL, 100, 17, 2), -- Spray Nasal Salin vendu au Centre Biomédical Madagascar
('2025-02-04 09:45:00', 400, NULL, 18, 3), -- Bétadine ajouté au Laboratoire Médic Pharma
('2025-02-05 14:30:00', NULL, 120, 18, 3), -- Bétadine vendu au Laboratoire Médic Pharma
('2025-02-06 16:00:00', 500, NULL, 19, 4), -- Magnésium ajouté à BioTest Mahajanga
('2025-02-07 11:30:00', NULL, 200, 19, 4), -- Magnésium vendu à BioTest Mahajanga
('2025-02-08 13:00:00', 250, NULL, 20, 5), -- Probiotique ajouté au Laboratoire TropicLab
('2025-02-09 09:15:00', NULL, 75, 20, 5), -- Probiotique vendu au Laboratoire TropicLab
('2025-02-10 14:00:00', 150, NULL, 21, 1), -- Aspirine ajouté au Laboratoire Santé Plus
('2025-02-11 16:30:00', NULL, 60, 21, 1), -- Aspirine vendu au Laboratoire Santé Plus
('2025-02-12 10:30:00', 300, NULL, 22, 2), -- Antitussif ajouté au Centre Biomédical Madagascar
('2025-02-13 12:45:00', NULL, 90, 22, 2), -- Antitussif vendu au Centre Biomédical Madagascar
('2025-02-14 08:15:00', 400, NULL, 23, 3), -- Antispasmodique ajouté au Laboratoire Médic Pharma
('2025-02-15 17:00:00', NULL, 150, 23, 3), -- Antispasmodique vendu au Laboratoire Médic Pharma
('2025-02-16 10:00:00', 200, NULL, 24, 4), -- Levothyrox ajouté à BioTest Mahajanga
('2025-02-17 18:30:00', NULL, 80, 24, 4), -- Levothyrox vendu à BioTest Mahajanga
('2025-02-18 12:00:00', 350, NULL, 25, 5), -- Bronchodilatateur ajouté au Laboratoire TropicLab
('2025-02-19 09:45:00', NULL, 150, 25, 5), -- Bronchodilatateur vendu au Laboratoire TropicLab
('2025-02-20 15:00:00', 200, NULL, 26, 1), -- Complément Fer ajouté au Laboratoire Santé Plus
('2025-02-21 10:15:00', NULL, 70, 26, 1), -- Complément Fer vendu au Laboratoire Santé Plus
('2025-02-22 11:45:00', 100, NULL, 27, 2), -- Gaviscon ajouté au Centre Biomédical Madagascar
('2025-02-23 16:15:00', NULL, 30, 27, 2), -- Gaviscon vendu au Centre Biomédical Madagascar
('2025-02-24 13:30:00', 400, NULL, 28, 3), -- Tamiflu ajouté au Laboratoire Médic Pharma
('2025-02-25 08:45:00', NULL, 150, 28, 3), -- Tamiflu vendu au Laboratoire Médic Pharma
('2025-02-26 14:15:00', 300, NULL, 29, 4), -- Nurofen ajouté à BioTest Mahajanga
('2025-02-27 17:00:00', NULL, 110, 29, 4), -- Nurofen vendu à BioTest Mahajanga
('2025-02-28 12:30:00', 180, NULL, 28, 5), -- Tamiflu ajouté au Laboratoire TropicLab
('2025-03-01 09:00:00', NULL, 50, 28, 5); -- Tamiflu vendu au Laboratoire TropicLab

