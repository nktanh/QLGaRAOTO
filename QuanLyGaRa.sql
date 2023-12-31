USE [master]
GO
/****** Object:  Database [DA_QLGarage]    Script Date: 12/14/2023 9:57:38 PM ******/
CREATE DATABASE [DA_QLGarage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DA_QLGarage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DA_QLGarage.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DA_QLGarage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DA_QLGarage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DA_QLGarage] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DA_QLGarage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DA_QLGarage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DA_QLGarage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DA_QLGarage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DA_QLGarage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DA_QLGarage] SET ARITHABORT OFF 
GO
ALTER DATABASE [DA_QLGarage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DA_QLGarage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DA_QLGarage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DA_QLGarage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DA_QLGarage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DA_QLGarage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DA_QLGarage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DA_QLGarage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DA_QLGarage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DA_QLGarage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DA_QLGarage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DA_QLGarage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DA_QLGarage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DA_QLGarage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DA_QLGarage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DA_QLGarage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DA_QLGarage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DA_QLGarage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DA_QLGarage] SET  MULTI_USER 
GO
ALTER DATABASE [DA_QLGarage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DA_QLGarage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DA_QLGarage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DA_QLGarage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DA_QLGarage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DA_QLGarage] SET QUERY_STORE = OFF
GO
USE [DA_QLGarage]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DA_QLGarage]
GO
/****** Object:  User [DAQLGarage]    Script Date: 12/14/2023 9:57:38 PM ******/
CREATE USER [DAQLGarage] FOR LOGIN [DAQLGarage] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [DAQLGarage]
GO
/****** Object:  Table [dbo].[BaoDuong1]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoDuong1](
	[IDBaoDuong] [int] IDENTITY(1,1) NOT NULL,
	[MaDL] [int] NOT NULL,
	[IDVatTu] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[IDTienCong] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_BaoDuong1_1] PRIMARY KEY CLUSTERED 
(
	[IDBaoDuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietBD]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietBD](
	[IDChiTietBD] [int] IDENTITY(1,1) NOT NULL,
	[MaDL] [int] NULL,
	[IDKM] [int] NULL,
	[IDVatTu] [int] NULL,
 CONSTRAINT [PK_ChiTietBD] PRIMARY KEY CLUSTERED 
(
	[IDChiTietBD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietUser]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietUser](
	[IDNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[IDChucVu] [int] NOT NULL,
	[HoTen] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[CMND] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[Luong] [int] NULL,
	[NgaySinh] [smalldatetime] NULL,
	[Anh] [nvarchar](50) NULL,
	[tk] [varchar](20) NULL,
	[mk] [varchar](20) NULL,
 CONSTRAINT [PK_ChiTietUser] PRIMARY KEY CLUSTERED 
(
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[IDChucVu] [int] IDENTITY(1,1) NOT NULL,
	[TenChucVu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[IDChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTNhapKhoVT]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTNhapKhoVT](
	[IDCTNhapKho] [int] IDENTITY(1,1) NOT NULL,
	[IDNhapKho] [int] NULL,
	[IDVatTu] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTNhapKhoVT] PRIMARY KEY CLUSTERED 
(
	[IDCTNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTTonKho]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTonKho](
	[IDTonKho] [int] IDENTITY(1,1) NOT NULL,
	[IDVatTu] [int] NULL,
	[TonDau] [int] NULL,
	[PhatSinh] [int] NULL,
	[TonCuoi] [int] NULL,
 CONSTRAINT [PK_CTTonKho] PRIMARY KEY CLUSTERED 
(
	[IDTonKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATLICH]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATLICH](
	[MaDL] [int] IDENTITY(1,1) NOT NULL,
	[NgayBD] [smalldatetime] NULL,
	[IDTiepNhanXe] [int] NULL,
	[IDTienCong] [int] NULL,
	[TinhTrang] [bit] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_DATLICH] PRIMARY KEY CLUSTERED 
(
	[MaDL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[IDTienCong] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[GiaTri] [int] NULL,
 CONSTRAINT [PK_TienCong] PRIMARY KEY CLUSTERED 
(
	[IDTienCong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[AnhKH] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiVatTu]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVatTu](
	[IDLoaiVatTu] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiVatTu] PRIMARY KEY CLUSTERED 
(
	[IDLoaiVatTu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNhaCungCap] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](max) NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanCongSuaChuaXe]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanCongSuaChuaXe](
	[IDNhanCongSuaChua] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[IDSuaChua] [int] NULL,
 CONSTRAINT [PK_NhanCongSuaChuaXe] PRIMARY KEY CLUSTERED 
(
	[IDNhanCongSuaChua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhapKho]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapKho](
	[IDNhapKho] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[IDNCC] [int] NULL,
	[NgayNhap] [smalldatetime] NULL,
 CONSTRAINT [PK_NhapKho] PRIMARY KEY CLUSTERED 
(
	[IDNhapKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IDUser] [int] NOT NULL,
	[IDQuyen] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC,
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IDQuyen] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [varchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[IDQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOKM]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOKM](
	[IDKM] [int] IDENTITY(1,1) NOT NULL,
	[Sokm] [int] NULL,
	[IDThuongHieuXe] [int] NULL,
	[LinhKien] [nvarchar](50) NULL,
 CONSTRAINT [PK_SOKM] PRIMARY KEY CLUSTERED 
(
	[IDKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuaChua]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuaChua](
	[IDMaSuaChua] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [smalldatetime] NULL,
	[IDTiepNhan] [int] NULL,
	[NoiDung] [ntext] NULL,
 CONSTRAINT [PK_SuaChua1] PRIMARY KEY CLUSTERED 
(
	[IDMaSuaChua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThayVatTu]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThayVatTu](
	[IDThayVatTu] [int] IDENTITY(1,1) NOT NULL,
	[IDVatTu] [int] NULL,
	[IDSuaChua] [int] NULL,
	[SoLuong] [int] NULL,
	[IDDichVu] [int] NULL,
	[NgayThay] [smalldatetime] NULL,
 CONSTRAINT [PK_ThayVatTu] PRIMARY KEY CLUSTERED 
(
	[IDThayVatTu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKeVt]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeVt](
	[IDThongKe] [int] IDENTITY(1,1) NOT NULL,
	[IDVatTu] [int] NULL,
	[SoLuong] [int] NULL,
	[Ngay] [smalldatetime] NULL,
 CONSTRAINT [PK_ThongKeVt] PRIMARY KEY CLUSTERED 
(
	[IDThongKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieuXe]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieuXe](
	[IDThuongHieuXe] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NULL,
	[ANh] [varchar](max) NULL,
 CONSTRAINT [PK_ThuongHieuXe] PRIMARY KEY CLUSTERED 
(
	[IDThuongHieuXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiepNhanXe]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiepNhanXe](
	[IDTiepNhanXe] [int] IDENTITY(1,1) NOT NULL,
	[BienSoXe] [nvarchar](50) NULL,
	[NgayTiepNhan] [date] NULL,
	[IDKhachHang] [int] NULL,
	[IDThuongHieuXe] [int] NULL,
	[BanGiaoXe] [bit] NULL,
	[IDNhanVien] [int] NULL,
 CONSTRAINT [PK_TiepNhanXe] PRIMARY KEY CLUSTERED 
(
	[IDTiepNhanXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TonKho]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonKho](
	[IDTonKho] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[NgayLap] [date] NULL,
 CONSTRAINT [PK_TonKho] PRIMARY KEY CLUSTERED 
(
	[IDTonKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[IDChucVu] [int] NULL,
	[TenTK] [nvarchar](max) NULL,
	[MK] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VatTu]    Script Date: 12/14/2023 9:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VatTu](
	[IDVatTu] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Gia] [int] NULL,
	[SoLuong] [int] NULL,
	[Anh] [varchar](max) NULL,
	[IDHangXe] [int] NULL,
	[IDLoai] [int] NULL,
	[GiaNhap] [int] NULL,
 CONSTRAINT [PK_VatTu] PRIMARY KEY CLUSTERED 
(
	[IDVatTu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaoDuong1] ON 

INSERT [dbo].[BaoDuong1] ([IDBaoDuong], [MaDL], [IDVatTu], [SoLuong], [IDTienCong], [GhiChu]) VALUES (35, 4, 9, 12, 7, NULL)
INSERT [dbo].[BaoDuong1] ([IDBaoDuong], [MaDL], [IDVatTu], [SoLuong], [IDTienCong], [GhiChu]) VALUES (36, 29, 2, 4, 1, NULL)
SET IDENTITY_INSERT [dbo].[BaoDuong1] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietBD] ON 

INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (1, 3, 1, 2)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (2, 3, 1, 4)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (3, 3, 1, 5)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (7, 5, 3, 10)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (13, 8, 1, 2)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (14, 4, 4, 9)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (15, 4, 4, 10)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (16, 10, 1, 2)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (17, 10, 1, 16)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (18, 5, 3, 14)
INSERT [dbo].[ChiTietBD] ([IDChiTietBD], [MaDL], [IDKM], [IDVatTu]) VALUES (19, 29, 3, 2)
SET IDENTITY_INSERT [dbo].[ChiTietBD] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietUser] ON 

INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (1, 1, N'Nguyễn Admin', N'Bình Dương', N'299991011', N'093999911', NULL, NULL, N'/Images/002.jpg', N'admin', N'1')
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (2, 4, N'Nguyễn Mậu Đông ', N'Thanh Hóa', N'323232323', N'024224243', NULL, NULL, N'/Images/001.jpg', N'nv01', N'1')
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (4, 5, N'Nguyễn', N'Bình Dương', NULL, NULL, NULL, CAST(N'2001-09-09T00:00:00' AS SmallDateTime), N'/Images/p_62019_VIETMAP-C9.jpg', NULL, NULL)
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (6, 4, N'nguyen2', N'22', N'4341414', N'14141', 414141, CAST(N'2002-08-08T00:00:00' AS SmallDateTime), N'/Images/p_62019_VIETMAP-C9.jpg', NULL, NULL)
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (7, 1, N'Nguyễn Anh', N'Bình Dương', N'4341414', N'0983818001', 7000000, CAST(N'2005-06-02T00:00:00' AS SmallDateTime), N'~/Images/Screenshot (2852).jpg', NULL, NULL)
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (8, 4, N'Nguyễn Đông', N'Đắc lắk', N'212777911', N'0983819982', 5000000, CAST(N'2002-06-02T00:00:00' AS SmallDateTime), N'System.Web.HttpPostedFileWrapper', NULL, NULL)
INSERT [dbo].[ChiTietUser] ([IDNguoiDung], [IDChucVu], [HoTen], [DiaChi], [CMND], [SoDienThoai], [Luong], [NgaySinh], [Anh], [tk], [mk]) VALUES (9, 4, N'Đỗ tiến đũn', N'Lào Cai', N'87902210', N'0309819982', 4000000, CAST(N'2001-07-02T00:00:00' AS SmallDateTime), N'System.Web.HttpPostedFileWrapper', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietUser] OFF
GO
SET IDENTITY_INSERT [dbo].[ChucVu] ON 

INSERT [dbo].[ChucVu] ([IDChucVu], [TenChucVu]) VALUES (1, N'admin')
INSERT [dbo].[ChucVu] ([IDChucVu], [TenChucVu]) VALUES (2, N'Nhân viên kỹ thuật')
INSERT [dbo].[ChucVu] ([IDChucVu], [TenChucVu]) VALUES (3, N'Nhân viên thu  ngân')
INSERT [dbo].[ChucVu] ([IDChucVu], [TenChucVu]) VALUES (4, N'Nhân viên rửa xe')
INSERT [dbo].[ChucVu] ([IDChucVu], [TenChucVu]) VALUES (5, N'Nhân viên bảo dưỡng')
SET IDENTITY_INSERT [dbo].[ChucVu] OFF
GO
SET IDENTITY_INSERT [dbo].[CTNhapKhoVT] ON 

INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (25, 57, 9, 10)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (26, 57, 2, 10)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (27, 58, 2, 4)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (28, 59, 10, 10)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (29, 59, 7, 10)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (30, 60, 7, 100)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (31, 61, 2, 10)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (32, 61, 8, 20)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (33, 62, 9, 20)
INSERT [dbo].[CTNhapKhoVT] ([IDCTNhapKho], [IDNhapKho], [IDVatTu], [SoLuong]) VALUES (34, 62, 7, 20)
SET IDENTITY_INSERT [dbo].[CTNhapKhoVT] OFF
GO
SET IDENTITY_INSERT [dbo].[CTTonKho] ON 

INSERT [dbo].[CTTonKho] ([IDTonKho], [IDVatTu], [TonDau], [PhatSinh], [TonCuoi]) VALUES (1, 9, 4, 20, 24)
INSERT [dbo].[CTTonKho] ([IDTonKho], [IDVatTu], [TonDau], [PhatSinh], [TonCuoi]) VALUES (2, 2, 6, 10, 16)
INSERT [dbo].[CTTonKho] ([IDTonKho], [IDVatTu], [TonDau], [PhatSinh], [TonCuoi]) VALUES (3, 10, 1, 10, 11)
INSERT [dbo].[CTTonKho] ([IDTonKho], [IDVatTu], [TonDau], [PhatSinh], [TonCuoi]) VALUES (4, 7, 151, 20, 171)
INSERT [dbo].[CTTonKho] ([IDTonKho], [IDVatTu], [TonDau], [PhatSinh], [TonCuoi]) VALUES (5, 8, 6, 20, 26)
SET IDENTITY_INSERT [dbo].[CTTonKho] OFF
GO
SET IDENTITY_INSERT [dbo].[DATLICH] ON 

INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (3, CAST(N'2023-11-08T00:00:00' AS SmallDateTime), 19, 19, 1, N'<p>Thay b&ocirc;</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (4, CAST(N'2023-11-08T00:00:00' AS SmallDateTime), 2, 2, 0, N'Tôi cần rửa full xe')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (5, CAST(N'2023-11-24T00:00:00' AS SmallDateTime), 1, 19, 1, N'<p>ko</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (8, CAST(N'2023-11-12T00:00:00' AS SmallDateTime), 2, 2, 0, N'đáadasdada')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (10, CAST(N'2023-12-28T00:00:00' AS SmallDateTime), 1, 18, 0, N'<p>đ&acirc;y l&agrave; xe mới</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (13, CAST(N'2023-11-26T00:00:00' AS SmallDateTime), 1, 19, 1, N'<p>đ&acirc;sdadad</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (15, CAST(N'2023-11-17T07:31:00' AS SmallDateTime), 1, 1, 0, N'<p>rửa xe</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (16, NULL, 1, 19, NULL, N'Tôi cần bảo dưỡng xe ')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (19, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (20, CAST(N'2023-12-03T19:09:00' AS SmallDateTime), 2, 19, NULL, NULL)
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (22, CAST(N'2023-11-30T14:05:00' AS SmallDateTime), 1, 19, NULL, NULL)
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (23, CAST(N'2023-12-02T14:13:00' AS SmallDateTime), 18, 19, NULL, NULL)
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (24, CAST(N'2023-12-10T21:22:00' AS SmallDateTime), 18, 19, 0, N'<p>bảo dưỡng khung xe</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (25, CAST(N'2023-12-31T03:34:00' AS SmallDateTime), 18, 19, 0, N'<p>bảo dưỡng c&agrave;ng xe</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (26, CAST(N'2023-12-22T14:28:00' AS SmallDateTime), 19, 19, 0, N'<p>kh&aacute;ch đ&ograve;i bảo dưỡng</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (27, CAST(N'2023-12-24T02:17:00' AS SmallDateTime), 1, 19, 0, N'<p>bảo dưỡng gấp</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (28, CAST(N'2023-12-13T20:19:00' AS SmallDateTime), 1, 28, 0, N'<p>Nhớ l&agrave;m</p>
')
INSERT [dbo].[DATLICH] ([MaDL], [NgayBD], [IDTiepNhanXe], [IDTienCong], [TinhTrang], [GhiChu]) VALUES (29, CAST(N'2023-12-15T20:29:00' AS SmallDateTime), 18, 28, 0, N'')
SET IDENTITY_INSERT [dbo].[DATLICH] OFF
GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (1, N'Rửa xe 7 chỗ', 600000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (2, N'Rửa xe 4 chỗ', 500000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (7, N'Thay linh kiện', 300000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (12, N'Thay lốp', 50000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (14, N'Lắp ráp', 50000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (15, N'Rã xe', 5000000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (16, N'Rửa xe 7 chỗ', 600000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (18, N'rửa xe 01', 20000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (19, N'Bảo dưỡng xe', 2000000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (20, N'Làm mát', 100000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (22, N'Sửa bánh xe', 300000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (26, N'Thay kính', 800000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (28, N'Đun xe', 100000)
INSERT [dbo].[DichVu] ([IDTienCong], [Ten], [GiaTri]) VALUES (29, N'Thay cốp xe', 5000000)
SET IDENTITY_INSERT [dbo].[DichVu] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKH], [SDT], [DiaChi], [AnhKH]) VALUES (1, N'Nguyễn Mậu Đông', N'122093911', N'Kom tum', N'cua.jpg')
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKH], [SDT], [DiaChi], [AnhKH]) VALUES (2, N'Đỗ Tiến Dũng', N'0938811191', N'Chùm ruộc , Đắc Nông', N'dung.jpg')
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKH], [SDT], [DiaChi], [AnhKH]) VALUES (3, N'Nguyễn Khang Thái Anh', N'039709001', N'Bình Dương', N'thaianh1.jpg')
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKH], [SDT], [DiaChi], [AnhKH]) VALUES (4, N'Nguyễn Khang Thái Anh', N'013131312', N'Bình Dương', N'thaianh.jpg')
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKH], [SDT], [DiaChi], [AnhKH]) VALUES (12, N'Nguyễn Khang Thái Anh', N'04131312312', N'Bình Dương', N'thaianh1.jpg')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiVatTu] ON 

INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (1, N'Phụ tùng hầm ô tô')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (2, N'Phụ tùng thân vỏ')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (3, N'Phụ tùng điện')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (4, N'Phần máy ')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (5, N'Phần điện')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (6, N'Khác')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (7, N'Dầu nhớt')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (8, N'Đèn')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (10, N'Phanh và Hệ Thống Làm Mát')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (11, N'Hệ Thống Treo và Làm Điều Hòa')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (12, N'Đồng Hồ Đo và Kiểm Soát')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (13, N'Phụ Kiện Nội Thất')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (14, N'Hệ Thống Điều Khiển Động Cơ')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (15, N'Bộ Lốp và Lốp')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (16, N'Hệ Thống Truyền Động')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (17, N'Phụ Tùng Nâng Cấp và Tuỳ Chỉnh')
INSERT [dbo].[LoaiVatTu] ([IDLoaiVatTu], [Ten]) VALUES (18, N'Hệ Thống Điều Hòa và Sưởi Ấm')
SET IDENTITY_INSERT [dbo].[LoaiVatTu] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [Ten], [SoDienThoai], [Email]) VALUES (1, N'Phụ Tùng Ô Tô Vũ Phương - Công Ty TNHH Thương Mại Vũ Phương', N'098222910', N'vuphuong@gmail.com')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [Ten], [SoDienThoai], [Email]) VALUES (2, N'Trung Tâm Phụ Tùng Điều Hòa Ô Tô Hà Nội', N'0299881190', N'phutunghanoi@gmail.com')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanCongSuaChuaXe] ON 

INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (2, 2, N'sửa xe', 11)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (3, 2, N'xe hư', 11)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (4, 1, N'xe hư', 12)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (7, 1, N'Hư hỏng nặng cấp 3', 13)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (14, 4, N'1', 14)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (15, 2, NULL, 14)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (16, 1, N'Hư hỏng nặng cấp 3', 20)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (17, 4, N'thay xe', 20)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (18, 6, NULL, 22)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (19, 9, NULL, 21)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (20, 2, NULL, 24)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (21, 4, NULL, 24)
INSERT [dbo].[NhanCongSuaChuaXe] ([IDNhanCongSuaChua], [IDUser], [NoiDung], [IDSuaChua]) VALUES (22, 2, NULL, 25)
SET IDENTITY_INSERT [dbo].[NhanCongSuaChuaXe] OFF
GO
SET IDENTITY_INSERT [dbo].[NhapKho] ON 

INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (56, 1, 1, CAST(N'2023-12-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (57, 1, 1, CAST(N'2023-12-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (58, 1, 1, CAST(N'2023-12-11T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (59, 1, 1, CAST(N'2023-12-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (60, 1, 1, CAST(N'2023-12-12T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (61, 1, 2, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[NhapKho] ([IDNhapKho], [IDUser], [IDNCC], [NgayNhap]) VALUES (62, 1, 2, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[NhapKho] OFF
GO
INSERT [dbo].[PhanQuyen] ([IDUser], [IDQuyen], [GhiChu]) VALUES (2, 10, NULL)
INSERT [dbo].[PhanQuyen] ([IDUser], [IDQuyen], [GhiChu]) VALUES (2, 11, NULL)
INSERT [dbo].[PhanQuyen] ([IDUser], [IDQuyen], [GhiChu]) VALUES (2, 12, NULL)
INSERT [dbo].[PhanQuyen] ([IDUser], [IDQuyen], [GhiChu]) VALUES (2, 13, NULL)
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([IDQuyen], [NoiDung]) VALUES (10, N'NhanVienDanhSach')
INSERT [dbo].[Quyen] ([IDQuyen], [NoiDung]) VALUES (11, N'NhanVienThem')
INSERT [dbo].[Quyen] ([IDQuyen], [NoiDung]) VALUES (12, N'NhanVienSua')
INSERT [dbo].[Quyen] ([IDQuyen], [NoiDung]) VALUES (13, N'NhanVienXoa')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[SOKM] ON 

INSERT [dbo].[SOKM] ([IDKM], [Sokm], [IDThuongHieuXe], [LinhKien]) VALUES (1, 5001, 1, N'( Van - Kính)')
INSERT [dbo].[SOKM] ([IDKM], [Sokm], [IDThuongHieuXe], [LinhKien]) VALUES (2, 7001, 2, N'( Bộ lọc - Cần gạt nước)')
INSERT [dbo].[SOKM] ([IDKM], [Sokm], [IDThuongHieuXe], [LinhKien]) VALUES (3, 8001, 3, N'( Bánh xe - Bánh răng )')
INSERT [dbo].[SOKM] ([IDKM], [Sokm], [IDThuongHieuXe], [LinhKien]) VALUES (4, 9001, 4, N'( Camera Hành trình )')
INSERT [dbo].[SOKM] ([IDKM], [Sokm], [IDThuongHieuXe], [LinhKien]) VALUES (5, 10001, 5, N'( Động cơ chính)')
SET IDENTITY_INSERT [dbo].[SOKM] OFF
GO
SET IDENTITY_INSERT [dbo].[SuaChua] ON 

INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (10, CAST(N'2023-11-25T21:03:00' AS SmallDateTime), 18, N'Hư hỏng nặng cấp 3')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (11, CAST(N'2023-11-25T22:26:00' AS SmallDateTime), 1, N'Hư hỏng nặng cấp 3')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (12, CAST(N'2023-11-26T14:03:00' AS SmallDateTime), 2, N'Hư hỏng nặng cấp 3')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (13, CAST(N'2023-11-26T23:06:00' AS SmallDateTime), 19, N'Hư hỏng nặng cấp 3')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (14, CAST(N'2023-11-27T19:08:00' AS SmallDateTime), 20, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (17, CAST(N'2023-11-27T21:05:00' AS SmallDateTime), 2, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (19, CAST(N'2023-11-27T21:05:00' AS SmallDateTime), 2, N'd')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (20, CAST(N'2023-11-28T08:29:00' AS SmallDateTime), 20, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (21, CAST(N'2023-11-28T08:37:00' AS SmallDateTime), 20, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (22, CAST(N'2023-11-28T08:37:00' AS SmallDateTime), 20, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (23, CAST(N'2023-12-03T15:56:00' AS SmallDateTime), 1, NULL)
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (24, CAST(N'2023-12-13T20:17:00' AS SmallDateTime), 21, N'Sửa chữa xe')
INSERT [dbo].[SuaChua] ([IDMaSuaChua], [NgayLap], [IDTiepNhan], [NoiDung]) VALUES (25, CAST(N'2023-12-13T20:26:00' AS SmallDateTime), 22, N'Sửa chữa
')
SET IDENTITY_INSERT [dbo].[SuaChua] OFF
GO
SET IDENTITY_INSERT [dbo].[ThayVatTu] ON 

INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (96, 4, 14, 3, 1, CAST(N'2023-12-01T15:39:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (98, 7, 14, 1, 7, CAST(N'2023-12-01T16:01:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (99, 5, 14, 4, 1, CAST(N'2023-12-09T13:38:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (100, 8, 22, 4, 16, CAST(N'2023-12-09T15:53:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (101, 2, 22, 4, 1, CAST(N'2023-12-12T16:03:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (102, 16, 22, 2, 7, CAST(N'2023-12-12T16:04:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (103, 5, 21, 4, 1, CAST(N'2023-12-12T16:55:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (104, 2, 21, 4, 1, CAST(N'2023-12-12T16:55:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (105, 7, 21, 10, 1, CAST(N'2023-12-12T22:29:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (106, 17, 21, 10, 1, CAST(N'2023-12-13T12:55:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (107, 12, 21, 2, 1, CAST(N'2023-12-13T12:56:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (108, 5, 13, 4, 1, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (109, 2, 13, 4, 1, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (110, 9, 13, 1, 1, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (111, 2, 14, 1, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (112, 2, 20, 1, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (113, 4, 24, 4, 7, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (114, 12, 24, 2, 7, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (115, 46, 25, 1, 7, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThayVatTu] ([IDThayVatTu], [IDVatTu], [IDSuaChua], [SoLuong], [IDDichVu], [NgayThay]) VALUES (116, 22, 25, 1, 7, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ThayVatTu] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongKeVt] ON 

INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (1, 17, 6, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (2, 12, 2, CAST(N'2023-12-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (3, 2, 4, CAST(N'2023-12-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (4, 9, 12, CAST(N'2023-12-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (6, 4, 6, CAST(N'2023-12-10T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (7, 5, 4, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (8, 2, 4, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (9, 9, 1, CAST(N'2023-12-13T17:25:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (10, 2, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (11, 2, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (12, 4, 4, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (13, 12, 2, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (14, 46, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[ThongKeVt] ([IDThongKe], [IDVatTu], [SoLuong], [Ngay]) VALUES (15, 22, 1, CAST(N'2023-12-13T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ThongKeVt] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieuXe] ON 

INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (1, N' Hãng xe Toyota', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (2, N' Hãng xe Chevrolet', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (3, N' Hãng xe Ford', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (4, N'Hãng xe Honda', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (5, N' Hãng xe Hyundai', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (6, N'Hãng xe Isuzu', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (7, N'Hãng xe Suzuki', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (8, N' Hãng xe Kia', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (9, N'Hãng xe Mitsubishi', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (10, N' Hãng xe Lexus', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (11, N' Hãng xe Mazda', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (12, N' Hãng xe Nissan', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (13, N'Hãng xe Subaru', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (14, N'Hãng xe Ssangyong', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (15, N'Hãng xe Land Rover', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (16, N'Hãng xe Peugeot', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (17, N'Hãng xe Volkswagen', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (18, N'Hãng xe Mercedes Benz', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (19, N'Hãng xe BMW', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (20, N'Hãng Mini Cooper', NULL)
INSERT [dbo].[ThuongHieuXe] ([IDThuongHieuXe], [TenThuongHieu], [ANh]) VALUES (21, N'All', NULL)
SET IDENTITY_INSERT [dbo].[ThuongHieuXe] OFF
GO
SET IDENTITY_INSERT [dbo].[TiepNhanXe] ON 

INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (1, N'60 999AB', CAST(N'2023-11-13' AS Date), 1, 4, 1, NULL)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (2, N'60 888AB', CAST(N'2023-11-13' AS Date), 2, 10, 0, NULL)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (18, N'89A782 122', CAST(N'2023-11-21' AS Date), 2, 20, 0, 4)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (19, N'89A782 1', CAST(N'2023-11-26' AS Date), 2, 12, 1, 2)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (20, N'89A782 12111111', CAST(N'2023-11-27' AS Date), 3, 17, 0, 2)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (21, N'89A782 190', CAST(N'2023-12-13' AS Date), 3, 15, 0, 2)
INSERT [dbo].[TiepNhanXe] ([IDTiepNhanXe], [BienSoXe], [NgayTiepNhan], [IDKhachHang], [IDThuongHieuXe], [BanGiaoXe], [IDNhanVien]) VALUES (22, N'89A782 190', CAST(N'2023-12-13' AS Date), 2, 6, 1, 2)
SET IDENTITY_INSERT [dbo].[TiepNhanXe] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [IDChucVu], [TenTK], [MK]) VALUES (1, 1, N'admin', N'1')
INSERT [dbo].[User] ([IDUser], [IDChucVu], [TenTK], [MK]) VALUES (4, 2, N'nv1', N'1')
INSERT [dbo].[User] ([IDUser], [IDChucVu], [TenTK], [MK]) VALUES (5, 2, N'nv2', N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[VatTu] ON 

INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (2, N'Van', 40000, 12, N'/Images/van11.jfif', 1, 15, 30000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (4, N'Bánh xe', 530000, 32, N'/Images/banhxe.jpg', 4, 6, 40000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (5, N'Bánh xe trước', 300000, 41, N'/Images/banhxe.jpg', 19, 15, 250000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (7, N'Phanh xe', 580000, 171, N'/Images/phanhxe.jpg', 5, 10, 100000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (8, N'Bánh răng', 200000, 26, N'/Images/anhrang.jpg', 1, 1, 100000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (9, N'Camera hành trình VIETMAP C9', 2290000, 24, N'/Images/camera2.jfif', 1, 1, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (10, N'Camera hành trình tích hợp DVD VIETMAP V5', 2900000, 11, N'/Images/camera1.jpg', 21, 6, 1500000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (12, N'Cửa xe', 3000000, 96, N'/Images/cua.jpg', 5, 2, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (14, N'Camera hành trình CV5', 40000000, 10, N'/Images/camera1.jpg', 3, 13, 30000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (15, N'Camera hành trình CV5', 300000000, 10, N'/Images/camera2.jfif', 1, 13, 200000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (16, N'Phanh ', 1212121, 114, N'/Images/phanhxe.jpg', 14, 13, 121212)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (17, N'Camera hành trình CV7', 1000000, 4, N'/Images/camera2.jfif', 13, 13, 1000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (18, N'Động cơ', 10000000, 100, N'/Images/dongco.jfif', 2, 4, 7000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (19, N'Bộ giảm xóc', 10000000, 50, N'/Images/giamxoc.jfif', 1, 4, 5000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (20, N'Bộ tản nhiệt', 5000000, 50, N'/Images/tannhiet.jpg', 1, 4, 3000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (21, N'Quạt làm mát', 3000000, 100, N'/Images/quat.jpg', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (22, N'Pin xe', 1000000, 999, N'/Images/pin.jfif', 1, 5, 500000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (23, N'Bộ đánh lửa', 1000000, 500, N'/Images/danhlua.jpg', 1, 5, 700000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (24, N'Cảm biến', 5000000, 40, N'/Images/cambien.jpg', 2, 5, 3500000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (25, N'Ổng xả', 3000000, 40, N'/Images/ongxa.jpg', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (26, N'Bộ lọc không khí', 3000000, 40, N'/Images/boloc.jfif', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (27, N'Bộ lọc nhiên liệu', 3000000, 40, N'/Images/boloc.jfif', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (28, N'Bộ lọc dầu', 3000000, 40, N'/Images/boloc.jfif', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (29, N'Bộ nén', 3000000, 40, N'/Images/bonen.jfif', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (30, N'Bộ điều khiển', 3000000, 40, N'/Images/dieukhien.jfif', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (31, N'Bộ làm lạnh', 3000000, 40, N'/Images/quat.jpg', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (32, N'Bình ắc quy', 3000000, 40, N'/Images/acquy.jpg', 3, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (33, N'Máy phát điện', 3000000, 40, N'/Images/phatdien.jpg', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (34, N'Hộp số', 3000000, 40, N'/Images/hopso.jpg', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (35, N'Hệ thống treo', 3000000, 40, N'/Images/treo.png', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (36, N'Hệ thống hút gió', 5000000, 50, N'/Images/treo.png', 1, 4, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (37, N'Bộ nạp khí', 5000000, 50, N'/Images/napkhi.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (38, N'Bộ tăng áp', 5000000, 50, N'/Images/tangap.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (39, N'Cần gạt', 5000000, 50, N'/Images/cangat.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (40, N'Hệ thống truyền động 4 bánh', 5000000, 50, N'/Images/giamxoc.jfif', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (41, N'Hệ thống phanh ABS', 5000000, 50, N'/Images/abs.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (42, N'Hệ thống phanh điện tử', 5000000, 50, N'/Images/abs.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (43, N'Hệ thống phanh chống bó cứng', 5000000, 50, N'/Images/abs.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (44, N'Hệ thống phanh chống trượt', 2900000, 36, N'/Images/abs.jpg', 3, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (45, N'Hệ thống phanh khẩn cấp', 2900000, 36, N'/Images/abs.jpg', 1, 6, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (46, N'Hệ thống phanh tay', 2900000, 35, N'/Images/abs.jpg', 1, 5, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (47, N'Hệ thống phanh trợ lực', 2900000, 36, N'/Images/abs.jpg', 1, 5, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (48, N'Bộ van điều khiển áp suất lái', 2900000, 36, N'/Images/van11.jfif', 1, 5, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (49, N'Bộ van điều khiển áp suất truyền động', 2900000, 36, N'/Images/van11.jfif', 1, 5, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (50, N'Bộ van điều khiển áp suất cabin', 2900000, 36, N'/Images/van11.jfif', 1, 5, 2000000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (51, N'Camera hành trình VIETMAPc5', 2300000, 4, NULL, 17, 14, 1900000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (52, N'Bánh xe phụ', 700000, 1, NULL, 15, 6, 450000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (53, N'Bánh xe sau', 450000, 1, NULL, 18, 15, 3500000)
INSERT [dbo].[VatTu] ([IDVatTu], [Ten], [Gia], [SoLuong], [Anh], [IDHangXe], [IDLoai], [GiaNhap]) VALUES (54, N'Bánh răng c6s', 300000, 10, NULL, 18, 14, 150000)
SET IDENTITY_INSERT [dbo].[VatTu] OFF
GO
ALTER TABLE [dbo].[BaoDuong1]  WITH CHECK ADD  CONSTRAINT [FK_BaoDuong1_DATLICH] FOREIGN KEY([MaDL])
REFERENCES [dbo].[DATLICH] ([MaDL])
GO
ALTER TABLE [dbo].[BaoDuong1] CHECK CONSTRAINT [FK_BaoDuong1_DATLICH]
GO
ALTER TABLE [dbo].[BaoDuong1]  WITH CHECK ADD  CONSTRAINT [FK_BaoDuong1_DichVu] FOREIGN KEY([IDTienCong])
REFERENCES [dbo].[DichVu] ([IDTienCong])
GO
ALTER TABLE [dbo].[BaoDuong1] CHECK CONSTRAINT [FK_BaoDuong1_DichVu]
GO
ALTER TABLE [dbo].[BaoDuong1]  WITH CHECK ADD  CONSTRAINT [FK_BaoDuong1_VatTu] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[BaoDuong1] CHECK CONSTRAINT [FK_BaoDuong1_VatTu]
GO
ALTER TABLE [dbo].[ChiTietBD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBD_DATLICH] FOREIGN KEY([MaDL])
REFERENCES [dbo].[DATLICH] ([MaDL])
GO
ALTER TABLE [dbo].[ChiTietBD] CHECK CONSTRAINT [FK_ChiTietBD_DATLICH]
GO
ALTER TABLE [dbo].[ChiTietBD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBD_SOKM] FOREIGN KEY([IDKM])
REFERENCES [dbo].[SOKM] ([IDKM])
GO
ALTER TABLE [dbo].[ChiTietBD] CHECK CONSTRAINT [FK_ChiTietBD_SOKM]
GO
ALTER TABLE [dbo].[ChiTietBD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietBD_VatTu1] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[ChiTietBD] CHECK CONSTRAINT [FK_ChiTietBD_VatTu1]
GO
ALTER TABLE [dbo].[ChiTietUser]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietUser_ChucVu] FOREIGN KEY([IDChucVu])
REFERENCES [dbo].[ChucVu] ([IDChucVu])
GO
ALTER TABLE [dbo].[ChiTietUser] CHECK CONSTRAINT [FK_ChiTietUser_ChucVu]
GO
ALTER TABLE [dbo].[CTNhapKhoVT]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapKhoVT_NhapKho] FOREIGN KEY([IDNhapKho])
REFERENCES [dbo].[NhapKho] ([IDNhapKho])
GO
ALTER TABLE [dbo].[CTNhapKhoVT] CHECK CONSTRAINT [FK_CTNhapKhoVT_NhapKho]
GO
ALTER TABLE [dbo].[CTNhapKhoVT]  WITH CHECK ADD  CONSTRAINT [FK_CTNhapKhoVT_VatTu] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[CTNhapKhoVT] CHECK CONSTRAINT [FK_CTNhapKhoVT_VatTu]
GO
ALTER TABLE [dbo].[CTTonKho]  WITH CHECK ADD  CONSTRAINT [FK_CTTonKho_VatTu] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[CTTonKho] CHECK CONSTRAINT [FK_CTTonKho_VatTu]
GO
ALTER TABLE [dbo].[DATLICH]  WITH CHECK ADD  CONSTRAINT [FK_DATLICH_DichVu] FOREIGN KEY([IDTienCong])
REFERENCES [dbo].[DichVu] ([IDTienCong])
GO
ALTER TABLE [dbo].[DATLICH] CHECK CONSTRAINT [FK_DATLICH_DichVu]
GO
ALTER TABLE [dbo].[DATLICH]  WITH CHECK ADD  CONSTRAINT [FK_DATLICH_TiepNhanXe] FOREIGN KEY([IDTiepNhanXe])
REFERENCES [dbo].[TiepNhanXe] ([IDTiepNhanXe])
GO
ALTER TABLE [dbo].[DATLICH] CHECK CONSTRAINT [FK_DATLICH_TiepNhanXe]
GO
ALTER TABLE [dbo].[NhanCongSuaChuaXe]  WITH CHECK ADD  CONSTRAINT [FK_NhanCongSuaChuaXe_ChiTietUser1] FOREIGN KEY([IDUser])
REFERENCES [dbo].[ChiTietUser] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[NhanCongSuaChuaXe] CHECK CONSTRAINT [FK_NhanCongSuaChuaXe_ChiTietUser1]
GO
ALTER TABLE [dbo].[NhanCongSuaChuaXe]  WITH CHECK ADD  CONSTRAINT [FK_NhanCongSuaChuaXe_SuaChua] FOREIGN KEY([IDSuaChua])
REFERENCES [dbo].[SuaChua] ([IDMaSuaChua])
GO
ALTER TABLE [dbo].[NhanCongSuaChuaXe] CHECK CONSTRAINT [FK_NhanCongSuaChuaXe_SuaChua]
GO
ALTER TABLE [dbo].[NhapKho]  WITH CHECK ADD  CONSTRAINT [FK_NhapKho_ChiTietUser] FOREIGN KEY([IDUser])
REFERENCES [dbo].[ChiTietUser] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[NhapKho] CHECK CONSTRAINT [FK_NhapKho_ChiTietUser]
GO
ALTER TABLE [dbo].[NhapKho]  WITH CHECK ADD  CONSTRAINT [FK_NhapKho_NhaCungCap] FOREIGN KEY([IDNCC])
REFERENCES [dbo].[NhaCungCap] ([IDNhaCungCap])
GO
ALTER TABLE [dbo].[NhapKho] CHECK CONSTRAINT [FK_NhapKho_NhaCungCap]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_ChiTietUser] FOREIGN KEY([IDUser])
REFERENCES [dbo].[ChiTietUser] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_ChiTietUser]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_Quyen] FOREIGN KEY([IDQuyen])
REFERENCES [dbo].[Quyen] ([IDQuyen])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_Quyen]
GO
ALTER TABLE [dbo].[SuaChua]  WITH CHECK ADD  CONSTRAINT [FK_SuaChua_TiepNhanXe] FOREIGN KEY([IDTiepNhan])
REFERENCES [dbo].[TiepNhanXe] ([IDTiepNhanXe])
GO
ALTER TABLE [dbo].[SuaChua] CHECK CONSTRAINT [FK_SuaChua_TiepNhanXe]
GO
ALTER TABLE [dbo].[ThayVatTu]  WITH CHECK ADD  CONSTRAINT [FK_ThayVatTu_DichVu] FOREIGN KEY([IDDichVu])
REFERENCES [dbo].[DichVu] ([IDTienCong])
GO
ALTER TABLE [dbo].[ThayVatTu] CHECK CONSTRAINT [FK_ThayVatTu_DichVu]
GO
ALTER TABLE [dbo].[ThayVatTu]  WITH CHECK ADD  CONSTRAINT [FK_ThayVatTu_SuaChua] FOREIGN KEY([IDSuaChua])
REFERENCES [dbo].[SuaChua] ([IDMaSuaChua])
GO
ALTER TABLE [dbo].[ThayVatTu] CHECK CONSTRAINT [FK_ThayVatTu_SuaChua]
GO
ALTER TABLE [dbo].[ThayVatTu]  WITH CHECK ADD  CONSTRAINT [FK_ThayVatTu_VatTu] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[ThayVatTu] CHECK CONSTRAINT [FK_ThayVatTu_VatTu]
GO
ALTER TABLE [dbo].[ThongKeVt]  WITH CHECK ADD  CONSTRAINT [FK_ThongKeVt_VatTu] FOREIGN KEY([IDVatTu])
REFERENCES [dbo].[VatTu] ([IDVatTu])
GO
ALTER TABLE [dbo].[ThongKeVt] CHECK CONSTRAINT [FK_ThongKeVt_VatTu]
GO
ALTER TABLE [dbo].[TiepNhanXe]  WITH CHECK ADD  CONSTRAINT [FK_TiepNhanXe_ChiTietUser1] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[ChiTietUser] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[TiepNhanXe] CHECK CONSTRAINT [FK_TiepNhanXe_ChiTietUser1]
GO
ALTER TABLE [dbo].[TiepNhanXe]  WITH CHECK ADD  CONSTRAINT [FK_TiepNhanXe_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[TiepNhanXe] CHECK CONSTRAINT [FK_TiepNhanXe_KhachHang]
GO
ALTER TABLE [dbo].[TiepNhanXe]  WITH CHECK ADD  CONSTRAINT [FK_TiepNhanXe_ThuongHieuXe] FOREIGN KEY([IDThuongHieuXe])
REFERENCES [dbo].[ThuongHieuXe] ([IDThuongHieuXe])
GO
ALTER TABLE [dbo].[TiepNhanXe] CHECK CONSTRAINT [FK_TiepNhanXe_ThuongHieuXe]
GO
ALTER TABLE [dbo].[VatTu]  WITH CHECK ADD FOREIGN KEY([IDHangXe])
REFERENCES [dbo].[ThuongHieuXe] ([IDThuongHieuXe])
GO
ALTER TABLE [dbo].[VatTu]  WITH CHECK ADD  CONSTRAINT [FK_VatTu_LoaiVatTu] FOREIGN KEY([IDLoai])
REFERENCES [dbo].[LoaiVatTu] ([IDLoaiVatTu])
GO
ALTER TABLE [dbo].[VatTu] CHECK CONSTRAINT [FK_VatTu_LoaiVatTu]
GO
USE [master]
GO
ALTER DATABASE [DA_QLGarage] SET  READ_WRITE 
GO
