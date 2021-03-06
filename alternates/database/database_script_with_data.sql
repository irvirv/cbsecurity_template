USE [demoapp]
GO
/****** Object:  User [cf_demo_test]    Script Date: 5/29/2020 8:48:16 PM ******/
CREATE USER [cf_demo_test] FOR LOGIN [cf_demo_test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [cf_demo_test]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [cf_demo_test]
GO
/****** Object:  Schema [AppUser]    Script Date: 5/29/2020 8:48:16 PM ******/
CREATE SCHEMA [AppUser]
GO
/****** Object:  Table [AppUser].[tbl_user]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser].[tbl_user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[email] [varchar](60) NULL,
	[AddDate] [smalldatetime] NULL,
	[recMail] [tinyint] NOT NULL,
	[recPartnerMail] [tinyint] NOT NULL,
	[Phone] [varchar](20) NULL,
	[IsActive] [tinyint] NOT NULL,
	[ActiveThru] [date] NULL,
	[IsPaying] [tinyint] NOT NULL,
	[SetUp] [tinyint] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [char](60) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppUser].[tbl_role]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser].[tbl_role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
	[roleDescription] [varchar](500) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppUser].[tbl_permission]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser].[tbl_permission](
	[permissionID] [int] IDENTITY(1,1) NOT NULL,
	[permissionName] [varchar](50) NOT NULL,
	[permissionDescription] [varchar](500) NULL,
 CONSTRAINT [PK_Permission_1] PRIMARY KEY CLUSTERED 
(
	[permissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppUser].[tbl_role_permission]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser].[tbl_role_permission](
	[roleID] [int] NOT NULL,
	[permissionID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_role_permission] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC,
	[permissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AppUser].[tbl_user_role]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AppUser].[tbl_user_role](
	[userID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_user_role] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [AppUser].[v_User]    Script Date: 5/29/2020 8:48:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AppUser].[v_User]
AS


			SELECT U.[ID], U.[firstname], U.[lastname], U.[username], R.[roleName], R.[roleDescription], P.[permissionName], P.[permissionDescription], U.[password]
            FROM AppUser.tbl_user U INNER JOIN 
                AppUser.tbl_user_role UR ON UR.userID = U.ID INNER JOIN 
                AppUser.tbl_role R ON R.roleID = UR.roleID INNER JOIN 
                AppUser.tbl_role_permission RP ON RP.roleID = R.roleID INNER JOIN 
                AppUser.tbl_permission P ON P.permissionID = RP.permissionID



GO
SET IDENTITY_INSERT [AppUser].[tbl_permission] ON 

INSERT [AppUser].[tbl_permission] ([permissionID], [permissionName], [permissionDescription]) VALUES (1, N'view', N'view test results')
INSERT [AppUser].[tbl_permission] ([permissionID], [permissionName], [permissionDescription]) VALUES (2, N'update', N'update test results')
INSERT [AppUser].[tbl_permission] ([permissionID], [permissionName], [permissionDescription]) VALUES (3, N'create', N'create test results')
INSERT [AppUser].[tbl_permission] ([permissionID], [permissionName], [permissionDescription]) VALUES (4, N'admin', N'app administrative stuff')
SET IDENTITY_INSERT [AppUser].[tbl_permission] OFF
GO
SET IDENTITY_INSERT [AppUser].[tbl_role] ON 

INSERT [AppUser].[tbl_role] ([roleID], [roleName], [roleDescription]) VALUES (1, N'student', N'student')
INSERT [AppUser].[tbl_role] ([roleID], [roleName], [roleDescription]) VALUES (2, N'professor', N'professor')
INSERT [AppUser].[tbl_role] ([roleID], [roleName], [roleDescription]) VALUES (3, N'tech', N'tech support')
SET IDENTITY_INSERT [AppUser].[tbl_role] OFF
GO
INSERT [AppUser].[tbl_role_permission] ([roleID], [permissionID]) VALUES (1, 1)
INSERT [AppUser].[tbl_role_permission] ([roleID], [permissionID]) VALUES (2, 1)
INSERT [AppUser].[tbl_role_permission] ([roleID], [permissionID]) VALUES (2, 2)
INSERT [AppUser].[tbl_role_permission] ([roleID], [permissionID]) VALUES (2, 3)
INSERT [AppUser].[tbl_role_permission] ([roleID], [permissionID]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [AppUser].[tbl_user] ON 

INSERT [AppUser].[tbl_user] ([ID], [firstName], [lastName], [email], [AddDate], [recMail], [recPartnerMail], [Phone], [IsActive], [ActiveThru], [IsPaying], [SetUp], [username], [password]) VALUES (1, N'Joe', N'Student', NULL, CAST(N'2020-05-29T18:27:00' AS SmallDateTime), 1, 0, NULL, 1, CAST(N'2020-12-31' AS Date), 0, 0, N'joe_student', N'$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6')
INSERT [AppUser].[tbl_user] ([ID], [firstName], [lastName], [email], [AddDate], [recMail], [recPartnerMail], [Phone], [IsActive], [ActiveThru], [IsPaying], [SetUp], [username], [password]) VALUES (2, N'Sally', N'Professor', NULL, CAST(N'2020-05-29T18:27:00' AS SmallDateTime), 1, 0, NULL, 1, CAST(N'2020-12-31' AS Date), 0, 0, N'sally_prof', N'$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6')
INSERT [AppUser].[tbl_user] ([ID], [firstName], [lastName], [email], [AddDate], [recMail], [recPartnerMail], [Phone], [IsActive], [ActiveThru], [IsPaying], [SetUp], [username], [password]) VALUES (3, N'Billy', N'Tech Support', NULL, CAST(N'2020-05-29T18:28:00' AS SmallDateTime), 1, 0, NULL, 1, CAST(N'2020-12-31' AS Date), 0, 0, N'billy_tech', N'$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6')
INSERT [AppUser].[tbl_user] ([ID], [firstName], [lastName], [email], [AddDate], [recMail], [recPartnerMail], [Phone], [IsActive], [ActiveThru], [IsPaying], [SetUp], [username], [password]) VALUES (4, N'Jane', N'Super Admin', NULL, CAST(N'2020-05-29T18:28:00' AS SmallDateTime), 1, 0, NULL, 1, CAST(N'2020-12-31' AS Date), 0, 0, N'jane_admin', N'$2a$12$JiNfnCEN5To7guayPM8kyum7gdqC0qvYZioYknppuYxkXmPPVnUM6')
SET IDENTITY_INSERT [AppUser].[tbl_user] OFF
GO
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (1, 1)
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (2, 2)
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (3, 3)
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (4, 1)
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (4, 2)
INSERT [AppUser].[tbl_user_role] ([userID], [roleID]) VALUES (4, 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_user]    Script Date: 5/29/2020 8:48:16 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_user] ON [AppUser].[tbl_user]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_recMail]  DEFAULT ((1)) FOR [recMail]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_recPartnerMail]  DEFAULT ((0)) FOR [recPartnerMail]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_ActiveThru]  DEFAULT ('2020-12-31') FOR [ActiveThru]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_IsPaying]  DEFAULT ((0)) FOR [IsPaying]
GO
ALTER TABLE [AppUser].[tbl_user] ADD  CONSTRAINT [DF_user_SetUp]  DEFAULT ((0)) FOR [SetUp]
GO
ALTER TABLE [AppUser].[tbl_role_permission]  WITH CHECK ADD  CONSTRAINT [FK_tbl_role_permission_tbl_permission] FOREIGN KEY([permissionID])
REFERENCES [AppUser].[tbl_permission] ([permissionID])
GO
ALTER TABLE [AppUser].[tbl_role_permission] CHECK CONSTRAINT [FK_tbl_role_permission_tbl_permission]
GO
ALTER TABLE [AppUser].[tbl_role_permission]  WITH CHECK ADD  CONSTRAINT [FK_tbl_role_permission_tbl_role] FOREIGN KEY([roleID])
REFERENCES [AppUser].[tbl_role] ([roleID])
GO
ALTER TABLE [AppUser].[tbl_role_permission] CHECK CONSTRAINT [FK_tbl_role_permission_tbl_role]
GO
ALTER TABLE [AppUser].[tbl_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_role_tbl_role] FOREIGN KEY([roleID])
REFERENCES [AppUser].[tbl_role] ([roleID])
GO
ALTER TABLE [AppUser].[tbl_user_role] CHECK CONSTRAINT [FK_tbl_user_role_tbl_role]
GO
ALTER TABLE [AppUser].[tbl_user_role]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_role_tbl_user] FOREIGN KEY([userID])
REFERENCES [AppUser].[tbl_user] ([ID])
GO
ALTER TABLE [AppUser].[tbl_user_role] CHECK CONSTRAINT [FK_tbl_user_role_tbl_user]
GO
