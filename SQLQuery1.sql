USE [master]
GO
/****** Object:  Database [ElectrodomesticosDB]    Script Date: 19/05/2023 12:19:22 ******/
CREATE DATABASE [ElectrodomesticosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectrodomesticosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ElectrodomesticosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ElectrodomesticosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ElectrodomesticosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ElectrodomesticosDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectrodomesticosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectrodomesticosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectrodomesticosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectrodomesticosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElectrodomesticosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectrodomesticosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ElectrodomesticosDB] SET  MULTI_USER 
GO
ALTER DATABASE [ElectrodomesticosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectrodomesticosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectrodomesticosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectrodomesticosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectrodomesticosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectrodomesticosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ElectrodomesticosDB', N'ON'
GO
ALTER DATABASE [ElectrodomesticosDB] SET QUERY_STORE = OFF
GO
USE [ElectrodomesticosDB]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 19/05/2023 12:19:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [precio]) VALUES (1, N'TV', N'LG 43 pulgadas', 1950)
GO
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [precio]) VALUES (2, N'Lavadora', N'Mabe de 12 kg', 950)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
USE [master]
GO
ALTER DATABASE [ElectrodomesticosDB] SET  READ_WRITE 
GO
