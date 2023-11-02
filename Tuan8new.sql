--1. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product. Thông tin gồm ProductID, ProductName, Unitprice .
select ProductID, ProductName, Unitprice
from Products p
where UnitPrice > (select AVG(UnitPrice) from Products)
order by p.ProductID, UnitPrice
--2. Liệt kê các product có đơn giá bán lớn hơn đơn giá bán trung bình của
--các product có ProductName bắt đầu là ‘N’
select ProductID, ProductName, Unitprice
from Products p
where UnitPrice > (select AVG(UnitPrice) from Products) and ProductName like '%N%'
order by p.ProductID, UnitPrice
--3. Danh sách các products có đơn giá mua lớn hơn đơn giá mua nhỏ nhất
--của tất cả các products
select ProductID, ProductName, Unitprice
from Products p
where UnitPrice > (select min(UnitPrice) from Products)
order by p.ProductID, UnitPrice
--4. Cho biết những product có đơn vị tính có chữ ‘box’ và có số lượng bán
--lớn hơn số lượng trung bình bán ra.
select p.ProductID, ProductName, sum(od.Quantity) as sumQuantity, p.QuantityPerUnit
from Products p join [Order Details] od on p.ProductID = od.ProductID
where p.QuantityPerUnit like '%box%' and od.Quantity > (select avg(Quantity) from [Order Details])
group by p.ProductID, ProductName, p.QuantityPerUnit
order by p.ProductID, sumQuantity
--5. Cho biết những sản phẩm có tên bắt đầu bằng chữ N và đơn giá bán >
--đơn giá bán của (tất cả) những sản phẩm khác
select p.ProductID, ProductName, p.UnitPrice
from Products p 
where p.UnitPrice > all (select UnitPrice from Products) and p.ProductName like 'N%'
order by ProductName
--6. Cho biết những sản phẩm thuộc nhóm hàng có mã 4 (categoryID) và có
--tổng số lượng bán lớn hơn (tất cả) tổng số lượng của những sản phẩm
--không thuộc nhóm hàng mã 4
--Lưu ý : Có nhiều phương án thực hiện các truy vấn sau. Hãy đưa ra
--phương án sử dụng subquery.
select c.CategoryID, p.ProductID, ProductName, sum(od.Quantity) as Total
from Products p join Categories c on p.CategoryID = c.CategoryID join [Order Details] od on od.ProductID = p.ProductID
where c.CategoryID = 4 
group by c.CategoryID, p.ProductID, ProductName
having sum(od.Quantity) > all (select sum(Quantity) from [Order Details] od join Products p on od.ProductID = p.ProductID where CategoryID <> 4)

--7. Danh sách các products đã có khách hàng mua hàng (tức là ProductID có
--trong [Order Details]). Thông tin bao gồm ProductID, ProductName,
--Unitprice
select p.ProductID, ProductName,od.Unitprice
from Products p join [Order Details] od on p.ProductID = od.ProductID
where p.ProductID  in (select  Productid from [Order Details])
--8. Danh sách các hóa đơn của những khách hàng ở thành phố LonDon và
--Madrid.
select c.CustomerID, c.ContactName, o.OrderID, c.City
from Orders o join Customers c on o.CustomerID = c.CustomerID
where c.City in ('LonDon', 'Madrid')
--9. Liệt kê các sản phẩm có trên 20 đơn hàng trong quí 3 năm 1998, thông
--tin gồm ProductID, ProductName.
select ProductID, ProductName
from Products p where ProductID in (select od.ProductID from [Order Details] od join Orders o on od.OrderID = o.OrderID
where datepart(QUARTER, o.OrderDate) = 3 and year(o.OrderDate) = 1998
group by od.ProductID
having count(od.OrderID) > 20
)
--10. Liệt kê danh sách các sản phẩm chưa bán được trong tháng 6 năm 1996
select ProductID, ProductName
from Products p where ProductID not in (select od.ProductID from [Order Details] od join Orders o on od.OrderID = o.OrderID
where month( o.OrderDate) = 6 and year(o.OrderDate) = 1996
)
--11. Liệt kê danh sách các Employes không lập hóa đơn vào ngày hôm nay
select e.EmployeeID, e.FirstName, e.LastName
from Employees e 
where e.EmployeeID not in (select o.EmployeeID from Orders o where o.OrderDate = getdate())
--12. Liệt kê danh sách các Customers chưa mua hàng trong năm 1997
select c.CustomerID, c.ContactName
from Customers c 
where c.CustomerID not in (select o.CustomerID  from Orders o where year(o.OrderDate) = 1997)
--13. Tìm tất cả các Customers mua các sản phẩm có tên bắt đầu bằng chữ T
--trong tháng 7 năm 1997
select c.CustomerID, c.ContactName
from Customers c 
where c.CustomerID in (select o.CustomerID  from Orders o join [Order Details] od on o.OrderID = od.OrderID join Products p on p.ProductID = od.ProductID
where year(o.OrderDate) = 1997 and month(o.OrderDate) = 7 and p.ProductName like 'T%' ) 
--14. Liệt kê danh sách các khách hàng mua các hóa đơn mà các hóa đơn này
--chỉ mua những sản phẩm có mã >=3
select c.CustomerID, c.ContactName
from Customers c 
where c.CustomerID in (select o.CustomerID  from Orders o join [Order Details] od on o.OrderID = od.OrderID 
where  od.ProductID >= 3 )
--15. Tìm các Customer chưa từng lập hóa đơn (viết bằng ba cách: dùng NOT
--EXISTS, dùng LEFT JOIN, dùng NOT IN )
--not exists:

