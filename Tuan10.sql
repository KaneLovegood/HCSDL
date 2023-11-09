--1.  Tạo view  vw_Products_Info  hiển thị danh sách các sản phẩm từ bảng 
--Products  và  bảng  Categories.  Thông  tin  bao  gồm  CategoryName, 
--Description,  ProductName,  QuantityPerUnit,  UnitPrice,  UnitsInStock  ? 
--Thực hiện truy vấn dữ liệu từ View ?

create view vw_Products_Info
as 
SELECT        Products.QuantityPerUnit, Categories.CategoryName, Categories.Description, Products.ProductName, Products.UnitPrice, Products.UnitsInStock
FROM            Categories INNER JOIN
                         Products ON Categories.CategoryID = Products.CategoryID

select * from vw_Products_Info
--2.  Tạo view  vw_CustomerTotals  hiển thị tổng tiền  các hóa đơn của  mỗi 
--khách  hàng  theo  tháng  và  theo  năm.  Thông  tin  gồm  CustomerID, 
--YEAR(OrderDate)  AS  Year,  MONTH(OrderDate)  AS  Month, 
--SUM(UnitPrice*Quantity) ? 

create view vw_CustomerTotals
as 
SELECT        Customers.CustomerID,month( Orders.OrderDate) as "month", year(Orders.OrderDate) AS "Year",sum( [Order Details].Quantity *[Order Details].UnitPrice ) as Total
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                         [Order Details] ON Orders.OrderID = [Order Details].OrderID
						 group by Customers.CustomerID, month( Orders.OrderDate), year(Orders.OrderDate)

--Xem lại cú pháp lệnh tạo view ? Thực hiện truy vấn dữ liệu từ View ?
select * from vw_CustomerTotals
--3.  Tạo view  hiển thị  tổng số lượng sản phẩm bán được của mỗi nhân viên 
--theo  từng  năm.  Thông  tin  gồm  EmployeeID,  OrderYear, 
--SumOfQuantity. Yêu cầu : người dùng không xem được cú pháp lệnh tạo 
--view ?
--Xem lại cú pháp lệnh tạo view ? Thực hiện truy vấn dữ liệu từ View ?
--4.  Tạo view ListCustomer_view  chứa danh sách các khách hàng có trên 5 
--hóa đơn đặt hàng từ năm 1997 đến 1998,  thông tin gồm mã khách  hàng
--(CustomerID) , họ tên (CompanyName), Số hóa đơn (CountOfOrders) ?
--Thực hiện truy vấn dữ liệu từ View ?
--5.  Tạo  view  ListProduct_view  chứa  danh  sách  những  sản  phẩm  thuộc
--nhóm  hàng  ‘Beverages’  và  ‘Seafood’  có  tổng  số  lượng  bán  trong  mỗi 
--năm  trên  30  sản  phẩm,  thông  tin  gồm  CategoryName,  ProductName, 
--Year, SumOfQuantity ?
--Thực hiện truy vấn dữ liệu từ View ?
--6.  Tạo view  vw_OrderSummary  với từ khóa WITH ENCRYPTION gồm 
--OrderYear (năm của ngày lập hóa đơn), OrderMonth (tháng của ngày lập 
--hóa đơn), OrderTotal (tổng tiền sum(UnitPrice*Quantity)) ?
--Thực hiện truy vấn dữ liệu từ View ?
--Viết lệnh để thấy công dụng của từ khóa trên ?
--7.  Tạo  view  vwProducts  với  từ  khóa  WITH  SCHEMABINDING  gồm 
--ProductID, ProductName, Discount ?
--Thực hiện truy vấn dữ liệu từ View ?