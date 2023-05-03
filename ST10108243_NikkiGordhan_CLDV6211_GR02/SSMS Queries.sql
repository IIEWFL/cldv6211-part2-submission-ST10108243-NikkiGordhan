--Creates the database. 
	USE master
	IF EXISTS (SELECT * FROM Sys.databases WHERE name = 'TheRideYouRent')
	DROP DATABASE TheRideYouRent
	CREATE DATABASE TheRideYouRent
	GO
	USE TheRideYouRent
	GO 

--Creates the tables.
	IF OBJECT_ID (N'tblCar_Make', N'U') IS NOT NULL 
	DROP TABLE tblCar_Make
	GO
	CREATE TABLE tblCar_Make
	(
		Car_Make_ID int IDENTITY(1,1) PRIMARY KEY,
		Description varchar (255),
	);


	IF OBJECT_ID (N'tblCar_Body_Type', N'U') IS NOT NULL 
	DROP TABLE tblCar_Body_Type
	GO
	CREATE TABLE tblCar_Body_Type
	(
		Car_Body_Type_ID int IDENTITY(1,1) PRIMARY KEY,
		Description varchar (255),
	);

	IF OBJECT_ID (N'tblCar', N'U') IS NOT NULL 
	DROP TABLE tblCar
	GO
	CREATE TABLE tblCar
	(
		Car_ID int IDENTITY(1,1) PRIMARY KEY,
		Car_No varchar (6) NOT NULL,
		Car_Make_ID int NOT NULL,
		Car_Body_Type_ID int NOT NULL,
		Model varchar (200) NOT NULL,
		Kilometers_Travelled int NOT NULL,
		Service_Kilometers int NOT NULL,
		Available bit NOT NULL,
	
		CONSTRAINT Car_Make_ID_fk
			FOREIGN KEY (Car_Make_ID)
			REFERENCES tblCar_Make (Car_Make_ID),

		CONSTRAINT Car_Body_Type_fk
			FOREIGN KEY (Car_Body_Type_ID)
			REFERENCES tblCar_Body_Type (Car_Body_Type_ID),
	);

	IF OBJECT_ID (N'tblDriver', N'U') IS NOT NULL 
	DROP TABLE tblDriver
	GO
	CREATE TABLE tblDriver
	(
		Drive_ID int IDENTITY(1,1) PRIMARY KEY,
		Name varchar (200),
		Address varchar (150),
		Email varchar (50),
		Mobile varchar (10),
	);

	IF OBJECT_ID (N'tblInspector', N'U') IS NOT NULL 
	DROP TABLE tblInspector
	GO
	CREATE TABLE tblInspector
	(
		Inspector_ID int IDENTITY(1,1) PRIMARY KEY,
		Inspector_No varchar (4),
		Name varchar (200),
		Email varchar (50),
		Mobile varchar (10)
	);

	IF OBJECT_ID (N'tblRental', N'U') IS NOT NULL 
	DROP TABLE tblRental
	GO
	CREATE TABLE tblRental
	(
		Rental_ID int IDENTITY(1,1) PRIMARY KEY,
		Car_ID int,
		Inspector_ID int,
		Driver_ID int,
		Rental_Fee money,
		Start_Date date,
		End_Date date
	);

	IF OBJECT_ID (N'tblReturn', N'U') IS NOT NULL 
	DROP TABLE tblReturn
	GO
	CREATE TABLE tblReturn
	(
		Return_ID int IDENTITY(1,1) PRIMARY KEY,
		Car_ID int,
		Inspector_ID int,
		Driver_ID int,
		Return_Date date,
		Elapsed_Date int,
		Fine money
	);

--Populates the tables 
	--Populates the Car_Make table
		INSERT INTO tblCar_Make (Description)
		VALUES ('Hyundai');

		INSERT INTO tblCar_Make (Description)
		VALUES ('BMW');

		INSERT INTO tblCar_Make (Description)
		VALUES ('Mercedes Benz');

		INSERT INTO tblCar_Make (Description)
		VALUES ('Toyota');

		INSERT INTO tblCar_Make (Description)
		VALUES ('Ford');

--Checking to see the recoreds in the table
	SELECT *
	FROM tblCar_Make;

	--Populates the Car_Body_Type table
		INSERT INTO tblCar_Body_Type (Description)
		VALUES ('Hatchback');

		INSERT INTO tblCar_Body_Type (Description)
		VALUES ('Sedan');

		INSERT INTO tblCar_Body_Type (Description)
		VALUES ('Coupe');

		INSERT INTO tblCar_Body_Type (Description)
		VALUES ('SUV');

