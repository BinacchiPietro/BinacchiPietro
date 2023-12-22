-- create a table Dipendente
CREATE TABLE Dipendente (
  Id INT PRIMARY KEY,
  nome VARCHAR(50),
  cognome VARCHAR(50),
  email VARCHAR(50),
  numerotelefono VARCHAR(50),
  data_assunzione DATE,
  id_lavoro INT,
  salario INT,
  id_manager INT,
  id_dipartimento INT, 
  INDEX(id_manager)
);

-- insert some values
INSERT INTO Dipendente (Id, nome, cognome, email, numerotelefono, data_assunzione, id_lavoro, salario, id_manager, id_dipartimento) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.com', '123-456-7890', '2023-01-01', 101, 50000, 2, 201),
(2, 'Luca', 'Bianchi', 'luca.bianchi@email.com', '234-567-8901', '2023-02-15', 102, 60000, 1, 202),
(3, 'Giulia', 'Verdi', 'giulia.verdi@email.com', '345-678-9012', '2023-03-20', 103, 70000, 1, 203),
(4, 'Anna', 'Neri', 'anna.neri@email.com', '456-789-0123', '2023-04-10', 104, 55000, 2, 204),
(5, 'Paolo', 'Gialli', 'paolo.gialli@email.com', '567-890-1234', '2023-05-05', 105, 65000, 2, 202),
(6, 'Laura', 'Marrone', 'laura.marrone@email.com', '678-901-2345', '2023-06-15', 106, 75000, 3, 203),
(7, 'Federico', 'Blu', 'federico.blu@email.com', '789-012-3456', '2023-07-20', 107, 60000, 3, 201),
(8, 'Eleonora', 'Rosa', 'eleonora.rosa@email.com', '890-123-4567', '2023-08-10', 108, 70000, 1, 202),
(9, 'Giovanni', 'Viola', 'giovanni.viola@email.com', '901-234-5678', '2023-09-05', 109, 55000, 2, 201),
(10, 'Chiara', 'Azzurri', 'chiara.azzurri@email.com', '012-345-6789', '2023-10-01', 110, 65000, 2, 203),
(11, 'Alice', 'Smith', 'alice.smith@email.com', '123-456-7890', '2023-11-15', 108, 65000, 1, 201),
(12, 'Bob', 'Johnson', 'bob.johnson@email.com', '234-567-8901', '2023-12-01', 105, 70000, 1, 201),
(13, 'Charlie', 'Brown', 'charlie.brown@email.com', '345-678-9012', '2024-01-10', 106, 60000, 2, 202),
(14, 'David', 'Williams', 'david.williams@email.com', '456-789-0123', '2024-02-05', 109, 75000, 2, 202),
(15, 'Emma', 'Davis', 'emma.davis@email.com', '567-890-1234', '2024-03-20', 107, 70000, 3, 203),
(16, 'Frank', 'Miller', 'frank.miller@email.com', '678-901-2345', '2024-04-15', 104, 55000, 3, 203),
(17, 'Grace', 'Wilson', 'grace.wilson@email.com', '789-012-3456', '2024-05-10', 103, 65000, 1, 201),
(18, 'Monkey D.', 'Luffy', 'luffy.monkey@email.com', '890-123-4567', '2024-06-05', 102, 70000, 1, 201),
(19, 'Ivy', 'Moore', 'ivy.moore@email.com', '901-234-5678', '2024-07-01', 108, 60000, 2, 202),
(20, 'James', 'Lee', 'james.lee@email.com', '012-345-6789', '2024-08-15', 106, 75000, 2, 202);

-- create a table Dipartimento
CREATE TABLE Dipartimento (
    id_dipartimento INT PRIMARY KEY,
    nome_dip VARCHAR(50),
    id_manager INT,
    id_location VARCHAR(50)
   
);
INSERT INTO Dipartimento (id_dipartimento, nome_dip, id_manager, id_location) VALUES
(201, 'Sviluppo', 1, 301),
(202, 'Vendite', 2, 302),
(203, 'Risorse Umane', 3, 303),
(204, 'Amministrazione', 1, 304),
(205, 'Produzione', 2, 305),
(206, 'Marketing', 3, 306),
(207, 'Amministrazione', 1, 307),
(208, 'Assistenza Clienti', 2, 308),
(209, 'Logistica', 3, 309),
(210, 'Ricerca e Sviluppo', 1, 310),
(211, 'Ricerca e Sviluppo II', 1, 310),
(212, 'Customer Success', 2, 308),
(213, 'Qualità', 3, 309),
(214, 'Comunicazioni', 1, 304),
(215, 'Sistemi Informativi', 2, 305),
(216, 'Progettazione', 3, 306),
(217, 'Acquisti', 1, 307),
(218, 'Formazione', 2, 308),
(219, 'Affari Legali', 3, 309),
(220, 'Sicurezza', 1, 310);

ALTER TABLE Dipendente 
ADD CONSTRAINT FK_Dipendente_Dipartimento
FOREIGN KEY (id_dipartimento)
REFERENCES Dipartimento(id_dipartimento);


SELECT DATE.FORMAT(data_assunzione, '%m/%d/%Y') AS assunzione, id
    FROM Dipendente
     WHERE (SELECT id_dipartimento
         FROM Dipartimento 
         WHERE nome_dip ='Amministrazione')=id_dipartimento;











