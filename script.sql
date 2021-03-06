USE [master]
GO
/****** Object:  Database [JournalData]    Script Date: 26.04.2020 20:00:15 ******/
CREATE DATABASE [JournalData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JournalData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSEXPRESS\MSSQL\DATA\JournalData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JournalData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSEXPRESS\MSSQL\DATA\JournalData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JournalData] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JournalData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JournalData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JournalData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JournalData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JournalData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JournalData] SET ARITHABORT OFF 
GO
ALTER DATABASE [JournalData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JournalData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JournalData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JournalData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JournalData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JournalData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JournalData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JournalData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JournalData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JournalData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JournalData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JournalData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JournalData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JournalData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JournalData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JournalData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JournalData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JournalData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JournalData] SET  MULTI_USER 
GO
ALTER DATABASE [JournalData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JournalData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JournalData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JournalData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JournalData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JournalData] SET QUERY_STORE = OFF
GO
USE [JournalData]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Id] [uniqueidentifier] NOT NULL,
	[Студент] [uniqueidentifier] NOT NULL,
	[Пара] [int] NOT NULL,
	[Дата] [datetime] NOT NULL,
	[Был] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Пара] [int] NOT NULL,
	[Время начала] [time](7) NOT NULL,
	[Время окончания] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Пара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [uniqueidentifier] NOT NULL,
	[Факультет] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [uniqueidentifier] NOT NULL,
	[Факультет] [uniqueidentifier] NOT NULL,
	[Группа] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [uniqueidentifier] NOT NULL,
	[Неделя] [int] NOT NULL,
	[День_недели] [int] NOT NULL,
	[Пара] [int] NOT NULL,
	[Группа] [uniqueidentifier] NOT NULL,
	[Предмет] [uniqueidentifier] NOT NULL,
	[Тип_занятия] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [uniqueidentifier] NOT NULL,
	[Факультет] [uniqueidentifier] NOT NULL,
	[Группа] [uniqueidentifier] NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [uniqueidentifier] NOT NULL,
	[Предмет] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfClass]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfClass](
	[Id] [int] NOT NULL,
	[Тип занятия] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Week]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Week](
	[Неделя] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Неделя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weekday]    Script Date: 26.04.2020 20:00:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekday](
	[Id] [int] NOT NULL,
	[День недели] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([Id], [Студент], [Пара], [Дата], [Был]) VALUES (N'7e7af09a-2a55-476a-bd95-a5831339064f', N'f09ebfcd-bc5c-47f6-90ba-d2a0fc5c5ed6', 2, CAST(N'2020-04-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Attendance] ([Id], [Студент], [Пара], [Дата], [Был]) VALUES (N'2422729a-40dd-4158-83bc-a712e7e13a53', N'e3e2539f-905d-4db3-989d-550fcf12e15d', 2, CAST(N'2020-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([Id], [Студент], [Пара], [Дата], [Был]) VALUES (N'1fb932ec-88ae-49e8-a68f-bbc09ee803e0', N'541324e0-8e0c-47f4-819a-fa7e69660c36', 2, CAST(N'2020-04-22T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Attendance] ([Id], [Студент], [Пара], [Дата], [Был]) VALUES (N'528323dd-1e4c-47a5-8310-bf965bb05e78', N'f09ebfcd-bc5c-47f6-90ba-d2a0fc5c5ed6', 2, CAST(N'2020-04-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Classes] ([Пара], [Время начала], [Время окончания]) VALUES (1, CAST(N'09:00:00' AS Time), CAST(N'10:30:00' AS Time))
INSERT [dbo].[Classes] ([Пара], [Время начала], [Время окончания]) VALUES (2, CAST(N'10:40:00' AS Time), CAST(N'12:10:00' AS Time))
INSERT [dbo].[Classes] ([Пара], [Время начала], [Время окончания]) VALUES (3, CAST(N'12:50:00' AS Time), CAST(N'14:20:00' AS Time))
INSERT [dbo].[Classes] ([Пара], [Время начала], [Время окончания]) VALUES (4, CAST(N'14:30:00' AS Time), CAST(N'16:00:00' AS Time))
GO
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'9849b3d5-568d-40c1-ae75-20140478471d', N'Факультет математики и информационных технологий')
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'6aa6d8ad-b97c-42b6-8878-241dc5653a70', N'Факультет физической культуры и спорта')
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'df9b0e8d-bc60-4525-bc22-3dc919d5028e', N'Стоматологический факультет')
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'133882fa-1f33-4d59-942b-9d4c2caa1edd', N'Исторический факультет')
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'5712c6ee-72be-4854-84d9-aa0ffa63d02c', N'Юридический факультет')
INSERT [dbo].[Faculties] ([Id], [Факультет]) VALUES (N'2f6c224f-7586-483c-a935-ebbeaaf80c07', N'Факультет искусств')
GO
INSERT [dbo].[Groups] ([Id], [Факультет], [Группа]) VALUES (N'c597e883-e2a0-4730-a6f1-baca829bf6f4', N'df9b0e8d-bc60-4525-bc22-3dc919d5028e', 201)
INSERT [dbo].[Groups] ([Id], [Факультет], [Группа]) VALUES (N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'9849b3d5-568d-40c1-ae75-20140478471d', 11)
GO
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'81936b1a-8e09-43e6-afb5-051011e8e269', 1, 2, 4, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'cb9e961b-998b-4650-a00d-09d466147398', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'48e3e4aa-b974-4296-8cb0-2ba2f961e6ae', 1, 1, 2, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'4732cc3a-65fb-4e3f-8dd7-e240df645057', 2)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'b4fcfb9f-97a8-4e1f-9a92-4b2cd047600b', 1, 3, 1, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'3f5bd81a-8fe1-4ee7-9750-363fba2454b0', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'bdc5c206-8fca-4cb9-b897-6377046b2623', 1, 3, 3, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'e545aefb-9245-4005-b602-8caf22922570', 2)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'fc9bd492-f299-4654-b6b3-7196131cc095', 1, 3, 2, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'9c3a2059-edec-4bb8-bbc5-1c97172efce3', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'27b4c45d-d341-423f-af35-7df12bd044a1', 1, 3, 4, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'9c3a2059-edec-4bb8-bbc5-1c97172efce3', 2)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'761f3b0c-a512-4391-853c-9f2e8e875be0', 1, 2, 2, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'fb87c11c-0c20-4c1e-b31b-b27a2f746661', 2)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'57fd5133-e79f-4f2a-a5f2-a98b04d88ed4', 2, 1, 3, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'cb9e961b-998b-4650-a00d-09d466147398', 3)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'f5a04d3a-a5c8-41c8-b437-bfdc8e6acc0c', 1, 2, 1, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'fb87c11c-0c20-4c1e-b31b-b27a2f746661', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'd1c57353-597f-4b75-9e19-c37b62b2d79b', 1, 2, 3, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'9c3a2059-edec-4bb8-bbc5-1c97172efce3', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'10db97da-2b13-4a06-9f29-d0b69ea1826b', 1, 1, 3, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'cb9e961b-998b-4650-a00d-09d466147398', 3)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'bcd5259a-a677-4bdb-ba77-e29c32f7e61e', 2, 1, 1, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'4732cc3a-65fb-4e3f-8dd7-e240df645057', 2)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'0ab697b9-c47a-4714-9b33-ee046184afb7', 1, 1, 1, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'e545aefb-9245-4005-b602-8caf22922570', 1)
INSERT [dbo].[Schedule] ([Id], [Неделя], [День_недели], [Пара], [Группа], [Предмет], [Тип_занятия]) VALUES (N'60a61974-835d-402b-b439-f2d526c73451', 2, 1, 2, N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'4732cc3a-65fb-4e3f-8dd7-e240df645057', 2)
GO
INSERT [dbo].[Students] ([Id], [Факультет], [Группа], [Фамилия], [Имя], [Отчество]) VALUES (N'e3e2539f-905d-4db3-989d-550fcf12e15d', N'9849b3d5-568d-40c1-ae75-20140478471d', N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'Батаев', N'Хетаг', N'Леонидович')
INSERT [dbo].[Students] ([Id], [Факультет], [Группа], [Фамилия], [Имя], [Отчество]) VALUES (N'f09ebfcd-bc5c-47f6-90ba-d2a0fc5c5ed6', N'9849b3d5-568d-40c1-ae75-20140478471d', N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'Бирагова', N'Людмила', N'Казбековна')
INSERT [dbo].[Students] ([Id], [Факультет], [Группа], [Фамилия], [Имя], [Отчество]) VALUES (N'541324e0-8e0c-47f4-819a-fa7e69660c36', N'9849b3d5-568d-40c1-ae75-20140478471d', N'486d7d68-ad71-4283-b5af-d217c3ca1b0f', N'Битаров', N'Зелимхан', N'Асланбекович')
GO
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'cb9e961b-998b-4650-a00d-09d466147398', N'Физическая культура и спорт')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'9c3a2059-edec-4bb8-bbc5-1c97172efce3', N'Алгебра и геометрия')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'3f5bd81a-8fe1-4ee7-9750-363fba2454b0', N'Языки и методы программирования')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'7af103dd-515d-44e3-9af6-5006b8c4c83b', N'Педагогика и психология')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'8cd98902-c0cf-41be-839a-55eeb2ebeb28', N'Дискретная математика')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'e545aefb-9245-4005-b602-8caf22922570', N'Основы информатики')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'7dd331f2-8140-4716-aa9c-a7b4bbbee6a7', N'Иностранный язык')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'fb87c11c-0c20-4c1e-b31b-b27a2f746661', N'Математический анализ')
INSERT [dbo].[Subjects] ([Id], [Предмет]) VALUES (N'4732cc3a-65fb-4e3f-8dd7-e240df645057', N'Практикум на ПК')
GO
INSERT [dbo].[TypeOfClass] ([Id], [Тип занятия]) VALUES (1, N'Лекция')
INSERT [dbo].[TypeOfClass] ([Id], [Тип занятия]) VALUES (2, N'Лабороторная')
INSERT [dbo].[TypeOfClass] ([Id], [Тип занятия]) VALUES (3, N'Практическое занятие')
INSERT [dbo].[TypeOfClass] ([Id], [Тип занятия]) VALUES (4, N'Семинар')
GO
INSERT [dbo].[Week] ([Неделя]) VALUES (1)
INSERT [dbo].[Week] ([Неделя]) VALUES (2)
GO
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (1, N'Понедельник')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (2, N'Вторник')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (3, N'Среда')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (4, N'Четверг')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (5, N'Пятница')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (6, N'Суббота')
INSERT [dbo].[Weekday] ([Id], [День недели]) VALUES (7, N'Воскресенье')
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((1)) FOR [Был]
GO
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [DF_Faculties_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Groups] ADD  CONSTRAINT [DF_Groups_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Schedule] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Subjects] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_ToClasses] FOREIGN KEY([Пара])
REFERENCES [dbo].[Classes] ([Пара])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_ToClasses]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_ToStudents] FOREIGN KEY([Студент])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_ToStudents]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Faculties] FOREIGN KEY([Факультет])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Faculties]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToClasses] FOREIGN KEY([Пара])
REFERENCES [dbo].[Classes] ([Пара])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToClasses]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToGroups] FOREIGN KEY([Группа])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToGroups]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToSubjects] FOREIGN KEY([Предмет])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToSubjects]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToTypeOfClass] FOREIGN KEY([Тип_занятия])
REFERENCES [dbo].[TypeOfClass] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToTypeOfClass]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToWeek] FOREIGN KEY([Неделя])
REFERENCES [dbo].[Week] ([Неделя])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToWeek]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ToWeekday] FOREIGN KEY([День_недели])
REFERENCES [dbo].[Weekday] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ToWeekday]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([Факультет])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Groups] FOREIGN KEY([Группа])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Groups]
GO
USE [master]
GO
ALTER DATABASE [JournalData] SET  READ_WRITE 
GO
