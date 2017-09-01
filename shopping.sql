USE [shopping]
GO
/****** Object:  Table [dbo].[item]    Script Date: 09/01/2017 15:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[price] [int] NULL,
	[number] [int] NULL,
	[picture] [varchar](500) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (1, N'沃特篮球鞋', N'佛山', 180, 500, N'001.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (2, N'安踏运动鞋', N'福州', 120, 800, N'002.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (3, N'耐克运动鞋', N'广州', 500, 1000, N'003.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (4, N'阿迪达斯T血衫', N'上海', 388, 600, N'004.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (5, N'李宁文化衫', N'广州', 180, 900, N'005.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (6, N'小米3', N'北京', 1999, 3000, N'006.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (7, N'小米2S', N'北京', 1299, 1000, N'007.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (8, N'thinkpad笔记本', N'北京', 6999, 500, N'008.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (9, N'dell笔记本', N'北京', 3999, 500, N'009.jpg')
INSERT [dbo].[item] ([id], [name], [city], [price], [number], [picture]) VALUES (10, N'ipad5', N'北京', 5999, 500, N'010.jpg')