--Checking to see the recoreds in the table
	SELECT * 
	FROM tblCar_Body_Type;

	--Populates the Car table
		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('HYU001',1,1,'Grand i10 1.0 Motion', 1500,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('HYU002',1,1,'i20 1.2 Fluid', 3000,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('BMW001',2,2,'320d 1.', 20000,50000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('BMW002',2,2,'240d 1.4', 9500,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('TOY001',4,2,'Corolla 1.0', 15000,50000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('TOY002',4,4,'Avanza 1.0', 98000,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('TOY003',4,2,'Corolla Quest 1.0', 15000,50000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('MER001',3,2,'c180', 5200,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('MER002',3,2,'A200 Sedan', 4080,15000,1);

		INSERT INTO tblCar (Car_No,Car_Make_ID,Car_Body_Type_ID,Model,Kilometers_Travelled,Service_Kilometers,Available)
		VALUES ('FOR001',5,2,'Fiesta 1.0', 7600,15000,1);


--Checking to see the recoreds in the table
	SELECT *
	FROM tblCar;
	
	--Populates the Driver table
		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Gabrielle Clarke', '917 Heuvel St Botshabelo Free State 9781', 'gorix10987@macauvpn.com', '0837113269');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Geoffrey Franklin', '1114 Dorp St Paarl Western Cape 7655', 'noceti8743@drlatvia.com', '0847728052');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Fawn Cooke', '2158 Prospect St Garsfontein Gauteng 0042', 'yegifav388@enamelme.com', '0821966584');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Darlene Peters', '2529 St. John Street Somerset West Western Cape 7110', 'mayeka4267@macauvpn.com', '0841221244');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Vita Soto', '1474 Wolmarans St Sundra Mpumalanga 2200', 'wegog55107@drlatvia.com', '0824567924');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Opal Rehbein', '697 Thutlwa St Letaba Limpopo 0870', 'yiyow34505@enpaypal.com', '0826864938');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Vernon Hodgson', '1935 Thutlwa St Letsitele Limpopo 0885', 'gifeh11935@enamelme.com', '0855991446');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Crispin Wheatly', '330 Sandown Rd Cape Town Western Cape 8018', 'likon78255@macauvpn.com', '0838347945');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Melanie Cunningham', '616 Loop St Atlantis Western Cape 7350', 'sehapeb835@macauvpn.com', '0827329001');

		INSERT INTO tblDriver (Name, Address, Email, Mobile)
		VALUES ('Kevin Peay', '814 Daffodil Dr Elliotdale Eastern Cape 5118', 'xajic53991@enpaypal.com', '0832077149');

--Checking to see the recoreds in the table
	SELECT *
	FROM tblDriver;

	--Populates the Inspector table.
		INSERT INTO tblInspector (Inspector_No, Name, Email, Mobile)
		VALUES ('I101', 'Bud Barnes', 'bud@therideyourent.com', '0821585359');

		INSERT INTO tblInspector (Inspector_No, Name, Email, Mobile)
		VALUES ('I102', 'Tracy Reeves', 'tracy@therideyourent.com', '0822889988');

		INSERT INTO tblInspector (Inspector_No, Name, Email, Mobile)
		VALUES ('I103', 'Sandra Goodwin', ' sandra@therideyourent.com', '0837695468');

		INSERT INTO tblInspector (Inspector_No, Name, Email, Mobile)
		VALUES ('I104', 'Shannon Burke', 'shannon@therideyourent.com', '0836802514');

--Checking to see the recoreds in the table
	SELECT *
	FROM tblInspector;

	--Populates the Rental table.
		INSERT INTO tblRental(Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (1,1,1,5000,'2021-08-30','2021-08-31');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (2,1,1,5000,'2021-09-01','2021-09-10');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (4,2,5,7000,'2021-09-20','2021-09-25');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (6,2,4,5000,'2021-10-03','2021-10-31');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (8,3,4,8000,'2021-10-05','2021-10-15');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (2,4,7,5000,'2021-12-01','2022-02-10');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (7,4,9,5000,'2021-08-10','2021-08-31');

		INSERT INTO tblRental (Car_ID,Inspector_ID,Driver_ID,Rental_Fee,Start_Date,End_Date)
		VALUES (10,1,2,6500,'2021-09-01','2021-09-10');

--Checking to see the recoreds in the table
	SELECT *
	FROM tblRental;

	--Populates the Return table.
		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (1,1,1,'2021-08-31',0,0);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (2,1,1,'2021-09-10',0,0);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (10,1,2,'2021-09-10',0,0);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (4,2,5,'2021-09-30',5,2500);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (6,2,4,'2021-10-31',2,1000);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (8,3,4,'2021-10-15',1,500);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (2,4,7,'2022-02-10',0,0);

		INSERT INTO tblReturn (Car_ID,Inspector_ID,Driver_ID,Return_Date,Elapsed_Date,Fine)
		VALUES (7,4,9,'2021-08-31',0,0);

--Checking to see the recoreds in the table
	SELECT *
	FROM tblReturn;

--Query 5
	SELECT *
	FROM tblRental 
	WHERE Start_Date Between '2021-08-01' AND '2021-10-30';

--Query 6
	SELECT C.Car_No,
		I.Name,
		D.Name,
		R.Rental_Fee,R.Start_Date,R.End_Date
		FROM tblRental R
		INNER JOIN tblInspector I
			ON R.Inspector_ID = I.Inspector_ID
		INNER JOIN tblCar C
			ON C.Car_ID = R.Car_ID
		INNER JOIN tblDriver D
			ON D.Drive_ID = R.Driver_ID
		WHERE I.Name = 'Bud Barnes';

--Query 7
	SELECT C.Car_No,
		I.Name,
		D.Name,
		R.Return_Date,R.Elapsed_Date,R.Fine
		FROM tblReturn R
			INNER JOIN tblCar C
				ON R.Car_ID = C.Car_ID
			INNER JOIN tblCar_Make CM
				ON C.Car_Make_ID = CM.Car_Make_ID
			INNER JOIN tblInspector I
				ON R.Inspector_ID = I.Inspector_ID
			INNER JOIN tblDriver D
				ON D.Drive_ID = R.Driver_ID
		WHERE CM.Description = 'Toyota';

--Query 8
	SELECT CM.Description, COUNT(CM.Description) AS NoOfHyundai
		FROM tblReturn R
			INNER JOIN tblCar C
				ON R.Car_ID = C.Car_ID
			INNER JOIN tblCar_Make CM
				ON C.Car_Make_ID = CM.Car_Make_ID
			INNER JOIN tblInspector I
				ON R.Inspector_ID = I.Inspector_ID
			INNER JOIN tblDriver D
				ON D.Drive_ID = R.Driver_ID
		WHERE CM.Description = 'Hyundai'
		GROUP BY CM.Description;

--Query 9
	/*SELECT *
		FROM tblCar
		WHERE Car_No = 'FOR001';*/

	UPDATE tblCar
		SET Model  = 'Focus'
		WHERE Car_No = 'FOR001';

--Query 10
	SELECT C.Car_No,
		D.Name,
		R.Rental_Fee,R.Start_Date,R.End_Date,
		C.Available
		FROM tblRental R
			INNER JOIN tblCar C
				ON R.Car_ID = C.Car_ID 
			INNER JOIN tblDriver D
				ON D.Drive_ID = R.Driver_ID
		WHERE Available = 1;

--Query 11
	SELECT DISTINCT Description
		FROM tblCar_Make;

--Query 12
	SELECT C.Car_No,
	CM.Description,
	C.Model,
	CBT.Description,
	C.Kilometers_Travelled, C.Service_Kilometers

	FROM tblCar C
		INNER JOIN tblCar_Make CM
			ON C.Car_Make_ID = CM.Car_Make_ID
		INNER JOIN tblCar_Body_Type CBT
			ON C.Car_Body_Type_ID = CBT.Car_Body_Type_ID
	WHERE Kilometers_Travelled BETWEEN (Service_Kilometers - 9000) AND Service_Kilometers;

--Query 13
	SELECT c.Car_No,
	I.Name,
	D.Name,
	R.Return_Date,R.Elapsed_Date,R.Fine,( DATEDIFF(year,GETDATE(),Return_Date) * 500) AS TotalFine
	FROM tblReturn R
		INNER JOIN tblCar C
				ON C.Car_ID = R.Car_ID
		INNER JOIN tblInspector I
				ON R.Inspector_ID = I.Inspector_ID
		INNER JOIN tblDriver D
				ON D.Drive_ID = R.Driver_ID;