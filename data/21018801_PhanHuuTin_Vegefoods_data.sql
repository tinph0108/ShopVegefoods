USE [master]
GO
/****** Object:  Database [Vegefoods]    Script Date: 7/26/2024 3:36:11 PM ******/
CREATE DATABASE [Vegefoods]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vegefoods', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Vegefoods.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Vegefoods_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Vegefoods_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Vegefoods] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vegefoods].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vegefoods] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vegefoods] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vegefoods] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vegefoods] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Vegefoods] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vegefoods] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vegefoods] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vegefoods] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vegefoods] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vegefoods] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vegefoods] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vegefoods] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vegefoods] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vegefoods] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vegefoods] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vegefoods] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vegefoods] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vegefoods] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vegefoods] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vegefoods] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vegefoods] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vegefoods] SET  MULTI_USER 
GO
ALTER DATABASE [Vegefoods] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vegefoods] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vegefoods] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vegefoods] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Vegefoods] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Vegefoods]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [varchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[isSell] [bit] NOT NULL,
	[isAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[maCart] [int] IDENTITY(1,1) NOT NULL,
	[uID] [varchar](50) NULL,
	[maSP] [nvarchar](50) NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[maDanhMuc] [nvarchar](50) NOT NULL,
	[tenDanhMuc] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[uID] [varchar](50) NULL,
	[firstName] [nvarchar](100) NULL,
	[lastName] [nvarchar](100) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[orderDate] [datetime] NULL,
	[totalAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[maSP] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[maSP] [nvarchar](50) NOT NULL,
	[tenSP] [nvarchar](255) NOT NULL,
	[giaBan] [decimal](18, 2) NOT NULL,
	[donViTinh] [nvarchar](50) NOT NULL,
	[tinhTrang] [nvarchar](50) NOT NULL,
	[maDanhMuc] [nvarchar](50) NOT NULL,
	[hinh1] [nvarchar](255) NULL,
	[moTa] [nvarchar](max) NULL,
	[khoiLuong] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[hinh2] [nvarchar](255) NULL,
	[hinh3] [nvarchar](255) NULL,
	[hinh4] [nvarchar](255) NULL,
	[sell_ID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tokenForgetPassword]    Script Date: 7/26/2024 3:36:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tokenForgetPassword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [nvarchar](255) NOT NULL,
	[expiryTime] [datetime2](7) NOT NULL,
	[isUsed] [bit] NOT NULL,
	[uID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID23072444440005', N'admin@vegefoods.com', N'123456', 0, 1)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID23072444440006', N'hieu1@gmail.com', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID2407240001', N'tin1@gmail.com', N'123456', 1, 0)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID24072440002', N'tinphan924@gmail.com', N'aaa', 0, 0)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID2507240001', N'tinphan309z@gmail.com', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID25072440002', N'tinphan924zz@gmail.com', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID250724440003', N'hieupro123@gmail.com', N'123', 0, 1)
INSERT [dbo].[Account] ([uID], [email], [password], [isSell], [isAdmin]) VALUES (N'UID2507244440004', N'hieupro1234@gmail.com', N'123', 0, 0)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'DM001', N'Cải')
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'DM002', N'Rau củ')
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'DM003', N'Nấm')
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'DM004', N'Lá')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (1, N'UID24072440002', N'Phan Đình', N'Hiếu', N'12 Huỳnh Văn Nghệ', N'0327858843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 60000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (2, N'UID2407240001', N'Phan Hữu ', N'Tín', N'240A Nguyễn Thị Tú, KP2, Phường Bình Hưng Hòa B, quận Bình Tân, TP HCM', N'0327858812', N'dinhhieu2003vn@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 100000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (3, N'UID2407240001', N'Phan Hữu ', N'Tín', N'240A Nguyễn Thị Tú, KP2, Phường Bình Hưng Hòa B, quận Bình Tân, TP HCM', N'0327 858 843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 95000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (4, N'UID24072440002', N'Phan Đình', N'Hiếu', N'123 lê lai', N'0327858843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 135500)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (5, N'UID24072440002', N'Phan Đình', N'Hiếu', N'123 lê lai', N'0327858843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 107000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (6, N'UID24072440002', N'Phan Đình', N'Hiếu', N'123 lê lai', N'0327858843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 21000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (7, N'UID24072440002', N'Phan Đình', N'Hiếu', N'123 lê lai', N'0327858843', N'tinphan924@gmail.com', CAST(N'2024-07-25 00:00:00.000' AS DateTime), 204000)
INSERT [dbo].[Order] ([orderID], [uID], [firstName], [lastName], [address], [phone], [email], [orderDate], [totalAmount]) VALUES (8, N'UID24072440002', N'Phan Hữu ', N'Tín', N'240A Nguyễn Thị Tú, KP2, Phường Bình Hưng Hòa B, quận Bình Tân, TP HCM', N'0327 858 843', N'tinphan924@gmail.com', CAST(N'2024-07-26 00:00:00.000' AS DateTime), 89000)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (1, 1, N'SP004', 1, 15000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (2, 1, N'SP006', 1, 45000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (15, 2, N'SP008', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (16, 2, N'SP007', 1, 35000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (17, 2, N'SP004', 1, 15000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (18, 2, N'SP010', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (19, 3, N'SP003', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (20, 3, N'SP008', 1, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (21, 3, N'SP006', 1, 45000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (22, 4, N'SP001', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (23, 4, N'SP11', 1, 19500)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (24, 4, N'SP003', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (25, 4, N'SP007', 1, 35000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (26, 4, N'SP010', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (27, 5, N'SP005', 1, 12000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (28, 5, N'SP010', 2, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (29, 5, N'SP007', 1, 35000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (30, 6, N'SP001', 1, 21000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (31, 7, N'SP11', 12, 19500)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (32, 7, N'SP003', 1, 30000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (33, 8, N'SP005', 2, 12000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (34, 8, N'SP008', 2, 20000)
INSERT [dbo].[OrderDetail] ([orderDetailID], [orderID], [maSP], [quantity], [price]) VALUES (35, 8, N'SP002', 1, 25000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP001', N'Bắp cải thảo', CAST(21000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM001', N'bapcaithao.jpg', N'Giá trị dinh dưỡng trong 100g cải thảo: chứa 95,14 gam nước, 0,86 gam protein, 0,1 gam chất béo, 3,9 gam carbohydrate (0,94 g chất xơ), 13 mg vitamin A, 80 mg carotene, 0.03 mg thiamin, 0,04 mg riboflavin, 0,4 mg niacin, 28 mg vitamin C, 0,36 mg vitamin E (T).', 1000, 98, N'product-1.jpg', N'product-1.jpg', N'product-1.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP002', N'Cải thìa', CAST(25000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM001', N'caithia.jpg', N'Theo Cơ sở dữ liệu dinh dưỡng quốc gia của Bộ Nông nghiệp Hoa Kỳ thì 70g cải thìa chứa, Lượng calorie : 9,1, Chất béo : 0,1g, Natri : 45,5mg, Carbohydrate : 1,5g, Chất xơ : 0,7g, Đường : 0,8g, Chất đạm : 1,1g', 1000, 49, N'product-1.jpg', N'product-1.jpg', N'product-1.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP003', N'Nấm hương', CAST(30000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM003', N'namhuong.jpg', N'Thành phần dinh dưỡng trong Nấm hương khô Việt San gói 80g có thể kể đến như chất đạm, vitamin C, vitamin B, tiền Vitamin D, canxi, nhôm, sắt, magie…giúp bổ sung dưỡng chất cần thiết cho cơ thể.', 1000, 75, N'product-3.jpg', N'product-3.jpg', N'product-3.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP004', N'Lá lốt', CAST(15000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM004', N'lalot.jpg', N'Lá lốt chứa rất nhiều dưỡng chất trong mỗi 100g, bao gồm: 39 kcal, 86,5gr nước, 4,3gr protein, 2,5gr chất xơ, 260mgr canxi, 980mg photpho, 4,1mg sắt và 34mg vitamin C.', 1000, 60, N'product-4.jpg', N'product-4.jpg', N'product-4.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP005', N'Củ cải', CAST(12000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM002', N'cucai.jpg', N'Theo ước tính từ các nhà dinh dưỡng, 338 gram củ cải tươi chứa các chất dinh dưỡng sau đây: Calo: 61, Carbs: 14 gram, Protein: 2 gram, Chất xơ: 5 gram, Vitamin C: 124% DV, Axit folic (vitamin B9): 24% DV, Canxi: 9% của DV, Magiê: 14% của DV, Kali: 22% DV, Đồng: 19% của DV', 1000, 87, N'product-5.jpg', N'product-5.jpg', N'product-5.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP006', N'Giá sống', CAST(45000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM004', N'giasong.jpg', N'Theo Bộ Nông nghiệp Hoa Kỳ thì cứ trong 100 gram giá sống sẽ chứa các chất dinh dưỡng như sau: Năng lượng: 23 kcal, Carbohydrates: 2.1gr, Protein: 3.99gr, Chất béo: 0.69gr, Chất xơ: 1.9gr, Kali: 79mg, Canxi: 32mg', 1000, 110, N'product-6.jpg', N'product-6.jpg', N'product-6.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP007', N'Củ sen', CAST(35000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM002', N'cusen.jpg', N'Trong 100gram củ sen tươi chứa 79,10 g nước và 74 kcal năng lượng. Các chất dinh dưỡng thiết yếu khác trong củ sen như sau: 2,60g protein; 17,23g carbohydrate; 4,9g chất xơ; 45mg canxi; 1,16mg sắt; 23mg magiê; 100mg phốt pho; 556mg kali; 450mg natri; 0,39mg kẽm; 44mg vitamin C; 0,25mg vitamin B6', 1000, 78, N'product-7.jpg', N'product-7.jpg', N'product-7.jpg', N'UID23072444440006')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP008', N'Mồng tơi', CAST(20000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM004', N'mongtoi.jpg', N'Trong rau mồng tơi có các chất như: Vitamin C, A, PP, B1, B2; Pectin; Saponin; Polysaccharide; Tinh bột; Chất đạm và béo; canxi; Sắt; Nước và Folate rất tốt cho cơ thể con người và giàu dinh dưỡng.', 1000, 48, N'product-8.jpg', N'product-8.jpg', N'product-8.jpg', N'UID23072444440005')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP009', N'Rau dền', CAST(5000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM004', N'rauden.jpg', N'Rau dền đỏ chứa 88% là nước và chất xơ, phần còng lại là 12% các chất khác như kẽm, canxi, sắt, đồng, kali, magie, photpho và các vitamin A, B và C', 1000, 200, N'product-9.jpg', N'product-9.jpg', N'product-9.jpg', N'UID23072444440005')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP010', N'Hẹ lá', CAST(30000.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM004', N'hela.jpg', N'Với 100 grams tương đương với 10 muỗng canh hẹ lá xắt nhỏ có thể cung cấp: Calo: 75, Chất đạm: 2.5grams, Chất béo: 0gram, Tinh bột: 17grams, Chất xơ: 3grams, Canxi: 3% giá trị dinh dưỡng hàng ngày (DV), Sắt: 7% DV, Magiê: 5% DV, Phốt pho: 5% DV, Kali: 7% DV, Zinc: 4% DV, Folate: 9% DV', 1000, 47, N'product-10.jpg', N'product-10.jpg', N'product-10.jpg', N'UID23072444440005')
INSERT [dbo].[Product] ([maSP], [tenSP], [giaBan], [donViTinh], [tinhTrang], [maDanhMuc], [hinh1], [moTa], [khoiLuong], [soLuong], [hinh2], [hinh3], [hinh4], [sell_ID]) VALUES (N'SP11', N'Rau rừng', CAST(49500.00 AS Decimal(18, 2)), N'Kg', N'Còn hàng', N'DM002', N'raurung.jpg', N'Rau rừng có lượng protein khá cao: lá dâu 8,7%; lá sắn 7%; lá diễn 5,9%; rau rệu 4,5%; rau dớn 3,6%; dền gai 3,6%; rau má 3,9% tương đương hoặc cao hơn lượng protein trong rau muống. Nếu mỗi ngày ăn khoảng 300g rau rừng sẽ cung cấp cho cơ thể khoảng 70 – 80 calo và trên 10g protein, đồng thời có thêm được một lượng vitamin C cho cơ thể.', 1000, 20, N'raurung.jpg', N'raurung.jpg', N'raurung.jpg', N'UID23072444440006')
SET IDENTITY_INSERT [dbo].[tokenForgetPassword] ON 

INSERT [dbo].[tokenForgetPassword] ([id], [token], [expiryTime], [isUsed], [uID]) VALUES (1, N'76b8c4cd-612f-4a36-b0b1-5f4d2356cac7', CAST(N'2024-07-24 16:06:55.6647442' AS DateTime2), 1, N'UID24072440002')
SET IDENTITY_INSERT [dbo].[tokenForgetPassword] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__AB6E6164551C198F]    Script Date: 7/26/2024 3:36:11 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([maSP])
REFERENCES [dbo].[Product] ([maSP])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([maSP])
REFERENCES [dbo].[Product] ([maSP])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([maDanhMuc])
REFERENCES [dbo].[DanhMuc] ([maDanhMuc])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([sell_ID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[tokenForgetPassword]  WITH CHECK ADD FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
USE [master]
GO
ALTER DATABASE [Vegefoods] SET  READ_WRITE 
GO
