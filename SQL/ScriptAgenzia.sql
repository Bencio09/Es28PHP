DROP DATABASE IF EXISTS agenzia;
CREATE DATABASE agenzia;
use agenzia;

CREATE TABLE `agenzia`.`quartieri` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `urlmappa` VARCHAR(45) NULL,
  PRIMARY KEY (`codice`));

CREATE TABLE `agenzia`.`proprietari` (
  `codiceFiscale` CHAR(16) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `indirizzo` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `cellulare` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `codiceIban` VARCHAR(45) NULL,
  PRIMARY KEY (`codiceFiscale`));
  
  CREATE TABLE `agenzia`.`appartamenti` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `indirizzo` VARCHAR(45) NULL,
  `prezzoGiorno` DOUBLE NULL,
  `numeroCamere` INT NULL,
  `postiLetto` INT NULL,
  `usoCucina` ENUM('Si', 'No') NULL,
  `parcheggio` ENUM('Si', 'No') NULL,
  `note` VARCHAR(500) NULL,
  `codiceQuartiere` INT NULL,
  `codiceProprietario` VARCHAR(16) NULL,
  PRIMARY KEY (`codice`),
  FOREIGN KEY(codiceQuartiere) REFERENCES quartieri(codice),
  FOREIGN KEY(codiceProprietario) REFERENCES proprietari(codiceFiscale));
  
  
  CREATE TABLE `agenzia`.`foto` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `didascalia` VARCHAR(50) NULL,
  `urlFoto` VARCHAR(50) NULL,
  `codiceAppartamento` INT NULL,
  PRIMARY KEY (`codice`),
  FOREIGN KEY(codiceAppartamento) REFERENCES appartamenti(codice));
  
  CREATE TABLE `agenzia`.`clienti` (
  `codiceFiscale` VARCHAR(16) NOT NULL,
  `nome` VARCHAR(50) NULL,
  `indirizzo` VARCHAR(60) NULL,
  `nomeUtente` VARCHAR(10) NULL,
  `password` VARCHAR(10) NULL,
  `telefono` VARCHAR(20) NULL,
  `cellulare` VARCHAR(20) NULL,
  `email` VARCHAR(30) NULL,
  PRIMARY KEY (`codiceFiscale`));
  
  CREATE TABLE `agenzia`.`prenotazioni` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `dataPrenotazione` DATE NULL,
  `codiceCliente` VARCHAR(16) NULL,
  `confermaPrenotazione` ENUM('S', 'N') NULL,
  PRIMARY KEY (`codice`),
  FOREIGN KEY(codiceCliente) REFERENCES clienti(codiceFiscale));

CREATE TABLE `agenzia`.`righe` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `dataIniziale` DATE NULL,
  `dataFinale` DATE NULL,
  `costo` DOUBLE NULL,
  `confermaRiga` ENUM('S', 'N') NULL,
  `codicePrenotazione` INT NOT NULL,
  `codiceAppartamento` INT NOT NULL,
  PRIMARY KEY (`codice`),
  FOREIGN KEY(codiceAppartamento) REFERENCES appartamenti(codice),
  FOREIGN KEY(codicePrenotazione) REFERENCES prenotazioni(codice));
  
  CREATE TABLE `agenzia`.`disponibilità` (
  `codice` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NULL,
  `disponibile` ENUM('S', 'N') NULL,
  `codiceRiga` INT NULL,
  `codiceAppartamento` INT NULL,
  PRIMARY KEY (`codice`),
  FOREIGN KEY(codiceAppartamento) REFERENCES appartamenti(codice),
  FOREIGN KEY(codiceRiga) REFERENCES righe(codice));


