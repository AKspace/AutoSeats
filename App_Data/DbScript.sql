USE [master]
GO
/****** Object:  Database [AutoSeats]    Script Date: 04/24/18 2:31:09 PM ******/
CREATE DATABASE [AutoSeats]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoSeats', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AutoSeats.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoSeats_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AutoSeats_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoSeats] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoSeats].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoSeats] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoSeats] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoSeats] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoSeats] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoSeats] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoSeats] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoSeats] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoSeats] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoSeats] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoSeats] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoSeats] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoSeats] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoSeats] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoSeats] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoSeats] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoSeats] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoSeats] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoSeats] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoSeats] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoSeats] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoSeats] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoSeats] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoSeats] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoSeats] SET  MULTI_USER 
GO
ALTER DATABASE [AutoSeats] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoSeats] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoSeats] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoSeats] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AutoSeats] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutoSeats', N'ON'
GO
ALTER DATABASE [AutoSeats] SET QUERY_STORE = OFF
GO
USE [AutoSeats]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AutoSeats]
GO
/****** Object:  UserDefinedTableType [dbo].[SittingPlanType]    Script Date: 04/24/18 2:31:10 PM ******/
CREATE TYPE [dbo].[SittingPlanType] AS TABLE(
	[room_id] [varchar](50) NULL,
	[roll_number] [varchar](50) NULL,
	[column_index] [int] NULL,
	[row_index] [int] NULL,
	[date] [varchar](50) NULL,
	[shift] [int] NULL,
	[branch_id] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TimeTableType]    Script Date: 04/24/18 2:31:10 PM ******/
CREATE TYPE [dbo].[TimeTableType] AS TABLE(
	[date] [date] NULL,
	[shift] [smallint] NULL,
	[subject_id] [varchar](50) NULL,
	[subject_name] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[branch]    Script Date: 04/24/18 2:31:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branch_code] [varchar](25) NOT NULL,
	[branch_name] [varchar](100) NOT NULL,
	[total_students] [varchar](50) NULL,
 CONSTRAINT [PK_branch_details] PRIMARY KEY CLUSTERED 
(
	[branch_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [varchar](50) NOT NULL,
	[total_seats] [int] NOT NULL,
	[no_of_column] [int] NOT NULL,
	[no_of_row] [int] NOT NULL,
	[available_seats] [int] NULL,
	[room_block] [varchar](50) NULL,
 CONSTRAINT [PK_room_details] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sitting plan]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sitting plan](
	[room_id] [varchar](50) NOT NULL,
	[roll_number] [varchar](50) NOT NULL,
	[column_index] [int] NULL,
	[row_index] [int] NULL,
	[date] [varchar](50) NULL,
	[shift] [int] NULL,
	[branch_id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sittingplanstatus]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sittingplanstatus](
	[examdate] [varchar](50) NULL,
	[status] [bit] NULL,
	[generationtime] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[enrollment_number] [varchar](50) NOT NULL,
	[roll_number] [varchar](50) NOT NULL,
	[year_of_admission] [varchar](30) NULL,
	[branch_id] [varchar](50) NULL,
	[name] [varchar](100) NULL,
	[semester] [varchar](50) NULL,
	[other1] [varchar](50) NULL,
	[other2] [varchar](50) NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[enrollment_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subject_id] [varchar](25) NOT NULL,
	[subject_name] [varchar](100) NOT NULL,
	[branch_code] [varchar](25) NOT NULL,
	[other1] [varchar](25) NULL,
 CONSTRAINT [PK_subject_details] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_table]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_table](
	[date] [date] NOT NULL,
	[subject_id] [varchar](50) NOT NULL,
	[shift] [smallint] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'9', N'br9', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'BT', N'BT', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'CE', N'CE', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'CS', N'CS', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'EC', N'EC', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'EE', N' EE', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'IT', N'IT', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'ME', N'ME', N'50')
