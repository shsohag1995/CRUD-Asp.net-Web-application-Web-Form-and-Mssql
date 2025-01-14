USE [master]
GO
/****** Object:  Database [HrAndAdmin]    Script Date: 09-Nov-24 11:44:31 PM ******/
CREATE DATABASE [HrAndAdmin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HrAndAdmin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HrAndAdmin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HrAndAdmin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HrAndAdmin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HrAndAdmin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HrAndAdmin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HrAndAdmin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HrAndAdmin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HrAndAdmin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HrAndAdmin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HrAndAdmin] SET ARITHABORT OFF 
GO
ALTER DATABASE [HrAndAdmin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HrAndAdmin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HrAndAdmin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HrAndAdmin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HrAndAdmin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HrAndAdmin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HrAndAdmin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HrAndAdmin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HrAndAdmin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HrAndAdmin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HrAndAdmin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HrAndAdmin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HrAndAdmin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HrAndAdmin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HrAndAdmin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HrAndAdmin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HrAndAdmin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HrAndAdmin] SET RECOVERY FULL 
GO
ALTER DATABASE [HrAndAdmin] SET  MULTI_USER 
GO
ALTER DATABASE [HrAndAdmin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HrAndAdmin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HrAndAdmin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HrAndAdmin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HrAndAdmin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HrAndAdmin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HrAndAdmin', N'ON'
GO
ALTER DATABASE [HrAndAdmin] SET QUERY_STORE = ON
GO
ALTER DATABASE [HrAndAdmin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HrAndAdmin]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09-Nov-24 11:44:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](100) NULL,
	[LastName] [nchar](100) NULL,
	[Division] [nchar](100) NULL,
	[Building] [nchar](256) NULL,
	[Title] [nchar](100) NULL,
	[Room] [nchar](100) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (1, N'Md.Shariful Hasan                                                                                   ', N'Sohag                                                                                               ', N'Interviewer                                                                                         ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'.Net Developer                                                                                      ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (2, N'Synthia                                                                                             ', N'Islam                                                                                               ', N'HR and Admin                                                                                        ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'Executive                                                                                           ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (3, N'Md. Sabbir                                                                                          ', N'Hossain                                                                                             ', N'HR and Admin                                                                                        ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'Jr. Executive                                                                                       ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (4, N'Abu                                                                                                 ', N'Sayem                                                                                               ', N'Interviewer                                                                                         ', N'Leads tower                                                                                                                                                                                                                                                     ', N'.Net Developer                                                                                      ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (5, N'Md.Shariful Hasan                                                                                   ', N'Sohag                                                                                               ', N'Interviewer                                                                                         ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'.Net Developer                                                                                      ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (6, N'Synthia                                                                                             ', N'Islam                                                                                               ', N'HR and Admin                                                                                        ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'Executive                                                                                           ', N'HR and Admin Room                                                                                   ')
INSERT [dbo].[Employees] ([ID], [FirstName], [LastName], [Division], [Building], [Title], [Room]) VALUES (7, N'Md. Sabbir                                                                                          ', N'Hossain                                                                                             ', N'HR and Admin                                                                                        ', N'Leads Tower                                                                                                                                                                                                                                                     ', N'Jr. Executive                                                                                       ', N'HR and Admin Room                                                                                   ')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
USE [master]
GO
ALTER DATABASE [HrAndAdmin] SET  READ_WRITE 
GO
