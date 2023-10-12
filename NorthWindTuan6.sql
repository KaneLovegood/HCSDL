--1.  Hiển  thị  thông  tin  về  hóa  đơn  có  mã  ‘10248’,  bao  gồm:  OrderID, 
--OrderDate,  CustomerID,  EmployeeID,  ProductID,  Quantity,  Unitprice, 
--Discount.
select o.OrderID, OrderDate,  CustomerID,  EmployeeID,  ProductID,  Quantity,  Unitprice, 
Discount
from Orders o join [OrderDetails] od on o.OrderID = od.OrderID
where o.OrderID = '10248'
--2.  Liệt  kê  các  khách  hàng  có  lập  hóa  đơn  trong  tháng  7/1997  và  9/1997. 
--Thông  tin  gồm  CustomerID,  CompanyName,  Address,  OrderID, 
--Orderdate. Được sắp xếp theo CustomerID, cùng CustomerID thì sắp xếp 
--theo OrderDate giảm dần.
select c.CustomerID,  CompanyName,  Address,  OrderID, 
Orderdate
from Orders o join Customers c on o.CustomerID = c.CustomerID 
where month(o.OrderDate) = 7 and year(o.OrderDate ) = 1997
or month (o.OrderDate ) = 9 and year(o.OrderDate ) = 1997
order by c.CustomerID, o.OrderDate desc
--3.  Liệt kê danh sách các  mặt hàng  xuất bán vào ngày 19/7/1996. Thông tin 
--gồm : ProductID, ProductName, OrderID, OrderDate, Quantity.
select p.ProductID, ProductName, o.OrderID, OrderDate, od.Quantity
from Orders o join OrderDetails od on o.OrderID = od.orderid 
join Products p on p.ProductID = od.productID

where convert(date, o.OrderDate) = '1996/7/19'

--4.  Liệt kê danh sách các mặt hàng từ nhà cung cấp (supplier) có mã 1,3,6 và
--đã  xuất  bán  trong  quý  2  năm  1997.  Thông  tin  gồm  :  ProductID, 
--ProductName,  SupplierID,  OrderID,  Quantity.  Được  sắp  xếp  theo  mã
--nhà  cung  cấp  (SupplierID),  cùng  mã  nhà  cung  cấp  thì  sắp  xếp  theo 
--ProductID.
select  p.ProductID, ProductName,  s.SupplierID, o .OrderID,  Quantity
from Suppliers s join Products p on s.SupplierID = p.SupplierID 
join orderdetails od on od.productid = p.ProductID 
join orders o on o.OrderID = od.orderid
where s.SupplierID in ('1','3','6') and datepart(QUARTEr,o.OrderDate) = 2 and year(o.OrderDate ) = 1997
order by s.SupplierID, p.ProductID desc
--5.  Liệt kê danh sách các mặt hàng có đơn giá bán bằng đơn giá mua.
select * from
OrderDetails od join Products p on od.UnitPrice = p.UnitPrice 
where od.UnitPrice = p.UnitPrice
--6.  Danh sách các  mặt hàng  bán trong ngày thứ 7 và chủ nhật của tháng 12 
--năm 1996, thông tin gồm ProductID, ProductName, OrderID, OrderDate, 
--CustomerID, Unitprice, Quantity, ToTal= Quantity*UnitPrice. Được sắp 
--xếp theo ProductID, cùng ProductID thì sắp xếp theo Quantity giảm dần.
select p.ProductID, ProductName, o.OrderID, OrderDate, 
CustomerID, p.UnitPrice, Quantity, ToTal= Quantity*p.UnitPrice
from Orders o join [OrderDetails] od on o.OrderID = od.orderid
join Products p on p.ProductID = od.productid
where year(o.OrderDate ) = 1996 and month(o.OrderDate ) = 12 and datepart(WEEKDAY, o.OrderDate) = 7
and datepart(weekday, o.OrderDate ) = 8
order by p.ProductID , od.quantity desc
--7.  Liệt kê danh sách các nhân viên  đã lập hóa đơn trong tháng 7 của năm 
--1996.  Thông  tin  gồm  :  EmployeeID,  EmployeeName,  OrderID, 
--Orderdate.
select e.EmployeeID,e.lastname + e.firstname as  EmployeeName,  o.OrderID, 
o.Orderdate
from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
where month(o.OrderDate) = 7 and year(o.OrderDate ) = 1996

--8.  Liệt kê danh sách các hóa đơn do nhân viên có Lastname là  ‘Fuller’  lập.
--Thông tin gồm : OrderID, Orderdate, ProductID, Quantity, Unitprice.
select o.OrderID, Orderdate, p.ProductID, Quantity, d.UnitPrice
from Orders o join Employees e on o.EmployeeID = e.EmployeeID 
join OrderDetails d on d.orderid = o.OrderID 
join Products p on p.ProductID = d.productid
where e.LastName like '%Fuller%'
--9.  Liệt kê chi tiết bán hàng của mỗi nhân viên theo từng hóa đơn  trong năm 
--1996. Thông tin  gồm:  EmployeeID, EmployName, OrderID, Orderdate, 
--ProductID, quantity, unitprice, ToTalLine=quantity*unitprice. 
select e.EmployeeID,e.FirstName + e.LastName as EmployName, o.OrderID, Orderdate, 
p.ProductID, quantity, p.unitprice, ToTalLine=quantity*p.unitprice
from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
join [OrderDetails] d on d.orderid = o.OrderID 
join Products p on p.ProductID = d.productid
where year(o.OrderDate ) = 1996
--10.  Danh sách các đơn hàng sẽ được giao trong các thứ 7 của tháng 12 năm 
--1996. 
select * from Orders o join Shippers s on o.ShipVia = s.ShipperID 
where datepart(weekday, o.OrderDate ) = 7 and month(o.OrderDate ) = 12 
and year(o.OrderDate ) = 1996
--11.  Liệt  kê  danh  sách  các  nhân  viên  chưa  lập  hóa  đơn  (dùng  LEFT 
--JOIN/RIGHT JOIN).
select distinct e.EmployeeID, e.FirstName, e.LastName, o.OrderID, o.OrderDate  
from Orders o right join 
Employees e on o.EmployeeID = e.EmployeeID 
where o.OrderID is null
--12.  Liệt  kê  danh  sách  các  sản  phẩm  chưa  bán  được  (dùng  LEFT 
--JOIN/RIGHT JOIN).
select * from Products p left join [OrderDetails] o on p.ProductID = o.productid
where o.productid is null
--13.  Liệt kê danh sách các khách hàng chưa mua hàng lần nào (dùng LEFT 
--JOIN/RIGHT JOIN).
select * from Orders o right join Customers c on o.CustomerID = c.CustomerID 
where o.CustomerID is null