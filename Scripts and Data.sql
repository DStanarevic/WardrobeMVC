USE [WardrobeMVC]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 11/5/2017 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accessory](
	[AccessoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Type] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Season] [varchar](50) NULL,
	[Occasion] [varchar](50) NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[AccessoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bottom]    Script Date: 11/5/2017 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bottom](
	[BottomID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Type] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Season] [varchar](50) NULL,
	[Occasion] [varchar](50) NULL,
 CONSTRAINT [PK_Bottom] PRIMARY KEY CLUSTERED 
(
	[BottomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Combination]    Script Date: 11/5/2017 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combination](
	[CombinationID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NULL,
	[BottomID] [int] NULL,
	[ShoeID] [int] NULL,
	[AccessoryID] [int] NULL,
 CONSTRAINT [PK_Combination] PRIMARY KEY CLUSTERED 
(
	[CombinationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shoe]    Script Date: 11/5/2017 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shoe](
	[ShoeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Type] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Season] [varchar](50) NULL,
	[Occasion] [varchar](50) NULL,
 CONSTRAINT [PK_Shoe] PRIMARY KEY CLUSTERED 
(
	[ShoeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Top]    Script Date: 11/5/2017 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Top](
	[TopID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Type] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Season] [varchar](50) NULL,
	[Occasion] [varchar](50) NULL,
 CONSTRAINT [PK_Top] PRIMARY KEY CLUSTERED 
(
	[TopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Accessory] FOREIGN KEY([AccessoryID])
REFERENCES [dbo].[Accessory] ([AccessoryID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Accessory]
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Bottom] FOREIGN KEY([BottomID])
REFERENCES [dbo].[Bottom] ([BottomID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Bottom]
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Shoe] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[Shoe] ([ShoeID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Shoe]
GO
ALTER TABLE [dbo].[Combination]  WITH CHECK ADD  CONSTRAINT [FK_Combination_Top] FOREIGN KEY([TopID])
REFERENCES [dbo].[Top] ([TopID])
GO
ALTER TABLE [dbo].[Combination] CHECK CONSTRAINT [FK_Combination_Top]
GO
