USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 2/18/2024 8:38:47 PM ******/
CREATE DATABASE OnlineShop
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Flower.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Flower_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE OnlineShop SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC OnlineShop.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE OnlineShop SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE OnlineShop SET ANSI_NULLS OFF 
GO
ALTER DATABASE OnlineShop SET ANSI_PADDING OFF 
GO
ALTER DATABASE OnlineShop SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE OnlineShop SET ARITHABORT OFF 
GO
ALTER DATABASE OnlineShop SET AUTO_CLOSE ON 
GO
ALTER DATABASE OnlineShop SET AUTO_SHRINK OFF 
GO
ALTER DATABASE OnlineShop SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE OnlineShop SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE OnlineShop SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE OnlineShop SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE OnlineShop SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE OnlineShop SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE OnlineShop SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE OnlineShop SET  ENABLE_BROKER 
GO
ALTER DATABASE OnlineShop SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE OnlineShop SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE OnlineShop SET TRUSTWORTHY OFF 
GO
ALTER DATABASE OnlineShop SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE OnlineShop SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE OnlineShop SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE OnlineShop SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE OnlineShop SET RECOVERY SIMPLE 
GO
ALTER DATABASE OnlineShop SET  MULTI_USER 
GO
ALTER DATABASE OnlineShop SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE OnlineShop SET DB_CHAINING OFF 
GO
ALTER DATABASE OnlineShop SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE OnlineShop SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE OnlineShop SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE OnlineShop SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Flower', N'ON'
GO
ALTER DATABASE OnlineShop SET QUERY_STORE = ON
GO
ALTER DATABASE OnlineShop SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE OnlineShop
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](50) NULL,
	[email] [nvarchar](500) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [nvarchar](500) NULL,
	[gender] [bit] NULL,
	[phone] [varchar](11) NULL,
	[role_id] [int] NULL,
	[created_by] [int] NULL,
	[created_on] [date] NULL,
	[modifile_by] [int] NULL,
	[modifile_on] [date] NULL,
	[img] [varchar](500) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[banner_id] [int] IDENTITY(1,1) NOT NULL,
	[banner_img] [nvarchar](500) NULL,
	[banner_title] [nvarchar](500) NULL,
	[banner_content] [nvarchar](500) NULL,
	[created_by] [int] NULL,
	[created_on] [date] NULL,
	[modifile_by] [int] NULL,
	[modifile_on] [date] NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[banner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[banner] [ntext] NULL,
	[blog_title] [nvarchar](500) NULL,
	[blog_category] [int] NULL,
	[introduction] [ntext] NULL,
	[body] [ntext] NULL,
	[conclusion] [ntext] NULL,
	[img1] [ntext] NULL,
	[create_date] [date] NULL,
	[viewCount] [int] NULL,
	[status] [bit] NOT NULL,
	[author] [nvarchar](255) NULL,
	CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategory]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [varchar](max) NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
	[admin_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question1]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question1](
	[q1_id] [int] NOT NULL,
	[q1_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Question1] PRIMARY KEY CLUSTERED 
(
	[q1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question2]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question2](
	[q2_id] [int] NOT NULL,
	[q2_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Question2] PRIMARY KEY CLUSTERED 
(
	[q2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/18/2024 8:38:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[email] [nvarchar](500) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [varchar](50) NULL,
	[role_id] [int] NULL,
	[q1_id] [int] NULL,
	[q1_answer] [nvarchar](50) NULL,
	[q2_id] [int] NULL,
	[q2_answer] [nvarchar](50) NULL,
	[img] [varchar](500) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [admin_name], [email], [password], [address], [gender], [phone], [role_id], [created_by], [created_on], [modifile_by], [modifile_on], [img]) VALUES (1, N'user123', N'ab@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Ha Noi', 0, N'01242345', 2, 1, NULL, 1, NULL, N'20f3460528eaca36d20c864f15ca1ed1.jpg')
INSERT [dbo].[Admin] ([admin_id], [admin_name], [email], [password], [address], [gender], [phone], [role_id], [created_by], [created_on], [modifile_by], [modifile_on], [img]) VALUES (24, N'Duy ', N'anhduymx21@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'ha noi', 1, N'123456789', 3, 1, CAST(N'2024-01-25' AS Date), 1, CAST(N'2024-01-25' AS Date), NULL)
INSERT [dbo].[Admin] ([admin_id], [admin_name], [email], [password], [address], [gender], [phone], [role_id], [created_by], [created_on], [modifile_by], [modifile_on], [img]) VALUES (25, N'Duy ', N'thach3619@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'ha noi', 1, N'123456789', 2, 1, CAST(N'2024-02-17' AS Date), 1, CAST(N'2024-02-17' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([banner_id], [banner_img], [banner_title], [banner_content], [created_by], [created_on], [modifile_by], [modifile_on]) VALUES (13, N'Yellow Creative Noodle Food Promotion Banner 2.jpg', N'hhe', N'hho', 1, CAST(N'2024-02-18' AS Date), 1, CAST(N'2024-02-18' AS Date))
INSERT [dbo].[Banner] ([banner_id], [banner_img], [banner_title], [banner_content], [created_by], [created_on], [modifile_by], [modifile_on]) VALUES (14, N'Yellow Creative Noodle Food Promotion Banner 1.jpg', N'hhe', N'hho', 1, CAST(N'2024-02-18' AS Date), 1, CAST(N'2024-02-18' AS Date))
INSERT [dbo].[Banner] ([banner_id], [banner_img], [banner_title], [banner_content], [created_by], [created_on], [modifile_by], [modifile_on]) VALUES (15, N'Yellow Creative Noodle Food Promotion Banner 3.jpg', N'hhe', N'hho', 1, CAST(N'2024-02-18' AS Date), 1, CAST(N'2024-02-18' AS Date))
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (1, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (2, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (3, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (4, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (5, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
INSERT [dbo].[Blog] ([id], [banner], [blog_title], [blog_category], [introduction], [body], [conclusion], [img1], [create_date], [viewCount], [status], [author]) 
VALUES (6, N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', N'Ông Trump thắng vòng sơ bộ ở Iowa', 4, N'Chỉ nửa giờ sau khi các cuộc họp kín chọn ứng viên đảng Cộng hòa bắt đầu tại bang Iowa...', N'Đến chiều 16/1, với 99% phiếu bầu đã được kiểm, ông Trump nhận được hơn 56.000 phiếu, chiếm 51%...', N'Việc bà Haley không giành được vị trí thứ hai được coi là kết quả có lợi cho Trump...', N'https://i1-vnexpress.vnecdn.net/2024/01/16/34EG2WF-highres-6536-1705370647.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=1-wvPGZ9_DXyHww2kc_jfQ', CAST(N'2024-01-11' AS Date), 9, 1, N'Ngọc Ánh')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategory] ON 

INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (1, N'Chính Trị', CAST(N'2022-10-10' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (2, N'Kinh Nghiệm', CAST(N'2022-10-11' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (3, N'Du Lịch', CAST(N'2022-10-12' AS Date))
INSERT [dbo].[BlogCategory] ([id], [category_name], [create_date]) VALUES (4, N'Ẩm Thực', CAST(N'2022-10-13' AS Date))
SET IDENTITY_INSERT [dbo].[BlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Khai vị')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Rau')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Cơm')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'Mì')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'Thịt gà')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (6, N'Đồ uống')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (53, N'Bibibap', 30, 1, 3, N'bibimbap.jpg', N'Cơm trộn Hàn Quốc', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (54, N'Chips', 10, 1, 1, N'chips.jpg', N'Bim Bim khoai tây', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (56, N'Gà Tandoori', 40, 1, 5, N'Gà tandoori.jpg', N'Thịt gà thơm ngon', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (57, N'Xúc Xích', 10, 1, 1, N'xúc xích.jpg', N'Xúc xích rán', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (58, N'Hành chiên', 10, 1, 1, N'hành chiên.jpg', N'Hành tây chiên giòn', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (59, N'Khoai tây bào đường', 15, 1, 1, N'khoai tây.jpg', N'Khoai tây chiên đảo qua với đường', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (60, N'Khai lang bào đường', 15, 1, 1, N'khoai.jpg', N'Khoai lang chiên bào đường', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (61, N'Mì bò ', 35, 1, 4, N'mì bò.jpg', N'Mì cùng với nước dùng bò hảo hạng', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (62, N'Mì xào cay hải ', 35, 1, 4, N'm.jpg', N'Mì xào cay cùng hải sản', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (63, N'Mì ý bò bằm', 35, 1, 4, N'mì ý.jpg', N'Mì ý sốt cà chua bò bằm', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (64, N'Udon', 35, 1, 4, N'udon.jpg', N'Udon', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (65, N'Mì tương đen', 30, 1, 4, N'mì.jpg', N'Mì tương đen ', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (66, N'Nem chua rán', 15, 1, 1, N'nem chua.jpg', N'Nem chua', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (67, N'Mì Ranmen', 45, 1, 4, N'e7a055c298143b479ade0bda6bd53dcf.jpg', N'Mì Ramen', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (68, N'Salad ức gà', 25, 1, 2, N'salad.jpg', N'Salad cùng ức gà', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (69, N'Gà Rán KFC', 18, 1, 5, N'gà rán.jpg', N'Thơm ngon', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (70, N'Gà viên ', 30, 1, 5, N'Gà viên.jpg', N'Gà viên', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (71, N'Gà caramel gừng', 50, 1, 5, N'gà caramel.jpg', N'Gà nướng cùng caramel và gừng', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (72, N'Gà nướng nguyên con', 150, 1, 5, N'8095924bf112df783eb7db31d782a862.jpg', N'Gà nướng mật ong nguyên con', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (73, N'Cơm nắm rong biển', 15, 1, 3, N'20f3460528eaca36d20c864f15ca1ed1.jpg', N'Cơm nắm cùng rong biển', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (74, N'Cơm rang thập cẩm', 35, 1, 3, N'eca9561df15ff6367a899a92d31a4ee5.jpg', N'Cơm rang bò rau củ', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (75, N'Cơm trắng', 5, 1, 3, N'89917ed60c97f69dafdd03c8fe8f629e.jpg', N'Cơm rắc chút lá rau', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (76, N'Cơm cà ri', 55, 1, 3, N'58adec61463c59368526f4fe91e2c78e.jpg', N'Cơm cà ri heo', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (77, N'Cơm chiên lá dứa', 50, 1, 3, N'd517268c21c801bc98e8782a20eb9cdc.jpg', N'Cơm thơm mùi dứa', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (78, N'Cơm kiểu trung hoa', 45, 1, 3, N'b5e4f7743535ca8c6a4917045b04b70f.jpg', N'Cơm chuẩn vị trung hoa', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (79, N'Salad rau củ', 15, 1, 2, N'e840b7e05e8eb3ba13aec856a2aabd1c.jpg', N'cà chua dưa chuột hành tây', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (80, N'Salad cá hồi', 25, 1, 2, N'cc474537618ae14f3d62ff718641c491.jpg', N'Rau củ cùng cá hồi', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (81, N'Salad thập cẩm', 25, 1, 2, N'3836e6eca3f657329ef24a7cdf31e529.jpg', N'bơ, trứng luộc, bacon, cà chua bi, hành tím', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (82, N'Blue lagoon cocktail', 30, 1, 6, N'46ec593d88d3a5abf9e0746b51345a5b.jpg', N'sieu ngon', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (83, N'Nước ép dưa hấu', 25, 1, 6, N'1bbad477d435f6b66a910add35a6adc5.jpg', N'dưa hấu', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (84, N'Thịt xiên ', 15, 1, 1, N'196da1208673041b47294d5998d4ba01.jpg', N'Thịt xiên nướng', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (85, N'Coca', 10, 1, 6, N'ae2d65d73a98f127fdc0b320b2482c8b.jpg', N'coca', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (86, N'Nước cam', 15, 1, 6, N'a68347315e1e13399234c1957982237f.jpg', N'Nước cam', CAST(N'2024-02-18' AS Date), NULL)
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date], [admin_id]) VALUES (87, N'Nước chanh', 15, 1, 6, N'b3cc65036266985ddfc88f3a9e4211a0.jpg', N'Nước chanh', CAST(N'2024-02-18' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Question1] ([q1_id], [q1_name]) VALUES (1, N'Bạn thích ăn món gì nhất?')
INSERT [dbo].[Question1] ([q1_id], [q1_name]) VALUES (2, N'Bạn thích sống ở đâu nhất?')
INSERT [dbo].[Question1] ([q1_id], [q1_name]) VALUES (3, N'Bạn thích con vật gì nhất?')
INSERT [dbo].[Question1] ([q1_id], [q1_name]) VALUES (4, N'Tên hồi bé của bạn là gì?')
INSERT [dbo].[Question1] ([q1_id], [q1_name]) VALUES (5, N'Nếu mai là tận thế thì bạn muốn làm gì?')
GO
INSERT [dbo].[Question2] ([q2_id], [q2_name]) VALUES (1, N'Bố mẹ bạn gặp nhau ở đâu?')
INSERT [dbo].[Question2] ([q2_id], [q2_name]) VALUES (2, N'Bạn thích môn học gì nhất?')
INSERT [dbo].[Question2] ([q2_id], [q2_name]) VALUES (3, N'Bạn hối tiếc điều gì trong quá khứ?')
INSERT [dbo].[Question2] ([q2_id], [q2_name]) VALUES (4, N'Nếu bạn bị kẹt ở hoang đảo thì bạn mang theo gì?')
INSERT [dbo].[Question2] ([q2_id], [q2_name]) VALUES (5, N'Tương lai bạn muốn làm gì?')
GO
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Users')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Admin')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (3, N'Seller')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [email], [password], [address], [gender], [phone], [role_id], [q1_id], [q1_answer], [q2_id], [q2_answer], [img]) VALUES (1, N'abce', N'abc@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Ha Noi', 1, N'012401242345', 1, 1, N'hehe', 1, N'hehe', N'58adec61463c59368526f4fe91e2c78e.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Roles]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Admin1] FOREIGN KEY([admin_id])
REFERENCES [dbo].[Admin] ([admin_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Admin1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Question1] FOREIGN KEY([q1_id])
REFERENCES [dbo].[Question1] ([q1_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Question1]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Question2] FOREIGN KEY([q2_id])
REFERENCES [dbo].[Question2] ([q2_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Question2]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE OnlineShop SET READ_WRITE 
GO
