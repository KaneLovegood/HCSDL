--a.  Insert  dữ liệu vào bảng KhachHang trong QLBH  với dữ liệu nguồn là 
--bảng Customers trong NorthWind.

insert into KhachHang (MaKh, TenKh, DiaChi, Phone, SoFax)
select c.CustomerID, c.ContactName, c.Address, c.Phone, c.Fax 
from Northwind.dbo.Customers c

--b.  Insert dữ liệu vào  bảng Sanpham trong QLBH. Dữ liệu nguồn là các 
--sản  phẩm  có  SupplierID  từ  4  đến  29  trong  bảng 
--Northwind.dbo.Products 
insert into NhaCungCap
select s.SupplierID, s.CompanyName, s.Address, s.Phone, s.Fax, s.
from Northwind.dbo.Suppliers s

insert into SanPham
select 
from Northwind.dbo.Products p

--c.  Insert dữ liệu vào  bảng  HoaDon  trong QLBH. Dữ liệu nguồn là  các 
--hoá  đơn  có  OrderID  nằm  trong  khoảng  10248  đến  10350  trong
--NorthWind.dbo.[Orders]
--d.  Insert dữ liệu vào  bảng CT_HoaDon  trong QLBH. Dữ liệu nguồn là
--các chi tiết hoá đơn có OderID nằm trong khoảng 10248 đến 10350 
--trong NorthWind.dbo.[Order Detail