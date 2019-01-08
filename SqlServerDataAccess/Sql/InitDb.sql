﻿CREATE SCHEMA Chatter;
GO

CREATE TABLE [Chatter].[User]
(
	Id					INT IDENTITY(1,1) NOT NULL,
	Username			VARCHAR(25) NOT NULL,
	CreateUserId		INT NULL,
	CreateDate			DATETIME2 NOT NULL,
	PasswordHash		NVARCHAR(64) NOT NULL,
	Email				NVARCHAR(100) NOT NULL,
	VerificationCode	NVARCHAR(16) NOT NULL,
	VerificationDate	DATETIME2 NULL,
	UpdateUserId		INT NULL,
	UpdateDate			DATETIME2 NULL,

	CONSTRAINT User_Pk PRIMARY KEY CLUSTERED (Id),

	CONSTRAINT User_FK1 FOREIGN KEY (CreateUserId)
		REFERENCES [Chatter].[User].[Id],

	CONSTRAINT User_FK2 FOREIGN KEY (UpdateUserId)
		REFERENCES [Chatter].[User].[Id]
);

CREATE TABLE [Chatter].[Post]
(
	Id				INT IDENTITY(1,1) NOT NULL,
	PostText		NVARCHAR(160) NOT NULL,
	CreateUserId	INT NULL,
	CreateDate		DATETIME2 NOT NULL,
	UpdateUserId	INT NOT NULL,
	UpdateDate		DATETIME2 NULL,

	CONSTRAINT Post_Pk PRIMARY KEY CLUSTERED (Id),

	CONSTRAINT Post_FK1 FOREIGN KEY (CreateUserId)
		REFERENCES [Chatter].[User].[Id],

	CONSTRAINT Post_FK2 FOREIGN KEY (UpdateUserId)
		REFERENCES [Chatter].[User].[Id]
);
