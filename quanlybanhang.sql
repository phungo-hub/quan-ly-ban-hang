create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer
(
	cID int not null primary key,
    cName varchar(20),
    cAge int
);

create table CustOrder
(
	oId int not null primary key,
    cID int,
    oDate Datetime,
    oTotalPrice float,
    foreign key (cID) references Customer(cID)
);

create table Product 
(
	pId int not null primary key,
    pName varchar(20),
    pPrice float
);

create table OrderDetail 
(
	oId int,
    pId int,
    odQty int,
    primary key (oId, pId),
    foreign key (oId) references CustOrder(oId),
    foreign key (pId) references Product(pId)
);