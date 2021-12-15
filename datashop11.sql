IF DB_ID('datashop1') IS NOT NULL
BEGIN
	USE master
	DROP DATABASE [datashop1]
END

GO

CREATE DATABASE [datashop1]

GO

USE [datashop1]

GO
CREATE TABLE Category
(
	id_cat		int				NOT NULL	IDENTITY(1,1),
	name_cat	nvarchar(255)	NOT NULL,
	describe	nvarchar(max)	,

	CONSTRAINT PK_cat_ID PRIMARY KEY(id_cat)
)
GO
CREATE TABLE Product
(
	id_pro		int				NOT NULL	IDENTITY(1,1),
	id_cat		int				NOT NULL,
	name_pro	nvarchar(255)	NOT NULL,
	images		nvarchar(255)	NULL,
	quantity	int				NOT NULL,
	price		float			NOT NULL,
	supplier	nvarchar(255)	NOT NULL,
	infor		nvarchar(max)	NULL,

	CONSTRAINT PK_pro_ID PRIMARY KEY(id_pro),
	CONSTRAINT FK_cat_ID FOREIGN KEY(id_cat) REFERENCES Category(id_cat)
)
GO
CREATE TABLE Account
(
	id_user		int				NOT NULL	IDENTITY(1,1),
	username	varchar(25)		NOT NULL,
	salt_p		varchar(255)	NOT NULL,
	hash_p		varchar(255)	NOT NULL,
	[role]		bit				NOT NULL

	CONSTRAINT PK_user_ID PRIMARY KEY(id_user)
)
GO
CREATE TABLE AccountInformation(
	id_user		int				NOT NULL,
	[fullname]	nvarchar(50)	NOT NULL,
	dob			date			NULL,
	gender		varchar(10)		NULL,
	email		varchar(255)	NOT NULL,
	phone		varchar(255)	NOT NULL,
	[address]	varchar(255)	NULL,

	CONSTRAINT FK_user_ID FOREIGN KEY(id_user) REFERENCES Account(id_user)
)
GO
CREATE TABLE [Order]
(
	id_order	int				NOT NULL	IDENTITY(1,1),
	id_user		int				NOT NULL,
	id_pro		int				NOT NULL,
	dateBuy		datetime		NOT NULL,
	quantity	int				NOT NULL,
	total		float			NOT NULL,
	
	CONSTRAINT PK_order_ID PRIMARY KEY(id_order),
	CONSTRAINT FK_user_ID_O FOREIGN KEY(id_user) REFERENCES Account(id_user),
	CONSTRAINT FK_pro_ID FOREIGN KEY(id_pro) REFERENCES Product(id_pro)
)
GO
INSERT INTO Category VALUES ('New','')
INSERT INTO Category VALUES ('Sale','')
INSERT INTO Category VALUES ('Style','')
INSERT INTO Category VALUES ('Man','')
INSERT INTO Category VALUES ('Women','')
INSERT INTO Category VALUES ('Sandal','')
INSERT INTO Category VALUES ('Hat','')
GO
--INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?, ?)
INSERT INTO Product VALUES (3, N'Ao no style', N'nostyle.jpg', 23, 35000, N'Mali', N'Dang cap nhat')
INSERT INTO Product VALUES (1, N'Ao khoac Adachi moi', N'new.jpg', 5, 10000, N'Oron', N'Dang cap nhat')
INSERT INTO Product VALUES (5, N'Ao nu', N'nu4.jpg', 10, 15000, N'LV', N'Dang cap nhat')
INSERT INTO Product VALUES (4, N'Ao nam', N'nam.jpg', 35, 45000, N'Gucci', N'Dang cap nhat')
INSERT INTO Product VALUES (6, N'Dep 3', N'dep3.jpg', 5, 4000, N'Bitis', N'Dang cap nhat')
INSERT INTO Product VALUES (6, N'Dep 2', N'dep1.jpg', 10, 3500, N'Bitis', N'Dang cap nhat')
INSERT INTO Product VALUES (6, N'Dep 4', N'dep4.jpg', 2, 9500, N'Bítis', N'Dang cap nhat')
INSERT INTO Product VALUES (2, N'Ao sale 2', N'aosale2.jpg', 5, 20000, N'LV', N'Dang cap nhat')
INSERT INTO Product VALUES (2, N'Ao sale 3', N'aosale3.jpg', 47, 12000, N'Adidas', N'Dang cap nhat')
INSERT INTO Product VALUES (1, N'Ao khoac 2', N'aokhoac.jpg', 5, 51000, N'Puma', N'Dang cap nhat')
INSERT INTO Product VALUES (7, N'Non 2', N'non11.jpg', 2, 1200, N'NoO', N'Dang cap nhat')
INSERT INTO Product VALUES (2, N'Ao sale', N'nu2.jpg', 65, 9000, N'Omo', N'Dang cap nhat')
INSERT INTO Product VALUES (7, N'Non', N'non.jpg', 15, 2000, N'Docle', N'Dang cap nhat')

--GO
--INSERT INTO Account VALUES ()
--GO
--INSERT INTO AccountInformation VALUES ()
--GO
--INSERT INTO [Order] VALUES ()