GO
INSERT [dbo].[branch] ([branch_code], [branch_name], [total_students]) VALUES (N'PT', N'PT', N'50')
GO
INSERT [dbo].[room] ([room_id], [total_seats], [no_of_column], [no_of_row], [available_seats], [room_block]) VALUES (N'KB201', 36, 6, 6, 36, NULL)
GO
INSERT [dbo].[room] ([room_id], [total_seats], [no_of_column], [no_of_row], [available_seats], [room_block]) VALUES (N'KB302', 49, 7, 7, 49, NULL)
GO
INSERT [dbo].[room] ([room_id], [total_seats], [no_of_column], [no_of_row], [available_seats], [room_block]) VALUES (N'KB303', 64, 8, 8, 64, NULL)
GO
INSERT [dbo].[room] ([room_id], [total_seats], [no_of_column], [no_of_row], [available_seats], [room_block]) VALUES (N'KB304', 64, 8, 8, 64, NULL)
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14001', 0, 0, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14001', 0, 1, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14002', 0, 2, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14002', 0, 3, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14003', 0, 4, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14003', 0, 5, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14004', 0, 6, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14004', 0, 7, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14001', 1, 0, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14001', 1, 1, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14002', 1, 2, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14002', 1, 3, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14003', 1, 4, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14003', 1, 5, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14004', 1, 6, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14004', 1, 7, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14005', 2, 0, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14005', 2, 1, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14006', 2, 2, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14006', 2, 3, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14007', 2, 4, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14007', 2, 5, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14008', 2, 6, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14008', 2, 7, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14005', 3, 0, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14005', 3, 1, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14006', 3, 2, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14006', 3, 3, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14007', 3, 4, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14007', 3, 5, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14008', 3, 6, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14008', 3, 7, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14009', 4, 0, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14009', 4, 1, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14010', 4, 2, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14010', 4, 3, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14011', 4, 4, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14011', 4, 5, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14012', 4, 6, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14012', 4, 7, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14009', 5, 0, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14009', 5, 1, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14010', 5, 2, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14010', 5, 3, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14011', 5, 4, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14011', 5, 5, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14012', 5, 6, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14012', 5, 7, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14013', 6, 0, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14013', 6, 1, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14014', 6, 2, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14014', 6, 3, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14015', 6, 4, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14015', 6, 5, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1CS14016', 6, 6, N'2018-12-24', 1, N'CS')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1ME14016', 6, 7, N'2018-12-24', 1, N'ME')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14013', 7, 0, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14013', 7, 1, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14014', 7, 2, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14014', 7, 3, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14015', 7, 4, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14015', 7, 5, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EC14016', 7, 6, N'2018-12-24', 1, N'EC')
GO
INSERT [dbo].[sitting plan] ([room_id], [roll_number], [column_index], [row_index], [date], [shift], [branch_id]) VALUES (N'KB303', N'BETN1EE14016', 7, 7, N'2018-12-24', 1, N'EE')
GO
INSERT [dbo].[sittingplanstatus] ([examdate], [status], [generationtime]) VALUES (N'2018-12-24', 1, NULL)
GO
INSERT [dbo].[sittingplanstatus] ([examdate], [status], [generationtime]) VALUES (N'2018-12-25', 0, NULL)
GO
INSERT [dbo].[sittingplanstatus] ([examdate], [status], [generationtime]) VALUES (N'2018-03-25', 1, NULL)
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0001', N'BETN1CS14001', N'2014', N'CS', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0002', N'BETN1CS14002', N'2014', N'CS', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0003', N'BETN1CS14003', N'2014', N'CS', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0004', N'BETN1CS14004', N'2014', N'CS', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0005', N'BETN1CS14005', N'2014', N'CS', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0006', N'BETN1CS14006', N'2014', N'CS', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0007', N'BETN1CS14007', N'2014', N'CS', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0008', N'BETN1CS14008', N'2014', N'CS', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0009', N'BETN1CS14009', N'2014', N'CS', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0010', N'BETN1CS14010', N'2014', N'CS', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0011', N'BETN1CS14011', N'2014', N'CS', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0012', N'BETN1CS14012', N'2014', N'CS', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0013', N'BETN1CS14013', N'2014', N'CS', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0014', N'BETN1CS14014', N'2014', N'CS', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0015', N'BETN1CS14015', N'2014', N'CS', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0016', N'BETN1CS14016', N'2014', N'CS', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0017', N'BETN1CS14017', N'2014', N'CS', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0018', N'BETN1CS14018', N'2014', N'CS', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0019', N'BETN1CS14019', N'2014', N'CS', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0020', N'BETN1CS14020', N'2014', N'CS', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0021', N'BETN1CS14021', N'2014', N'CS', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0022', N'BETN1CS14022', N'2014', N'CS', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0023', N'BETN1CS14023', N'2014', N'CS', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0024', N'BETN1CS14024', N'2014', N'CS', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0025', N'BETN1CS14025', N'2014', N'CS', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0026', N'BETN1CS14026', N'2014', N'CS', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0027', N'BETN1CS14027', N'2014', N'CS', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0028', N'BETN1CS14028', N'2014', N'CS', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0029', N'BETN1CS14029', N'2014', N'CS', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0030', N'BETN1CS14030', N'2014', N'CS', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0031', N'BETN1CS14031', N'2014', N'CS', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0032', N'BETN1CS14032', N'2014', N'CS', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0033', N'BETN1CS14033', N'2014', N'CS', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0034', N'BETN1CS14034', N'2014', N'CS', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0035', N'BETN1CS14035', N'2014', N'CS', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0036', N'BETN1CS14036', N'2014', N'CS', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0037', N'BETN1CS14037', N'2014', N'CS', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0038', N'BETN1CS14038', N'2014', N'CS', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0039', N'BETN1CS14039', N'2014', N'CS', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0040', N'BETN1CS14040', N'2014', N'CS', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0041', N'BETN1CS14041', N'2014', N'CS', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0042', N'BETN1CS14042', N'2014', N'CS', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0043', N'BETN1CS14043', N'2014', N'CS', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0044', N'BETN1CS14044', N'2014', N'CS', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0045', N'BETN1CS14045', N'2014', N'CS', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0046', N'BETN1CS14046', N'2014', N'CS', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0047', N'BETN1CS14047', N'2014', N'CS', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0048', N'BETN1CS14048', N'2014', N'CS', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0049', N'BETN1CS14049', N'2014', N'CS', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0050', N'BETN1CS14050', N'2014', N'CS', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0051', N'BETN1ME14001', N'2014', N'ME', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0052', N'BETN1ME14002', N'2014', N'ME', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0053', N'BETN1ME14003', N'2014', N'ME', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0054', N'BETN1ME14004', N'2014', N'ME', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0055', N'BETN1ME14005', N'2014', N'ME', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0056', N'BETN1ME14006', N'2014', N'ME', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0057', N'BETN1ME14007', N'2014', N'ME', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0058', N'BETN1ME14008', N'2014', N'ME', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0059', N'BETN1ME14009', N'2014', N'ME', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0060', N'BETN1ME14010', N'2014', N'ME', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0061', N'BETN1ME14011', N'2014', N'ME', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0062', N'BETN1ME14012', N'2014', N'ME', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0063', N'BETN1ME14013', N'2014', N'ME', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0064', N'BETN1ME14014', N'2014', N'ME', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0065', N'BETN1ME14015', N'2014', N'ME', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0066', N'BETN1ME14016', N'2014', N'ME', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0067', N'BETN1ME14017', N'2014', N'ME', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0068', N'BETN1ME14018', N'2014', N'ME', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0069', N'BETN1ME14019', N'2014', N'ME', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0070', N'BETN1ME14020', N'2014', N'ME', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0071', N'BETN1ME14021', N'2014', N'ME', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0072', N'BETN1ME14022', N'2014', N'ME', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0073', N'BETN1ME14023', N'2014', N'ME', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0074', N'BETN1ME14024', N'2014', N'ME', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0075', N'BETN1ME14025', N'2014', N'ME', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0076', N'BETN1ME14026', N'2014', N'ME', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0077', N'BETN1ME14027', N'2014', N'ME', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0078', N'BETN1ME14028', N'2014', N'ME', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0079', N'BETN1ME14029', N'2014', N'ME', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0080', N'BETN1ME14030', N'2014', N'ME', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0081', N'BETN1ME14031', N'2014', N'ME', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0082', N'BETN1ME14032', N'2014', N'ME', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0083', N'BETN1ME14033', N'2014', N'ME', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0084', N'BETN1ME14034', N'2014', N'ME', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0085', N'BETN1ME14035', N'2014', N'ME', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0086', N'BETN1ME14036', N'2014', N'ME', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0087', N'BETN1ME14037', N'2014', N'ME', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0088', N'BETN1ME14038', N'2014', N'ME', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0089', N'BETN1ME14039', N'2014', N'ME', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0090', N'BETN1ME14040', N'2014', N'ME', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0091', N'BETN1ME14041', N'2014', N'ME', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0092', N'BETN1ME14042', N'2014', N'ME', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0093', N'BETN1ME14043', N'2014', N'ME', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0094', N'BETN1ME14044', N'2014', N'ME', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0095', N'BETN1ME14045', N'2014', N'ME', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0096', N'BETN1ME14046', N'2014', N'ME', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0097', N'BETN1ME14047', N'2014', N'ME', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0098', N'BETN1ME14048', N'2014', N'ME', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0099', N'BETN1ME14049', N'2014', N'ME', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0100', N'BETN1ME14050', N'2014', N'ME', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0101', N'BETN1CE14001', N'2014', N'CE', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0102', N'BETN1CE14002', N'2014', N'CE', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0103', N'BETN1CE14003', N'2014', N'CE', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0104', N'BETN1CE14004', N'2014', N'CE', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0105', N'BETN1CE14005', N'2014', N'CE', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0106', N'BETN1CE14006', N'2014', N'CE', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0107', N'BETN1CE14007', N'2014', N'CE', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0108', N'BETN1CE14008', N'2014', N'CE', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0109', N'BETN1CE14009', N'2014', N'CE', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0110', N'BETN1CE14010', N'2014', N'CE', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0111', N'BETN1CE14011', N'2014', N'CE', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0112', N'BETN1CE14012', N'2014', N'CE', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0113', N'BETN1CE14013', N'2014', N'CE', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0114', N'BETN1CE14014', N'2014', N'CE', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0115', N'BETN1CE14015', N'2014', N'CE', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0116', N'BETN1CE14016', N'2014', N'CE', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0117', N'BETN1CE14017', N'2014', N'CE', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0118', N'BETN1CE14018', N'2014', N'CE', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0119', N'BETN1CE14019', N'2014', N'CE', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0120', N'BETN1CE14020', N'2014', N'CE', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0121', N'BETN1CE14021', N'2014', N'CE', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0122', N'BETN1CE14022', N'2014', N'CE', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0123', N'BETN1CE14023', N'2014', N'CE', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0124', N'BETN1CE14024', N'2014', N'CE', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0125', N'BETN1CE14025', N'2014', N'CE', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0126', N'BETN1CE14026', N'2014', N'CE', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0127', N'BETN1CE14027', N'2014', N'CE', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0128', N'BETN1CE14028', N'2014', N'CE', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0129', N'BETN1CE14029', N'2014', N'CE', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0130', N'BETN1CE14030', N'2014', N'CE', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0131', N'BETN1CE14031', N'2014', N'CE', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0132', N'BETN1CE14032', N'2014', N'CE', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0133', N'BETN1CE14033', N'2014', N'CE', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0134', N'BETN1CE14034', N'2014', N'CE', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0135', N'BETN1CE14035', N'2014', N'CE', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0136', N'BETN1CE14036', N'2014', N'CE', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0137', N'BETN1CE14037', N'2014', N'CE', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0138', N'BETN1CE14038', N'2014', N'CE', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0139', N'BETN1CE14039', N'2014', N'CE', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0140', N'BETN1CE14040', N'2014', N'CE', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0141', N'BETN1CE14041', N'2014', N'CE', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0142', N'BETN1CE14042', N'2014', N'CE', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0143', N'BETN1CE14043', N'2014', N'CE', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0144', N'BETN1CE14044', N'2014', N'CE', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0145', N'BETN1CE14045', N'2014', N'CE', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0146', N'BETN1CE14046', N'2014', N'CE', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0147', N'BETN1CE14047', N'2014', N'CE', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0148', N'BETN1CE14048', N'2014', N'CE', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0149', N'BETN1CE14049', N'2014', N'CE', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0150', N'BETN1CE14050', N'2014', N'CE', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0151', N'BETN1EC14001', N'2014', N'EC', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0152', N'BETN1EC14002', N'2014', N'EC', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0153', N'BETN1EC14003', N'2014', N'EC', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0154', N'BETN1EC14004', N'2014', N'EC', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0155', N'BETN1EC14005', N'2014', N'EC', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0156', N'BETN1EC14006', N'2014', N'EC', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0157', N'BETN1EC14007', N'2014', N'EC', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0158', N'BETN1EC14008', N'2014', N'EC', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0159', N'BETN1EC14009', N'2014', N'EC', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0160', N'BETN1EC14010', N'2014', N'EC', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0161', N'BETN1EC14011', N'2014', N'EC', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0162', N'BETN1EC14012', N'2014', N'EC', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0163', N'BETN1EC14013', N'2014', N'EC', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0164', N'BETN1EC14014', N'2014', N'EC', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0165', N'BETN1EC14015', N'2014', N'EC', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0166', N'BETN1EC14016', N'2014', N'EC', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0167', N'BETN1EC14017', N'2014', N'EC', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0168', N'BETN1EC14018', N'2014', N'EC', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0169', N'BETN1EC14019', N'2014', N'EC', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0170', N'BETN1EC14020', N'2014', N'EC', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0171', N'BETN1EC14021', N'2014', N'EC', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0172', N'BETN1EC14022', N'2014', N'EC', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0173', N'BETN1EC14023', N'2014', N'EC', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0174', N'BETN1EC14024', N'2014', N'EC', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0175', N'BETN1EC14025', N'2014', N'EC', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0176', N'BETN1EC14026', N'2014', N'EC', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0177', N'BETN1EC14027', N'2014', N'EC', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0178', N'BETN1EC14028', N'2014', N'EC', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0179', N'BETN1EC14029', N'2014', N'EC', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0180', N'BETN1EC14030', N'2014', N'EC', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0181', N'BETN1EC14031', N'2014', N'EC', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0182', N'BETN1EC14032', N'2014', N'EC', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0183', N'BETN1EC14033', N'2014', N'EC', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0184', N'BETN1EC14034', N'2014', N'EC', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0185', N'BETN1EC14035', N'2014', N'EC', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0186', N'BETN1EC14036', N'2014', N'EC', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0187', N'BETN1EC14037', N'2014', N'EC', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0188', N'BETN1EC14038', N'2014', N'EC', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0189', N'BETN1EC14039', N'2014', N'EC', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0190', N'BETN1EC14040', N'2014', N'EC', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0191', N'BETN1EC14041', N'2014', N'EC', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0192', N'BETN1EC14042', N'2014', N'EC', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0193', N'BETN1EC14043', N'2014', N'EC', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0194', N'BETN1EC14044', N'2014', N'EC', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0195', N'BETN1EC14045', N'2014', N'EC', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0196', N'BETN1EC14046', N'2014', N'EC', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0197', N'BETN1EC14047', N'2014', N'EC', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0198', N'BETN1EC14048', N'2014', N'EC', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0199', N'BETN1EC14049', N'2014', N'EC', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0200', N'BETN1EC14050', N'2014', N'EC', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0201', N'BETN1EE14001', N'2014', N'EE', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0202', N'BETN1EE14002', N'2014', N'EE', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0203', N'BETN1EE14003', N'2014', N'EE', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0204', N'BETN1EE14004', N'2014', N'EE', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0205', N'BETN1EE14005', N'2014', N'EE', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0206', N'BETN1EE14006', N'2014', N'EE', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0207', N'BETN1EE14007', N'2014', N'EE', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0208', N'BETN1EE14008', N'2014', N'EE', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0209', N'BETN1EE14009', N'2014', N'EE', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0210', N'BETN1EE14010', N'2014', N'EE', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0211', N'BETN1EE14011', N'2014', N'EE', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0212', N'BETN1EE14012', N'2014', N'EE', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0213', N'BETN1EE14013', N'2014', N'EE', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0214', N'BETN1EE14014', N'2014', N'EE', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0215', N'BETN1EE14015', N'2014', N'EE', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0216', N'BETN1EE14016', N'2014', N'EE', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0217', N'BETN1EE14017', N'2014', N'EE', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0218', N'BETN1EE14018', N'2014', N'EE', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0219', N'BETN1EE14019', N'2014', N'EE', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0220', N'BETN1EE14020', N'2014', N'EE', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0221', N'BETN1EE14021', N'2014', N'EE', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0222', N'BETN1EE14022', N'2014', N'EE', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0223', N'BETN1EE14023', N'2014', N'EE', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0224', N'BETN1EE14024', N'2014', N'EE', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0225', N'BETN1EE14025', N'2014', N'EE', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0226', N'BETN1EE14026', N'2014', N'EE', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0227', N'BETN1EE14027', N'2014', N'EE', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0228', N'BETN1EE14028', N'2014', N'EE', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0229', N'BETN1EE14029', N'2014', N'EE', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0230', N'BETN1EE14030', N'2014', N'EE', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0231', N'BETN1EE14031', N'2014', N'EE', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0232', N'BETN1EE14032', N'2014', N'EE', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0233', N'BETN1EE14033', N'2014', N'EE', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0234', N'BETN1EE14034', N'2014', N'EE', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0235', N'BETN1EE14035', N'2014', N'EE', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0236', N'BETN1EE14036', N'2014', N'EE', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0237', N'BETN1EE14037', N'2014', N'EE', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0238', N'BETN1EE14038', N'2014', N'EE', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0239', N'BETN1EE14039', N'2014', N'EE', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0240', N'BETN1EE14040', N'2014', N'EE', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0241', N'BETN1EE14041', N'2014', N'EE', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0242', N'BETN1EE14042', N'2014', N'EE', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0243', N'BETN1EE14043', N'2014', N'EE', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0244', N'BETN1EE14044', N'2014', N'EE', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0245', N'BETN1EE14045', N'2014', N'EE', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0246', N'BETN1EE14046', N'2014', N'EE', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0247', N'BETN1EE14047', N'2014', N'EE', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0248', N'BETN1EE14048', N'2014', N'EE', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0249', N'BETN1EE14049', N'2014', N'EE', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0250', N'BETN1EE14050', N'2014', N'EE', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0251', N'BETN1BT14001', N'2014', N'BT', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0252', N'BETN1BT14002', N'2014', N'BT', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0253', N'BETN1BT14003', N'2014', N'BT', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0254', N'BETN1BT14004', N'2014', N'BT', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0255', N'BETN1BT14005', N'2014', N'BT', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0256', N'BETN1BT14006', N'2014', N'BT', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0257', N'BETN1BT14007', N'2014', N'BT', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0258', N'BETN1BT14008', N'2014', N'BT', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0259', N'BETN1BT14009', N'2014', N'BT', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0260', N'BETN1BT14010', N'2014', N'BT', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0261', N'BETN1BT14011', N'2014', N'BT', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0262', N'BETN1BT14012', N'2014', N'BT', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0263', N'BETN1BT14013', N'2014', N'BT', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0264', N'BETN1BT14014', N'2014', N'BT', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0265', N'BETN1BT14015', N'2014', N'BT', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0266', N'BETN1BT14016', N'2014', N'BT', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0267', N'BETN1BT14017', N'2014', N'BT', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0268', N'BETN1BT14018', N'2014', N'BT', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0269', N'BETN1BT14019', N'2014', N'BT', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0270', N'BETN1BT14020', N'2014', N'BT', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0271', N'BETN1BT14021', N'2014', N'BT', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0272', N'BETN1BT14022', N'2014', N'BT', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0273', N'BETN1BT14023', N'2014', N'BT', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0274', N'BETN1BT14024', N'2014', N'BT', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0275', N'BETN1BT14025', N'2014', N'BT', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0276', N'BETN1BT14026', N'2014', N'BT', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0277', N'BETN1BT14027', N'2014', N'BT', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0278', N'BETN1BT14028', N'2014', N'BT', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0279', N'BETN1BT14029', N'2014', N'BT', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0280', N'BETN1BT14030', N'2014', N'BT', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0281', N'BETN1BT14031', N'2014', N'BT', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0282', N'BETN1BT14032', N'2014', N'BT', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0283', N'BETN1BT14033', N'2014', N'BT', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0284', N'BETN1BT14034', N'2014', N'BT', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0285', N'BETN1BT14035', N'2014', N'BT', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0286', N'BETN1BT14036', N'2014', N'BT', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0287', N'BETN1BT14037', N'2014', N'BT', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0288', N'BETN1BT14038', N'2014', N'BT', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0289', N'BETN1BT14039', N'2014', N'BT', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0290', N'BETN1BT14040', N'2014', N'BT', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0291', N'BETN1BT14041', N'2014', N'BT', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0292', N'BETN1BT14042', N'2014', N'BT', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0293', N'BETN1BT14043', N'2014', N'BT', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0294', N'BETN1BT14044', N'2014', N'BT', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0295', N'BETN1BT14045', N'2014', N'BT', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0296', N'BETN1BT14046', N'2014', N'BT', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0297', N'BETN1BT14047', N'2014', N'BT', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0298', N'BETN1BT14048', N'2014', N'BT', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0299', N'BETN1BT14049', N'2014', N'BT', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0300', N'BETN1BT14050', N'2014', N'BT', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0301', N'BETN1PT14001', N'2014', N'PT', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0302', N'BETN1PT14002', N'2014', N'PT', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0303', N'BETN1PT14003', N'2014', N'PT', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0304', N'BETN1PT14004', N'2014', N'PT', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0305', N'BETN1PT14005', N'2014', N'PT', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0306', N'BETN1PT14006', N'2014', N'PT', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0307', N'BETN1PT14007', N'2014', N'PT', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0308', N'BETN1PT14008', N'2014', N'PT', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0309', N'BETN1PT14009', N'2014', N'PT', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0310', N'BETN1PT14010', N'2014', N'PT', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0311', N'BETN1PT14011', N'2014', N'PT', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0312', N'BETN1PT14012', N'2014', N'PT', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0313', N'BETN1PT14013', N'2014', N'PT', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0314', N'BETN1PT14014', N'2014', N'PT', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0315', N'BETN1PT14015', N'2014', N'PT', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0316', N'BETN1PT14016', N'2014', N'PT', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0317', N'BETN1PT14017', N'2014', N'PT', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0318', N'BETN1PT14018', N'2014', N'PT', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0319', N'BETN1PT14019', N'2014', N'PT', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0320', N'BETN1PT14020', N'2014', N'PT', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0321', N'BETN1PT14021', N'2014', N'PT', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0322', N'BETN1PT14022', N'2014', N'PT', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0323', N'BETN1PT14023', N'2014', N'PT', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0324', N'BETN1PT14024', N'2014', N'PT', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0325', N'BETN1PT14025', N'2014', N'PT', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0326', N'BETN1PT14026', N'2014', N'PT', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0327', N'BETN1PT14027', N'2014', N'PT', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0328', N'BETN1PT14028', N'2014', N'PT', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0329', N'BETN1PT14029', N'2014', N'PT', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0330', N'BETN1PT14030', N'2014', N'PT', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0331', N'BETN1PT14031', N'2014', N'PT', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0332', N'BETN1PT14032', N'2014', N'PT', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0333', N'BETN1PT14033', N'2014', N'PT', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0334', N'BETN1PT14034', N'2014', N'PT', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0335', N'BETN1PT14035', N'2014', N'PT', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0336', N'BETN1PT14036', N'2014', N'PT', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0337', N'BETN1PT14037', N'2014', N'PT', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0338', N'BETN1PT14038', N'2014', N'PT', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0339', N'BETN1PT14039', N'2014', N'PT', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0340', N'BETN1PT14040', N'2014', N'PT', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0341', N'BETN1PT14041', N'2014', N'PT', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0342', N'BETN1PT14042', N'2014', N'PT', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0343', N'BETN1PT14043', N'2014', N'PT', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0344', N'BETN1PT14044', N'2014', N'PT', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0345', N'BETN1PT14045', N'2014', N'PT', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0346', N'BETN1PT14046', N'2014', N'PT', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0347', N'BETN1PT14047', N'2014', N'PT', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0348', N'BETN1PT14048', N'2014', N'PT', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0349', N'BETN1PT14049', N'2014', N'PT', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0350', N'BETN1PT14050', N'2014', N'PT', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0351', N'BETN1IT14001', N'2014', N'IT', N'Student001', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0352', N'BETN1IT14002', N'2014', N'IT', N'Student002', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0353', N'BETN1IT14003', N'2014', N'IT', N'Student003', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0354', N'BETN1IT14004', N'2014', N'IT', N'Student004', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0355', N'BETN1IT14005', N'2014', N'IT', N'Student005', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0356', N'BETN1IT14006', N'2014', N'IT', N'Student006', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0357', N'BETN1IT14007', N'2014', N'IT', N'Student007', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0358', N'BETN1IT14008', N'2014', N'IT', N'Student008', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0359', N'BETN1IT14009', N'2014', N'IT', N'Student009', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0360', N'BETN1IT14010', N'2014', N'IT', N'Student010', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0361', N'BETN1IT14011', N'2014', N'IT', N'Student011', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0362', N'BETN1IT14012', N'2014', N'IT', N'Student012', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0363', N'BETN1IT14013', N'2014', N'IT', N'Student013', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0364', N'BETN1IT14014', N'2014', N'IT', N'Student014', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0365', N'BETN1IT14015', N'2014', N'IT', N'Student015', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0366', N'BETN1IT14016', N'2014', N'IT', N'Student016', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0367', N'BETN1IT14017', N'2014', N'IT', N'Student017', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0368', N'BETN1IT14018', N'2014', N'IT', N'Student018', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0369', N'BETN1IT14019', N'2014', N'IT', N'Student019', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0370', N'BETN1IT14020', N'2014', N'IT', N'Student020', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0371', N'BETN1IT14021', N'2014', N'IT', N'Student021', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0372', N'BETN1IT14022', N'2014', N'IT', N'Student022', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0373', N'BETN1IT14023', N'2014', N'IT', N'Student023', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0374', N'BETN1IT14024', N'2014', N'IT', N'Student024', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0375', N'BETN1IT14025', N'2014', N'IT', N'Student025', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0376', N'BETN1IT14026', N'2014', N'IT', N'Student026', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0377', N'BETN1IT14027', N'2014', N'IT', N'Student027', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0378', N'BETN1IT14028', N'2014', N'IT', N'Student028', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0379', N'BETN1IT14029', N'2014', N'IT', N'Student029', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0380', N'BETN1IT14030', N'2014', N'IT', N'Student030', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0381', N'BETN1IT14031', N'2014', N'IT', N'Student031', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0382', N'BETN1IT14032', N'2014', N'IT', N'Student032', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0383', N'BETN1IT14033', N'2014', N'IT', N'Student033', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0384', N'BETN1IT14034', N'2014', N'IT', N'Student034', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0385', N'BETN1IT14035', N'2014', N'IT', N'Student035', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0386', N'BETN1IT14036', N'2014', N'IT', N'Student036', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0387', N'BETN1IT14037', N'2014', N'IT', N'Student037', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0388', N'BETN1IT14038', N'2014', N'IT', N'Student038', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0389', N'BETN1IT14039', N'2014', N'IT', N'Student039', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0390', N'BETN1IT14040', N'2014', N'IT', N'Student040', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0391', N'BETN1IT14041', N'2014', N'IT', N'Student041', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0392', N'BETN1IT14042', N'2014', N'IT', N'Student042', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0393', N'BETN1IT14043', N'2014', N'IT', N'Student043', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0394', N'BETN1IT14044', N'2014', N'IT', N'Student044', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0395', N'BETN1IT14045', N'2014', N'IT', N'Student045', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0396', N'BETN1IT14046', N'2014', N'IT', N'Student046', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0397', N'BETN1IT14047', N'2014', N'IT', N'Student047', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0398', N'BETN1IT14048', N'2014', N'IT', N'Student048', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0399', N'BETN1IT14049', N'2014', N'IT', N'Student049', N'6', N'null', N'null')
GO
INSERT [dbo].[students] ([enrollment_number], [roll_number], [year_of_admission], [branch_id], [name], [semester], [other1], [other2]) VALUES (N'ITMET14S0400', N'BETN1IT14050', N'2014', N'IT', N'Student050', N'6', N'null', N'null')
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'BTL0601', N'BT1', N'BT', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'CEL0601', N'CE1', N'CE', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'CSL0601', N'CS1', N'CS', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'ECL0601', N'EC1', N'EC', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'EEL0601', N'EE1', N'EE', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'ITL0601', N'IT1', N'IT', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'MEL0601', N'ME1', N'ME', NULL)
GO
INSERT [dbo].[subject] ([subject_id], [subject_name], [branch_code], [other1]) VALUES (N'PTL0601', N'PT1', N'PT', NULL)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-24' AS Date), N'CSL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-24' AS Date), N'MEL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-24' AS Date), N'ECL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-24' AS Date), N'EEL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-25' AS Date), N'PTL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-25' AS Date), N'BTL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-25' AS Date), N'CEL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-25' AS Date), N'ITL0601', 1)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-26' AS Date), N'CSL0601', 2)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-26' AS Date), N'MEL0601', 2)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-26' AS Date), N'ECL0601', 2)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-24' AS Date), N'CSL0601', 2)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-12-26' AS Date), N'EEL0601', 2)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-04-21' AS Date), N'CSL0601', 0)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-04-21' AS Date), N'ECL0601', 0)
GO
INSERT [dbo].[time_table] ([date], [subject_id], [shift]) VALUES (CAST(N'2018-04-24' AS Date), N'CSL0601', 5)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [rollno]    Script Date: 04/24/18 2:31:11 PM ******/
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [rollno] UNIQUE NONCLUSTERED 
(
	[roll_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[branch] ADD  CONSTRAINT [ck_default]  DEFAULT ((50)) FOR [total_students]
GO
/****** Object:  StoredProcedure [dbo].[AddStudents]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery12.sql|3|0|C:\Users\Anurag\AppData\Local\Temp\~vsE643.sql
CREATE procedure [dbo].[AddStudents] @branch varchar(2), @branchname varchar(30)
As
--Count for student
declare @count int;
set @count = 1;

--Insert Query
declare @sqlquery varchar(200);

--Count for Enrollmentno
declare @enrollcount int;
select @enrollcount = max(cast(substring((enrollment_number),10,13) as int)) +1 from dbo.students;
-- Insert 50 records
while @count < 51
begin
--Student roll number
declare @rlfix varchar(50);
set @rlfix = 'BETN1'+@branchname+'140'+RIGHT('00'+ cast(@count as varchar(3)),2);

--Student Enroll Number
declare @enroll varchar(50);
set @enroll = 'ITMET14S0'+ RIGHT('000'+ cast(@enrollcount as varchar(3)),3);

--Student Name
declare @name varchar(50);
set @name = 'Student'+RIGHT('000'+CAST(@count as varchar(3)),3);

set @sqlquery = 'insert into dbo.students values('''+@enroll+''','''+@rlfix+''',''2014'','''+@branch+''','''+@name+''',''6'',''null'',''null'')';
exec(@sqlquery);
set @count = @count+1;
set @enrollcount = @enrollcount+1;
end
GO
/****** Object:  StoredProcedure [dbo].[InsertBranches]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertBranches] @table_name varchar(50)
as
Declare @count int;
set @count=1;
Declare @br varchar (25);
set @br = 'branch';
declare @actualtablename nvarchar(max);
select @actualtablename = QUOTENAME(TABLE_NAME) FROM AutoSeats.INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = @table_name;
Declare @sqlquery nvarchar (max);
while @count < 9
begin
set @sqlquery = 'insert into ' + @actualtablename + ' values ('+ cast(@count as varchar)  + ' ,'' '+ (@br + cast(@count as varchar)) +''')';
exec(@sqlquery);
set @count = @count+1;
end

GO
/****** Object:  StoredProcedure [dbo].[InsertSittingPlan]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSittingPlan] 
@SitPlanType SittingPlanType READONLY  
AS  
BEGIN  
    INSERT INTO [sitting plan]  
    SELECT * FROM @SitPlanType  
END 
GO
/****** Object:  StoredProcedure [dbo].[InsertTimeTable]    Script Date: 04/24/18 2:31:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTimeTable]
@TimeTabType TimeTableType READONLY  
AS  
BEGIN  
    INSERT INTO   [dbo].[time_table]
    SELECT [date], subject_id, [shift] FROM   @TimeTabType
END 
GO
USE [master]
GO
ALTER DATABASE [AutoSeats] SET  READ_WRITE 
GO
