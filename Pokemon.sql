-- DROP DATABASE Pokemon
-- CREATE DATABASE Pokemon;
USE Pokemon;
GO

CREATE TABLE Type (
	TypeID			INT				IDENTITY(1,1),
	TypeName		VARCHAR(50)		NOT NULL,

	CONSTRAINT PK_Type PRIMARY KEY(TypeID)
);

CREATE TABLE Nature (
	NatureID		INT				IDENTITY(1,1),
	NatureName		VARCHAR(50)		NOT NULL,

	CONSTRAINT PK_Nature PRIMARY KEY(NatureID)
);

CREATE TABLE Pokemon (
	PokemonID		INT				IDENTITY(1,1),
	PokemonName		VARCHAR(50)		NOT NULL,
	Ability			VARCHAR(50)		NOT NULL,
	TypeID			INT				NOT NULL,
	NatureID		INT				NOT NULL,
	PokedexNotes	VARCHAR(500)	NOT NULL,

	CONSTRAINT PK_Pokemon PRIMARY KEY(PokemonID),
	CONSTRAINT FK_Type FOREIGN KEY(TypeID) REFERENCES Type(TypeID),
	CONSTRAINT FK_Nature FOREIGN KEY(NatureID) REFERENCES Nature(NatureID)
);

CREATE TABLE Region (
	RegionID		INT				IDENTITY(1,1),
	RegionName		VARCHAR(50)		NOT NULL,

	CONSTRAINT PK_Region PRIMARY KEY(RegionID)
);

CREATE TABLE Trainer (
	TrainerID		INT				IDENTITY(1,1),
	RegionID		INT				NOT NULL,
	TrainerName		VARCHAR(50)		NOT NULL,
	PokemonCount	INT				NOT NULL,
	BadgeCount		INT				NOT NULL,
	AvatarIndex		INT				NOT NULL,

	CONSTRAINT PK_Trainer PRIMARY KEY(TrainerID),
	CONSTRAINT FK_Region FOREIGN KEY(RegionID) REFERENCES Region(RegionID)
);

CREATE TABLE Trainer_Pokemon (
	PokemonID		INT				NOT NULL,
	TrainerID		INT				NOT NULL,

	CONSTRAINT FK_Pokemon FOREIGN KEY(PokemonID) REFERENCES Pokemon(PokemonID),
	CONSTRAINT FK_Trainer FOREIGN KEY(TrainerID) REFERENCES Trainer(TrainerID),
	CONSTRAINT PK_Trainer_Pokemon PRIMARY KEY(PokemonID, TrainerID)
);

INSERT INTO Type(TypeName)
VALUES
('Normal'), ('Fire'), ('Water'), ('Electric'), ('Grass'), ('Ice'),
('Fighting'), ('Poison'), ('Ground'), ('Flying'), ('Psychic'), ('Bug'),
('Rock'), ('Ghost'), ('Dragon'), ('Dark'), ('Steel'), ('Fairy');

INSERT INTO Nature(NatureName)
VALUES
('Adamant'), ('Bashful'), ('Bold'), ('Brave'), ('Calm'),
('Careful'), ('Docile'), ('Gentle'), ('Hardy'), ('Hasty'),
('Impish'), ('Jolly'), ('Lax'), ('Lonely'), ('Mild'),
('Modest'), ('Naive'), ('Naughty'), ('Quiet'), ('Quirky'),
('Rash'), ('Relaxed'), ('Sassy'), ('Serious'), ('Timid');

INSERT INTO Region(RegionName)
VALUES
('Kanto'), ('Johto'), ('Hoenn'), ('Sinnoh'), ('Unova'),
('Kalos'), ('Alola'), ('Galar'), ('Hisui'), ('Paldea');

INSERT INTO Trainer(RegionID, TrainerName, PokemonCount, BadgeCount, AvatarIndex)
VALUES
(1, 'Red', 151, 8, 0),
(1, 'Blue', 136, 7, 2),
(1, 'Brock', 55, 8, 5),
(1, 'Misty', 73, 8, 7);

INSERT INTO Pokemon(PokemonName, Ability, TypeID, NatureID, PokedexNotes)
VALUES
('Spectroll', 'Hot Wheels', 16, 2, 'The Rider Pokémon. Taking the form of a small goblin, this ghoul resides in the hollow confines of a rubber tire. It uses the tire to roll around, and loves to play tricks by running into unsuspecting trainers at full speed.'),
('Nosfurkatu', 'Catty Haunt', 14, 8, 'The Vampire Pokémon. Nosfurkatu is a small spirit that takes the form of a black cat. It is usually identified by its piercing red eyes, and tends to live near abandoned buildings and gravesites. It is usually passive, and tries to avoid trainers at all costs.'),
('Snowslam', 'Speed Boost', 6, 10, 'The Wall Pokémon. Resembling a big boulder, Snowslam uses the friction of its icy habitat to slam into its enemies. Weighing approximately 400kg on average, this Pokémon can burst through even the toughest of obstacles with ease.');

INSERT INTO Trainer_Pokemon(PokemonID, TrainerID, Level, Route)
VALUES
(1, 2, 100, 453),
(2, 2, 63, 463);

CREATE TABLE Login (
	UserID		INT				IDENTITY(1,1),
	Username	VARCHAR(50)		NOT NULL,
	Password	VARCHAR(100)	NOT NULL,

	CONSTRAINT PK_Login PRIMARY KEY(UserID)
);

INSERT INTO Login(Username, Password)
VALUES
('nbcctester', 'dbprog'),
('swhite05', 'swhite05'),
('user', 'pass'),
('admin', 'password');