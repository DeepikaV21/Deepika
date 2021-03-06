CREATE TABLE [dbo].[BMT_User_Auth]
(
[User_Id] INT NOT NULL PRIMARY KEY,
FName VARCHAR(100)NOT NULL,
LName VARCHAR(100) NOT NULL,
Email VARCHAR(20) NOT NULL,
Category VARCHAR(10) NOT NULL,
Password VARCHAR(100) NOT NULL 
)
go

Create Table [dbo].[BMT_Tutor_Schedules](
[Slot_Id] int Not Null Primary Key IDENTITY(1,1),
[Tutor_Id] int  foreign key references [dbo].[BMT_Tutor_Details](Tutor_Id),
[Course_Type] Varchar(20) Not Null,
[Course_Id] Varchar(50) Not Null,
[SlotTiming] Varchar(10)Not Null,
[Location] varchar(100) ,
[TotalNumberOfSlots] int not null,
[RemainingSlots] int null
)

go

CREATE TABLE [dbo].[BMT_Tutor_Details]
([User_Id] int  constraint [User_Id] foreign key references BMT_User_Auth(User_id),
[Tutor_Id] int Primary Key Identity(1,1),
[Stream] varchar(50) Not Null,
[Description] Varchar(2000)Not Null,
[Location] varchar(100) NOT NULL,
[Company] Varchar(100),
[Rating] int null

)
go

CREATE TABLE [dbo].[BMT_Student_Details]
(
[Student_Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[Location] VARCHAR(100) NOT NULL,
FOREIGN KEY ([Student_Id]) REFERENCES BMT_User_Auth([User_Id]) 
)

go

CREATE TABLE [dbo].[BMT_Requests]
(
[Request_Id] INT NOT NULL PRIMARY KEY IDENTITY(101,1),
[Student_Id] INT CONSTRAINT ref_Stu_Req_id FOREIGN KEY (Student_Id)
   REFERENCES BMT_Student_Details(Student_Id),
[Tutor_Id] INT CONSTRAINT ref_Tut_Req_id FOREIGN KEY (Tutor_Id)
   REFERENCES BMT_Tutor_Details(Tutor_Id),
[Status] VARCHAR(20) NOT NULL CONSTRAINT chk_Status CHECK 
(Status IN ('REQUESTED', 'APPROVED', 'REJECTED')),
[Time_Slot] CHAR(5) NOT NULL,
[Course_Id] int CONSTRAINT ref_Course_id FOREIGN KEY (Course_Id)
   REFERENCES BMT_Course(Course_Id)

)
go

CREATE TABLE [dbo].[BMT_Course]
(
[Course_Id] INT NOT NULL PRIMARY KEY,
[Course_Name] VARCHAR(20) NOT NULL
)