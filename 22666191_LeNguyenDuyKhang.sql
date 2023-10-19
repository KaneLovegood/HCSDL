--Le Nguyen Duy Khang 22666191 422000192201
--1.Tạo CSDL QLNV có tham số như sau:
--Tham số Giá trị	
--Database name 	QLNV
--Tên logic của data file chính 	QLNV_Data
--Tên tập tin và đường dẫn của data file chính 	T:\QLNV_Data.mdf
--Kích cỡ khởi tạo của CSDL 	20 MB
--Kích cỡ tối đa của CSDL 	40 MB
--Gia số gia tăng tập tin CSDL 	1 MB
--Tên logic của transaction log 	QLNV _Log
--Tên tập tin và đường dẫn của transaction log 	T:\ QLNV _Log.ldf
--Kích cỡ khởi tạo của transaction log 	6 MB
--Kích cỡ tối đa của transaction log 	8 MB
--Gia số gia tăng tập tin transaction log 	1 MB
create database QLNV 
on primary
( name = 'QLNV_data',
filename = 'T:\QLNV_Data.mdf',
size = 20mb, maxsize = 40mb, filegrowth = 1mb)
log on ( name = 'QLNV _Log',
filename = 'T:\ QLNV _Log.ldf',
size = 6mb, maxsize = 8mb, filegrowth = 1mb)
--2. Tạo các bảng sau trong CSDL QLVV:
--PHONGBAN
--MAPB int
--TENPB Nvarchar(50)
--VITRI Nvarchar(50)
--TRUONGPHONG int
--NGANSACH numeric
--DOANHTHU numeric
create table PHONGBAN
( MAPB int primary key not null,
TENPB Nvarchar(50),
VITRI Nvarchar(50),
TRUONGPHONG int,
NGANSACH numeric,
DOANHTHU numeric)

--NHANVIEN
--MANV Int
--HOTEN Nvarchar(20)
--MACV Nvarchar(10)
--LUONG numeric
--HOAHONG numeric
--MAPB int
--PHAI int
create table NHANVIEN
(MANV Int primary key,
HOTEN Nvarchar(20),
MACV Nvarchar(10),
LUONG numeric,
HOAHONG numeric,
MAPB int references PHONGBAN(MAPB),
PHAI int)
alter table NHANVIEN with check
add constraint FK_MACV foreign key (MACV) references CONGVIEC(MACV)
--CONGVIEC
--MACV Nvarchar(10)
--TENCV Nvarchar(50)
--LUONG_MIN numeric
--LUONG_MAX numeric
create table CONGVIEC
(MACV Nvarchar(10) primary key,
TENCV Nvarchar(50),
LUONG_MIN numeric,
LUONG_MAX numeric )

--Xác định khóa chính và khóa ngoại  và tạo  các ràng buộc hoa hồng của nhân vien phải >0, LUONG_MAX > LUONG_MIN, Ngân sách >0
alter table CONGVIEC
add constraint LUONG check (LUONG_MAX > LUONG_MIN)
alter table NHANVIEN
add constraint HOAHONG check (HOAHONG > 0)
alter table PHONGBAN
add constraint NGANSACH check (NGANSACH > 0)
--3. Nhập dữ liệu vào hai bảng, mỗi bảng tối thiểu 3 mẫu tin. 
--Trong bảng NHANVIEN  nhập 1 Nhân viên  có hoa hồng  20000000. 
--Trong bảng Phòng Ban nhập 1 mã phòng ban Phó Giám đốc . 
--Các thông tin khác tùy chọn.
insert into phongban values (1,'phong dao tao', 'a1', 1, 10, 10)
insert into phongban values (2,'phong tai chinh', 'a2', 2, 15, 15)
insert into phongban values (3,'phong kinh doanh', 'a3', 3, 20, 20)
insert into phongban values (4,'Pho giam doc', 'a4', 1, 22, 24)
insert into CONGVIEC values (1,'ke toan',1000000, 3000000)
insert into CONGVIEC values (2,'Tap vu',500000, 2000000)
insert into CONGVIEC values (3,'Quan ly',1500000, 4000000)
insert into NHANVIEN values (1, 'Khang', 3, 30000000, 1000000, 3, 1)
insert into NHANVIEN values (2, 'Khang Le', 1, 2000000, 1000000, 1, 1)
insert into NHANVIEN values (3, 'Le Lam', 3, 30000000, 1000000, 2, 2)
insert into NHANVIEN values (4, 'Lam Le', 3, 30000000, 20000000, 2, 2)
--4.  Sửa hoa hồng của nhân viên có hoa hồng 20000000 thành 25000000 
update NHANVIEN set HOAHONG = 25000000 
from NHANVIEN
where HOAHONG = 20000000
--5. Xóa Phòng Ban có mã phòng ban là  Phó Giám đốc 
delete from PHONGBAN where MAPB = 4
