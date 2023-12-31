USE [dbKStore]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[idCustomer] [int] NOT NULL,
	[codeCustomer] [char](13) NOT NULL,
	[nameCustomer] [nvarchar](100) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[passWord] [nvarchar](50) NOT NULL,
	[birthDay] [date] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[credate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[idOrder] [int] IDENTITY(1,1) NOT NULL,
	[codeOrder] [char](30) NOT NULL,
	[checkPay] [nvarchar](200) NOT NULL,
	[deliveryStatus] [nvarchar](200) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[deliveryDate] [datetime] NULL,
	[idCustomer] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[idOrder] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](9, 2) NOT NULL,
	[idProduct_Size] [int] NOT NULL,
	[idSize] [int] NOT NULL,
	[TotalPrice] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[idOrder] ASC,
	[idProduct_Size] ASC,
	[idSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [int] NOT NULL,
	[codeProduct] [char](13) NOT NULL,
	[nameProduct] [nvarchar](100) NOT NULL,
	[describe] [ntext] NOT NULL,
	[thumb] [nvarchar](2000) NOT NULL,
	[stock] [bit] NOT NULL,
	[price] [float] NOT NULL,
	[idProductCategory] [int] NOT NULL,
	[updateDay] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[idProduct_Size] [int] NOT NULL,
	[idProduct] [int] NOT NULL,
	[idSize] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[idProduct_Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[idProductCategory] [int] NOT NULL,
	[codeProductCategory] [char](13) NOT NULL,
	[nameProductCategory] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[idProductCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[idSize] [int] NOT NULL,
	[nameSize] [char](10) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[idSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAdmin]    Script Date: 11/20/2023 1:39:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin](
	[idAdmin] [int] NOT NULL,
	[codeAdmin] [char](13) NOT NULL,
	[nameAdmin] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[passWord] [nvarchar](50) NOT NULL,
	[access] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[idAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (1, N'SP2123PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Ngắn Vải Cotton Thấm Hút Trơn Dáng Rộng Đơn Giản PREMIUM 32', N'<p>Chất liệu: C&aacute; sấu Cotton Poly<br />
Th&agrave;nh phần: 50% Cotton 50% Xanadu<br />
- Si&ecirc;u co gi&atilde;n<br />
- &Iacute;t nhăn<br />
+ Kỹ thuật: Th&ecirc;u</p>
', N'a20df699-1bde-7801-c00a-001aa1e4c6e2-20231026203851721.jpg', 1, 12000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (2, N'SP2223PT     ', N'Áo Sơ Mi Cổ Lãnh tụ Tay Dài Sợi Tự Nhiên Thấm Hút Trơn Dáng Rộng Đơn Giản PREMIUM 10', N'<p>Chất liệu: Line<br />
Th&agrave;nh phần: 49% Rayon 17% Nylon 34% Polyester<br />
- Bề mặt mềm mại<br />
- Thấm h&uacute;t tốt<br />
- Tho&aacute;ng kh&iacute;<br />
- Nhanh kh&ocirc;<br />
- Th&acirc;n thiện với m&ocirc;i trường<br />
+ Trọng lượng: 150gsm<br />
+ Nẹp n&uacute;t phối kẹp kim loại kh&ocirc;ng rỉ</p>
', N'3b0fd0dc-75c9-9b00-526b-001aa1dc92ad-20231026203914639.jpg', 1, 120000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (3, N'SP2323PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Dài Sợi Nhân Tạo Nhanh Khô Trơn Dáng Rộng Đơn Giản Cosmo 13', N'<p>Chất liệu: Caro Poly<br />
Th&agrave;nh phần: 100% Polyester<br />
- Họa tiết caro</p>
', N'6d5f896e-a3eb-3200-5241-001a6e04f492-20231026210116318.jpg', 1, 12000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (4, N'SP2423PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Nhân Tạo Nhanh Khô Trơn Dáng Rộng Đơn Giản Cosmo 15', N'<p>Chất liệu: Poly<br />
Th&agrave;nh phần: 100% Polyester<br />
- Kiểu d&aacute;ng trơn đơn giản<br />
- Chất liệu lạ mắt cấu tr&uacute;c waffle</p>
', N'e23b0711-84e9-0f00-3ff6-001a6e0381a7-20231026210154183.jpg', 1, 12000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (5, N'SP2523PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Tự Nhiên Thấm Hút Trơn Dáng Rộng Đơn Giản PREMIUM 11', N'<p>M&ocirc; tả sản phẩm</p>

<p>Sơ Mi Tay Ngắn Tối Giản M10<br />
Chất liệu: Vải Oxford<br />
Th&agrave;nh phần: 57% Cotton 43% Polyester<br />
- Tho&aacute;ng kh&iacute;<br />
- Thấm h&uacute;t mồ h&ocirc;i<br />
- Kh&aacute;ng khuẩn<br />
- Ngăn m&ugrave;i hiệu quả<br />
- Duy tr&igrave; độ ẩm cho l&agrave;n da<br />
- Độ bền cao, khả năng chịu lực tốt, co gi&atilde;n thoải m&aacute;i<br />
+ Họa tiết in dẻo</p>
', N'53328de4-efc1-a301-8560-001aa1e6728b-20231026204032037.jpg', 1, 12000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (7, N'SP2723PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Ngắn Vải Cotton Thấm Hút Biểu Tượng Dáng Rộng BST Thiết Kế SPEED 29', N'<p>M&ocirc; tả sản phẩm</p>

<p>Chất liệu: Cotton Compact 2S<br />
Th&agrave;nh phần: 100% Cotton<br />
- Thấm h&uacute;t tho&aacute;t ẩm<br />
- Mềm mại<br />
- Th&acirc;n thiện với m&ocirc;i trường<br />
- Kiểm so&aacute;t m&ugrave;i<br />
- Điều h&ograve;a nhiệt<br />
+ Kỹ thuật: In nhung<br />
+ &Aacute;o thun cổ tr&ograve;n, sử dụng bo cotton trắng l&agrave;m cổ &aacute;o.<br />
+ Th&acirc;n trước may r&atilde; phần ngực.<br />
+ D&ugrave;ng vải cotton trắng chạy 2 đường sọc b&ecirc;n tay.<br />
+ Lai &aacute;o + lai tay chạy chỉ trắng tạo kiểu.</p>
', N'bfcc3378-2da1-2f00-e8f7-001a9dfa0b2c-20231026204057197.jpg', 1, 12000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (8, N'SP2823PT     ', N'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản No Style 08', N'<p>M&ocirc; tả sản phẩm</p>

<p>Chất liệu: Poly Rayon Spandex<br />
Th&agrave;nh phần: 82% Polyester 14% Rayon 4% Spandex<br />
- Co d&atilde;n tốt<br />
- Kh&aacute;ng khuẩn<br />
- Mềm mịn<br />
- &Iacute;t nhăn<br />
- Độ bền m&agrave;u tương đối tốt<br />
+ Phom cơ bản ph&ugrave; hợp nhiều lứa tuổi</p>
', N'6ed561ac-db2b-d800-e20f-001a298a69ec-20231026204124273.jpg', 1, 277000, 4, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (9, N'SP2923PT     ', N'Áo Sơ Mi Cổ Bẻ Tay Ngắn Sợi Nhân Tạo Nhanh Khô Biểu Tượng Dáng Rộng BST Thiết Kế SPEED 40', N'<p>Chất liệu: Poly<br />
Th&agrave;nh phần: 100% Polyester<br />
- Co gi&atilde;n 4 chiều,<br />
- Nhanh kh&ocirc;<br />
- Thấm h&uacute;t<br />
+ Kỹ thuật: In cao th&agrave;nh<br />
+ Sơ mi phom rộng dạng d&acirc;y kh&oacute;a k&eacute;o, kiểu cổ &aacute;o cơ bản<br />
+ Th&acirc;n trước phần vai r&atilde; phối vải đen<br />
+ Th&acirc;n sau d&ugrave;ng vải đen chạy d&acirc;y viền song song tạo kiểu.<br />
+ Sử dụng d&acirc;y k&eacute;o phao, đầu kh&oacute;a k&eacute;o kim loại kh&ocirc;ng rỉ.</p>
', N'47c6ceca-b113-0300-5a2d-001a8636e39a-20231026204145331.jpg', 1, 297000, 2, CAST(N'2023-10-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (10, N'SP21023PT    ', N'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Cosmo 25', N'<p>Chất liệu: Poly Rayon Spandex<br />
Th&agrave;nh phần: 82% Polyester 14% Rayon 4% Spandex<br />
- Co d&atilde;n tốt<br />
- Kh&aacute;ng khuẩn<br />
- Mềm mịn<br />
- &Iacute;t nhăn<br />
- Độ bền m&agrave;u tương đối tốt<br />
+ Phom cơ bản ph&ugrave; hợp nhiều lứa tuổi</p>
', N'7e0c7fdd-e69f-f601-b96d-001a6e18c6cc-20231026210625789.jpg', 1, 427000, 4, CAST(N'2023-10-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (11, N'SP21123PT    ', N'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 1 Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver23', N'<p>&nbsp;</p>

<p>Quần T&acirc;y Đơn Giản Y Nguy&ecirc;n Bản Ver23<br />
Chất liệu: Vải Quần T&acirc;y<br />
Th&agrave;nh phần: 76% Polyester 23% Rayon 1% Spandex<br />
+ Th&ecirc;u logo #Y2010</p>
', N'f4c558f3-e593-3b00-9233-00198eb28663-20231026210743577.jpg', 1, 427000, 4, CAST(N'2023-10-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (12, N'SP21223PT    ', N'Quần Dài Lưng Thun Ống Đứng Vải Denim Đứng Dáng Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver16', N'<p>Quần D&agrave;i Vải Đơn Giản Y Nguy&ecirc;n Bản Ver16<br />
Chất liệu: Vải Linen<br />
Th&agrave;nh phần: 49% Rayon 17% Nylon 34% Polyester<br />
- Mềm mại<br />
- Thấm h&uacute;t<br />
- Tho&aacute;ng kh&iacute;<br />
- Th&acirc;n thiện<br />
- Nhanh kh&ocirc;<br />
- Co gi&atilde;n nhẹ<br />
+ May logo kim loại t&uacute;i sau</p>
', N'c1c7df29-aed6-b000-1dd7-001957b2d47e-20231026210901829.jpg', 1, 357000, 4, CAST(N'2023-10-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (13, N'SP21323PT    ', N'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 2 Trơn Dáng Vừa Đơn Giản Gu Tối Giản HG17', N'<p>Chất liệu: Vải Quần T&acirc;y<br />
Th&agrave;nh phần: 82% polyester 14% rayon 4% spandex<br />
- Mềm mại<br />
- Tho&aacute;ng kh&iacute;<br />
- Th&acirc;n thiện với mối trường<br />
- H&uacute;t ẩm tốt</p>
', N'783c439e-0473-3300-079f-0018b9fb8fee-20231026211138451.jpg', 1, 325000, 4, CAST(N'2023-10-26T00:00:00' AS SmallDateTime))
INSERT [dbo].[Product] ([idProduct], [codeProduct], [nameProduct], [describe], [thumb], [stock], [price], [idProductCategory], [updateDay]) VALUES (14, N'SP21423PT    ', N'Quần Tây Sợi Tự Nhiên Co Giãn Cấp Độ 1 Trơn Dáng Vừa Đơn Giản Y2010 Originals Ver22', N'<p>Quần T&acirc;y Đơn Giản Y Nguy&ecirc;n Bản Ver22<br />
Chất liệu: Vải Quần T&acirc;y<br />
Th&agrave;nh phần: 70% Polyester 28% Rayon 2% Spandex<br />
+ Th&ecirc;u logo #Y2010</p>
', N'6c141d4b-75c8-2d00-272e-00198eb124ed-20231026211220749.jpg', 1, 427000, 4, CAST(N'2023-10-26T00:00:00' AS SmallDateTime))
GO
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (1, 1, 1, 10)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (2, 1, 2, 12)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (3, 1, 3, 13)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (4, 1, 4, 14)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (5, 1, 5, 15)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (6, 1, 6, 16)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (7, 2, 1, 20)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (8, 2, 2, 50)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (9, 2, 3, 10)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (10, 2, 4, 10)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (11, 2, 5, 20)
INSERT [dbo].[Product_Size] ([idProduct_Size], [idProduct], [idSize], [quantity]) VALUES (12, 2, 6, 50)
GO
INSERT [dbo].[ProductCategory] ([idProductCategory], [codeProductCategory], [nameProductCategory]) VALUES (1, N'DMSP2123PT   ', N'Quần Short')
INSERT [dbo].[ProductCategory] ([idProductCategory], [codeProductCategory], [nameProductCategory]) VALUES (2, N'DMSP2223PT   ', N'Áo sơ mi')
INSERT [dbo].[ProductCategory] ([idProductCategory], [codeProductCategory], [nameProductCategory]) VALUES (3, N'DMSP2323PT   ', N'Áo thun')
INSERT [dbo].[ProductCategory] ([idProductCategory], [codeProductCategory], [nameProductCategory]) VALUES (4, N'DMSP2423PT   ', N'Quần tây, âu')
GO
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (1, N'S         ', N'11')
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (2, N'M         ', N'1')
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (3, N'L         ', N'1')
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (4, N'XL        ', N'1')
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (5, N'XXL       ', N'1')
INSERT [dbo].[Size] ([idSize], [nameSize], [status]) VALUES (6, N'3XL       ', N'1')
GO
INSERT [dbo].[UserAdmin] ([idAdmin], [codeAdmin], [nameAdmin], [phone], [userName], [passWord], [access]) VALUES (3, N'ADMIN3       ', N'Bùi Nguyễn Anh Khoa', N'0335867103', N'anhkhoaad', N'7c9454103016e32013357ed07ad502af', N'Đang hoạt động')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customer] ([idCustomer])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([idOrder])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_Size] FOREIGN KEY([idProduct_Size])
REFERENCES [dbo].[Product_Size] ([idProduct_Size])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_Size]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Size] FOREIGN KEY([idSize])
REFERENCES [dbo].[Size] ([idSize])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([idProductCategory])
REFERENCES [dbo].[ProductCategory] ([idProductCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Product]
GO
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Size] FOREIGN KEY([idSize])
REFERENCES [dbo].[Size] ([idSize])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Size]
GO
