USE [master]
GO
/****** Object:  Database [PR29_TestingStudents]    Script Date: 31.10.2023 21:25:23 ******/
CREATE DATABASE [PR29_TestingStudents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PR29_TestingStudents', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PR29_TestingStudents.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PR29_TestingStudents_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PR29_TestingStudents_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PR29_TestingStudents] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PR29_TestingStudents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PR29_TestingStudents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET ARITHABORT OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PR29_TestingStudents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PR29_TestingStudents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PR29_TestingStudents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PR29_TestingStudents] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PR29_TestingStudents] SET  MULTI_USER 
GO
ALTER DATABASE [PR29_TestingStudents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PR29_TestingStudents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PR29_TestingStudents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PR29_TestingStudents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PR29_TestingStudents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PR29_TestingStudents] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PR29_TestingStudents] SET QUERY_STORE = OFF
GO
USE [PR29_TestingStudents]
GO
/****** Object:  Table [dbo].[QuestionsReports]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsReports](
	[IDTestQuestions] [int] NOT NULL,
	[IDTestingReport] [int] NOT NULL,
	[Answer] [int] NULL,
 CONSTRAINT [PK_QuestionsReports] PRIMARY KEY CLUSTERED 
(
	[IDTestQuestions] ASC,
	[IDTestingReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[NumberStudentCard] [int] IDENTITY(1,1) NOT NULL,
	[StudentGroup] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](300) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Patronymic] [nvarchar](300) NULL,
 CONSTRAINT [PK__Student__A1934E33CAE42C13] PRIMARY KEY CLUSTERED 
(
	[NumberStudentCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](300) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Patronymic] [nvarchar](300) NULL,
 CONSTRAINT [PK__Teacher__3213E83F5D9B999B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestingReport]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestingReport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateTesting] [date] NOT NULL,
	[IDStudent] [int] NOT NULL,
	[TimeTesting] [time](6) NOT NULL,
 CONSTRAINT [PK__TestingR__3213E83F90800DA0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestQuestions]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestQuestions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDTypeQuestions] [int] NULL,
	[Question] [nvarchar](max) NOT NULL,
	[AnswerVariant1] [nvarchar](max) NOT NULL,
	[AnswerVariant2] [nvarchar](max) NOT NULL,
	[AnswerVariant3] [nvarchar](max) NOT NULL,
	[AnswerVariant4] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeQuestion]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31.10.2023 21:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IDStudent] [int] NULL,
	[IDTeacher] [int] NULL,
	[IsTeacher] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[QuestionsReports] ([IDTestQuestions], [IDTestingReport], [Answer]) VALUES (2, 1, 3)
INSERT [dbo].[QuestionsReports] ([IDTestQuestions], [IDTestingReport], [Answer]) VALUES (2, 3, 4)
INSERT [dbo].[QuestionsReports] ([IDTestQuestions], [IDTestingReport], [Answer]) VALUES (3, 2, 2)
INSERT [dbo].[QuestionsReports] ([IDTestQuestions], [IDTestingReport], [Answer]) VALUES (4, 1, 2)
INSERT [dbo].[QuestionsReports] ([IDTestQuestions], [IDTestingReport], [Answer]) VALUES (6, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (1, N'ПКС-220', N'Морозов', N'Илларион', N'Альбертович')
INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (2, N'ПКС-220', N'Ларионов', N'Мечеслав', N'Пантелеймонович')
INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (3, N'ПКС-220', N'Батхиев', N'Ахмед', N'Борисович')
INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (4, N'ПКС-120', N'Журавлёв', N'Назарий', N'Юлианович')
INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (5, N'ПКС-120', N'Медведев', N'Олег', N'Давидович')
INSERT [dbo].[Student] ([NumberStudentCard], [StudentGroup], [LastName], [Name], [Patronymic]) VALUES (6, N'220', N'Petrov', N'Petr', N'')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (1, N'Иванова', N'Елена', N'Сергеевна')
INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (2, N'Петров', N'Александр', N'Иванович')
INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (3, N'Смирнова', N'Ольга', N'Александровна')
INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (4, N'Козлов', N'Дмитрий', N'Владимирович')
INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (5, N'Новикова', N'Анна', N'Павловна')
INSERT [dbo].[Teacher] ([id], [LastName], [Name], [Patronymic]) VALUES (10, N'Ivanov', N'Ivan', N'')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[TestingReport] ON 

INSERT [dbo].[TestingReport] ([id], [DateTesting], [IDStudent], [TimeTesting]) VALUES (1, CAST(N'2023-09-12' AS Date), 1, CAST(N'00:43:12' AS Time))
INSERT [dbo].[TestingReport] ([id], [DateTesting], [IDStudent], [TimeTesting]) VALUES (2, CAST(N'2023-09-12' AS Date), 2, CAST(N'00:33:33' AS Time))
INSERT [dbo].[TestingReport] ([id], [DateTesting], [IDStudent], [TimeTesting]) VALUES (3, CAST(N'2023-09-12' AS Date), 3, CAST(N'00:45:11' AS Time))
INSERT [dbo].[TestingReport] ([id], [DateTesting], [IDStudent], [TimeTesting]) VALUES (4, CAST(N'2023-09-13' AS Date), 4, CAST(N'00:22:57' AS Time))
INSERT [dbo].[TestingReport] ([id], [DateTesting], [IDStudent], [TimeTesting]) VALUES (5, CAST(N'2023-09-13' AS Date), 5, CAST(N'00:18:09' AS Time))
SET IDENTITY_INSERT [dbo].[TestingReport] OFF
GO
SET IDENTITY_INSERT [dbo].[TestQuestions] ON 

INSERT [dbo].[TestQuestions] ([id], [IDTypeQuestions], [Question], [AnswerVariant1], [AnswerVariant2], [AnswerVariant3], [AnswerVariant4], [CorrectAnswer]) VALUES (2, 3, N'Какой город является столицей Франции?', N'Берлин', N'Рим', N'Париж', N'Мадрид', 3)
INSERT [dbo].[TestQuestions] ([id], [IDTypeQuestions], [Question], [AnswerVariant1], [AnswerVariant2], [AnswerVariant3], [AnswerVariant4], [CorrectAnswer]) VALUES (3, 1, N'Кто является создателем серии книг о Гарри Поттере?', N'Джордж Р. Р. Мартин', N'Дж. К. Роулинг', N'Стивен Кинг', N'Джоан Роулинг', 4)
INSERT [dbo].[TestQuestions] ([id], [IDTypeQuestions], [Question], [AnswerVariant1], [AnswerVariant2], [AnswerVariant3], [AnswerVariant4], [CorrectAnswer]) VALUES (4, 4, N'Какое химическое обозначение у таблицы элементов?', N'Na', N'Fe', N'H2O', N'Pt', 3)
INSERT [dbo].[TestQuestions] ([id], [IDTypeQuestions], [Question], [AnswerVariant1], [AnswerVariant2], [AnswerVariant3], [AnswerVariant4], [CorrectAnswer]) VALUES (6, 3, N'Кто написал пьесу "Ромео и Джульетта"?', N'Уильям Шекспир', N'Федор Достоевский', N'Чарльз Диккенс', N'Франц Кафка', 1)
INSERT [dbo].[TestQuestions] ([id], [IDTypeQuestions], [Question], [AnswerVariant1], [AnswerVariant2], [AnswerVariant3], [AnswerVariant4], [CorrectAnswer]) VALUES (7, 2, N'Какой планетой считается самой большой в Солнечной системе?', N'Венера', N'Марс', N'Юпитер', N'Сатурн', 3)
SET IDENTITY_INSERT [dbo].[TestQuestions] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeQuestion] ON 

INSERT [dbo].[TypeQuestion] ([id], [Text]) VALUES (1, N'Информационный вопрос')
INSERT [dbo].[TypeQuestion] ([id], [Text]) VALUES (2, N'Разъяснительные вопросы')
INSERT [dbo].[TypeQuestion] ([id], [Text]) VALUES (3, N'Открытые вопросы')
INSERT [dbo].[TypeQuestion] ([id], [Text]) VALUES (4, N'Закрытые вопросы')
INSERT [dbo].[TypeQuestion] ([id], [Text]) VALUES (5, N'Гипотетические вопросы')
SET IDENTITY_INSERT [dbo].[TypeQuestion] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (1, N'ABBatkhiew', N'272272Bat', 3, NULL, 0)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (2, N'ESIvanova', N'112233Iva', NULL, 1, 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (3, N'DVKozlov', N'998877Koz', NULL, 4, 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (4, N'IAMorozov', N'135790Mor', 1, NULL, 0)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (5, N'MPLarionov', N'192837Lar', 2, NULL, 0)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (6, N'someteacher', N'123', NULL, 5, 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [IDStudent], [IDTeacher], [IsTeacher]) VALUES (7, N'somestudent', N'123', 5, NULL, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[QuestionsReports]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsReports_TestingReport] FOREIGN KEY([IDTestingReport])
REFERENCES [dbo].[TestingReport] ([id])
GO
ALTER TABLE [dbo].[QuestionsReports] CHECK CONSTRAINT [FK_QuestionsReports_TestingReport]
GO
ALTER TABLE [dbo].[QuestionsReports]  WITH CHECK ADD  CONSTRAINT [FK_QuestionsReports_TestQuestions] FOREIGN KEY([IDTestQuestions])
REFERENCES [dbo].[TestQuestions] ([id])
GO
ALTER TABLE [dbo].[QuestionsReports] CHECK CONSTRAINT [FK_QuestionsReports_TestQuestions]
GO
ALTER TABLE [dbo].[TestingReport]  WITH CHECK ADD  CONSTRAINT [FK_TestingReport_Student] FOREIGN KEY([IDStudent])
REFERENCES [dbo].[Student] ([NumberStudentCard])
GO
ALTER TABLE [dbo].[TestingReport] CHECK CONSTRAINT [FK_TestingReport_Student]
GO
ALTER TABLE [dbo].[TestQuestions]  WITH CHECK ADD  CONSTRAINT [FK_TestQuestions_TypeQuestion] FOREIGN KEY([IDTypeQuestions])
REFERENCES [dbo].[TypeQuestion] ([id])
GO
ALTER TABLE [dbo].[TestQuestions] CHECK CONSTRAINT [FK_TestQuestions_TypeQuestion]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Student] FOREIGN KEY([IDStudent])
REFERENCES [dbo].[Student] ([NumberStudentCard])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Student]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Teacher] FOREIGN KEY([IDTeacher])
REFERENCES [dbo].[Teacher] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Teacher]
GO
USE [master]
GO
ALTER DATABASE [PR29_TestingStudents] SET  READ_WRITE 
GO
