--CREATE DATABASE WebAPIDb
--GO

USE [WebAPIDb]
GO
/****** Object:  User [akhil]    Script Date: 05/07/2015 12:13:46 ******/
CREATE USER [akhil] FOR LOGIN [akhil] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 05/07/2015 12:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (1, N'Laptop')
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (2, N'Mobile')
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (3, N'IPad')
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (4, N'IPhone')
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (5, N'Bag')
INSERT [dbo].[Products] ([ProductId], [ProductName]) VALUES (6, N'Watch')
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[User]    Script Date: 05/07/2015 12:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Name]) VALUES (1, N'akhil', N'akhil', N'Akhil Mittal')
INSERT [dbo].[User] ([UserId], [UserName], [Password], [Name]) VALUES (2, N'api', N'api', N'API User')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  Table [dbo].[Tokens]    Script Date: 05/07/2015 12:13:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tokens](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AuthToken] [nvarchar](250) NOT NULL,
	[IssuedOn] [datetime] NOT NULL,
	[ExpiresOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Tokens] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Tokens_User]    Script Date: 05/07/2015 12:13:46 ******/
ALTER TABLE [dbo].[Tokens]  WITH CHECK ADD  CONSTRAINT [FK_Tokens_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Tokens] CHECK CONSTRAINT [FK_Tokens_User]
GO


DROP TABLE Products

DROP TABLE Tokens

DROP TABLE [User]