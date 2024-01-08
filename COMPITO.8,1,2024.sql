
CREATE TABLE Vendite (
  Id_Transazione INT PRIMARY KEY,
  Categoria VARCHAR(255) NOT NULL,
  Costo DECIMAL(10, 2),
  Sconto_Perc DECIMAL(5, 2)
);

INSERT INTO Vendite (Id_Transazione, Categoria, Costo, Sconto_Perc) VALUES 
    (1, 'Elettronica', 500.00, 10.00),
    (2, 'Abbigliamento', 120.50, 5.50),
    (3, 'Alimentari', 30.00, 2.00),
    (4, 'Elettronica', 800.00, 60.00),  
    (5, 'Abbigliamento', 75.25, 7.25),
    (6, 'Alimentari', 45.75, 3.75),
    (7, 'Elettronica', 600.00, 12.00),
    (8, 'Abbigliamento', 200.00, 20.00),
    (9, 'Alimentari', 25.50, 1.50),
    (10, 'Elettronica', 950.00, 55.00),  
    (11, 'Abbigliamento', 80.00, 8.00),
    (12, 'Alimentari', 35.20, 2.20),
    (13, 'Elettronica', 700.00, 25.00),
    (14, 'Abbigliamento', 150.75, 15.75),
    (15, 'Alimentari', 40.50, 4.50),
    (16, 'Elettronica', 1200.00, 30.00),
    (17, 'Abbigliamento', 90.00, 9.00),
    (18, 'Alimentari', 15.30, 1.30),
    (19, 'Elettronica', 550.00, 5.00),
    (20, 'Abbigliamento', 180.25, 18.25),
    (21, 'Alimentari', 50.00, 55.00),
    (22, 'Elettronica', 350.00, 15.00),
    (23, 'Abbigliamento', 85.75, 8.75),
    (24, 'Alimentari', 28.50, 3.50),
    (25, 'Elettronica', 750.00, 20.00),
    (26, 'Abbigliamento', 110.00, 10.50),
    (27, 'Alimentari', 22.30, 1.80),
    (28, 'Elettronica', 480.00, 12.50),
    (29, 'Abbigliamento', 160.25, 15.25),
    (30, 'Alimentari', 35.00, 2.50),
    (31, 'Elettronica', 890.00, 25.00),
    (32, 'Elettronica', 420.00, 18.00),
    (33, 'Abbigliamento', 95.50, 9.00),
    (34, 'Alimentari', 32.75, 4.25),
    (35, 'Elettronica', 680.00, 56.50),
    (36, 'Abbigliamento', 130.00, 12.75),
    (37, 'Alimentari', 26.20, 2.00),
    (38, 'Elettronica', 550.00, 15.00),
    (39, 'Abbigliamento', 180.75, 17.50),
    (40, 'Alimentari', 40.00, 3.00),
    (41, 'Elettronica', 920.00, 30.00);

CREATE TABLE Dettagli_Vendite (
    Id_Transazione INT PRIMARY KEY,
    Data_Transazione DATE,
    Quantit INT,
    FOREIGN KEY (Id_Transazione) REFERENCES Vendite(Id_Transazione)
);

INSERT INTO Dettagli_Vendite (Id_Transazione, Data_Transazione, Quantit) VALUES 
    (1, '2024-01-02', 8),
    (2, '2024-01-08', 5),
    (3, '2024-02-08', 3),
    (4, '2024-02-10', 8),
    (5, '2024-03-01', 6),
    (6, '2024-03-10', 10),
    (7, '2024-03-15', 6),
    (8, '2024-04-05', 12),
    (9, '2024-04-05', 7),
    (10, '2024-04-20', 11),
    (11, '2024-05-01', 6),
    (12, '2024-05-02', 3),
    (13, '2024-05-15', 5),
    (14, '2024-05-20', 15),
    (15, '2024-05-25', 9),
    (16, '2024-06-05', 4),
    (17, '2024-06-12', 9),
    (18, '2024-06-20', 7),
    (19, '2024-06-25', 5),
    (20, '2024-07-01', 7),
    (21, '2024-07-05', 6),
    (22, '2024-07-10', 10),
    (23, '2024-08-15', 3),
    (24, '2024-08-22', 8),
    (25, '2024-09-01', 5),
    (26, '2024-09-10', 7),
    (27, '2024-10-05', 12),
    (28, '2024-10-15', 9),
    (29, '2024-11-02', 4),
    (30, '2024-11-12', 8),
    (31, '2025-01-05', 6),
    (32, '2025-01-10', 10),
    (33, '2025-02-15', 3),
    (34, '2025-02-22', 8),
    (35, '2025-03-01', 5),
    (36, '2025-03-10', 7),
    (37, '2025-04-05', 12),
    (38, '2025-04-15', 9),
    (39, '2025-05-02', 4),
    (40, '2025-05-12', 8),
    (41, '2025-06-01', 5);

