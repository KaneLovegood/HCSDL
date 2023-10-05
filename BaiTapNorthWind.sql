﻿--1.  Liệt kê danh sách các mặt hàng (Products).
select * from Products
--2.  Liệt  kê  danh  sách  các  mặt  hàng  (Products).  Thông  tin  bao  gồm 
--ProductID, ProductName, UnitPrice.
select ProductID, ProductName, UnitPrice from Products
--3.  Liệt  kê  danh  sách  các  nhân  viên  (Employees).  Thông  tin  bao  gồm 
--EmployeeID,  EmployeeName,  Phone,  Age.  Trong  đó  EmployeeName 
--được  ghép  từ  LastName  và  FirstName;  Age  là  tuổi  được  tính  dựa  trên
--năm hiện hành (GetDate()) và năm sinh.
select EmployeeID,LastName + FirstName as EmployeeName, HomePhone as Phone, year(getdate()) - year(BirthDate)  from Employees
--4.  Liệt  kê  danh  sách  các  khách  hàng  (Customers)  mà  người  đại  diện  có
--ContactTitle  bắt  đầu  bằng  chữ  ‘O’.  Thông  tin  bao  gồm  CustomerID, 
--CompanyName, ContactName, ContactTitle, City, Phone.
select CustomerID, CompanyName,ContactName, ContactTitle, City, Phone from Customers where ContactTitle like 'O%' 
--5.  Liệt kê danh sách  khách hàng (Customers)  ở thành phố LonDon, Boise 
--và Paris.
select * from Customers where city in ('LonDon' , 'Boise' , 'Paris')
--6.  Liệt kê danh sách khách hàng (Customers) có tên bắt đầu bằng chữ V mà 
--ở thành phố Lyon.
select * from Customers where City = 'Lyon' and ContactName like 'V%'
--7.  Liệt kê danh sách các khách hàng (Customers) không có số fax.
select * from Customers where Fax is null
--8.  Liệt kê danh sách các khách hàng (Customers) có số Fax.
select * from Customers where Fax is not null
--9.  Liệt kê danh sách nhân viên (Employees) có năm sinh <=1960
select * from Employees where year(BirthDate) <= 1960
--10.  Liệt kê danh sách các  sản phẩm (Products)  có  chứa chữ  ‘Boxes’ trong 
--cột QuantityPerUnit. 
select * from Products where QuantityPerUnit like '%Boxes%'
--11.  Liệt  kê  danh  sách  các  mặt  hàng  (Products)  có  đơn  giá  (Unitprice)  lớn 
--hơn 10 và nhỏ hơn 15.  
select * from Products where UnitPrice >= 10 and UnitPrice <= 15
--Trường ĐH Công Nghiệp TP.HCM    Bài Tập Thực Hành Môn Hệ Cơ Sở Dữ Liệu
--Khoa Công Nghệ Thông Tin    40/51
--12.  Liệt kê danh sách các mặt hàng (Products) có số lượng tồn nhỏ hơn 5.
select * from Products where UnitsInStock <= 5
--13.  Liệt kê danh sách các  mặt hàng  (Products)  ứng với tiền tồn vốn. Thông 
--tin  bao  gồm  ProductId,  ProductName,  Unitprice,  UnitsInStock,  Total. 
--Trong đó Total= UnitsInStock*Unitprice.  Được sắp xếp theo Total  giảm 
--dần.
select ProductId,  ProductName,  Unitprice,  UnitsInStock, UnitsInStock*Unitprice as Total from Products
order by Total desc
--14.  Hiển thị thông tin OrderID, OrderDate, CustomerID, EmployeeID của  2 
--hóa đơn có mã OrderID là ‘10248’ và ‘10250’
select OrderID, OrderDate, CustomerID, EmployeeID from Orders where orderId in ('10248' , '10250')
--15.  Liệt  kê  chi  tiết  của  hóa  đơn  có  OrderID  là  ‘10248’.  Thông  tin  gồm 
--OrderID,  ProductID,  Quantity,  Unitprice,  Discount,  ToTalLine  = 
--Quantity * unitPrice *(1-Discount) 
select OrderID,  ProductID,  Quantity,  Unitprice,  Discount, Quantity * unitPrice *(1-Discount) as ToTalLine
from OrderDetails where orderid = '10248'
--16.  Liệt  kê  danh  sách  các  hóa  đơn  (orders)  có  OrderDate  được  lập  trong 
--tháng 9 năm 1996.  Được sắp xếp theo mã khách hàng, cùng mã khách 
--hàng sắp xếp theo ngày lập hóa đơn giảm dần.
select * from orders where year(OrderDate) = 1996 and month(orderdate) = 9
order by customerid, orderdate desc
--17.  Liệt kê danh sách các hóa đơn (Orders) được lập trong quý 4 năm 1997. 
--Thông  tin  gồm  OrderID,  OrderDate,  CustomerID,  EmployeeID.  Được 
--sắp xếp theo tháng của ngày lập hóa đơn.
select OrderID,  OrderDate,  CustomerID,  EmployeeID from orders 
where datepart(QUARTER, OrderDate) = 4
order by month(orderdate)
--18.  Liệt kê danh sách các hóa đơn (Orders) được lập trong trong ngày thứ 7 
--và chủ nhật của tháng 12 năm 1997. Thông tin gồm OrderID, OrderDate, 
--Customerid,  EmployeeID,  WeekDayOfOrdate  (Ngày  thứ  mấy  trong 
--tuần). 
select OrderID, OrderDate,Customerid,  EmployeeID,datepart(WEEKDAY, orderdate) as WeekDayOfOrdate from orders
where 
datepart(weekday,orderdate) = 7 or datepart(weekday,orderdate) = 8 and 
month(OrderDate) = 12 and year(orderdate) = 1997

--19.  Liệt kê danh sách 5 customers có city có ký tự bắt đầu  ‘M’.
select top 5 * from customers where city like 'M%' 

--20.  Liệt  kê  danh  sách  2  employees  có  tuổi  lớn  nhất.  Thông  tin  bao  gồm 
--EmployeeID,  EmployeeName,  Age.  Trong  đó,  EmployeeName  được 
--ghép từ LastName và FirstName; Age là tuổi.
select top 2 EmployeeID,LastName + FirstName as EmployeeName,year(getdate()) - year(birthdate) as  Age from Employees
order by age desc