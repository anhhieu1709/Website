USE [master]
GO
/****** Object:  Database [website]    Script Date: 11/11/2023 2:32:30 PM ******/
CREATE DATABASE [website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [website] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [website] SET ARITHABORT OFF 
GO
ALTER DATABASE [website] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [website] SET  DISABLE_BROKER 
GO
ALTER DATABASE [website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [website] SET RECOVERY FULL 
GO
ALTER DATABASE [website] SET  MULTI_USER 
GO
ALTER DATABASE [website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'website', N'ON'
GO
ALTER DATABASE [website] SET QUERY_STORE = OFF
GO
USE [website]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [nvarchar](50) NULL,
	[Display] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryId]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryId](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [nvarchar](50) NULL,
	[Display] [int] NULL,
 CONSTRAINT [PK_CategoryId] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[Status] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[CategoryId] [int] NULL,
	[Price] [nvarchar](50) NULL,
	[Mota] [ntext] NULL,
 CONSTRAINT [PK_Product_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2023 2:32:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [Display], [Description]) VALUES (1, N'Apple', N'iphone15promax.png', N'iphone-12', 1, N'iPhone là chiếc điện thoại di động đầu tiên sử dụng công nghệ cảm ứng đa điểm Kể từ khi ra mắt
')
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [Display], [Description]) VALUES (2, N'Samsung', N'samsung1.png', N'readmi-12', 2, N'Samsung là một thương hiệu điện tử, viễn thông có trụ sở đặt tại hàn Quốc,thành lập năm 1938
')
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [Display], [Description]) VALUES (3, N'Xiaomi', N'readmi.png', N'sam-sung', 3, N'Xiaomi là nhà sản xuất điện thoại đã chiếm gần 17% thị trường điện thoại thông minh thế giới')
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [Display], [Description]) VALUES (1011, N'Nokia', N'iphone14_20231111020510.png', NULL, NULL, N'âfafafafaf')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang20231110020336', 1006, 1, CAST(N'2023-11-10T02:03:36.873' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang20231110020527', 1006, 1, CAST(N'2023-11-10T02:05:27.977' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang20231110020646', 1006, 1, CAST(N'2023-11-10T02:06:46.370' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang20231110020806', 1006, 1, CAST(N'2023-11-10T02:08:06.667' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang20231110020820', 1006, 1, CAST(N'2023-11-10T02:08:20.563' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang20231110020829', 1006, 1, CAST(N'2023-11-10T02:08:29.033' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang20231110020835', 1006, 1, CAST(N'2023-11-10T02:08:35.747' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang20231110020911', 1006, 1, CAST(N'2023-11-10T02:09:11.027' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang20231110020916', 1006, 1, CAST(N'2023-11-10T02:09:16.327' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang20231110020917', 1006, 1, CAST(N'2023-11-10T02:09:17.407' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang20231110020917', 1006, 1, CAST(N'2023-11-10T02:09:17.790' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang20231110020918', 1006, 1, CAST(N'2023-11-10T02:09:18.217' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang20231110020925', 1006, 1, CAST(N'2023-11-10T02:09:25.423' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang20231110020940', 1006, 1, CAST(N'2023-11-10T02:09:40.897' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang20231110020952', 1006, 1, CAST(N'2023-11-10T02:09:52.737' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang20231110020955', 1006, 1, CAST(N'2023-11-10T02:09:55.107' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (17, N'DonHang20231110020958', 1006, 1, CAST(N'2023-11-10T02:09:58.023' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (18, N'DonHang20231110021348', 1006, 1, CAST(N'2023-11-10T02:13:48.867' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (19, N'DonHang20231110021452', 1006, 1, CAST(N'2023-11-10T02:14:52.767' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (20, N'DonHang20231110021526', 1006, 1, CAST(N'2023-11-10T02:15:26.510' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (21, N'DonHang20231110030153', 1006, 1, CAST(N'2023-11-10T03:01:53.623' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (22, N'DonHang20231110131422', 1006, 1, CAST(N'2023-11-10T13:14:22.370' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (23, N'DonHang20231110135512', 1006, 1, CAST(N'2023-11-10T13:55:12.027' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (24, N'DonHang20231110135635', 1006, 1, CAST(N'2023-11-10T13:56:35.737' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (25, N'DonHang20231110135716', 1006, 1, CAST(N'2023-11-10T13:57:16.313' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (26, N'DonHang20231110135748', 1006, 1, CAST(N'2023-11-10T13:57:48.290' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (27, N'DonHang20231110135757', 1006, 1, CAST(N'2023-11-10T13:57:57.320' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (28, N'DonHang20231110135839', 1006, 1, CAST(N'2023-11-10T13:58:39.990' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (29, N'DonHang20231110135850', 1006, 1, CAST(N'2023-11-10T13:58:50.193' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (30, N'DonHang20231110135939', 1006, 1, CAST(N'2023-11-10T13:59:39.910' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (31, N'DonHang20231110135945', 1006, 1, CAST(N'2023-11-10T13:59:45.227' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (32, N'DonHang20231110140056', 1006, 1, CAST(N'2023-11-10T14:00:56.207' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (33, N'DonHang20231110140133', 1006, 1, CAST(N'2023-11-10T14:01:33.767' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (34, N'DonHang20231110140157', 1006, 1, CAST(N'2023-11-10T14:01:57.333' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (35, N'DonHang20231110140302', 1006, 1, CAST(N'2023-11-10T14:03:02.827' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (36, N'DonHang20231110140337', 1006, 1, CAST(N'2023-11-10T14:03:37.050' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (37, N'DonHang20231110141220', 1006, 1, CAST(N'2023-11-10T14:12:20.647' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (38, N'DonHang20231110141425', 1006, 1, CAST(N'2023-11-10T14:14:25.163' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (39, N'DonHang20231110141705', 1006, 1, CAST(N'2023-11-10T14:17:05.507' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (40, N'DonHang20231110141839', 1006, 1, CAST(N'2023-11-10T14:18:39.137' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (41, N'DonHang20231110142112', 1006, 1, CAST(N'2023-11-10T14:21:12.550' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (42, N'DonHang20231110142123', 1006, 1, CAST(N'2023-11-10T14:21:23.810' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (43, N'DonHang20231110142457', 1006, 1, CAST(N'2023-11-10T14:24:57.490' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (44, N'DonHang20231110142604', 1006, 1, CAST(N'2023-11-10T14:26:04.183' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (48, N'DonHang20231110233309', 1006, 1, CAST(N'2023-11-10T23:33:09.027' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (49, N'DonHang20231111133748', 2008, 1, CAST(N'2023-11-11T13:37:48.280' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 3, 1, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 3, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 21, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 21, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 22, 23, 5)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 23, 23, 105)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 24, 23, 105)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 39, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 39, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 39, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 40, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 40, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 40, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 41, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 41, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 41, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 42, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (18, 42, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (19, 42, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (20, 43, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (21, 43, 23, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (22, 43, 27, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (23, 47, 4, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (24, 48, 29, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (25, 48, 30, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (26, 49, 23, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (2, N'Xiaomi Readmi Not 9', N'xiaomi9T_20231110025330.png', 3, N'7.000.000', N'Xiaomi sở hữu thiết kế độc đáo với cụm camera 3 ống kính trong mô-đun hình chữ nhật các họa tiết vân các-bon giúp máy trông cứng cáp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (3, N'Xiaomi 13 Lite 8GB-128GB', N'xiaomi_20231110025244.png', 3, N'5.200.000', N'Xiaomi sở hữu thiết kế độc đáo với cụm camera 3 ống kính trong mô-đun hình chữ nhật các họa tiết vân các-bon giúp máy trông cứng cáp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (4, N'Iphone 15 ProMax', N'iphone15promax.png_20231110025547.png', 1, N'49.000.000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (23, N'Samsung Note 20 Ultra 5G', N'samsungnot20utra_20231110025148.png', 2, N'8.100.000', N'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (24, N'Iphone 11 Pro', N'iphone11pro_20231110025529.png', 1, N'9.200.000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (25, N'Iphone 12', N'iphone12_20231110025640.png', 1, N'11.100.000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (27, N'Xiaomi Readmi Not 12 ', N'xiaomi12-5G_20231110025853.png', 3, N'9.500.000', N'Xiaomi sở hữu thiết kế độc đáo với cụm camera 3 ống kính trong mô-đun hình chữ nhật các họa tiết vân các-bon giúp máy trông cứng cáp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (28, N'Xiaomi Readmi 12S', N'xiaomi12s_20231110025932.png', 3, N'6.000.000', N'Xiaomi sở hữu thiết kế độc đáo với cụm camera 3 ống kính trong mô-đun hình chữ nhật các họa tiết vân các-bon giúp máy trông cứng cáp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (29, N'Sam Sung S10', N'samsungs10_20231110030022.png', 2, N'5.000.000', N'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (30, N'Sam Sung S20 Ultra', N'samsungs20utra_20231110030107.png', 2, N'7.000.000', N'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (31, N'Iphone 12 ProMax', N'iphone12promax_20231110041602.png', 1, N'20.000.000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (32, N'Iphone 14 Pro', N'iphone14_20231111111353.png', 1, N'30.000.000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (33, N'Samsung S10', N'samsungs10_20231111013615.png', 2, N'10.000.000', N'Samsung từng bước khẳng định thương hiệu của mình bằng việc cho ra đời những mẫu flagship ngày càng hiện đại với công nghệ tiến bộ.')
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (34, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [Price], [Mota]) VALUES (35, N'Nokia', NULL, 1, N'100000', N'Apple luôn chú trọng nâng cấp Camera iPhone để đem đến cho người dùng những trải nghiệm tốt nhất, một sản phẩm có màn hình siêu đẹp.')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (4, N'Hieuu', N'Hieuu', N'hieuanh123@gmail.com', N'81dc9bdb52d04dc20036dbd8313ed055')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (5, N'ho', N'hieuu', N'hohieuu@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1008, N'anh', N'hieu', N'anh@gmail.com', N'123')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1009, N'Hieu', N'Ho', N'hieu@gmail.com', N'1234')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (2008, NULL, NULL, N'ahieu@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (2009, NULL, NULL, N'abc@gmail.com', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [website] SET  READ_WRITE 
GO
