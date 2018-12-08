BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `Zahlung` (
	`Z_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`B_ID`	INTEGER NOT NULL,
	`Betrag`	REAL NOT NULL,
	`Datum`	DATE DEFAULT (datetime('now','localtime')),
	`Info`	TEXT,
	FOREIGN KEY(`B_ID`) REFERENCES `Benutzer`(`B_ID`)
);
CREATE TABLE IF NOT EXISTS `Logtyp` (
	`LT_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Logtyp`	TEXT NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS `Getraenk` (
	`G_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Preis`	REAL NOT NULL,
	`Name`	TEXT NOT NULL UNIQUE,
	`Bild`	BLOB UNIQUE,
	`Barcode`	TEXT UNIQUE
);
CREATE TABLE IF NOT EXISTS `Benutzer_Log` (
	`BL_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`LT_ID`	INTEGER,
	`B_ID`	INTEGER,
	`Zeitpunkt`	DATE DEFAULT (datetime('now','localtime')),
	FOREIGN KEY(`B_ID`) REFERENCES `Benutzer`(`B_ID`),
	FOREIGN KEY(`LT_ID`) REFERENCES `Logtyp`(`LT_ID`)
);
CREATE TABLE IF NOT EXISTS `Benutzer_Getraenk` (
	`B_ID`	INTEGER NOT NULL,
	`G_ID`	INTEGER NOT NULL,
	`Preis`	REAL NOT NULL,
	`Datum_Konsum`	DATE DEFAULT (datetime('now','localtime')),
	`BG_PK`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	FOREIGN KEY(`B_ID`) REFERENCES `Benutzer`(`B_ID`),
	FOREIGN KEY(`G_ID`) REFERENCES `Getraenk`(`G_ID`)
);
CREATE TABLE IF NOT EXISTS `Benutzer` (
	`B_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`Pin`	INTEGER,
	`Name`	TEXT NOT NULL UNIQUE,
	`EMail`	INTEGER UNIQUE
);
CREATE TABLE IF NOT EXISTS `Abrechnung` (
	`A_ID`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
	`B_ID`	INTEGER,
	`Datum`	DATE DEFAULT (datetime('now','localtime')) NOT NULL,
	`Datum_von`	DATE NOT NULL,
	`Datum_bis`	DATE DEFAULT (datetime('now','localtime')) NOT NULL,
	`Guthaben`	REAL,
	`Abrechnungscode`	TEXT,
	FOREIGN KEY(`B_ID`) REFERENCES `Benutzer`(`B_ID`)
);
COMMIT;