-- PUNTO 3
SELECT Id_Transazione 
FROM Vendite
WHERE Sconto_Perc > 50.00;

SELECT Id_Transazione, Quantit
FROM Dettagli_Vendite
WHERE Data_Transazione ="2024-04-05";

-- PUNTO 4 
SELECT Categoria, SUM(Costo) AS TotaleVendite
FROM Vendite
GROUP BY Categoria;

SELECT v.Categoria, SUM(dv.Quantit) AS NumeroProdottiVenduti
FROM Vendite v
JOIN Dettagli_Vendite dv ON v.Id_Transazione = dv.Id_Transazione
GROUP BY v.Categoria;

-- PUNTO 5
SELECT v.Categoria, SUM(dv.Quantit) AS NumeroProdottiVenduti
FROM Vendite v
JOIN Dettagli_Vendite dv ON v.Id_Transazione = dv.Id_Transazione
WHERE YEAR(dv.Data_Transazione) = YEAR(CURDATE()) AND QUARTER(dv.Data_Transazione) = QUARTER(CURDATE())
GROUP BY v.Categoria;

SELECT 
    YEAR(dv.Data_Transazione) AS Anno,
    MONTH(dv.Data_Transazione) AS Mese,
    SUM(v.Costo) AS CostoProdottiVenduti
FROM 
    Vendite v
JOIN 
    Dettagli_Vendite dv ON v.Id_Transazione = dv.Id_Transazione
GROUP BY 
    YEAR(dv.Data_Transazione), MONTH(dv.Data_Transazione)
ORDER BY 
    Anno, Mese;

-- PUNTO 7
SELECT Categoria, AVG(Sconto_Perc) AS ScontoMedio
FROM Vendite
GROUP BY Categoria;

-- PUNTO 8
/*SELECT 
    YEAR(dv.Data_Transazione) AS Anno,
    MONTH(dv.Data_Transazione) AS Mese,
    SUM(dv.Quantità) AS QuantitàVenduta
FROM 
    Dettagli_Vendite dv
GROUP BY 
    YEAR(dv.Data_Transazione), MONTH(dv.Data_Transazione)
ORDER BY 
    Anno, Mese;*/

-- PUNTO 9


-- PUNTO 10
CREATE TABLE Clienti (
    Id_Cliente INT,
    Id_Vendita INT PRIMARY KEY,
    Id_Transazione INT,
    FOREIGN KEY (Id_Transazione) REFERENCES Vendite(Id_Transazione)
);
INSERT INTO Clienti (Id_Cliente, Id_Vendita, Id_Transazione) VALUES
    (101, 1, 1),
    (102, 2, 2),
    (103, 3, 3),
    (104, 4, 4),
    (105, 5, 5),
    (106, 6, 6),
    (107, 7, 7),
    (108, 8, 8),
    (109, 9, 9),
    (110, 10, 10),
    (102, 11, 11),
    (102, 12, 12),
    (103, 13, 13),
    (104, 14, 14),
    (105, 15, 15),
    (106, 16, 16),
    (107, 17, 17),
    (108, 18, 18),
    (109, 19, 19),
    (110, 20, 20),
    (110, 21, 21),
    (104, 22, 22),
    (108, 23, 23),
    (103, 24, 24),
    (109, 25, 25),
    (101, 26, 26),
    (107, 27, 27),
    (103, 28, 28),
    (102, 29, 29),
    (108, 30, 30),
    (104, 31, 31),
    (106, 32, 32),
    (103, 33, 33),
    (108, 34, 34),
    (104, 35, 35),
    (103, 36, 36),
    (102, 37, 37),
    (105, 38, 38),
    (108, 39, 39),
    (103, 40, 40);

    


-- PUNTI A SCELTA
-- acquisto con il prezzo più alto
SELECT *
FROM Vendite
ORDER BY Costo DESC
LIMIT 1;
-- acquisto con il prezzo più basso 
SELECT *
FROM Vendite
ORDER BY Costo ASC
LIMIT 1;
-- Tutti i prezzi con uno sconto minore o uguale a 10
SELECT Id_Transazione, Categoria, Costo
FROM Vendite
WHERE Sconto_Perc < 10.00;
