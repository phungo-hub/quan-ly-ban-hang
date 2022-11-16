use QuanLyBanHang;
insert into Customer
values  (1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 50);
        
alter table Customer
modify cName VARCHAR(25);

alter table Customer
modify cAge tinyint;

alter table Customer
rename column cName to Name;

alter table CustOrder rename `Order`;

insert into `Order`(oID, cID, oDate)
values  (1, 2, '2006-03-21'),
		(2, 2, '2006-03-23'),
		(3, 1, '2006-03-16');
        
alter table Product
modify pName varchar(25);

alter table Product
modify pPrice int;

insert into Product
values  (1, 'May Giat', 3),
		(2, 'Tu Lanh', 5),
		(3, 'Dieu Hoa', 7),
        (4, 'Quat', 1),
        (5, 'Bep Dien', 2);

insert into OrderDetail
values	(1, 1, 3),
		(1, 3, 7),
        (1, 4, 2),
        (2, 1, 1),
        (3, 1, 8),
        (2, 5, 4),
        (2, 3, 3);

select oID, oDate, oPrice
from `Order`;

select distinct c.cID , c.Name, p.pID, p.pName
from Customer c join `Order` o on o.cID = c.cID
join OrderDetail od on o.oID = od.oID
join Product p on p.pID = od.pID;

select c.Name
from Customer c 
where c.cID not in (select cID from `Order`);

select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as oTotalPrice
from `Order` o join OrderDetail od on o.oID = od.oID
join Product p on p.pID = od.pID
group by o.oID;