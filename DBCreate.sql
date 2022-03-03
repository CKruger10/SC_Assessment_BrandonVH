--CREATE SCRIPT FOR DATABASE
--YOU CAN ALSO USE SQL SERVER MANAGEMENT STUDIO TO CREATE A NEW DATABASE CALLED 
CREATE DATABASE [Interview] ON  PRIMARY 
( NAME = N'Interview', FILENAME = N'C:\Work\Interview\Database\Interview.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Interview_log', FILENAME = N'C:\Work\Interview\Database\Interview_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO


-- INSERT AND CREATE TABLES AND STORED PROCEDURES
Use [Interview]
Go

CREATE TABLE [Hobbies](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hobbies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [People](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](10) NOT NULL,
	[Age] [int] NOT NULL,
 CONSTRAINT [PK_People_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Hobbies] ([ID], [Name]) VALUES (1, N'Chess')
INSERT [Hobbies] ([ID], [Name]) VALUES (2, N'Swimming')
INSERT [Hobbies] ([ID], [Name]) VALUES (3, N'Dancing')
INSERT [Hobbies] ([ID], [Name]) VALUES (4, N'Writing')
INSERT [Hobbies] ([ID], [Name]) VALUES (5, N'Reading')
INSERT [Hobbies] ([ID], [Name]) VALUES (6, N'Singing')
INSERT [Hobbies] ([ID], [Name]) VALUES (7, N'Building')
INSERT [People] ([ID], [Name], [Surname], [Age]) VALUES (1, N'Brendon', N'vdm', 23)
INSERT [People] ([ID], [Name], [Surname], [Age]) VALUES (2, N'Christiaan 1', N'Kruger', 24)
Go

CREATE procedure [DeletePerson]
as
begin
	select 1
end
GO

CREATE PROCEDURE [GetPeople]
	@Search nvarchar(50) = '',
	@page_number INT = NULL,
	@page_size INT = 1
AS
BEGIN
	with PeopleHobbies as (
		select ph.PersonID,ph.HobbyID,h.Name from PersonHobbies ph
		inner join Hobbies h
		on ph.HobbyID = h.ID
	),
	ListOfPeople as (
		select *
		from People
	),
	RowData as 
	(
		select ROW_NUMBER() OVER (ORDER BY rd.ID) AS [Row],
		1 AS [Page_Number],
		*
		from ListOfPeople rd
	),
	PageSettings AS
	(
		SELECT TOP 1
			CONVERT(int, [Row]) AS [Item_Count],
			CONVERT(int, [Page_Number]) as [Total_Pages]
		FROM RowData
		ORDER BY
			[Row] DESC
	)
	select * from RowData,PageSettings
	Where @page_number is null or 
	@page_number = Page_Number
END
GO

CREATE procedure [InsertPerson]
as
begin
 select 1
end
GO

CREATE procedure [UpdatePerson]
as
begin
	select 1
end
GO