select c.CustomerID, c.ContactName
from Customers c 
where not exists (select 1  from Orders o where o.CustomerID = c.CustomerID)
--left join
select c.CustomerID, c.ContactName
from Customers c left join Orders o on c.CustomerID = o.CustomerID
where o.CustomerID is null
--not in
select c.CustomerID, c.ContactName
from Customers c
where c.CustomerID not in (select CustomerID from Orders)
--16. Cho biết sản phẩm nào có đơn giá bán cao nhất trong số những sản phẩm
--có đơn vị tính có chứa chữ ‘box’ .
select top 1 p.ProductID, p.ProductName, p.QuantityPerUnit, p.UnitPrice
from Products p 
where p.QuantityPerUnit like '%box%' 
order by p.UnitPrice desc

--17. Danh sách các Products có tổng số lượng (Quantity) bán được lớn nhất.
select top 1 p.ProductID, p.ProductName, sum(Quantity) as Total
from Products p join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
order by Total desc
--18. Bạn hãy mô tả kết quả của các câu truy vấn sau ?
--Select ProductID, ProductName, UnitPrice From [Products]
--Where Unitprice>ALL (Select Unitprice from [Products] where
--ProductName like ‘N%’)


--Câu truy vấn này sẽ trả về danh sách các sản phẩm có 
--đơn giá cao hơn đơn giá của tất cả các sản phẩm có tên 
--bắt đầu bằng chữ ‘N’. 
--Nếu không có sản phẩm nào có tên bắt đầu bằng ‘N’ hoặc 
--nếu không có sản phẩm nào có đơn giá cao hơn tất cả 
--các sản phẩm có tên bắt đầu bằng ‘N’, câu truy vấn sẽ không trả về 
--kết quả nào.




--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice>ANY (Select Unitprice from [Products] where
--ProductName like ‘N%’)

--Câu truy vấn này sẽ trả về danh sách các sản phẩm 
--có đơn giá cao hơn đơn giá của bất kỳ sản phẩm nào 
--có tên bắt đầu bằng chữ ‘N’. Nếu không có sản phẩm 
--nào có tên bắt đầu bằng ‘N’, câu truy vấn sẽ không 
--trả về kết quả nào.


--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice=ANY (Select Unitprice from [Products] where
--ProductName like ‘N%’)

--Câu truy vấn này sẽ trả về danh sách các sản phẩm có đơn giá 
--bằng với đơn giá của bất kỳ sản phẩm nào có tên bắt đầu 
--bằng chữ ‘N’. Nếu không có sản phẩm nào có tên bắt đầu bằng
--‘N’, câu truy vấn sẽ không trả về kết quả nào.

--Select ProductId, ProductName, UnitPrice from [Products]
--Where ProductName like ‘N%’ and
--Unitprice>=ALL (Select Unitprice from [Products] where
--ProductName like ‘N%’)

--Câu truy vấn này sẽ trả về danh sách các sản phẩm có 
--tên bắt đầu bằng chữ ‘N’ và có đơn giá cao nhất trong số 
--những sản phẩm có tên bắt đầu bằng chữ ‘N’. Nếu không có 
--sản phẩm nào có tên bắt đầu bằng ‘N’, câu truy vấn sẽ không 
--trả về kết quả nào.