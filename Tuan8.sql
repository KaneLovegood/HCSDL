<<<<<<< HEAD
﻿--1.  Liệt kê các product có đơn giá  bán  lớn hơn đơn giá  bán  trung bình của 
--các product. Thông tin gồm ProductID, ProductName, Unitprice . 
select ProductID, ProductName, Unitprice
from  products p 
where (p.unitprice) > (select avg(od.unitprice) from orderdetails od)
--Trường ĐH Công Nghiệp TP.HCM    Bài Tập Thực Hành Môn Hệ Cơ Sở Dữ Liệu
--Khoa Công Nghệ Thông Tin    43/51
--2.  Liệt kê các  product có đơn giá  bán  lớn hơn đơn giá  bán  trung bình của 
--các product có ProductName bắt đầu là ‘N’
select * from Products p
where p.UnitPrice > (select avg(od.UnitPrice) from OrderDetails od) and p.ProductName like 'N%'
--3.  Danh sách các products có đơn giá  mua  lớn hơn đơn giá  mua  nhỏ nhất 
--của tất cả các products
select * from Products
where UnitPrice > (select min(UnitPrice) from Products)
--4.  Cho biết những product  có đơn vị tính có chữ  ‘box’    và  có số lượng bán 
--lớn hơn số lượng trung bình bán ra.
select * from OrderDetails od join Products p on od.ProductID = p.ProductID
where p.QuantityPerUnit like '%box%' and od.Quantity > (select avg(Quantity) from OrderDetails)
--5.  Cho biết những sản phẩm có tên  bắt đầu bằng chữ N  và đơn giá bán > 
--đơn giá bán của (tất cả) những sản phẩm khác
select * from Products p join OrderDetails od on p.ProductID = od.ProductID
where p.ProductName like 'N%'
and od.UnitPrice > (select max(od.UnitPrice) from OrderDetails od join Products p on od.ProductID = p.ProductID where p.ProductName not like 'N%')
--6.  Cho biết những  sản phẩm thuộc nhóm hàng có mã 4 (categoryID)  và có 
--tổng số lượng bán lớn hơn  (tất cả)  tổng số lượng của những sản phẩm 
--không thuộc nhóm hàng mã 4
--Lưu  ý  :  Có  nhiều  phương  án  thực  hiện  các  truy  vấn  sau.  Hãy  đưa  ra 
--phương án sử dụng subquery.
select * from Products p
where p.CategoryID = 4 and 
p.UnitsInStock > (select sum(p.UnitsInStock) from Products p where p.CategoryID <> 4)
--7.  Danh sách các products đã có khách hàng mua hàng (tức là ProductID có 
--trong  [Order  Details]).  Thông  tin  bao  gồm  ProductID,  ProductName, 
--Unitprice
select ProductID,  ProductName, Unitprice from Products p
where p.ProductID in (select distinct od.productid from OrderDetails od)
--8.  Danh sách các hóa đơn của những  khách hàng  ở thành phố LonDon và 
--Madrid.
select * from Orders o join Customers c on o.CustomerID = c.CustomerID
where c.City in ('LonDon' , 'Madrid')
--9.  Liệt kê các sản phẩm có trên 20 đơn hàng trong  quí 3  năm 1998, thông 
--tin gồm ProductID, ProductName.
select p.ProductID, ProductName from Products p join OrderDetails od on p.ProductID = od.ProductID
join Orders o on o.OrderID = od.OrderID
where p.UnitsOnOrder > 20 and year(o.OrderDate) = 1998 and datepart(quarter(o.OrderDate)) = 3
--10.  Liệt kê danh sách các sản phẩm chưa bán được trong tháng 6 năm 1996
--11.  Liệt kê danh sách các Employes không lập hóa đơn vào ngày hôm nay
--12.  Liệt kê danh sách các Customers chưa mua hàng trong năm 1997
--13.  Tìm tất cả các Customers mua các sản phẩm có tên bắt đầu bằng chữ T 
--trong tháng 7 năm 1997
--14.  Liệt kê danh sách các khách hàng mua các hóa đơn mà các hóa đơn này 
--chỉ mua những sản phẩm có mã >=3 
--15.  Tìm các Customer chưa từng lập  hóa đơn (viết bằng ba cách: dùng NOT 
--EXISTS, dùng LEFT JOIN, dùng NOT IN )
--16.  Cho biết sản phẩm nào có đơn giá bán cao nhất trong số những sản phẩm
--có đơn vị tính có chứa chữ ‘box’ .
--17.  Danh sách các Products có tổng số lượng (Quantity) bán được lớn nhất.
--18.  Bạn hãy mô tả kết quả của các câu truy vấn sau ?
--Select ProductID, ProductName, UnitPrice From [Products]
--Where Unitprice>ALL (Select Unitprice from [Products] where 
--ProductName like ‘N%’)
--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice>ANY (Select Unitprice from [Products] where 
--ProductName like ‘N%’) 
--Trường ĐH Công Nghiệp TP.HCM    Bài Tập Thực Hành Môn Hệ Cơ Sở Dữ Liệu
--Khoa Công Nghệ Thông Tin    44/51
--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice=ANY (Select Unitprice from [Products] where
--ProductName like ‘N%’)
--Select ProductId, ProductName, UnitPrice from [Products]
--Where ProductName like ‘N%’ and 
--Unitprice>=ALL (Select Unitprice from [Products] where
=======
﻿--1.  Liệt kê các product có đơn giá  bán  lớn hơn đơn giá  bán  trung bình của 
--các product. Thông tin gồm ProductID, ProductName, Unitprice . 
select ProductID, ProductName, Unitprice
from  products p 
where (p.unitprice) > (select avg(od.unitprice) from orderdetails od)
--Trường ĐH Công Nghiệp TP.HCM    Bài Tập Thực Hành Môn Hệ Cơ Sở Dữ Liệu
--Khoa Công Nghệ Thông Tin    43/51
--2.  Liệt kê các  product có đơn giá  bán  lớn hơn đơn giá  bán  trung bình của 
--các product có ProductName bắt đầu là ‘N’
select * from Products p
where p.UnitPrice > (select avg(od.UnitPrice) from OrderDetails od) and p.ProductName like 'N%'
--3.  Danh sách các products có đơn giá  mua  lớn hơn đơn giá  mua  nhỏ nhất 
--của tất cả các products
select * from Products
where UnitPrice > (select min(UnitPrice) from Products)
--4.  Cho biết những product  có đơn vị tính có chữ  ‘box’    và  có số lượng bán 
--lớn hơn số lượng trung bình bán ra.
select * from OrderDetails od join Products p on od.ProductID = p.ProductID
where p.QuantityPerUnit like '%box%' and od.Quantity > (select avg(Quantity) from OrderDetails)
--5.  Cho biết những sản phẩm có tên  bắt đầu bằng chữ N  và đơn giá bán > 
--đơn giá bán của (tất cả) những sản phẩm khác
select * from Products p join OrderDetails od on p.ProductID = od.ProductID
where p.ProductName like 'N%'
and od.UnitPrice > (select max(od.UnitPrice) from OrderDetails od join Products p on od.ProductID = p.ProductID where p.ProductName not like 'N%')
--6.  Cho biết những  sản phẩm thuộc nhóm hàng có mã 4 (categoryID)  và có 
--tổng số lượng bán lớn hơn  (tất cả)  tổng số lượng của những sản phẩm 
--không thuộc nhóm hàng mã 4
--Lưu  ý  :  Có  nhiều  phương  án  thực  hiện  các  truy  vấn  sau.  Hãy  đưa  ra 
--phương án sử dụng subquery.
select * from Products p
where p.CategoryID = 4 and 
p.UnitsInStock > (select sum(p.UnitsInStock) from Products p where p.CategoryID <> 4)
--7.  Danh sách các products đã có khách hàng mua hàng (tức là ProductID có 
--trong  [Order  Details]).  Thông  tin  bao  gồm  ProductID,  ProductName, 
--Unitprice
select ProductID,  ProductName, Unitprice from Products p
where p.ProductID in (select distinct od.productid from OrderDetails od)
--8.  Danh sách các hóa đơn của những  khách hàng  ở thành phố LonDon và 
--Madrid.
select * from Orders o join Customers c on o.CustomerID = c.CustomerID
where c.City in ('LonDon' , 'Madrid')
--9.  Liệt kê các sản phẩm có trên 20 đơn hàng trong  quí 3  năm 1998, thông 
--tin gồm ProductID, ProductName.
select p.ProductID, ProductName from Products p join OrderDetails od on p.ProductID = od.ProductID
join Orders o on o.OrderID = od.OrderID
where p.UnitsOnOrder > 20 and year(o.OrderDate) = 1998 and datepart(quarter(o.OrderDate)) = 3
--10.  Liệt kê danh sách các sản phẩm chưa bán được trong tháng 6 năm 1996
--11.  Liệt kê danh sách các Employes không lập hóa đơn vào ngày hôm nay
--12.  Liệt kê danh sách các Customers chưa mua hàng trong năm 1997
--13.  Tìm tất cả các Customers mua các sản phẩm có tên bắt đầu bằng chữ T 
--trong tháng 7 năm 1997
--14.  Liệt kê danh sách các khách hàng mua các hóa đơn mà các hóa đơn này 
--chỉ mua những sản phẩm có mã >=3 
--15.  Tìm các Customer chưa từng lập  hóa đơn (viết bằng ba cách: dùng NOT 
--EXISTS, dùng LEFT JOIN, dùng NOT IN )
--16.  Cho biết sản phẩm nào có đơn giá bán cao nhất trong số những sản phẩm
--có đơn vị tính có chứa chữ ‘box’ .
--17.  Danh sách các Products có tổng số lượng (Quantity) bán được lớn nhất.
--18.  Bạn hãy mô tả kết quả của các câu truy vấn sau ?
--Select ProductID, ProductName, UnitPrice From [Products]
--Where Unitprice>ALL (Select Unitprice from [Products] where 
--ProductName like ‘N%’)
--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice>ANY (Select Unitprice from [Products] where 
--ProductName like ‘N%’) 
--Trường ĐH Công Nghiệp TP.HCM    Bài Tập Thực Hành Môn Hệ Cơ Sở Dữ Liệu
--Khoa Công Nghệ Thông Tin    44/51
--Select ProductId, ProductName, UnitPrice from [Products]
--Where Unitprice=ANY (Select Unitprice from [Products] where
--ProductName like ‘N%’)
--Select ProductId, ProductName, UnitPrice from [Products]
--Where ProductName like ‘N%’ and 
--Unitprice>=ALL (Select Unitprice from [Products] where
>>>>>>> a56c3efa61a232f1192d350a159117977b01658c
--ProductName like ‘N%’)