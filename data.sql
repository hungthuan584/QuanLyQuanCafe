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

SELECT COUNT(*) FROM Account WHERE username = 'admin' and password = ''

CREATE PROC USP_Login
@userName nvarchar(100), @passWord nvarchar(100)
AS
BEGIN
	SELECT * FROM Account WHERE username = @userName AND password = @passWord
END
GO

-- Them ban
DECLARE @i INT = 1
WHILE @i <=40
BEGIN
	INSERT FoodTable (nameTable) VALUES (N'Bàn '+ CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
GO

SELECT * FROM FoodTable
GO

SELECT * FROM Bill
GO
SELECT * FROM BillInfo
GO
SELECT * FROM Food
GO
SELECT * FROM FoodCategory

--Them category
INSERT FoodCategory (nameFoodCategory) VALUES (N'Đồ uống');
INSERT FoodCategory (nameFoodCategory) VALUES (N'Đồ ăn sáng');
INSERT FoodCategory (nameFoodCategory) VALUES (N'Đồ ăn vặt');
INSERT FoodCategory (nameFoodCategory) VALUES (N'Cơm phần');
INSERT FoodCategory (nameFoodCategory) VALUES (N'Gọi thêm');

--Them Food
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cafe đá',1,N'20000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cafe Sữa',1,N'28000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Dừa lạnh',1,N'30000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Sinh tố bơ',1,N'29000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Sinh tố dâu',1,N'29000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Sinh tố mãng cầu',1,N'28000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Sinh tố sabo',1,N'26000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Pepsi',1,N'20000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Sting',1,N'20000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'7 up',1,N'20000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Trà sữa truyền thống',1,N'24000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Trà sữa matcha',1,N'28000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Trà sen',1,N'30000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Phở bò',2,N'40000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Hủ tiếu bò kho',2,N'40000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Mì xào hải sản',2,N'35000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bò né',2,N'30000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Phá lấu bò',1,N'40000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh mì trứng',2,N'30000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bún bò huế',2,N'35000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh mì xá xíu',2,N'32000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh mì chả',2,N'32000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bún riêu cua',2,N'35000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Xúc xích chiên',3,N'25000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cá viên chiên',3,N'22000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Khoai tây chiên',3,N'28000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Khoai lang lắc phomai',3,N'25000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh gạo cay',3,N'30000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Khoai mỡ chiên',3,N'35000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Đậu hủ chiên',3,N'28000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cơm gà xối mỡ',4,N'40000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cơm chiên dương châu',4,N'40000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Canh chua cá lóc',4,N'50000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cá kho tộ',4,N'45000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Tim bò xào hành',4,N'20000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Hạt sen',5,N'10000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh Flan',5,N'5000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Thạch',5,N'5000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Cơm',5,N'5000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh mì',5,N'5000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Bánh đa',5,N'10000');
INSERT Food (nameFood,idFoodCategory,priceFood) VALUES(N'Củ năng',5,N'5000');

--Them Bill
INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	14,
	0
);

INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	15,
	0
);
INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	16,
	0
);
INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	17,
	0
);
INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	18,
	0
);

INSERT Bill
(
	datein,
	dateout,
	idTable,
	statusBill
)
VALUES
(
	GETDATE(),
	NULL,
	19,
	1
);

SELECT * FROM Bill
GO
SELECT * FROM Food
GO

--Them BillInfo
INSERT BillInfo (idBill,idFood,infoCount) VALUES (22,2,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (22,15,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (23,4,1);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (23,17,1);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (24,4,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (24,18,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (25,14,4);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (26,8,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (27,10,2);
INSERT BillInfo (idBill,idFood,infoCount) VALUES (27,13,3);

SELECT * FROM Bill WHERE idTable = AND statusBill = 