
/****** Object:  Database [Interview]    Script Date: 2022/03/07 2:35:23 PM ******/
CREATE DATABASE [Interview]
GO
USE [Interview]
GO
/****** Object:  Table [dbo].[Hobbies]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hobbies](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Hobbies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](10) NOT NULL,
	[Age] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_People_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonHobbies]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonHobbies](
	[PersonHobbiesID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[HobbyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonHobbiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (1, N'Chess')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (2, N'Swimming')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (3, N'Dancing')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (4, N'Writing')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (5, N'Reading')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (6, N'Singing')
INSERT [dbo].[Hobbies] ([ID], [Name]) VALUES (7, N'Building')
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'Brendon', N'vdm', 23, 1)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'Christiaan 25', N'Kruger', 20, 2)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'kaas64', N'naas', 65, 6)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'Brandon', N'van heerde', 1012, 7)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'kels', N'moo', 55, 8)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'jac', N'lin', 220, 9)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'ddddd', N'pppp', 3, 10)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'f', N'', 2, 12)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'ddd', N'', 3, 14)
INSERT [dbo].[People] ([Name], [Surname], [Age], [ID]) VALUES (N'dee', N'fff', 4, 15)
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonHobbies] ON 

INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (1, 1, 1)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (2, 1, 2)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (3, 1, 3)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (4, 1, 4)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (5, 1, 5)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (6, 2, 6)
INSERT [dbo].[PersonHobbies] ([PersonHobbiesID], [PersonID], [HobbyID]) VALUES (7, 2, 7)
SET IDENTITY_INSERT [dbo].[PersonHobbies] OFF
GO
ALTER TABLE [dbo].[PersonHobbies]  WITH CHECK ADD FOREIGN KEY([HobbyID])
REFERENCES [dbo].[Hobbies] ([ID])
GO
ALTER TABLE [dbo].[PersonHobbies]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[People] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[DeletePerson]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DeletePerson]
	@ID int
as
begin
	
	If @ID <> 0 
		Begin
			DELETE from People where ID = @ID
		End
end
GO
/****** Object:  StoredProcedure [dbo].[GetPeople]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPeople]
	@Search nvarchar(50) = '',
	@page_number INT = NULL,
	@page_size INT = 1
AS
BEGIN
	with PeopleHobbies as (
	SELECT 
		personID,
		STUFF((
			SELECT 
				',' + 
				h.name
			from 
				PersonHobbies ph
			inner join Hobbies h 
				on ph.HobbyID = h.ID
			where ph.PersonID = p.PersonID
			FOR XML PATH('')
		), 1, 1, '')  as PeopleHobbies
	from 
		PersonHobbies p
	group by PersonID
	),
	ListOfPeople as (
		select *
		from People where Name like '%' + @Search + '%'
	),
	RowData as 
	(
		select ROW_NUMBER() OVER (ORDER BY rd.ID) AS [Row],
		@page_number AS [Page_Number],
		* 
		from ListOfPeople rd left join PeopleHobbies ph on (ph.PersonID = rd.ID)
	),
	PageSettings AS
	(
		SELECT TOP 1
			CONVERT(int, [Row]) AS [Item_Count],
			CONVERT(int, ( Row / @page_size )) as [Total_Pages]
		FROM RowData
		ORDER BY
			[Row] DESC
	)
	select * from RowData,PageSettings
	Where @page_number is null or 
	@page_number = Page_Number
	Order by Name
	OFFSET (@Page_Number-1) * @page_size ROWS
	FETCH NEXT @page_size ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPerson]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertPerson]
	@Name nvarchar(50) ,
	@Surname nvarchar(10) ,
	@Age int 
as
begin
	Insert into People 
	(
		Name,
		Surname,
		Age
	)
	Values
	(
		@Name,
		@Surname,
		@Age
	)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePerson]    Script Date: 2022/03/07 2:35:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdatePerson]
	@ID int,
	@Name nvarchar(50) ,	
	@Age int 
as
begin
	
	If @ID <> 0 
		Begin
			Update People set Name = @Name, Age = @Age where ID = @ID
		End
	 
end
GO
