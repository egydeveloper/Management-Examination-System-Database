USE [master]
GO
/****** Object:  Database [examination_sys]    Script Date: 6/5/2022 12:09:07 AM ******/
CREATE DATABASE [examination_sys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'exam_sys_Primary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\exam_sys_Primary.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%), 
 FILEGROUP [exam_S_F_G_1] 
( NAME = N'group_one_FG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\group_one_FG.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [exam_S_F_G_2] 
( NAME = N'group_two_FG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\group_two_FG.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%), 
 FILEGROUP [exam_S_F_G_3] 
( NAME = N'group_three_FG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\group_three_FG.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'exam_sys_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\exam_sys_Log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [examination_sys] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [examination_sys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [examination_sys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [examination_sys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [examination_sys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [examination_sys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [examination_sys] SET ARITHABORT OFF 
GO
ALTER DATABASE [examination_sys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [examination_sys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [examination_sys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [examination_sys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [examination_sys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [examination_sys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [examination_sys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [examination_sys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [examination_sys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [examination_sys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [examination_sys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [examination_sys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [examination_sys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [examination_sys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [examination_sys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [examination_sys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [examination_sys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [examination_sys] SET RECOVERY FULL 
GO
ALTER DATABASE [examination_sys] SET  MULTI_USER 
GO
ALTER DATABASE [examination_sys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [examination_sys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [examination_sys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [examination_sys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [examination_sys] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [examination_sys] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'examination_sys', N'ON'
GO
ALTER DATABASE [examination_sys] SET QUERY_STORE = OFF
GO
USE [examination_sys]
GO
/****** Object:  User [student_sys]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE USER [student_sys] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [instructor_sys]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE USER [instructor_sys] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [student_role]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE ROLE [student_role]
GO
/****** Object:  DatabaseRole [instructor_role]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE ROLE [instructor_role]
GO
ALTER ROLE [student_role] ADD MEMBER [student_sys]
GO
ALTER ROLE [db_owner] ADD MEMBER [student_sys]
GO
ALTER ROLE [instructor_role] ADD MEMBER [instructor_sys]
GO
ALTER ROLE [db_owner] ADD MEMBER [instructor_sys]
GO
/****** Object:  Schema [audit_admin]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE SCHEMA [audit_admin]
GO
/****** Object:  Rule [personal_identity]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE RULE [dbo].[personal_identity] 
AS
len(@id) = 14
GO
/****** Object:  Rule [rule_phone]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE RULE [dbo].[rule_phone] 
AS
len(@id) = 11
GO
/****** Object:  UserDefinedTableType [dbo].[assigExamStudent_type]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE TYPE [dbo].[assigExamStudent_type] AS TABLE(
	[student_id] [int] NULL,
	[exam_id] [int] NULL,
	[insrtuct_id] [char](14) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[quest_type_degree]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE TYPE [dbo].[quest_type_degree] AS TABLE(
	[FT_degree] [int] NULL,
	[text_degree] [int] NULL,
	[mcq_degree] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[quest_type_no]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE TYPE [dbo].[quest_type_no] AS TABLE(
	[FT_no] [int] NULL,
	[text_no] [int] NULL,
	[mcq_no] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[table_exam_DT]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE TYPE [dbo].[table_exam_DT] AS TABLE(
	[startTime] [time](7) NULL,
	[endTime] [time](7) NULL,
	[exam_type] [varchar](20) NULL,
	[exam_date] [date] NULL,
	[total_degree] [int] NULL,
	[course_id] [int] NULL,
	[instruct_id] [char](14) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tableExamC]    Script Date: 6/5/2022 12:09:09 AM ******/
CREATE TYPE [dbo].[tableExamC] AS TABLE(
	[question_id] [int] NULL,
	[question_degree] [int] NULL
)
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[instruct_id] [char](14) NOT NULL,
	[instruct_name] [nvarchar](20) NOT NULL,
	[instruct_birthDate] [date] NOT NULL,
	[instruct_phone] [char](11) NOT NULL,
	[instruct_city] [nvarchar](20) NOT NULL,
	[instruct_street] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[instruct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_1]
) ON [exam_S_F_G_1]
GO
/****** Object:  Table [dbo].[class]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_1]
) ON [exam_S_F_G_1]
GO
/****** Object:  Table [dbo].[course]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](20) NOT NULL,
	[course_description] [nvarchar](60) NULL,
	[course_maxDegree] [int] NOT NULL,
	[course_minDegree] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_1]
) ON [exam_S_F_G_1]
GO
/****** Object:  Table [dbo].[class_instructor_course]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_instructor_course](
	[class_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[instruct_id] [char](14) NOT NULL,
	[year] [date] NOT NULL,
 CONSTRAINT [class_instructor_course_PK] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC,
	[course_id] ASC,
	[instruct_id] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Instrucotr_Class_CourseInfo]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[Instrucotr_Class_CourseInfo] ([ID] , [Instrucotr Name]  , [Class Name] , [Course Name] ) 
as
(
select I.instruct_id, I.instruct_name , C.class_name ,Cr.course_name
from course Cr, instructor I , class C , class_instructor_course CI
where I.instruct_id = CI.instruct_id
AND C.class_id = Ci.class_id 
AND Cr.course_id = CI.course_id
)
GO
/****** Object:  Table [dbo].[exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[exam_id] [int] IDENTITY(1,1) NOT NULL,
	[exam_startTime] [time](7) NOT NULL,
	[exam_endTime] [time](7) NOT NULL,
	[exam_type] [nvarchar](20) NOT NULL,
	[exam_date] [date] NOT NULL,
	[exam_total_degree] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[instruct_id] [char](14) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_2]
) ON [exam_S_F_G_2]
GO
/****** Object:  Table [dbo].[student]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [int] NOT NULL,
	[student_name] [nvarchar](20) NOT NULL,
	[student_email] [nvarchar](50) NULL,
	[student_birthDate] [date] NOT NULL,
	[student_phone] [char](11) NOT NULL,
	[student_city] [nvarchar](20) NOT NULL,
	[student_street] [nvarchar](20) NULL,
	[class_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_2]
) ON [exam_S_F_G_2]
GO
/****** Object:  Table [dbo].[instructor_student_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor_student_exam](
	[student_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[instruct_id] [char](14) NOT NULL,
	[exam_result] [int] NULL,
	[done] [char](1) NULL,
 CONSTRAINT [instructor_student_exam_PK] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[instruct_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Exam_Rsult]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[Student_Exam_Rsult] ( [ID], [Student Name] , [Course Name] ,[Exam Type] , [Exam Date] , [Exam Result] )
as
(
select S.student_id, S.student_name , Cr.course_name ,  E.exam_type , E.exam_date , ISE.exam_result 
from instructor_student_exam ISE , exam E , Student S , course Cr
where S.student_id = ISE.student_id AND Cr.course_id = E.course_id 
AND E.exam_id = ISE.exam_id
)
GO
/****** Object:  Table [dbo].[question_pool]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_pool](
	[question_id] [int] IDENTITY(1,1) NOT NULL,
	[question_text] [varchar](max) NOT NULL,
	[question_type] [varchar](20) NOT NULL,
	[model_answer] [varchar](100) NOT NULL,
	[course_id] [int] NOT NULL,
	[instruct_id] [char](14) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [exam_S_F_G_2]
) ON [exam_S_F_G_2] TEXTIMAGE_ON [exam_S_F_G_2]
GO
/****** Object:  View [dbo].[Course_Questions_Pool]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Course_Questions_Pool] ([Ins_ID] , [Instrucotr Name] , [Course Name] , [Question Type] , [Question] , [Model Answer])
as
(
	select I.instruct_id ,I.instruct_name, Cr.course_name , QP.question_type , QP.question_text , QP.model_answer 
	from question_pool QP , Course Cr , Instructor I
	where Cr.course_id = QP.course_id AND I.instruct_id = QP.instruct_id
)
GO
/****** Object:  Table [dbo].[course_student]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_student](
	[course_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[final_result] [int] NULL,
 CONSTRAINT [course_student_PK] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[StudentCoursesInfo]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[StudentCoursesInfo] (ID , [Student Name] , [Course Name] , [Course Max Degree] , [Course MIn Degree]  ) 
as 
(
select S.student_id , S.student_name , C.course_name , C.course_maxDegree , C.course_minDegree
from student S , course C ,course_student CS
where S.student_id = CS.student_id AND c.course_id  = CS.course_id
)
GO
/****** Object:  View [dbo].[Student_courseInfo]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Student_courseInfo] ([ID] , [Student Name] , [Course ID] , [Course Name] , [Course Final Result])
as
(
select S.student_id, S.student_name , Cr.course_id, Cr.course_name ,Cs.final_result  
from student S , course Cr , course_student CS
where S.student_id = CS.student_id AND Cr.course_id = CS.course_id
)
GO
/****** Object:  View [dbo].[InsTructorDeatils]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[InsTructorDeatils] ([INS ID] , [Instructor Name],[Phone] , [Address] , [Course])
as
(
select I.instruct_id , I.instruct_name , I.instruct_phone ,I.instruct_city +' '+i.instruct_street , C.course_name
from instructor I , course C , class_instructor_course CI
where I.instruct_id = CI.instruct_id And C.course_id = CI.course_id
)
GO
/****** Object:  View [dbo].[Student_info]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Student_info]([Student Name] , [Student Address] , [Email] , [Phone]  , [Class Name])
as
(
 select S.student_name,s.student_city +' ' +s.student_street, s.student_email ,s.student_phone,  C.class_name
 from student S,class c 
 where c.class_id=s.class_id 
)
GO
/****** Object:  View [dbo].[Student_info_course]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Student_info_course]([Student Name],[Course Name],[Education Year])
as
(
 select s.student_name ,co.course_name,cic.year
 from student S,class_instructor_course cic,course co
 where  s.class_id=cic.class_id and co.course_id=cic.course_id
 )
GO
/****** Object:  View [dbo].[Course_info]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create view [dbo].[Course_info]([Instructor Name],[Course Name],[Course Description])
as
(
 select i.instruct_name,co.course_name,co.course_description
 from instructor i,class_instructor_course cic,course co
 where  i.instruct_id=cic.instruct_id and co.course_id=cic.course_id
 )
GO
/****** Object:  Table [dbo].[question_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_exam](
	[exam_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[question_degree] [int] NULL,
 CONSTRAINT [question_exam_PK] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Exam_Content_Details]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create View [dbo].[Exam_Content_Details]([Exam ID] , [Exam Type] , [Exam Date] , [Exam Questions],[Question Type] , [Question Degree] , [Model Answer])
 as 
 (
  Select e.exam_id , E.exam_type , exam_date , Qp.question_text, Qp.question_type , QE.question_degree , Qp.model_answer 
 from Exam E , question_exam QE , question_pool QP
 where E.exam_id = QE.exam_id AND QE.question_id = Qp.question_id
 )
GO
/****** Object:  Table [dbo].[student_question_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_question_exam](
	[student_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[student_answer] [nvarchar](100) NULL,
 CONSTRAINT [student_question_exam_PK] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[question_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Student_Exams]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Student_Exams] ([Student ID] ,[Student Name] , [Exam ID] , [Exam Type] , [Course Name] , [Questions] , [Student Answer] , [Model Answer])
as
(
select S.student_id , S.student_name ,  E.exam_id , E.exam_type, Cr.course_name , QP.question_text ,  SQE.student_answer , Qp.model_answer
From Student S , student_question_exam SQE , exam E , question_pool QP , course Cr
where S.student_id = SQE.student_id AND E.exam_id = SQE.exam_id 
And Qp.question_id = SQE.question_id AND E.course_id = Cr.course_id
)
GO
/****** Object:  UserDefinedFunction [dbo].[StudentExamById]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[StudentExamById](@student_id  int)
returns table
as
return
(
	select s.student_name,e.*,ise.exam_result,ise.done  from exam e,instructor_student_exam sqe,student s,instructor_student_exam ise
	where s.student_id=sqe.student_id and e.exam_id =sqe.exam_id and s.student_id = @student_id
	and ise.student_id = @student_id and ise.exam_id = e.exam_id
)
GO
/****** Object:  UserDefinedFunction [dbo].[InstructorCourseById]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[InstructorCourseById](@instruct_id  char(14))
returns table
as
return(select i.instruct_name , c.course_name from course c,class_instructor_course cic,instructor i
where c.course_id=cic.course_id and i.instruct_id =cic.instruct_id and i.instruct_id = @instruct_id)
GO
/****** Object:  UserDefinedFunction [dbo].[instruct_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[instruct_exam](@year date)
returns table
as
return
( 
   select x.exam_id ,x.course_id,x.instruct_id,cl.class_id from dbo.exam x inner join dbo.class_instructor_course cl on x.instruct_id=cl.instruct_id and x.course_id=cl.course_id and year(@year)=year(x.exam_date)
)
GO
/****** Object:  Table [audit_admin].[audit1_class]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit1_class](
	[class_id] [int] NULL,
	[class_name] [nvarchar](max) NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_class_name] [nvarchar](max) NULL,
	[inserted_class_name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit2_class_instruct]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit2_class_instruct](
	[class_id] [int] NULL,
	[course_id] [int] NULL,
	[instruct_id] [nvarchar](max) NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_year] [date] NULL,
	[new_year] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit3_course]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit3_course](
	[course_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_course_name] [nvarchar](max) NULL,
	[new_course_name] [nvarchar](max) NULL,
	[old_course_description] [nvarchar](max) NULL,
	[new_course_description] [nvarchar](max) NULL,
	[old_course_maxDegree] [int] NULL,
	[new_course_maxDegree] [int] NULL,
	[old_course_minDegree] [int] NULL,
	[new_course_minDegree] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit4_course_student]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit4_course_student](
	[course_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_final_result] [int] NULL,
	[new_final_result] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit4_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit4_exam](
	[exam_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_exam_starttime] [time](7) NULL,
	[new_exam_starttime] [time](7) NULL,
	[old_exam_endtime] [time](7) NULL,
	[new_exam_endtime] [time](7) NULL,
	[old_exam_type] [varchar](max) NULL,
	[new_exam_type] [varchar](max) NULL,
	[old_exam_date] [date] NULL,
	[new_exam_date] [date] NULL,
	[old_exam_total_degree] [int] NULL,
	[new_exam_total_degree] [int] NULL,
	[course_id] [int] NULL,
	[instruct_id] [char](14) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit4_instructor]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit4_instructor](
	[instruct_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[instruct_name] [nvarchar](max) NULL,
	[instruct_birthdate] [date] NULL,
	[instruct_phone] [char](11) NULL,
	[instruct_city] [nvarchar](max) NULL,
	[instruct_streat] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit5_instructor_student_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit5_instructor_student_exam](
	[student_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[instruct_id] [char](14) NULL,
	[exam_result] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit6_multi_choice]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit6_multi_choice](
	[choice_text] [varchar](max) NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[question_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit6_question__exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit6_question__exam](
	[exam_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[question_degree] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit6_question__pool]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit6_question__pool](
	[question_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[old_question_text] [varchar](max) NULL,
	[new_question_text] [varchar](max) NULL,
	[old_question_type] [varchar](max) NULL,
	[new_question_type] [varchar](max) NULL,
	[old_model_answer] [varchar](max) NULL,
	[new_model_answer] [varchar](max) NULL,
	[course_id] [int] NULL,
	[instruct_id] [char](14) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit7_student]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit7_student](
	[student_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[student_name] [nvarchar](max) NULL,
	[student_email] [nvarchar](max) NULL,
	[student_birthDate] [date] NULL,
	[student_phone] [char](11) NULL,
	[student_city] [nvarchar](max) NULL,
	[student_street] [nvarchar](max) NULL,
	[class_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [audit_admin].[audit7_student_question_exam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit_admin].[audit7_student_question_exam](
	[student_id] [int] NULL,
	[users_name] [nvarchar](max) NULL,
	[modifieddate] [date] NULL,
	[question_answer] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[multi_choice]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[multi_choice](
	[choise_text] [varchar](100) NOT NULL,
	[question_id] [int] NOT NULL,
 CONSTRAINT [multi_choice_PK] PRIMARY KEY CLUSTERED 
(
	[choise_text] ASC,
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([class_id], [class_name]) VALUES (1, N'Boy’s code')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (2, N'Girl’s code')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (3, N'Squad')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (4, N'Great gang')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (5, N'Canny Cougars')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (6, N'Canny Cougars')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (7, N'Talented Turtles')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (8, N'Chill Dude! ')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (9, N'Skillful bunch')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (10, N'Educated Eagles')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (11, N'Best Brother')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (12, N'Brightest scammer')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (13, N'Gang of Geniuses')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (14, N'Rising to the top')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (15, N'The Brainy Bunch')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (16, N'Meeting Zebras ')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (17, N'Web Cams')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (18, N'Computer Cats')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (19, N'Introverts set')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (20, N'The Spiders')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (21, N'Web theme')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (22, N'Weird Group')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (23, N'Consummate')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (24, N'Classmates')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (29, N'The Pirates')
INSERT [dbo].[class] ([class_id], [class_name]) VALUES (30, N'Workshop')
SET IDENTITY_INSERT [dbo].[class] OFF
GO
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (1, 5, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (1, 7, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (1, 10, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (1, 15, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (1, 21, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 4, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 5, N'15497841513579', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 10, N'78945612334566', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 16, N'52454584854367', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 21, N'15454545623234', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 24, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (2, 36, N'33649979812345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 4, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 5, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 7, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 10, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 15, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 16, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 23, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 31, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 32, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (3, 35, N'15497841513579', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 4, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 5, N'52454584854367', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 10, N'78945612334566', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 15, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 16, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 21, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 22, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 23, N'15454545623234', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 24, N'15497841513579', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 27, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 31, N'33649979812345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 32, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (4, 36, N'52454584854367', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 4, N'78945612334566', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 5, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 7, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 15, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 16, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (5, 21, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 4, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 5, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 7, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 10, N'33649979812345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 15, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (6, 22, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (7, 7, N'15454545623234', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (7, 15, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (7, 16, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (7, 21, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (7, 22, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 21, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 23, N'15497841513579', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 24, N'33649979812345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 27, N'78945612334566', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 31, N'52454584854367', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (8, 32, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (9, 4, N'13200131234534', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (9, 5, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (9, 22, N'14798656268321', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (9, 24, N'12345678911236', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (10, 4, N'15454545623234', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (10, 21, N'15454545445567', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (11, 21, N'29544444423456', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (11, 31, N'15497841513579', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (12, 31, N'45678912323345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (12, 32, N'33649979812345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (13, 24, N'78945612334566', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (13, 35, N'52454584854367', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (14, 31, N'12345101312345', CAST(N'2022-06-04' AS Date))
INSERT [dbo].[class_instructor_course] ([class_id], [course_id], [instruct_id], [year]) VALUES (14, 36, N'13200131234534', CAST(N'2022-06-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[course] ON 

INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (4, N'HTML', N'The HyperText Markup Language', 100, 50)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (5, N'CSS', N'Cascading Style Sheets', 100, 50)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (7, N'JavaScript', N'core technologies of the World Wide Web,', 150, 75)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (10, N'php', N'Backend Programming language', 200, 100)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (15, N'C#', N'Backend Programming Language', 200, 100)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (16, N'Bootstrap', N'Bootstrap is a free and open-source CSS framework', 75, 35)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (21, N'React', N'React is a free and open-source front-end ', 100, 50)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (22, N'Angular', N'Angular is a TypeScript-based free and open-source', 120, 60)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (23, N'Laravel', N'Laravel is a free, open-source PHP web framework', 140, 70)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (24, N'Node.js', N'Node.js is an open-source, cross-platform', 160, 80)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (27, N'Express', N' back end web application', 110, 55)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (31, N'ASP.NET', N'open-source ', 60, 30)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (32, N'Flutter', N' open-source UI software development ki', 130, 65)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (35, N'React Na', N'an open-source', 190, 95)
INSERT [dbo].[course] ([course_id], [course_name], [course_description], [course_maxDegree], [course_minDegree]) VALUES (36, N'Xamarin', N'oftware company founded in May 2011', 210, 105)
SET IDENTITY_INSERT [dbo].[course] OFF
GO
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 1, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 2, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 3, 45)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 4, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 5, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 6, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 7, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 8, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 9, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 10, 66)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 11, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 12, 81)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 13, 89)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 14, 84)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 15, 87)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 16, 88)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 17, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 18, 59)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 19, 52)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 20, 39)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 21, 95)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 22, 44)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 23, 48)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 24, 20)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 25, 64)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 26, 88)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 27, 81)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 28, 87)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 29, 96)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (4, 30, 54)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 1, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 2, 64)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 3, 44)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 4, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 5, 74)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 6, 14)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 7, 89)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 8, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 9, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 10, 92)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 11, 93)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 12, 94)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 13, 95)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 14, 96)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 15, 97)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 16, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 17, 61)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 18, 66)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 19, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 20, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 21, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 22, 47)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 23, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 24, 81)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 25, 82)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 26, 93)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 27, 50)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 28, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 29, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (5, 30, 78)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 1, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 2, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 3, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 4, 130)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 5, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 6, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 7, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 8, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 9, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 10, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 11, 115)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 12, 125)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 13, 136)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 14, 148)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 15, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 16, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 17, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 18, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 19, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 20, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 21, 141)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 22, 142)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 23, 143)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 24, 144)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 25, 101)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 26, 102)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 27, 103)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 28, 104)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 29, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (7, 30, 85)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 1, 199)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 2, 160)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 3, 165)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 4, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 5, 195)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 6, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 7, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 8, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 9, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 10, 200)
GO
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 11, 196)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 12, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 13, 105)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 14, 20)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 15, 30)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 16, 177)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 17, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 18, 112)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 19, 113)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 20, 114)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 21, 115)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 22, 116)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 23, 117)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 24, 118)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 25, 119)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 26, 174)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 27, 163)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 28, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 29, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (10, 30, 40)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 1, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 2, 35)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 3, 36)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 4, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 5, 199)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 6, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 7, 105)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 8, 180)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 9, 106)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 10, 47)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 11, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 12, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 13, 176)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 14, 188)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 15, 136)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 16, 103)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 17, 58)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 18, 49)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 19, 101)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 20, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 21, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 22, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 23, 146)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 24, 146)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 25, 174)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 26, 195)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 27, 191)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 28, 194)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 29, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (15, 30, 49)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 1, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 2, 10)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 3, 11)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 4, 15)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 5, 17)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 6, 14)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 7, 25)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 8, 65)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 9, 26)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 10, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 11, 57)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 12, 71)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 13, 72)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 14, 74)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 15, 61)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 17, 64)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 18, 66)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 19, 67)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 20, 68)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 21, 69)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 22, 51)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 23, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 24, 35)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 25, 36)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 26, 37)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 27, 39)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 28, 40)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 29, 41)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (16, 30, 45)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 1, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 2, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 3, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 4, 59)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 5, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 6, 4)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 7, 7)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 8, 40)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 9, 45)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 10, 50)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 11, 51)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 12, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 13, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 14, 34)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 15, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 16, 85)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 17, 83)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 18, 84)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 19, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 20, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 21, 81)
GO
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 22, 70)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 23, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 24, 92)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 25, 93)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 26, 94)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 27, 97)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 29, 98)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (21, 30, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 1, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 2, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 3, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 4, 1)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 5, 20)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 6, 30)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 7, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 8, 11)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 9, 111)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 10, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 11, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 12, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 13, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 14, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 15, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 18, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 19, 66)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 20, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 21, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 22, 34)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 23, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 24, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 25, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 26, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 27, 58)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 28, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 29, 119)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (22, 30, 116)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 1, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 2, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 3, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 4, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 5, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 6, 63)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 7, 130)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 8, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 9, 116)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 10, 117)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 11, 118)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 12, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 13, 139)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 14, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 15, 65)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 16, 66)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 17, 69)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 18, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 19, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 20, 75)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 22, 86)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 23, 88)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 24, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 25, 14)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 26, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 27, 113)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 28, 120)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 29, 121)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (23, 30, 127)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 1, 1)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 2, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 3, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 4, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 5, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 6, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 7, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 8, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 9, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 10, 95)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 11, 16)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 12, 160)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 13, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 14, 88)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 15, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 16, 89)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 17, 140)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 18, 141)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 19, 145)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 20, 149)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 21, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 22, 111)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 23, 160)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 24, 160)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 25, 113)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 26, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 27, 95)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 28, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 29, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (24, 30, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 1, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 2, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 3, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 4, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 5, 0)
GO
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 6, 90)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 7, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 8, 92)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 9, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 10, 65)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 11, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 12, 56)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 13, 70)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 14, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 15, 101)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 16, 102)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 17, 103)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 18, 109)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 19, 53)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 20, 104)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 21, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 22, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 23, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 24, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 25, 5)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 26, 91)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 27, 23)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 28, 85)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 29, 86)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (27, 30, 89)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 1, 10)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 2, 11)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 3, 40)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 4, 44)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 5, 45)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 6, 50)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 7, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 8, 19)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 9, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 10, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 11, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 12, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 13, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 14, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 15, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 16, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 17, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 18, 56)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 19, 58)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 20, 29)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 21, 27)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 22, 50)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 23, 33)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 24, 35)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 25, 36)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 26, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 27, 40)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 28, 45)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 29, 51)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (31, 30, 51)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 1, 130)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 2, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 3, 13)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 4, 130)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 5, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 6, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 7, 102)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 8, 10)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 9, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 10, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 11, 111)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 13, 114)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 14, 115)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 15, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 16, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 17, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 18, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 19, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 20, 119)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 21, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 22, 85)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 23, 77)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 24, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 25, 112)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 26, 119)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 27, 129)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 28, 121)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 29, 124)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (32, 30, 80)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 1, 180)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 2, 181)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 3, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 4, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 5, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 6, 170)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 8, 175)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 9, 180)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 10, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 11, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 12, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 13, 60)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 14, 65)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 15, 67)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 16, 70)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 17, 80)
GO
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 18, 99)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 19, 150)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 20, 155)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 21, 177)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 22, 176)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 23, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 24, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 25, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 26, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 27, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 28, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 29, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (35, 30, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 1, 200)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 2, 209)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 3, 100)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 4, 110)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 5, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 6, 164)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 7, 148)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 8, 103)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 9, 64)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 10, 149)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 11, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 12, NULL)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 13, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 14, 210)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 15, 105)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 16, 106)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 17, 109)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 18, 180)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 19, 190)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 20, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 21, 0)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 22, 159)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 23, 134)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 24, 185)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 25, 101)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 26, 147)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 27, 166)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 28, 44)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 29, 55)
INSERT [dbo].[course_student] ([course_id], [student_id], [final_result]) VALUES (36, 30, 77)
GO
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([exam_id], [exam_startTime], [exam_endTime], [exam_type], [exam_date], [exam_total_degree], [course_id], [instruct_id]) VALUES (6, CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), N'corrective', CAST(N'2022-07-15' AS Date), 100, 4, N'13200131234534')
SET IDENTITY_INSERT [dbo].[exam] OFF
GO
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'12345101312345', N'Shehab ahmed', CAST(N'1993-11-04' AS Date), N'01236544878', N'Sohag', N'114 MK')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'12345678911236', N'Mohamed', CAST(N'1995-01-02' AS Date), N'01023057927', N'Minya', N'9RD')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'13200131234534', N'Hassan ', CAST(N'2002-12-16' AS Date), N'01166794799', N'Giza', N'10 KA')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'14798656268321', N'Zyad Yassen', CAST(N'1991-10-15' AS Date), N'01236545487', N'Alex', N'12 WQ')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'15454545445567', N'Gamal Kamel', CAST(N'1975-05-09' AS Date), N'01145484789', N'Minya', N'66 LZ')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'15454545623234', N'John Karam', CAST(N'1989-05-09' AS Date), N'01054564877', N'Minya', N'44 FE')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'15497841513579', N'Taha Omar', CAST(N'1986-12-07' AS Date), N'01035411478', N'Cairo', N'33 QQ')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'29544444423456', N'Mohab Nader', CAST(N'1985-01-11' AS Date), N'01032354564', N'Cairo', N'77 RM')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'33649979812345', N'Ahmed Kamed', CAST(N'1999-06-11' AS Date), N'01136978744', N'Qena', N'61 LA')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'45678912323345', N'Michel', CAST(N'2000-10-10' AS Date), N'01264579834', N'Cairo', N'77 RM')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'52454584854367', N'Milad Emad', CAST(N'1980-04-05' AS Date), N'01236464597', N'Giza', N'44 OM')
INSERT [dbo].[instructor] ([instruct_id], [instruct_name], [instruct_birthDate], [instruct_phone], [instruct_city], [instruct_street]) VALUES (N'78945612334566', N'Antony', CAST(N'1998-09-09' AS Date), N'01032099776', N'Alex', N'10 Md')
GO
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'A - ToInt64', 201)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) <css>', 189)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) CSS is a style sheet language', 188)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) Drek Kolkevi', 196)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) HTML describes the structure of a webpage', 182)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) HyperText Markup Language', 186)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) It is an ordered list of values', 193)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'A) It is component oriented.', 199)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) JavaScript is an Object-Based language', 192)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) Null type', 194)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) PHP is an open-source programming language', 195)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) PHP stands for Preprocessor Home Page', 198)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) Rasmus Lerdorf', 184)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'a) tag', 190)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'B - ToSbyte', 201)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) <!DOCTYPE html>', 189)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) CSS is designed to separate the presentation and content, including layout, colors, and fonts', 188)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) HTML is the standard markup language mainly used to create web pages', 182)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) HyperText Machine Language', 186)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) id', 190)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'B) It can be compiled on a variety of computer platforms.', 199)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) It is an ordered list of objects', 193)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) JavaScript is Assembly-language', 192)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) PHP is used to develop dynamic and interactive websites', 195)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) PHP stands for Pretext Hypertext Processor', 198)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) Rasmus Lerdorf', 196)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) Tim Berners-Lee', 184)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'b) Undefined type', 194)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'C - ToSingle', 201)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) <script>', 189)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) Brendan Eich', 184)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) class', 190)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) CSS is the language used to style the HTML documents', 188)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) HTML consists of a set of elements that helps the browser how to view the content', 182)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) HyperText Marking Language', 186)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'C) It is a part of .Net Framework.', 199)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) It is an ordered list of string', 193)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) JavaScript is an Object-Oriented language', 192)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) Number type', 194)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) PHP is a server-side scripting language', 195)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) PHP stands for Hypertext Preprocessor', 198)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'c) Willam Makepiece', 196)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'D - ToInt32', 201)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) <style>', 189)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'D) All of the above.', 199)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) All of the mentioned', 182)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) All of the mentioned', 188)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) All of the mentioned', 194)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) All of the mentioned', 195)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) both class and tag', 190)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) HighText Marking Language', 186)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) It is an ordered list of functions', 193)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) JavaScript is a High-level language', 192)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) List Barely', 196)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) PHP stands for Personal Hyper Processor', 198)
INSERT [dbo].[multi_choice] ([choise_text], [question_id]) VALUES (N'd) Sergey Brin', 184)
GO
SET IDENTITY_INSERT [dbo].[question_pool] ON 

INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (19, N'1. Are the HTML tags and elements the same thing?', N'text', N' HTML elements are defined by a starting tag', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (25, N'2. What are tags and attributes in HTML?', N'text', N'Tags are the primary component of the HTML ', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (31, N'3. What are void elements in HTML?', N'text', N'HTML elements which do not have closing tags or d', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (33, N'4. What is the advantage of collapsing white space?', N'text', N'In HTML, a blank sequence of whitespace is treated', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (34, N'1. What is the Box model in CSS? Which CSS properties are a part of it?', N'text', N'A rectangle box is wrapped around every element', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (36, N'2. What are the advantages of using CSS?', N'text', N'Separation of content from presentation', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (42, N'3. What are the limitations of CSS?', N'text', N'Some style selectors are supported and some not', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (43, N'4. How to include CSS in the webpage?', N'text', N'External Style Sheet: An external file ', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (45, N'5. What is a CSS Preprocessor? What are Sass, Less, and Stylus? Why do people use them?', N'text', N'A CSS Preprocessor is a tool', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (50, N'1. What is JavaScript?', N'text', N'JavaScript is a client-side and server-', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (51, N'2. Enumerate the differences between Java and JavaScript?', N'text', N'Java is a complete programming language.', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (52, N'3. What are JavaScript Data Types?', N'text', N'Following are the JavaScript Data types:', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (54, N'4. What is the use of isNaN function?', N'text', N'isNan function returns', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (55, N'5. Which is faster between JavaScript and an ASP script?', N'text', N'JavaScript is faster. ', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (57, N'Q1. What are the common uses of PHP?', N'text', N'It performs system function', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (58, N'Q2. What is PEAR in PHP?', N'text', N'PEAR is a framework', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (59, N'Q3. What is the difference between static and dynamic websites?', N'text', N'To execute a PHP script', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (60, N'Q4. Is PHP a case sensitive language?', N'text', N'PHP is partially case sensitive', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (61, N'1. What is the role of C#?', N'text', N'The role of C# as a programming language', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (62, N'2. What is meant by object-oriented programming?', N'text', N'is an approach to programming ', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (63, N'3. What is the difference between managed and unmanaged code?', N'text', N'is executed by the Common Language Runtime', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (64, N'4. How is C# different from C?', N'text', N'The most significant difference between ', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (67, N'Q1. What is Bootstrap?', N'text', N'is a platform for web development based on a ', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (69, N'Q2. What is PEAR in PHP?', N'text', N'PEAR is a framework', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (70, N'Q3. What is the difference between static and dynamic websites?', N'text', N'content can’t be changed after running the script.', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (71, N'Q4. How to execute a PHP script from the command line?', N'text', N'PHP Command Line Interface (CLI)', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (72, N'1.  Differentiate between Real DOM and Virtual DOM.', N'text', N'1. It updates slow.	', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (75, N'2. What is JSX?', N'text', N' It is used with React to describe what the user ', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (76, N'3. Can web browsers read JSX directly? ', N'text', N'Web browsers cannot read JSX directly.', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (82, N'1. Why were client-side frameworks like Angular introduced?', N'text', N'Back in the day, web developers', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (84, N'2. How does an Angular application work?', N'text', N'Every Angular app consists of a file', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (85, N'3. What are some of the advantages of Angular over other frameworks?', N'text', N'Features that are provided out of the box', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (87, N'1-What is Laravel Framework?', N'text', N'Laravel is an open-source PHP  framework', 23, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (88, N'2. Define Composer.', N'text', N'Composer is the package manager for the framework', 23, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (89, N'1. What Is Node.js?', N'text', N'an extremely powerful framework developed on', 24, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (92, N'2 Why Node.js is single threaded?', N'text', N'single threaded model insupport async processing', 24, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (94, N'1) What is Express.js?', N'text', N'simply Express, is a free, open-source, ', 27, N'15454545445567')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (96, N'2) What are some distinctive features of Express?', N'text', N' minimal and flexible Node.js web application', 27, N'15454545445567')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (97, N'1. What is a web application?', N'text', N'The browser makes an HTTP request for a specific', 31, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (98, N'2. What is a web application framework, and what are its benefits?', N'text', N'it’s not tied to a Windows operating system', 31, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (100, N'1. Write the advantages of using flutter.', N'text', N'developing mobile applications, Flutter fulfills ', 32, N'33649979812345')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (101, N'2. Explain the flutter architecture.', N'text', N' The Dart-based platform that takes care of app ', 32, N'33649979812345')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (105, N'1. How is React Native different from ReactJS?', N'text', N'framework that was  by Facebook', 35, N'52454584854367')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (106, N'2. What is JSX?', N'text', N'avaScript XML, or JSX,', 35, N'52454584854367')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (107, N'Q1: What is Xamarin?', N'text', N' is a Cross Platform Mobile Development', 36, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (109, N'Q2: What are the various flavors of Xamarin Applications that can be made?', N'text', N' two different ways of creating applications', 36, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (119, N'Q1:You need to save the HTML document in a notepad file with an extension html to view it with a browser?', N'true & false', N'true', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (121, N'1-If the html tag is not closed propely the HTML language will inform the user by a sytax error message box.', N'true & false', N'true', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (122, N'2-An html file can be saved as with extension html, doc, or txt in order to be viewed by a web browser such as explorer, firefox or Chrome.?', N'true & false', N'false', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (124, N'1. Linking to an external style sheet allows you to have hyperlinks from your page to the World Wide Web?', N'true & false', N'false', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (127, N'2. font-name: Is the correct CSS syntax to change the font name.', N'true & false', N'false', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (129, N'3. Elements that have higher z-index values are displayed in front of elements with lower z-index values?', N'true & false', N'false', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (132, N'1-is JavaScript has two distinct values for nothing, null and undefined ?', N'true & false', N'true', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (133, N'2-JavaScript has three different approaches for testing equality', N'true & false', N'false', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (134, N'3-Is '' '' is false?', N'true & false', N'false', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (135, N'1-Parent constructors are not called implicitly if the child class defines a constructor.', N'true & false', N'true', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (136, N'2-Interface constant can be override in class implementing the interface.', N'true & false', N'false', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (137, N'3-Static methods can be call with class name and colon operator, $this is not available inside the method declared as static.', N'true & false', N'true', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (138, N'1-Multiple inheritance is different from multiple levels of inheritance.', N'true & false', N'true ', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (139, N'2-An object of a derived class cannot access private members of base class.', N'true & false', N'true', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (140, N'3-The way a derived class member function can access base class public members, the base class member functions can access public member functions of derived class.', N'true & false', N'false', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (142, N'1-is Mark Otto and Jacob Thornton developed the bootstrap?', N'true & false', N'true', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (143, N'2) Is Bootstrap3 mobile-first?', N'true & false', N'true', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (144, N'3).panel-head is used to add a heading to the panel?', N'true & false', N'false', 16, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (146, N'1)React.js can increase the application''s performance with Virtual DOM is the advantages of React.js?', N'true & false', N'true', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (148, N'2)React.js has only a view layer. We have put your code for Ajax requests, events and so on.', N'true & false', N'false', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (149, N'3)The JSX in React.js makes code easy to read and write.?', N'true & false', N'true', 21, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (150, N'1)Do AngularJS provide reusable components?', N'true & false', N'true', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (153, N'2) Is AngularJS completely based on HTML and JavaScript?', N'true & false', N'true', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (154, N'3) AngularJS Don,t support two-way data binding.', N'true & false', N'false', 22, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (156, N'1)Laravel language is assembly language Programming?', N'true & false', N'false', 23, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (157, N'2)Laravel language is an ancient language ?', N'true & false', N'false', 23, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (158, N'1)The buffer class is a global class that can be accessed without importing a buffer module?', N'true & false', N'true', 24, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (159, N'2) Is the process a global object and can be accessed from anywhere?', N'true & false', N'true', 24, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (161, N'3) Is Node.js multithreaded?', N'true & false', N'false', 24, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (162, N'1)Express designed for building single-page, multi-page, and hybrid web applications and APIs?', N'true & false', N'true', 27, N'15454545445567')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (165, N'2) MVC frameworks support scaffolding other than Express?', N'true & false', N'true', 27, N'15454545445567')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (166, N'1) .jpeg is the file extension an asp.net web form?', N'true & false', N'false', 31, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (167, N'2)The term for the pages that depend upon a master page is called content pages', N'true & false', N'true', 31, N'29544444423456')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (169, N'1)List View widgets used for repeating the content?', N'true & false', N'true', 32, N'33649979812345')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (170, N'2) only Mac Operating System can you install the Flutter development environment on?', N'true & false', N'false', 32, N'33649979812345')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (171, N'1)React.js is easy to integrate with other frameworks such as Angular, BackboneJS since it is only a view library.', N'true & false', N'true', 35, N'52454584854367')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (176, N'2)The JSX in React.js makes code easy to read and write" is  disadvantage of React.js.', N'true & false', N'false', 35, N'52454584854367')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (177, N'1) The main operation of Xamarin is to build mobile apps that work on cross-platforms. It is used to build the UI for Android, iOS, and Windows operating system. Xamarin application shares the codebase?', N'true & false', N'true', 36, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (179, N'2)The disadvantages of Xamarin is Developers can use Xamarin to make cross-platform apps.', N'true & false', N'false', 36, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (182, N'1. What is HTML?', N'choise', N'd) All of the mentioned', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (184, N'2. Who is the father of HTML?', N'choise', N'b) Tim Berners-Lee', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (186, N'3. HTML stands for?', N'choise', N'a) HyperText Markup Language', 4, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (188, N'1. What is CSS?', N'choise', N'd) All of the mentioned', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (189, N'2. Which of the following tag is used to embed css in html page?', N'choise', N'd) <style>', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (190, N'3. Which of the following CSS selectors are used to specify a group of elements?', N'choise', N'c) class', 5, N'15497841513579')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (192, N'1. Which of the following is correct about JavaScript?', N'choise', N'a) JavaScript is an Object-Based language', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (193, N'2. Arrays in JavaScript are defined by which of the following statements?', N'choise', N'a) It is an ordered list of values', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (194, N'3. Which of the following is not javascript data types?', N'choise', N'd) All of the mentioned', 7, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (195, N'1. What is PHP?', N'choise', N'd) All of the mentioned', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (196, N'2. Who is the father of PHP?', N'choise', N'b) Rasmus Lerdorf', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (198, N'3. What does PHP stand for?', N'choise', N'c) PHP stands for Hypertext Preprocessor', 10, N'12345678911236')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (199, N'Q 1 - Which of the following is correct about C#?', N'choise', N'D) All of the above.', 15, N'13200131234534')
INSERT [dbo].[question_pool] ([question_id], [question_text], [question_type], [model_answer], [course_id], [instruct_id]) VALUES (201, N'Q 3 - Which of the following converts a type to a signed byte type in C#?', N'choise', N'B) ToSbyte', 15, N'13200131234534')
GO
SET IDENTITY_INSERT [dbo].[question_pool] OFF
GO
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (1, N'Abdul Hussein', N'AbdulHussein@gmail.com', CAST(N'2005-02-05' AS Date), N'01045484846', N'Minya', N'14 SS', 1)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (2, N'Aman Ali', N'AmanAli@yahoo.com', CAST(N'2009-07-05' AS Date), N'01064777451', N'Minya', N'15 PO', 1)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (3, N'Mina', N'MinaMilad14@gmail.com', CAST(N'2001-09-06' AS Date), N'01134478789', N'Minya', N'16 ML', 1)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (4, N'Mohab Ahmed', N'MohabAhmed@gmail.com', CAST(N'2000-07-14' AS Date), N'01245479978', N'Alex', N'11 TA', 1)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (5, N'Khaled Sayed', N'KhaledSayed@yahoo.com', CAST(N'2002-11-17' AS Date), N'01135447779', N'Alex', N'11 MA', 2)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (6, N'Khaled Imam', N'khaledimam@yahoo.com', CAST(N'2003-12-04' AS Date), N'01032379651', N'Giza', N'66 WE', 2)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (7, N'Asem Essam', N'assemessam@yahoo.com', CAST(N'2004-04-10' AS Date), N'01085236419', N'Giza', N'19 sa', 2)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (8, N'John kamel', N'john@yahoo.com', CAST(N'2009-01-01' AS Date), N'01234545878', N'Cairo', N'13 ML', 3)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (9, N'Abdelraheem khaled', N'abdo@gmail.com', CAST(N'2010-10-14' AS Date), N'01131547999', N'Cairo', N'16 Vs', 3)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (10, N'Hoda Ahmed', N'hoda@gmail.com', CAST(N'2013-11-14' AS Date), N'01032547996', N'Cairo', N'58 RT', 3)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (11, N'Eman Metawly', N'eman@gmail.com', CAST(N'2000-05-26' AS Date), N'01175649302', N'Qena', N'44 OI', 3)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (12, N'Safia Reda', N'safia@gmail.com', CAST(N'2000-06-17' AS Date), N'01155487632', N'Qena', N'47 DS', 3)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (13, N'Sara Ahmed', N'Saraahmed17@yahoo.com', CAST(N'2000-07-05' AS Date), N'01234547889', N'Minya', N'13 wq ', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (14, N'Roida Maged', N'roida@gmail.com', CAST(N'1996-01-06' AS Date), N'01189797979', N'Minya', N'19 YT', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (15, N'Mariam Emad', N'mariam@gmail.com', CAST(N'1997-03-30' AS Date), N'01145996360', N'Minya', N'31 ZX', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (16, N'Mahitab saad', N'Mahitabsa14@gmail.com', CAST(N'1998-08-31' AS Date), N'01031546473', N'Sohag', N'10 BV', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (17, N'Gerges Eyad', N'Gerges777@gmail.com', CAST(N'1999-09-01' AS Date), N'01036479895', N'Sohag', N'11 BV', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (18, N'Amal Gamal', N'Amal44@gmail.com', CAST(N'1999-09-10' AS Date), N'01234577703', N'Minya', N'18 KJ', 4)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (19, N'Amal Mohamed', N'Amal555@gmail.com', CAST(N'1991-11-30' AS Date), N'01034444719', N'Minya', N'66 FF', 5)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (20, N'Tamim Morad', N'TamimMo10@yahoo.com', CAST(N'1994-12-31' AS Date), N'01234654789', N'Alex', N'64 RE', 5)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (21, N'Reda Ali', N'Redaali@yahoo.com', CAST(N'2007-01-01' AS Date), N'01254549011', N'Alex', N'70 ZX', 5)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (22, N'Mahmoud hamed ', N'Mahmoud211@yahoo.com', CAST(N'2003-04-16' AS Date), N'01036544789', N'Alex', N'00 SW', 5)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (23, N'Nada Ali', N'NadaSS@gmail.com', CAST(N'2000-04-27' AS Date), N'01114799510', N'Alex', N'02 CV', 6)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (24, N'Desuki Desuki', N'Desuki@gmail.com', CAST(N'2004-05-14' AS Date), N'01234489787', N'Bani suif', N'69 BN', 6)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (25, N'Amin khaled', N'amin11@gmail.com', CAST(N'2004-11-01' AS Date), N'01034548498', N'Cairo', N'60 MN', 6)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (26, N'Sholkami', N'Sho55@gmail.com', CAST(N'2006-08-31' AS Date), N'01031031907', N'Cairo', N'30 SD', 7)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (27, N'Youssef ahmed ', N'youssefAhmed@gmail.com', CAST(N'2006-08-11' AS Date), N'01254303197', N'Cairo', N'39 LM', 7)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (28, N'Ramadan kareem', N'Ramadan21@gmail.com', CAST(N'2013-12-17' AS Date), N'01035484889', N'Minya', N'60 CX', 7)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (29, N'Aliaa Ahmed', N'Aliaa78@yahoo.com', CAST(N'2005-03-28' AS Date), N'01163067913', N'Bani suif', N'34 NB', 8)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (30, N'Nermeen ali', N'Ner45@gmail.com', CAST(N'2000-06-05' AS Date), N'01064979623', N'Bami suif', N'80 GH', 8)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (31, N'Noran Foaad', N'Noran@Gmail.com', CAST(N'2009-08-21' AS Date), N'01264478798', N'Qena', N'91 VC', 8)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (32, N'Norhan daly', N'Norhan@gmail.com', CAST(N'1997-05-25' AS Date), N'01154889892', N'Qena', N'55 VF', 9)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (33, N'Noor Helmy', N'Noor11@gmail.com', CAST(N'1986-01-09' AS Date), N'01236454014', N'Aswan', N'39 AS', 9)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (34, N'Samy ramy', N'samy39@yahoo.com', CAST(N'1975-06-30' AS Date), N'01031654644', N'Aswan', N'74 ED', 10)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (35, N'Ramy samy', N'ramy@yahoo.com', CAST(N'1977-10-06' AS Date), N'01136496477', N'Alex', N'66 SW', 11)
INSERT [dbo].[student] ([student_id], [student_name], [student_email], [student_birthDate], [student_phone], [student_city], [student_street], [class_id]) VALUES (36, N'fahmy ', N'fahmy@gmail.com', CAST(N'1999-01-04' AS Date), N'01234655679', N'Alex', N'79 WE', 12)
GO
/****** Object:  Index [class_inst_course_unique_uq]    Script Date: 6/5/2022 12:09:09 AM ******/
ALTER TABLE [dbo].[class_instructor_course] ADD  CONSTRAINT [class_inst_course_unique_uq] UNIQUE NONCLUSTERED 
(
	[class_id] ASC,
	[course_id] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[class_instructor_course] ADD  DEFAULT (getdate()) FOR [year]
GO
ALTER TABLE [dbo].[instructor_student_exam] ADD  DEFAULT ('0') FOR [done]
GO
ALTER TABLE [dbo].[class_instructor_course]  WITH CHECK ADD  CONSTRAINT [class_inst_course__instructor_FK] FOREIGN KEY([instruct_id])
REFERENCES [dbo].[instructor] ([instruct_id])
GO
ALTER TABLE [dbo].[class_instructor_course] CHECK CONSTRAINT [class_inst_course__instructor_FK]
GO
ALTER TABLE [dbo].[class_instructor_course]  WITH CHECK ADD  CONSTRAINT [class_inst_course_class_FK] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[class_instructor_course] CHECK CONSTRAINT [class_inst_course_class_FK]
GO
ALTER TABLE [dbo].[class_instructor_course]  WITH CHECK ADD  CONSTRAINT [class_inst_course_course_FK] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[class_instructor_course] CHECK CONSTRAINT [class_inst_course_course_FK]
GO
ALTER TABLE [dbo].[course_student]  WITH CHECK ADD  CONSTRAINT [course_student_course_FK] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[course_student] CHECK CONSTRAINT [course_student_course_FK]
GO
ALTER TABLE [dbo].[course_student]  WITH CHECK ADD  CONSTRAINT [course_student_student_FK] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[course_student] CHECK CONSTRAINT [course_student_student_FK]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [course_exam_FK] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [course_exam_FK]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [exam_instructor_FK] FOREIGN KEY([instruct_id])
REFERENCES [dbo].[instructor] ([instruct_id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [exam_instructor_FK]
GO
ALTER TABLE [dbo].[instructor_student_exam]  WITH CHECK ADD  CONSTRAINT [inst_std_exam_exam_FK] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[instructor_student_exam] CHECK CONSTRAINT [inst_std_exam_exam_FK]
GO
ALTER TABLE [dbo].[instructor_student_exam]  WITH CHECK ADD  CONSTRAINT [inst_std_exam_instructor_FK] FOREIGN KEY([instruct_id])
REFERENCES [dbo].[instructor] ([instruct_id])
GO
ALTER TABLE [dbo].[instructor_student_exam] CHECK CONSTRAINT [inst_std_exam_instructor_FK]
GO
ALTER TABLE [dbo].[instructor_student_exam]  WITH CHECK ADD  CONSTRAINT [inst_std_exam_student_FK] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[instructor_student_exam] CHECK CONSTRAINT [inst_std_exam_student_FK]
GO
ALTER TABLE [dbo].[multi_choice]  WITH CHECK ADD  CONSTRAINT [multi_choice_question_FK] FOREIGN KEY([question_id])
REFERENCES [dbo].[question_pool] ([question_id])
GO
ALTER TABLE [dbo].[multi_choice] CHECK CONSTRAINT [multi_choice_question_FK]
GO
ALTER TABLE [dbo].[question_exam]  WITH CHECK ADD  CONSTRAINT [question_exam_exam_FK] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[question_exam] CHECK CONSTRAINT [question_exam_exam_FK]
GO
ALTER TABLE [dbo].[question_exam]  WITH CHECK ADD  CONSTRAINT [question_exam_question_FK] FOREIGN KEY([question_id])
REFERENCES [dbo].[question_pool] ([question_id])
GO
ALTER TABLE [dbo].[question_exam] CHECK CONSTRAINT [question_exam_question_FK]
GO
ALTER TABLE [dbo].[question_pool]  WITH CHECK ADD  CONSTRAINT [question_course_FK] FOREIGN KEY([course_id])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[question_pool] CHECK CONSTRAINT [question_course_FK]
GO
ALTER TABLE [dbo].[question_pool]  WITH CHECK ADD  CONSTRAINT [question_instructor_FK] FOREIGN KEY([instruct_id])
REFERENCES [dbo].[instructor] ([instruct_id])
GO
ALTER TABLE [dbo].[question_pool] CHECK CONSTRAINT [question_instructor_FK]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [student_class_FK] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([class_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [student_class_FK]
GO
ALTER TABLE [dbo].[student_question_exam]  WITH CHECK ADD  CONSTRAINT [std_quest_exam_exam_FK] FOREIGN KEY([exam_id])
REFERENCES [dbo].[exam] ([exam_id])
GO
ALTER TABLE [dbo].[student_question_exam] CHECK CONSTRAINT [std_quest_exam_exam_FK]
GO
ALTER TABLE [dbo].[student_question_exam]  WITH CHECK ADD  CONSTRAINT [std_quest_exam_question_FK] FOREIGN KEY([question_id])
REFERENCES [dbo].[question_pool] ([question_id])
GO
ALTER TABLE [dbo].[student_question_exam] CHECK CONSTRAINT [std_quest_exam_question_FK]
GO
ALTER TABLE [dbo].[student_question_exam]  WITH CHECK ADD  CONSTRAINT [std_quest_exam_student_FK] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[student_question_exam] CHECK CONSTRAINT [std_quest_exam_student_FK]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [course_Max_Min_Degree_ch] CHECK  (([course_maxDegree]>[course_minDegree]))
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [course_Max_Min_Degree_ch]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [check_type_exam] CHECK  (([exam_type]='corrective' OR [exam_type]='exam'))
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [check_type_exam]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [exam_exam_date_ch] CHECK  (([exam_date]>getdate()))
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [exam_exam_date_ch]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [exam_start_end_ch] CHECK  (([exam_startTime]<[exam_endTime]))
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [exam_start_end_ch]
GO
ALTER TABLE [dbo].[question_pool]  WITH CHECK ADD  CONSTRAINT [question_type_CH] CHECK  (([question_type]='choise' OR [question_type]='text' OR [question_type]='true & false'))
GO
ALTER TABLE [dbo].[question_pool] CHECK CONSTRAINT [question_type_CH]
GO
/****** Object:  StoredProcedure [dbo].[AssAllStdForExaCourseById]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AssAllStdForExaCourseById] @exam_id int ,@course_id int ,@instruct_id char(14)
as
begin
	begin tran
	begin try
		if @exam_id = (select exam_id from exam where course_id = @course_id and instruct_id=@instruct_id)
		begin
			declare @student_id int;
			declare @index int=1;
			declare @count int= (select count(s.student_id) from student s,course_student cs where s.student_id = cs.student_id and cs.course_id =@course_id);
			while @index < @count
			begin
				with tableAllStudent AS
				(select s.student_id,ROW_NUMBER() over(order by s.student_id) rownum from student s,course_student cs where s.student_id = cs.student_id and cs.course_id =@course_id)
				select @student_id=tas.student_id from tableAllStudent tas where rownum = @index;
				print @student_id;
				if @student_id is not null
				begin
					insert into instructor_student_exam(student_id,exam_id,instruct_id) values(@student_id,@exam_id,@instruct_id);
				end
				else
				begin
					raiserror('not exist student in this coures or the data not correct',16,10);
					rollback tran;
				end
				set @index = @index+1;
			end
			commit tran
		end
		else
		begin
			rollback tran;
		end
	end try
	begin catch
		rollback;
		throw;
		select ERROR_MESSAGE();
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[assignExamForMStudent]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[assignExamForMStudent] @examStudent assigExamStudent_type readonly
as
begin
begin try
	declare @index int=1;
	declare @lastIndex int=(select count(*) from @examStudent);
	declare @student int;
	declare @exam int;
	declare @instruct char(14);
	while  @index<=@lastIndex
	begin
		WITH cte AS ( SELECT   *,ROW_NUMBER() OVER( order BY student_id) AS ROW_NUM 
				FROM     @examStudent) 
		SELECT @student=student_id,@exam=exam_id,@instruct=insrtuct_id   
		FROM    cte WHERE   ROW_NUM = @index;
		exec assignExamForStudent @student,@exam,@instruct
		set @index = @index+1;
	end
	commit 
end try
begin catch
	rollback 
	select ERROR_MESSAGE();
end catch
end
GO
/****** Object:  StoredProcedure [dbo].[assignExamForStudent]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[assignExamForStudent] @student_id int,@exam_id int,@instruct_id char(14)
as
begin
	begin tran
	begin try
		if exists(select e.exam_id ,s.student_id,i.instruct_id from exam e,course_student cs,student s,instructor i,class_instructor_course cic 
		where e.course_id=cs.course_id and e.exam_id = @exam_id and cs.student_id=@student_id
		and cs.student_id = s.student_id and i.instruct_id = cic.instruct_id and i.instruct_id = @instruct_id and cic.course_id=cs.course_id)
		begin
			insert into instructor_student_exam(student_id,exam_id,instruct_id) values(@student_id,@exam_id,@instruct_id);
		end
		else 
		begin 
			raiserror('student and exam not exist in the same course',16,10);
			rollback tran;
		end
		commit tran;
	end try
	begin catch
		select ERROR_MESSAGE() as 'Message Error';
		rollback tran
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[calcFinalResCourse]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[calcFinalResCourse] @course_id int, @student_id int
as
begin
	begin tran
	begin try
		declare @final_Res int ;
		select @final_Res=sum(ise.exam_result)
		from course c,exam e,instructor_student_exam ise,student s
		where c.course_id = e.course_id and ise.exam_id = e.exam_id and ise.student_id = s.student_id and s.student_id=@student_id
		and c.course_id = @course_id
		if @final_Res is not null
		begin
			print @final_Res
			--update course_student 
			--set final_result = @final_Res
			--where student_id = @student_id
			commit tran
		end
		else
		begin
			raiserror('data not correct',16,10);
			rollback tran
		end
	end try
	begin catch
		select ERROR_MESSAGE() as 'Error Message';
		rollback tran
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[countExamResultForStudent]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[countExamResultForStudent] @student_id int,@exam_id int
as
begin	
	declare @index int=1;
	declare @lastIndex int=(select count(*) from question_exam where exam_id = @exam_id);
	declare @question int;
	declare @degree int;
	declare @total int=0;
	declare @answer nvarchar(max);
	declare @answer_std nvarchar(max);
	while  @index<=@lastIndex
	begin
		WITH cte AS ( SELECT   qe.question_id,qe.question_degree,sqe.student_answer,ROW_NUMBER()
				   OVER( order BY qe.exam_id) AS ROW_NUM 
				FROM question_exam qe,student_question_exam sqe
				where qe.exam_id = sqe.exam_id and qe.exam_id = @exam_id and sqe.student_id=@student_id) 
		SELECT @question = question_id,@degree=question_degree,@answer_std=student_answer
		FROM    cte WHERE   ROW_NUM = @index;
		select @answer=model_answer from question_pool where question_id=@question;
		if(@answer=@answer_std)
		begin
			set @total = @total+@degree
		end
	end
	if(@total>0)
	begin 
		update instructor_student_exam 
		set exam_result = @total
		where student_id = @student_id and exam_id = @exam_id
	end

end
GO
/****** Object:  StoredProcedure [dbo].[CreatedExam]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CreatedExam]  @examID int
as 
begin
	select * from [dbo].[Exam_Content_Details] 
	where [Exam ID] = @examID
end
GO
/****** Object:  StoredProcedure [dbo].[differenitalbackup]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--###########################################
create proc [dbo].[differenitalbackup]
as
begin
	BACKUP DATABASE examination_sys
	TO DISK = 'examination_sys.bak'
	WITH DIFFERENTIAL;
end
GO
/****** Object:  StoredProcedure [dbo].[fullbackup]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[fullbackup] 
as
begin
	BACKUP DATABASE examination_sys
	TO DISK = 'examination_sys.bak';
end
GO
/****** Object:  StoredProcedure [dbo].[Generat_exam_manaully]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Generat_exam_manaully]  @tableType table_exam_DT  readonly,@collectionExam tableExamC readonly
as
begin
begin tran
	begin try
		declare @totalDegree int;
		declare @maxDegree int;
		declare @lastIndex int;
		declare @index int=1;
		select question_id into #collectionExam from question_pool  where course_id = (select course_id from @tableType);
		select @totalDegree=sum(question_degree),@lastIndex=count(*) from @collectionExam;
		select @maxDegree=course_maxDegree from course where course_id=(select course_id from @tableType);
		if @totalDegree = (select total_degree from @tableType)
		begin
			if @maxDegree <@totalDegree
			begin
				raiserror('total degree for exam greater than max degree of this course the exam not save and question not save',16,10);
				throw 50005,'total degree for exam greater than max degree of this course the exam not save and question not save',1;
			end
			else
			begin			
				INSERT INTO exam SELECT * FROM @tableType;
				declare @examID int = (select IDENT_CURRENT('exam'));
				declare @question int,@degree int;
				while @index <= @lastIndex
				begin
					with collectionExa as (select *,ROW_NUMBER() over(order by question_id)  as rownum from @collectionExam)
					select @question=CE.question_id,@degree=CE.question_degree from collectionExa CE where rownum = @index;
					if Exists(select question_id from #collectionExam where question_id = @question)
					begin 
						insert into question_exam values(@examID,@question,@degree);
					end
					else
					begin
						raiserror('this question not exist in this course',16,10);
						throw 50005,'this question not exist in this course',1;
					end
					set @index = @index+1;
				end
			end
			commit tran;
			drop table #collectionExam;
			exec CreatedExam @examID
		end
		else
		begin
			raiserror('total degree is not equal sum of question which you inserted it',16,10);
			throw 50005,'total degree is not equal sum of question which you inserted it',1;
		end
	end try
	begin catch
		rollback tran
		select ERROR_MESSAGE();
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[Generat_exam_random]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Generat_exam_random]  @tableType table_exam_DT  readonly,
								 @questionNo quest_type_no readonly,
								 @questionDeg quest_type_degree readonly
AS
BEGIN
begin tran
   begin try
	   declare @FT int=(select FT_no from @questionNo);
	   declare @text int=(select text_no from @questionNo);
	   declare @mcq int=(select mcq_no from @questionNo);
	   declare @FT_D int=(select FT_degree from @questionDeg);
	   declare @text_D int=(select text_degree from @questionDeg);
	   declare @mcq_D int=(select mcq_degree from @questionDeg);
	   select * into #question_pool_temp from question_pool where course_id in (16)--select course_id from @tableType);
	   declare @sumTF int,@sumTxt int,@sumMcq int;
	   select @sumTxt=COUNT(*) from #question_pool_temp where question_type='text'
	   select @sumTF=COUNT(*) from #question_pool_temp where question_type='true & false'
	   select @sumMcq=COUNT(*) from #question_pool_temp where question_type='choise'
	   declare @maxDegreeCourse int =(select course_maxDegree from course where course_id =(select course_id from @tableType));
	   if ( (@FT*@FT_D+@text*@text_D+@mcq*@mcq_D) = (select total_degree from @tableType))
	   begin
			print concat('@FT',@FT,' T' ,@sumTF)
			print concat('@text',@text , ' T',@sumTxt)
			print concat('@mcq',@mcq , ' T',@sumMcq)
			if (@sumMcq>=@mcq and @sumTF>=@FT and @sumTxt>=@text) 
			begin
			   if ((@FT*@FT_D+@text*@text_D+@mcq*@mcq_D) <=  @maxDegreeCourse)
					and (select course_maxDegree from course where course_id =(select course_id from @tableType)) is not null
				---	and (select * from #question_pool_temp) is not null
				begin
					INSERT INTO exam SELECT * FROM @tableType;
					declare @lastIndexClass int=(SELECT IDENT_CURRENT('exam'))
					declare @currentQuesId int;
					while  @FT>0
							begin
								declare @ques_id_FT int =(SELECT TOP 1 question_id FROM #question_pool_temp where question_type ='true & false' ORDER BY NewId())
								insert into dbo.question_exam values
								(
									(@lastIndexClass), 
									(@ques_id_FT), 
									(select FT_degree from @questionDeg)
								)
								delete #question_pool_temp 
								where question_id = @ques_id_FT;
								set @FT = @FT -1;
							end
					while  @text>0
							begin
								declare @ques_id_txt int =(SELECT TOP 1 question_id FROM #question_pool_temp where question_type ='text' ORDER BY NewId())
								insert into dbo.question_exam values
								(
									(@lastIndexClass), 
									(@ques_id_txt), 
									(select FT_degree from @questionDeg)
								)
								delete #question_pool_temp 
								where question_id = @ques_id_txt;
								set @text = @text-1;
							end
					while  @mcq>0
							begin
							declare @ques_id_mcq int =(SELECT TOP 1 question_id FROM #question_pool_temp where question_type ='choise' ORDER BY NewId())
								insert into dbo.question_exam values
								(
									(@lastIndexClass), 
									(@ques_id_mcq), 
									(select FT_degree from @questionDeg)
								)
								delete #question_pool_temp 
								where question_id = @ques_id_mcq;
								set @mcq = @mcq-1;
							end
					commit ;
					exec CreatedExam @lastIndexClass;
				end
				else
				begin
					rollback
					RAISERROR('The Total Degree For This Exam Exceed Max Degree For This Course',16,10);
				end
			end
			else
			begin
				RAISERROR('The Number Of Question Error',16,10);
			end
		end
		else
		begin
				RAISERROR('sum of degree of question less than total degree',16,10);			
		end 
	end try
	begin catch
		rollback 
		select ERROR_MESSAGE() as 'ERROR MESSAGE' ;
	end catch
END
GO
/****** Object:  StoredProcedure [dbo].[logbackup]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--###########################################
create proc [dbo].[logbackup]
as
begin
	BACKUP LOG [examination_sys] TO DISK =  'examination_sys.bak';  
end
GO
/****** Object:  StoredProcedure [dbo].[Proc_Course_Exams]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Proc_Course_Exams] @St_id int , @Crs_id int 
as
begin
	declare @st_Crs_E int =(select exam_id  
							from instructor_student_exam , course 
							where student_id  = @St_id AND course_id = @Crs_id AND done=1 )
	
	if  Exists (select student_id from course_student where student_id =@St_id AND course_id = @Crs_id) 
		begin 
		    if exists(select @st_Crs_E)
				begin
					select [Course Name] , [Exam ID] , [Questions] , [Student Answer] , [Model Answer] , exam_result 'Exam Rsult' , final_result 'Course Final Result'
					from [dbo].[Student_Exams] , instructor_student_exam , course_student c
					where exam_id = [Exam ID] And c.course_id = @Crs_id
					And c.student_id = @St_id
				end
			Else 
				raiserror('You not attended any Exam In this Course yet ',16,10); 
		end
	else 
	    raiserror('YOu Not Attend in Course You Entered ',16,10);
end
GO
/****** Object:  StoredProcedure [dbo].[Show_student_courses]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Show_student_courses] @id int,@name varchar(50)
as
begin try
	if exists(select * from student where student_id = @id and student_name =@name)
	begin
		select  s.student_name,c.course_name,ct.final_result
		from course c,student s,course_student ct
		where ct.student_id =s.student_id 
		and c.course_id = ct.course_id
		and s.student_id =@id
		and s.student_name =@name
	end
	else
		raiserror('not exist data for this id and name',16,10);
end try
begin catch
		select ERROR_MESSAGE() as 'ERROR MESSAGE';
end catch
GO
/****** Object:  StoredProcedure [dbo].[showExamToAnswer]    Script Date: 6/5/2022 12:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showExamToAnswer] @student_id int ,@exam_id int ,@course_id int
as
begin
	declare @Stime time,@Etime time,@Dexam date;
	select @Stime=e.exam_startTime,@Etime=e.exam_endTime,@Dexam=e.exam_date
	from exam e, course c,instructor_student_exam ise
	where e.course_id = c.course_id and ise.exam_id=e.exam_id
	and ise.student_id = 1 and ise.exam_id = 10 and  c.course_id = 4
	if @Stime is  null and @Etime is  null and @Dexam is null
	begin
		raiserror('exam not exist',16,10)
	end
	else
	begin
		if @Dexam < GETDATE()
		begin 
			select E.* from exam E where E.exam_id = @exam_id;
		end 
		else if @Dexam > GETDATE()
		begin
			select 'not allow ';
		end
		else if @Dexam = GETDATE() and @Stime > convert(varchar, getdate(), 8)
		begin
			select CONCAT('the exam will start in ',@Stime)
		end 
		else if  @Dexam = GETDATE() and @Stime < convert(varchar, getdate(), 8) and convert(varchar, getdate(), 8) < @Etime
		begin
			select ecd.[Exam Questions],ecd.[Exam Type],ecd.[Question Degree],ecd.[Question Type] from Exam_Content_Details ecd where [Exam ID] = 10;
		end
		else if  @Dexam = GETDATE() and  convert(varchar, getdate(), 8) > @Etime
		begin
			select 'time out for this exam';
		end
	end
end





GO
USE [master]
GO
ALTER DATABASE [examination_sys] SET  READ_WRITE 
GO
