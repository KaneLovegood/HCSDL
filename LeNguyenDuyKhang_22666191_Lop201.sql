--22666191 Le Nguyen Duy Khang H.3.1 
--1.	Liệt kê danh sách tên của khách hàng ( companyName) 
--có tổng tiền mua hàng lớn nhất trong năm 1997(subquery)
select top 1 c.CompanyName, sum(Quantity * UnitPrice) as Total
from Customers c join Orders o on c.CustomerID = o.CustomerID 
join [Order Details] od on od.OrderID = o.OrderID
where year(OrderDate) = 1997
group by c.CompanyName
order by Total desc
--2.	Danh sách các Category có tổng số lượng tồn (UnitsInStock) lớn hơn 300, Thông tin kết quả bao gồm 
--CategoryID, CategoryName, Total_UnitsInStock
select c.CategoryID, CategoryName, sum(p.UnitsInStock) as Total_UnitsInStock
from Categories c join Products p on c.CategoryID = p.CategoryID
group by c.CategoryID, CategoryName
having sum(p.UnitsInStock) > 300
--3.	Liệt kê danh sách các Customers ứng với tổng số hoá đơn được lập trong Quý 1/1998  . 
--Thông tin được sắp xếp theo CustomerID, cùng CustomerID,t thì sắp xếp theo tổng hóa đơn  giảm dần.
select c.CustomerID, sum(OrderID) as Total
from Customers c join Orders o  on c.CustomerID = o.CustomerID
where datepart(QUARTER, OrderDate) = 1 and year(OrderDate) = 1998
group by c.CustomerID
order by c.CustomerID, total desc
--4.	Cho biết khách hàng nào có số lần mua hàng lớn hơn 5 trong năm 1997. 
select c.CustomerID, count (OrderID) as total
from Customers c join Orders o on c.CustomerID = o.CustomerID
where year(OrderDate) = 1997
group by c.CustomerID
having count(OrderID) > 5
order by total
--5.	Liệt kê danh sách các productID có tổng số tiền bán được trong năm 1998 lớn hơn tổng số tiền bán được lớn nhất  trong 1997 
select p.ProductID, sum (od.Quantity * od.UnitPrice) as Total
from Products p join [Order Details] od on p.ProductID = od.ProductID join Orders o on o.OrderID = od.OrderID
where year(OrderDate) = 1998 
group by p.ProductID
having sum (od.Quantity * od.UnitPrice) > (select sum(od.Quantity * od.UnitPrice) as total from [Order Details] od join Orders o on od.OrderID = o.OrderID 
where year(OrderDate) =1997 )
--6.	Hãy cho biết những nhân viên có tiền thưởng lớn nhất trong năm 1998. Biết rằng tiền thưởng được tính bằng 5% tổng tiền nhân viên đó bán được (subquery)
select top 1 c.CustomerID, sum(Quantity * UnitPrice) * 5/100 as TienThuong
from Customers c join Orders o on c.CustomerID =o.CustomerID join [Order Details] od on od.OrderID = o.OrderID
where year(OrderDate) = 1998
group by c.CustomerID
order by TienThuong desc
--7.	Cho biết nhân viên nào đã lập  tổng số trên 10 hóa đơn trong tháng 8 năm 1997. Thông tin bao gồm Mã nhân viên , tên nhân viên, số hóa đơn đã lập. (subquery)
select e.EmployeeID, FirstName + LastName as EmployeeName, count(o.OrderID) as total
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where month(o.OrderDate) = 8 and year(OrderDate) = 1997 
group by e.EmployeeID, FirstName + LastName
having count(o.OrderID) > 10


--8.	Liệt kê công ty vận chuyển đã vận chuyển trên 50 đơn hàng trong năm 1998
select CompanyName
from Shippers s
where  exists (select 1 from Shippers s join Orders o on s.ShipperID = o.ShipVia having count(OrderID) > 50)
--9.	Hãy cho biết danh sách các mặt hàng đã nhập về nhưng chưa bán được. Thông tin bao gồm ProductId, ProductName,Unitprice( giá mua) ( dùng left join)
select p.ProductID, ProductName,p.UnitPrice
from Products p left join [Order Details] od  on p.ProductID = od.ProductID
where od.OrderID is null
--10.	Liệt kê thông tin mã nhân viên , tên nhân viên có tổng số đơn hàng nhiều nhất trong năm 1997  (làm bằng subquery) 
select e.EmployeeID, FirstName, LastName
from Employees e 
where exists (select 1 from Employees e join Orders o on e.EmployeeID = o.EmployeeID where year(OrderDate) = 1997 having sum(OrderID) >  max(orderid) )
