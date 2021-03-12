CREATE DATABASE QuanLyQuanCafe;
GO

USE QuanLyQuanCafe;
GO

--Food
CREATE TABLE Food(
	idFood int identity primary key,
	nameFood nvarchar(100) not null default N'Chua dat ten',
	idFoodCategory int not null,
	priceFood float not null default 0
	
	foreign key (idFoodCategory) references FoodCategory(idFoodCategory)
)
GO

--Table
CREATE TABLE FoodTable(
	idTable int identity primary key,
	nameTable nvarchar(100) not null default N'Chua dat ten',
	statusTable int not null default 0 -- 0:Trong| 1:Co nguoi
)
GO

--FoodCategory
CREATE TABLE FoodCategory(
	idFoodCategory int identity primary key,
	nameFoodCategory nvarchar(100) not null default N'Chua dat ten'
)
GO

--Account
CREATE TABLE Account(
	username nvarchar(100) primary key,
	displayname nvarchar(100) not null default N'Chua dat ten',
	password nvarchar(1000) not null default N'123',
	typeAccount int not null default 0
)
GO

--Bill
CREATE TABLE Bill(
	idBill int identity primary key,
	idTable int not null,
	datein date not null default getdate(),
	dateout date,
	statusBill int not null default 0 -- 0:Chua thanh toan | 1: Da thanh toan
	
	foreign key (idTable) references FoodTable(idTable)
)
GO

--Bill_Info
CREATE TABLE BillInfo(
	idBill int,
	idFood int,
	infoCount int not null default 0,
	infoPrice float not null
	
	primary key (idBill,idFood),
	foreign key (idBill) references Bill(idBill),
	foreign key (idFood) references Food(idFood)
)
GO

INSERT INTO Account (username,displayname,password,typeAccount)
VALUES (N'admin',N'Quan tri vien',N'admin',1);

INSERT INTO Account (username,displayname,password,typeAccount)
VALUES (N'staff_1',N'Nhan vien 1',N'123',0);
GO

CREATE PROC USP_getAccountListByUsername
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM Account WHERE username = @userName
END
GO

EXEC USP_getAccountListByUsername @userName = N'admin'