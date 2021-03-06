USE [master]
GO
/****** Object:  Database [QuizDB]    Script Date: 2/16/2020 11:10:31 AM ******/
CREATE DATABASE [QuizDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuizDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuizDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QuizDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuizDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizDB] SET RECOVERY FULL 
GO
ALTER DATABASE [QuizDB] SET  MULTI_USER 
GO
ALTER DATABASE [QuizDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizDB', N'ON'
GO
ALTER DATABASE [QuizDB] SET QUERY_STORE = OFF
GO
USE [QuizDB]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 2/16/2020 11:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](200) NOT NULL,
	[OptA] [nvarchar](150) NOT NULL,
	[OptB] [nvarchar](150) NOT NULL,
	[OptC] [nvarchar](150) NOT NULL,
	[OptD] [nvarchar](150) NOT NULL,
	[Answer] [nvarchar](50) NOT NULL,
	[DateCreated] [date] NULL,
	[CreatorID] [int] NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Result]    Script Date: 2/16/2020 11:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Result](
	[UserID] [int] NOT NULL,
	[Mark] [float] NOT NULL,
	[DateTaken] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTBL]    Script Date: 2/16/2020 11:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTBL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_UserTBL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 2/16/2020 11:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (1, N'The name of capital of Vietnam after 1975', N'Sai Gon', N'HCM', N'Ha Noi', N'Can Tho', N'Ha Noi', CAST(N'2018-05-25' AS Date), 5)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (14, N'phat la ai', N'dep trai ', N'vui tinh', N'hai huoc ', N'ngu ngo', N'dep trai ', CAST(N'2020-01-09' AS Date), 9)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (15, N'phat la ai', N'la tui', N'la no', N'la may', N'la ban do', N'la tui', CAST(N'2020-01-10' AS Date), 10)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (16, N'phat dep trai khong', N'co ', N'khong', N'nothing', N'nothing', N'co ', CAST(N'2020-01-10' AS Date), 9)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (17, N'hello! how are you?', N'fine ', N'bad ', N'boring', N'tired ', N'fine ', CAST(N'2020-01-10' AS Date), 9)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (19, N'phat hoc lop bao nhieu', N'1315', N'1317', N'1319', N'0', N'1315', CAST(N'2020-01-14' AS Date), 5)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (20, N'123123', N'11', N'11', N'11', N'11', N'11', CAST(N'2020-01-14' AS Date), 11)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (21, N'phattt co may chu t', N'1', N'2', N'3', N'5', N'3', CAST(N'2020-01-15' AS Date), 5)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (22, N'chao la gi', N'helu', N'hello', N'halo', N'belo', N'hello', CAST(N'2020-01-15' AS Date), 5)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (23, N'troi hom nay the nao', N'nang', N'mua ', N'am u', N'dep troi', N'nang', CAST(N'2020-01-15' AS Date), 11)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (24, N'ban di hoc bang phuong tien gi', N'xe may ', N'o to', N'may bay', N'tau dien', N'o to', CAST(N'2020-01-15' AS Date), 11)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (25, N'may tinh cua ban loai gi ', N'dell', N'aus', N'lenovo', N'HP', N'dell', CAST(N'2020-01-15' AS Date), 11)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (26, N'chao cac ban la gi', N'mina san', N'hello bye ', N'lew', N'buye', N'mina san', CAST(N'2020-01-16' AS Date), 5)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (27, N'abcxyz', N'a', N'b', N'c', N'd', N'd', CAST(N'2020-02-05' AS Date), 13)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (28, N'mien ', N'stupid', N'lovely', N'gentle
', N'Dirty plaque', N'stupid', CAST(N'2020-02-05' AS Date), 13)
INSERT [dbo].[Quiz] ([ID], [Content], [OptA], [OptB], [OptC], [OptD], [Answer], [DateCreated], [CreatorID]) VALUES (29, N'yayaya co may chu', N'1', N'2', N'3', N'4', N'1', CAST(N'2020-02-05' AS Date), 13)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 15, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 20, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 5, CAST(N'2018-05-30' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (8, 10, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 13.333333969116211, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-05-29' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 20, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 30, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 40, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 50, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 60, CAST(N'2018-06-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 5, CAST(N'2018-06-08' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 6, CAST(N'2018-06-06' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 8, CAST(N'2020-01-09' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2020-01-12' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2020-01-12' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 5, CAST(N'2020-01-12' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 0, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 5, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 10, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 0, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 0, CAST(N'2020-01-14' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 5, CAST(N'2020-01-15' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (5, 10, CAST(N'2020-01-15' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 9, CAST(N'2020-02-05' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 3.3333334922790527, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-08' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (2, 10, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 10, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 5, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 0, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 0, CAST(N'2020-01-13' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (11, 0, CAST(N'2020-01-13' AS Date))
GO
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 5, CAST(N'2020-02-11' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 5, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 0, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 10, CAST(N'2020-02-07' AS Date))
INSERT [dbo].[Test_Result] ([UserID], [Mark], [DateTaken]) VALUES (13, 3.3333334922790527, CAST(N'2020-02-07' AS Date))
SET IDENTITY_INSERT [dbo].[UserTBL] ON 

INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (5, N'2', N'2', 2, N'eeee@xyz.abc')
INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (9, N'phat1234', N'Ph@t2910', 2, N'phat@gmail.com')
INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (10, N'phat12345', N'Ph@t2910', 2, N'phat@gmail.com')
INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (11, N'phat123123', N'Ph@t2910', 2, N'phat@gmail.com')
INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (12, N'phatoi123', N'Ph@t2910', 1, N'phat@gmail.com')
INSERT [dbo].[UserTBL] ([ID], [Username], [Password], [TypeID], [Email]) VALUES (13, N'phatka99', N'Ph@t2910', 2, N'phat@gmail.com')
SET IDENTITY_INSERT [dbo].[UserTBL] OFF
INSERT [dbo].[UserType] ([ID], [Name]) VALUES (1, N'Student')
INSERT [dbo].[UserType] ([ID], [Name]) VALUES (2, N'Teacher')
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_CreatorID] FOREIGN KEY([CreatorID])
REFERENCES [dbo].[UserTBL] ([ID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_CreatorID]
GO
ALTER TABLE [dbo].[UserTBL]  WITH CHECK ADD  CONSTRAINT [FK_UserTBL_UserType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
ALTER TABLE [dbo].[UserTBL] CHECK CONSTRAINT [FK_UserTBL_UserType]
GO
USE [master]
GO
ALTER DATABASE [QuizDB] SET  READ_WRITE 
GO
