USE [DBDOngHo]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](50) NULL,
	[brandPiture] [nvarchar](250) NULL,
	[brandDesription] [text] NULL,
	[brandHomePage] [nvarchar](250) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[iduser] [int] NOT NULL,
	[idPro] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[iduser] ASC,
	[idPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](50) NULL,
	[cateDescription] [nvarchar](50) NULL,
	[catePicture] [nvarchar](250) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cusAuthe]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cusAuthe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameAuthe] [varchar](50) NULL,
 CONSTRAINT [PK_cusAuthe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cusAuthe_Roles]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cusAuthe_Roles](
	[idCusAuthe] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_cusAuthe_Roles] PRIMARY KEY CLUSTERED 
(
	[idCusAuthe] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[accuontName] [nvarchar](50) NOT NULL,
	[passWord] [nvarchar](50) NOT NULL,
	[idCusAuthe] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[Address] [nvarchar](250) NULL,
	[phoneNumber] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NOT NULL,
	[dateRegistation] [nchar](10) NULL,
	[dateActivated] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDatails]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDatails](
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[unitPrice] [decimal](18, 0) NULL,
	[Quantity] [nchar](10) NULL,
	[intoMoney] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDatails] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[createDate] [date] NULL,
	[requireDate] [date] NULL,
	[addressTo] [nvarchar](250) NULL,
	[Active] [nvarchar](250) NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](250) NOT NULL,
	[productDescription] [text] NULL,
	[Price] [decimal](18, 0) NULL,
	[promotionPrice] [decimal](18, 0) NULL,
	[productPicture] [nvarchar](150) NULL,
	[categoryID] [int] NULL,
	[createDate] [date] NULL,
	[viewCount] [int] NULL,
	[productStatus] [bit] NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/4/2020 6:35:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Detail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (1, N'Armani Exchange', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (2, N'BOSS', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (3, N'Casio', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (4, N'Citizen', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (5, N'Emporio Armani', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (6, N'Fossil', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (7, N'Gucci', NULL, NULL, NULL)
INSERT [dbo].[Brands] ([ID], [brandName], [brandPiture], [brandDesription], [brandHomePage]) VALUES (8, N'Group18', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (1, N'Chronograph', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (2, N'Digital', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (3, N'Fitness', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (4, N'Smart', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (5, N'Automatic', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (6, N'Sports', NULL, NULL)
INSERT [dbo].[Categories] ([ID], [cateName], [cateDescription], [catePicture]) VALUES (7, N'Kids', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[cusAuthe] ON 

INSERT [dbo].[cusAuthe] ([id], [nameAuthe]) VALUES (1, N'Admin')
INSERT [dbo].[cusAuthe] ([id], [nameAuthe]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[cusAuthe] OFF
GO
INSERT [dbo].[cusAuthe_Roles] ([idCusAuthe], [RoleID], [Note]) VALUES (1, 1, NULL)
INSERT [dbo].[cusAuthe_Roles] ([idCusAuthe], [RoleID], [Note]) VALUES (1, 2, NULL)
INSERT [dbo].[cusAuthe_Roles] ([idCusAuthe], [RoleID], [Note]) VALUES (1, 3, NULL)
INSERT [dbo].[cusAuthe_Roles] ([idCusAuthe], [RoleID], [Note]) VALUES (1, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([idUser], [accuontName], [passWord], [idCusAuthe], [FirstName], [LastName], [Sex], [Address], [phoneNumber], [Email], [dateRegistation], [dateActivated]) VALUES (1, N'haong', N'123', 1, NULL, NULL, NULL, NULL, NULL, N'sdfsd@gmail.com', NULL, NULL)
INSERT [dbo].[Customers] ([idUser], [accuontName], [passWord], [idCusAuthe], [FirstName], [LastName], [Sex], [Address], [phoneNumber], [Email], [dateRegistation], [dateActivated]) VALUES (130, N'xinchao', N'a', 1, NULL, NULL, NULL, NULL, NULL, N'sdfsd@gmail.com', NULL, NULL)
INSERT [dbo].[Customers] ([idUser], [accuontName], [passWord], [idCusAuthe], [FirstName], [LastName], [Sex], [Address], [phoneNumber], [Email], [dateRegistation], [dateActivated]) VALUES (131, N'fasdfasd', N'1', 2, NULL, NULL, NULL, NULL, NULL, N'sdfsd@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (1, N'Armani Exchange Watch AX2631', N'Armani Exchange Drexler AX2631 is a practical and handsome Gents watch from Active collection. Material of the case is Nylon and the Blue dial gives the watch that unique look. In regards to the water resistance, the watch has got a resistancy up to 50 metres. It means it can be submerged in water for periods, so can be used for swimming and fishing. It is not recommended for high impact water sports. We ship it with an original box and a guarantee from the manufacturer.', CAST(300 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100039602/main/large/AX2631_main.jpg', 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (2, N'Mens Armani Exchange Cayde Watch AX2715', N'Armani Exchange Cayde AX2715 is a functional and handsome Gents watch from Smart collection. Case material is Stainless Steel while the dial colour is Black. This model has got 50 metres water resistancy - it can be submerged in water for periods, so can be used for swimming and fishing. It is not recommended for high impact water sports. The watch is shipped with an original box and a guarantee from the manufacturer.', CAST(299 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100035635/main/large/AX2715.jpg', 2, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (3, N'Armani Exchange Watch AX1325', N'Armani Exchange Outerbanks AX1325 is a functional Unisex watch from ACTIVE collection. Case is made out of Nylon while the dial colour is White. In regards to the water resistance, the watch has got a resistancy up to 30 metres. It means it can be worn in scenarios where it is likely to be splashed but not immersed in water. It can be worn while washing your hands and will be fine in rain. We ship it with an original box and a guarantee from the manufacturer.', CAST(210 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100038614/main/large/AX1325.jpg', 3, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (4, N'Armani Exchange Watch AX1838', N'Armani Exchange AX1838 is an amazing and special Gents watch from Holiday 2020 collection. Case is made out of Stainless Steel while the dial colour is Silver. The features of the watch include (among others) a chronograph. In regards to the water resistance, the watch has a water resistance of 100 metres. This makes it suitable for swimming, but not high impact water sports. The watch is shipped with an original box and a guarantee from the manufacturer.', CAST(320 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100039151/main/large/AX1838.jpg', 4, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (5, N'Hugo Boss Watch 1513670', N'Hugo Boss Legacy 1513670 is an amazing and handsome Gents watch. Material of the case is Plated Stainless Steel while the dial colour is Yellow. In regards to the water resistance, the watch has got a resistancy up to 50 metres. It means it can be submerged in water for periods, so can be used for swimming and fishing. It is not recommended for high impact water sports. The watch is shipped with an original box and a guarantee from the manufacturer.', CAST(4000 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100039536/main/large/1513670.jpg', 5, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (6, N'Hugo Boss Watch 1513837', N'Hugo Boss Skymaster 1513837 is an amazing watch from Skymaster collection. Case is made out of Plated Stainless Steel while the dial colour is Grey. The features of the watch include (among others) a chronograph. 50 metres water resistancy will protect the watch and allows it to be submerged in water for periods, so can be used for swimming and fishing. It is not recommended for high impact water sports. We ship it with an original box and a guarantee from the manufacturer.', CAST(5000 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100037977/main/large/1513837_FRONT_1.jpg', 6, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (7, N'Hugo Boss Watch 1513814', N'From the Hugo Boss Peak collection comes this super-stylish Hugo Boss watch is another classic timepiece from the luxury fashion house.

Like all good chronograph watches, it features three dials to keep track of hours, minutes and seconds, perfect for men on the go. It’ll withstand the odd splash, too, with 30 metres of water resistance, so if you’re caught in a sudden downpour, there’s no need to run for cover. A smart date function completes the look.

With its effortless chic, this timepiece contrasts the bold and the beautiful, with striking gold-look hands offset by the cool, dark dial. The strap is finished in black and dark grey, adding a sophisticated note to this understated timepiece. Style and precision is at the heart of this Hugo Boss Peak watch, and it makes the ideal finishing touch to your outfit.
Water resistant to 30m so you don’t have to remove it when washing your hands
Long lasting and rust-resistant 43mm plated stainless steel case
Powered by a quartz watch movement for superb time accuracy
Chronograph function for elapsed time measurement', CAST(1000 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100037986/main/large/1513814_FRONT_1.jpg', 7, NULL, NULL, NULL, 2)
INSERT [dbo].[Products] ([ID], [productName], [productDescription], [Price], [promotionPrice], [productPicture], [categoryID], [createDate], [viewCount], [productStatus], [BrandID]) VALUES (8, N'Gents Hugo Boss Black Chronograph Intensity Watch 1513662', N'From the chic designer brand BOSS comes the Intensity Watch 1513662, a sleek chronograph in watch that''s intense in both style and functionality; perfect for the modern gentleman.

With a black leather strap with horizontal stitching, the black stainless steel case is matched with a black chronograph dial. Three subdials are accompanied by baton hour markers and a tachymeter bezel. The face has silver detailing including the iconic BOSS logo and the subdial hands along with the tip of the second hand are in bold red.
Rust resistant stainless steel case
Chronograph functionality, so doubles as a stopwatch
Soft leather strap for ultimate comfort
Water resistant to 50m so suitable for shallow swimming
Tachymeter allows the wearer to measure speed on time travelled over a fixed distance', CAST(3000 AS Decimal(18, 0)), NULL, N'https://d1rkccsb0jf1bk.cloudfront.net/products/100037658/main/large/1513662.jpg', 1, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Detail]) VALUES (1, N'Admin', NULL)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Detail]) VALUES (2, N'Brand', NULL)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Detail]) VALUES (3, N'Category', NULL)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Detail]) VALUES (4, N'Product', NULL)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__97367C9ECE8E952B]    Script Date: 12/4/2020 6:35:13 PM ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ__Customer__97367C9ECE8E952B] UNIQUE NONCLUSTERED 
(
	[passWord] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A76EB6A17CF04B55]    Script Date: 12/4/2020 6:35:13 PM ******/
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [UQ__Customer__A76EB6A17CF04B55] UNIQUE NONCLUSTERED 
(
	[accuontName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customers] FOREIGN KEY([iduser])
REFERENCES [dbo].[Customers] ([idUser])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customers]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([idPro])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[cusAuthe_Roles]  WITH CHECK ADD  CONSTRAINT [FK_cusAuthe_Roles_cusAuthe] FOREIGN KEY([idCusAuthe])
REFERENCES [dbo].[cusAuthe] ([id])
GO
ALTER TABLE [dbo].[cusAuthe_Roles] CHECK CONSTRAINT [FK_cusAuthe_Roles_cusAuthe]
GO
ALTER TABLE [dbo].[cusAuthe_Roles]  WITH CHECK ADD  CONSTRAINT [FK_cusAuthe_Roles_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[cusAuthe_Roles] CHECK CONSTRAINT [FK_cusAuthe_Roles_Role]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_cusAuthe] FOREIGN KEY([idCusAuthe])
REFERENCES [dbo].[cusAuthe] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_cusAuthe]
GO
ALTER TABLE [dbo].[OrderDatails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDatails_Orders] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDatails] CHECK CONSTRAINT [FK_OrderDatails_Orders]
GO
ALTER TABLE [dbo].[OrderDatails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDatails_Products] FOREIGN KEY([productID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDatails] CHECK CONSTRAINT [FK_OrderDatails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([idUser])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brands] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
