use QLBH
create table NhomSanPham (
MaNhom int primary key,
TenNhom varchar (15) )
drop table NhomSanPham
create table NhaCungCap (
MaNCC char(5) primary key not null,
TenNCC char(40) not null,
DiaChi char (60),
Phone char(24),
SoFax char (24),
DCEmail char (50) )
create table KhachHang (
MaKH char (5) primary key not null,
TenKH char(40) not null,
LoaiKH char(3) check (LoaiKH in ('VIP','TV' ,'VL')),
DiaChi  char (60),
Phone  char(24),
DCEmail  char (50),
DiemTL int check(DiemTL >=0))
create table SanPham (
MaSP int primary key,
TenSp char(40) not null,
MaNCC char(5) references NhaCungCap(MaNCC),
MoTa char(50),
MaNhom int references NhomSanPham(MaNhom),
DonViTinh char (20),
GiaGoc money check (GiaGoc > 0),
SLTon int check (SLTon >= 0) )
create table HoaDon (
MaHD int primary key not null,
NgayLapHD dateTime default '9/21/2023' check (NgayLapHD >= NgayLapHD),
NgayGiao dateTime,
NoiChuyen char (60) not null,
MaKH char(5) references KhachHang(MaKH) )
create table CTHoaDon (
MaHD int  references HoaDon(MaHD),
MaSP int  references SanPham(MaSP),
primary key (MaHD,MaSP),
DonGia money,
chietKhau money check (chietKhau >= 0) )

alter table HoaDon add LoaiHD char (1) default 'N'
alter table HoaDon add constraint NgayGiao check (NgayGiao >= NgayLapHD)
insert into NhomSanPham values(1,'Dien tu')
insert into NhomSanPham values(2,'Dien lanh')
insert into NhaCungCap values (123, 'hang111', '12/34/23', '0123456789', '12345567890', 'hang1@email.com')
insert into SanPham values (1, 'Dien tu', 123, 'do dien tu', 1, 'vnd', 20000, 15)