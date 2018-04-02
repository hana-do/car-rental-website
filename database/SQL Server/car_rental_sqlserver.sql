USE [master]
GO
/****** Object:  Database [Car_Rental ]    Script Date: 3/31/2018 6:05:51 PM ******/
CREATE DATABASE [Car_Rental ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car_Rental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Car_Rental .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Car_Rental _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Car_Rental _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Car_Rental ] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car_Rental ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car_Rental ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car_Rental ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car_Rental ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car_Rental ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car_Rental ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car_Rental ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car_Rental ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car_Rental ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car_Rental ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car_Rental ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car_Rental ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car_Rental ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car_Rental ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car_Rental ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car_Rental ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Car_Rental ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car_Rental ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car_Rental ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car_Rental ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car_Rental ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car_Rental ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car_Rental ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car_Rental ] SET RECOVERY FULL 
GO
ALTER DATABASE [Car_Rental ] SET  MULTI_USER 
GO
ALTER DATABASE [Car_Rental ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car_Rental ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car_Rental ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car_Rental ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Car_Rental ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Car_Rental ', N'ON'
GO
ALTER DATABASE [Car_Rental ] SET QUERY_STORE = OFF
GO
USE [Car_Rental ]
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
USE [Car_Rental ]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 3/31/2018 6:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Booking_ID] [int] NOT NULL,
	[Pickup_DateTime] [datetime] NOT NULL,
	[Return_DateTime] [datetime] NOT NULL,
	[Payment_Type] [varchar](20) NOT NULL,
	[Booking_Status] [varchar](20) NOT NULL,
	[Return_Office] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Line]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Line](
	[Booking_ID] [int] NOT NULL,
	[Line_Num] [int] NOT NULL,
	[Car_ID] [int] NOT NULL,
	[Line_Total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC,
	[Line_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Car_ID] [int] NOT NULL,
	[Spec_ID] [int] NOT NULL,
	[Office_ID] [int] NOT NULL,
	[CarState_ID] [int] NOT NULL,
	[Mileage] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Car_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_Make]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Make](
	[CarMake_ID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarMake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_Spec]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Spec](
	[Spec_ID] [int] NOT NULL,
	[CarMake_ID] [int] NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Prod_Year] [int] NOT NULL,
	[CarType_ID] [int] NOT NULL,
	[Image_URL] [varchar](200) NULL,
	[Seats] [int] NULL,
	[Cruise_Control] [varchar](20) NULL,
	[Air_Conditioning] [varchar](20) NULL,
	[Parking_Sensor] [varchar](20) NULL,
	[Heated_Seats] [varchar](20) NULL,
	[Audio_Input] [varchar](20) NULL,
	[Bluetooth] [varchar](20) NULL,
	[Sunroof] [varchar](20) NULL,
	[Price_Bought] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Spec_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_State]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_State](
	[CarState_ID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarState_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car_Type]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Type](
	[CarType_ID] [int] NOT NULL,
	[Description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[Card_ID] [int] NOT NULL,
	[Exp_Month] [int] NOT NULL,
	[Exp_Year] [int] NOT NULL,
	[Card_Num] [varchar](50) NOT NULL,
	[Cust_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Card_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card_Payment]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card_Payment](
	[Booking_ID] [int] NOT NULL,
	[Card_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Booking_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Cust_ID] [int] NOT NULL,
	[Cust_FName] [varchar](50) NOT NULL,
	[Cust_LName] [varchar](50) NOT NULL,
	[Cust_Phone] [varchar](50) NOT NULL,
	[Cust_Email] [varchar](50) NOT NULL,
	[Cust_Gender] [varchar](1) NOT NULL,
	[Cust_LicenseNum] [varchar](50) NOT NULL,
	[Cust_IssueLocation] [varchar](20) NOT NULL,
	[Cust_DOB] [date] NOT NULL,
	[Cust_StrAdd] [varchar](100) NOT NULL,
	[Cust_City] [varchar](50) NULL,
	[Cust_State] [varchar](50) NULL,
	[Cust_Zip] [varchar](20) NULL,
	[Cust_Username] [varchar](20) NOT NULL,
	[Cust_Password] [varchar](50) NOT NULL,
	[CustType_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cust_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Type]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Type](
	[CustType_ID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Multiplier] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Office]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[Office_ID] [int] NOT NULL,
	[Office_StrAdd] [varchar](100) NOT NULL,
	[Office_City] [varchar](50) NULL,
	[Office_State] [varchar](50) NULL,
	[Office_Zip] [int] NULL,
	[Office_Phone] [varchar](50) NOT NULL,
	[Office_Username] [varchar](20) NOT NULL,
	[Office_Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Office_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental_Price]    Script Date: 3/31/2018 6:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental_Price](
	[CarState_ID] [int] NOT NULL,
	[Spec_ID] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarState_ID] ASC,
	[Spec_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([Return_Office])
REFERENCES [dbo].[Office] ([Office_ID])
GO
ALTER TABLE [dbo].[Booking_Line]  WITH CHECK ADD FOREIGN KEY([Booking_ID])
REFERENCES [dbo].[Booking] ([Booking_ID])
GO
ALTER TABLE [dbo].[Booking_Line]  WITH CHECK ADD FOREIGN KEY([Car_ID])
REFERENCES [dbo].[Car] ([Car_ID])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([CarState_ID])
REFERENCES [dbo].[Car_State] ([CarState_ID])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([Office_ID])
REFERENCES [dbo].[Office] ([Office_ID])
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD FOREIGN KEY([Spec_ID])
REFERENCES [dbo].[Car_Spec] ([Spec_ID])
GO
ALTER TABLE [dbo].[Car_Spec]  WITH CHECK ADD FOREIGN KEY([CarMake_ID])
REFERENCES [dbo].[Car_Make] ([CarMake_ID])
GO
ALTER TABLE [dbo].[Car_Spec]  WITH CHECK ADD FOREIGN KEY([CarType_ID])
REFERENCES [dbo].[Car_Type] ([CarType_ID])
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD FOREIGN KEY([Cust_ID])
REFERENCES [dbo].[Customer] ([Cust_ID])
GO
ALTER TABLE [dbo].[Card_Payment]  WITH CHECK ADD FOREIGN KEY([Booking_ID])
REFERENCES [dbo].[Booking] ([Booking_ID])
GO
ALTER TABLE [dbo].[Card_Payment]  WITH CHECK ADD FOREIGN KEY([Card_ID])
REFERENCES [dbo].[Card] ([Card_ID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([CustType_ID])
REFERENCES [dbo].[Customer_Type] ([CustType_ID])
GO
ALTER TABLE [dbo].[Rental_Price]  WITH CHECK ADD FOREIGN KEY([CarState_ID])
REFERENCES [dbo].[Car_State] ([CarState_ID])
GO
ALTER TABLE [dbo].[Rental_Price]  WITH CHECK ADD FOREIGN KEY([Spec_ID])
REFERENCES [dbo].[Car_Spec] ([Spec_ID])
GO
USE [master]
GO
ALTER DATABASE [Car_Rental ] SET  READ_WRITE 
GO
