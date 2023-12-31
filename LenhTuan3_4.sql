USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 9/21/2023 11:17:17 AM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 8192KB , MAXSIZE = 20480KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBH', N'ON'
GO
ALTER DATABASE [QLBH] SET QUERY_STORE = OFF
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[DonGia] [money] NULL,
	[chietKhau] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] NOT NULL,
	[NgayLapHD] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[NoiChuyen] [char](60) NOT NULL,
	[MaKH] [char](5) NULL,
	[LoaiHD] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](5) NOT NULL,
	[TenKH] [char](40) NOT NULL,
	[LoaiKH] [char](3) NULL,
	[DiaChi] [char](60) NULL,
	[Phone] [char](24) NULL,
	[DCEmail] [char](50) NULL,
	[DiemTL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [char](5) NOT NULL,
	[TenNCC] [char](40) NOT NULL,
	[DiaChi] [char](60) NULL,
	[Phone] [char](24) NULL,
	[SoFax] [char](24) NULL,
	[DCEmail] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[MaNhom] [int] NOT NULL,
	[TenNhom] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
alter table NhomSanPham
alter column TenNhom varchar (30)
/****** Object:  Table [dbo].[SanPham]    Script Date: 9/21/2023 11:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] NOT NULL,
	[TenSp] [char](40) NOT NULL,
	[MaNCC] [char](5) NULL,
	[MoTa] [char](50) NULL,
	[MaNhom] [int] NULL,
	[DonViTinh] [char](20) NULL,
	[GiaGoc] [money] NULL,
	[SLTon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ('9/21/2023') FOR [NgayLapHD]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT ('N') FOR [LoaiHD]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomSanPham] ([MaNhom])
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD CHECK  (([chietKhau]>=(0)))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD CHECK  (([NgayLapHD]>=[NgayLapHD]))
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [NgayGiao] CHECK  (([NgayGiao]>=[NgayLapHD]))
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [NgayGiao]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD CHECK  (([DiemTL]>=(0)))
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD CHECK  (([LoaiKH]='VL' OR [LoaiKH]='TV' OR [LoaiKH]='VIP'))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([GiaGoc]>(0)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([SLTon]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
insert into NhomSanPham values (1,N'Điện tử')
insert into NhomSanPham values (2,N'Gia dụng')
insert into NhomSanPham values (3,N'Dụng cụ gia đình')
insert into NhomSanPham values (4,N'Các mặt hàng khác')
select * from NhomSanPham
go 
insert into NhaCungCap values (1,'Cong ty TNHH Nam Phuong','1 Le Loi Phuong 4 Quan Go Vap', 0123456789,1234,'Namphuong@yahoo.com')
insert into NhaCungCap values (2,'Cong ty Lan Ngoc','12 Cao Ba Quat Quan 1 Tp HCM', 0123456789,1234,'LanNgoc@gmail.com')
go 
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (1, 'May Tinh', 'cai', 7000000, 100, 1,1,'May Sony Ram 2gb')
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (2, 'Ban Phim', 'cai', 100000, 50, 1,1,'Ban phim 101 phim')
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (3, 'Chuot', 'cai', 800000, 150, 1,1,'Chuot khong day')
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (4, 'CPU', 'cai', 3000000, 200, 1,1,'CPU')
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (5, 'USB', 'cai', 500000, 100, 1,1,'8GB')
insert into SanPham (MaSP, TenSp,DonViTinh, GiaGoc,SLTon,MaNhom,MaNCC, MoTa)  values (6, 'Lo Vi Song', 'cai', 100000000, 20, 3,2,null)
go
insert into HoaDon (MaHD, NgayLapHD, MaKH, NgayGiao, NoiChuyen) values 
(1, '2023-09-27', 1, '2023-09-28', 'Cua hang ABC')
insert into HoaDon (MaHD, NgayLapHD, MaKH, NgayGiao, NoiChuyen) values 
(2, '2023-09-27', 2, '2023-09-28', '23 Le Loi Quan Go Vap')
insert into HoaDon (MaHD, NgayLapHD, MaKH, NgayGiao, NoiChuyen) values 
(3, '2023-09-27', 3, '2023-09-28', '2 Nguyen Du Quan Go Vap')
go
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(1,1, 8000, 5)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(1,2, 12000, 4)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(1,3, 10000, 15)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(2,2, 12000, 9)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(2,4, 8000, 5)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(3,2, 3500, 20)
insert into CTHoaDon (MaHD, MaSP, DonGia,SoLuong) values 
(3,3, 1000, 15)
alter table CTHoaDon add  SoLuong int
go
update SanPham
set GiaGoc = GiaGoc + GiaGoc*0.05 where MaSP = 2
update SanPham 
set SLTon = SLTon + 100 where (MaNhom = 3 and MaNCC = 2)
select * from SanPham
update SanPham
set MoTa = 'Day la lo vi song' where TenSp = 'Lo Vi Song'
update KhachHang
set MaKH = 'VI003' where MaKH = '3'
update HoaDon
set MaKH = null where MaKH = 3
update HoaDon
set MaKH = null where MaKH = 1
update KhachHang
set MaKH = 'VL001' where MaKH = '1'
update HoaDon
set MaKH = null where MaKH = 2
update KhachHang
set MaKH = 'T0002' where MaKH = '2'
delete from NhomSanPham where MaNhom = 4
delete from CTHoaDon where (MaHD = 1 and MaSP = 3)
delete from HoaDon where(MaHD = 1)
delete from CTHoaDon where MaHD = 1
delete from HoaDon where(MaHD = 2)
delete from CTHoaDon where MaHD = 2
