/****** Object:  Table [dbo].[comments]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comments](
	[comment] [varchar](max) NULL,
	[commentBy] [varchar](255) NULL,
	[commentDate] [datetime] NULL,
	[idHistory] [int] NOT NULL,
	[state] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[config]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[config](
	[config] [text] NULL,
	[datetime] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_config] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dataCache]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataCache](
	[hash] [nvarchar](32) NULL,
	[id] [int] NULL,
	[dateTime] [datetime] NULL,
	[cacheData] [image] NULL,
	[caller] [nvarchar](50) NULL,
	[isString] [nvarchar](4) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[errorLog]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[errorLog](
	[datetime] [datetime] NOT NULL,
	[message] [varchar](max) NOT NULL,
	[detail] [varchar](max) NOT NULL,
	[error] [image] NOT NULL,
	[cgi] [image] NOT NULL,
	[hash] [char](32) NOT NULL,
 CONSTRAINT [PK_errorLog] PRIMARY KEY CLUSTERED 
(
	[datetime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[globalMaster]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[globalMaster](
	[idShortcut] [int] NULL,
	[shortcutType] [int] NULL,
	[shortcutExternal] [varchar](1000) NULL,
	[state] [varchar](50) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visible] [varchar](5) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [varchar](100) NOT NULL,
	[deleted] [varchar](5) NOT NULL,
	[locked] [varchar](5) NULL,
	[lockedBy] [varchar](100) NULL,
	[lockedDate] [datetime] NULL,
	[idHistory] [int] NULL,
	[idParent] [int] NULL,
	[securityGroup] [nvarchar](50) NOT NULL,
	[quicklink] [varchar](5) NULL,
	[app] [varchar](150) NULL,
	[gModifiedBy] [varchar](100) NULL,
	[gModifiedDate] [datetime] NULL,
	[sortIndex] [int] NULL,
	[template] [varchar](255) NULL,
	[owner] [varchar](100) NULL,
	[reviewedBy] [varchar](100) NULL,
	[reviewedDate] [datetime] NULL,
	[SSL] [varchar](5) NULL,
 CONSTRAINT [PK_globalMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[globalMasterHistory]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[globalMasterHistory](
	[idHistory] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NOT NULL,
	[state] [varchar](50) NULL,
	[modifiedBy] [varchar](100) NOT NULL,
	[modifiedDate] [datetime] NOT NULL,
	[title] [varchar](75) NOT NULL,
	[info] [text] NOT NULL,
	[editSession] [varchar](50) NULL,
	[usedDate] [datetime] NULL,
	[menu] [varchar](75) NULL,
	[url] [varchar](75) NULL,
	[urlHash] [varchar](max) NULL,
	[apps] [varchar](max) NULL,
	[appsDisplay] [varchar](6) NULL,
 CONSTRAINT [PK_globalMasterHistory_1] PRIMARY KEY CLUSTERED 
(
	[idHistory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[iCache]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iCache](
	[hash] [nvarchar](255) NOT NULL,
	[sourcePath] [nvarchar](255) NULL,
	[dateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_iCache_1] PRIMARY KEY CLUSTERED 
(
	[hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lockout]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lockout](
	[login] [nvarchar](50) NOT NULL,
	[loginAttempts] [int] NOT NULL,
	[unlockHash] [nchar](32) NULL,
 CONSTRAINT [PK_lockout] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loginHistory]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[loginHistory](
	[mail] [nvarchar](255) NULL,
	[dateTime] [datetime] NULL,
	[action] [nvarchar](255) NULL,
	[errorCode] [int] NULL,
	[remote_addr] [varchar](255) NULL,
	[remote_host] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pageAction]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pageAction](
	[action] [varchar](255) NULL,
	[actionBy] [varchar](255) NULL,
	[actionDate] [datetime] NULL,
	[idHistory] [int] NOT NULL,
	[actionInfo] [varchar](255) NULL,
	[actionId] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
 CONSTRAINT [PK_pageAction] PRIMARY KEY CLUSTERED 
(
	[actionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pageMoveLog]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pageMoveLog](
	[datetime] [datetime] NOT NULL,
	[movedBy] [varchar](100) NULL,
	[id] [int] NOT NULL,
	[oldParent] [int] NOT NULL,
	[newParent] [int] NOT NULL,
	[sortIndex] [int] NULL,
 CONSTRAINT [PK_pageMoveLog] PRIMARY KEY CLUSTERED 
(
	[datetime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[redirectsMaster]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[redirectsMaster](
	[id] [int] NOT NULL,
	[url] [nvarchar](max) NULL,
	[redirectToUrl] [nvarchar](max) NULL,
	[MD5] [char](32) NOT NULL,
	[redirect] [nvarchar](max) NULL,
	[redirectType] [nvarchar](20) NULL,
	[usedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [nvarchar](255) NULL,
	[modifiedDate] [datetime] NULL,
	[modifiedBy] [nvarchar](255) NULL,
	[deleted] [nvarchar](50) NULL,
	[idHistory] [int] NOT NULL,
	[redirectId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[redirectTypes]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[redirectTypes](
	[redirectType] [nvarchar](20) NOT NULL,
	[redirectDesc] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_redirectTypes] PRIMARY KEY CLUSTERED 
(
	[redirectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGroup]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup](
	[GroupName] [nvarchar](50) NOT NULL,
	[GroupDesc] [nvarchar](200) NULL,
	[active] [nvarchar](50) NULL,
	[OwnerMail] [nvarchar](255) NULL,
	[securityLevel] [int] NULL,
	[type] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGroupMember]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroupMember](
	[GroupName] [nvarchar](50) NOT NULL,
	[PersonID] [int] NULL,
	[login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblGroupMember] PRIMARY KEY CLUSTERED 
(
	[login] ASC,
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[templates]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[templates](
	[templateName] [varchar](255) NULL,
	[templateDesc] [varchar](max) NULL,
	[cfcName] [varchar](255) NOT NULL,
	[author] [varchar](255) NULL,
	[disabled] [varchar](5) NULL,
	[tinyMCEWidth] [int] NULL,
	[tinyMCEStyleSheet] [varchar](max) NULL,
 CONSTRAINT [PK_templates_1] PRIMARY KEY CLUSTERED 
(
	[cfcName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[userActivity]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userActivity](
	[mail] [nvarchar](255) NULL,
	[lastAction] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userSettings]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userSettings](
	[login] [varchar](255) NOT NULL,
	[data] [varchar](max) NOT NULL,
	[lastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_userSettings] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[siteHistory]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[siteHistory]
AS
SELECT     TOP (100) PERCENT dbo.globalMasterHistory.id, dbo.globalMaster.idParent, dbo.globalMasterHistory.idHistory, dbo.globalMaster.securityGroup, 
                      dbo.globalMasterHistory.title, dbo.globalMasterHistory.info, dbo.globalMaster.visible, dbo.globalMasterHistory.modifiedDate, dbo.globalMasterHistory.modifiedBy, 
                      dbo.globalMaster.createdDate, dbo.globalMaster.createdBy, dbo.globalMaster.deleted, dbo.globalMaster.locked, dbo.globalMaster.lockedBy, 
                      dbo.globalMaster.lockedDate, dbo.globalMaster.idShortcut, dbo.globalMaster.shortcutType, dbo.globalMaster.shortcutExternal, dbo.globalMaster.quicklink, 
                      dbo.globalMaster.app, dbo.globalMaster.gModifiedBy, dbo.globalMaster.gModifiedDate, dbo.globalMasterHistory.editSession, dbo.globalMasterHistory.state, 
                      dbo.globalMasterHistory.usedDate, dbo.globalMaster.sortIndex, dbo.globalMasterHistory.menu, dbo.globalMasterHistory.url, dbo.globalMaster.template,
                          (SELECT     TOP (1) actionDate
                            FROM          dbo.pageAction
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'pending') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS submittedDate,
                          (SELECT     TOP (1) actionBy
                            FROM          dbo.pageAction AS pageAction_1
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'pending') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS submittedBy,
                          (SELECT     TOP (1) actionDate
                            FROM          dbo.pageAction AS pageAction_2
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'approved') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS approvedDate,
                          (SELECT     TOP (1) actionBy
                            FROM          dbo.pageAction AS pageAction_1
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'approved') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS approvedBy, dbo.globalMaster.owner, dbo.globalMaster.SSL, dbo.globalMasterHistory.apps, 
                      dbo.globalMasterHistory.appsDisplay
FROM         dbo.globalMasterHistory INNER JOIN
                      dbo.globalMaster ON dbo.globalMasterHistory.id = dbo.globalMaster.id
ORDER BY dbo.globalMasterHistory.modifiedDate DESC
GO
/****** Object:  View [dbo].[siteAdmin]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[siteAdmin]
AS
SELECT     dbo.globalMaster.id, dbo.globalMaster.idParent, dbo.globalMaster.idHistory, dbo.globalMaster.securityGroup, dbo.globalMasterHistory.title, 
                      dbo.globalMasterHistory.info, dbo.globalMaster.visible, dbo.globalMasterHistory.modifiedDate, dbo.globalMasterHistory.modifiedBy, 
                      dbo.globalMaster.createdDate, dbo.globalMaster.createdBy, dbo.globalMaster.deleted, dbo.globalMaster.quicklink, dbo.globalMaster.app, 
                      dbo.globalMaster.gModifiedBy, dbo.globalMaster.gModifiedDate, dbo.globalMasterHistory.editSession, dbo.globalMaster.locked, 
                      dbo.globalMaster.lockedBy, dbo.globalMaster.lockedDate, dbo.globalMaster.state,
                          (SELECT     TOP (1) idHistory
                            FROM          dbo.siteHistory
                            WHERE      (id = dbo.globalMaster.id) AND (state <> 'preview')
                            ORDER BY usedDate DESC) AS idHistoryDraft,
                          (SELECT     TOP (1) title
                            FROM          dbo.siteHistory AS siteHistory_1
                            WHERE      (id = dbo.globalMaster.id) AND (state <> 'preview')
                            ORDER BY usedDate DESC) AS titleDraft,
                          (SELECT     TOP (1) actionDate
                            FROM          dbo.pageAction
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'pending') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS submittedDate,
                          (SELECT     TOP (1) actionBy
                            FROM          dbo.pageAction AS pageAction_1
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'pending') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS submittedBy, dbo.globalMaster.sortIndex, dbo.globalMasterHistory.menu, dbo.globalMasterHistory.url,
                          (SELECT     TOP (1) actionDate
                            FROM          dbo.pageAction AS pageAction_2
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'approved') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS approvedDate,
                          (SELECT     TOP (1) actionBy
                            FROM          dbo.pageAction AS pageAction_1
                            WHERE      (id = dbo.globalMaster.id) AND (action = 'approved') AND (idHistory <= dbo.globalMaster.idHistory)
                            ORDER BY actionId DESC) AS approvedBy, dbo.globalMasterHistory.urlHash, dbo.globalMaster.template, dbo.globalMaster.owner, 
                      dbo.globalMaster.reviewedBy, dbo.globalMaster.reviewedDate, dbo.globalMaster.SSL
FROM         dbo.globalMaster INNER JOIN
                      dbo.globalMasterHistory ON dbo.globalMaster.idHistory = dbo.globalMasterHistory.idHistory
GO
/****** Object:  View [dbo].[sitePublic]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[sitePublic]
AS
SELECT        id, idParent, securityGroup, title, info, visible, modifiedDate, modifiedBy, createdDate, createdBy, deleted, quicklink, app, gModifiedBy, gModifiedDate, submittedBy, submittedDate, sortIndex, menu, url, urlHash, 
                         template, owner, approvedBy, approvedDate, reviewedBy, reviewedDate, SSL, idHistory
FROM            dbo.siteAdmin
WHERE        (visible = 'T') AND (deleted = 'F') AND (approvedBy IS NOT NULL) AND (LOWER(title) <> '_slides')
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_globalMasterHistory] FOREIGN KEY([idHistory])
REFERENCES [dbo].[globalMasterHistory] ([idHistory])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_globalMasterHistory]
GO
ALTER TABLE [dbo].[globalMaster]  WITH CHECK ADD  CONSTRAINT [FK_globalMaster_tblGroup] FOREIGN KEY([securityGroup])
REFERENCES [dbo].[tblGroup] ([GroupName])
GO
ALTER TABLE [dbo].[globalMaster] CHECK CONSTRAINT [FK_globalMaster_tblGroup]
GO
ALTER TABLE [dbo].[globalMaster]  WITH CHECK ADD  CONSTRAINT [FK_globalMaster_templates] FOREIGN KEY([template])
REFERENCES [dbo].[templates] ([cfcName])
GO
ALTER TABLE [dbo].[globalMaster] CHECK CONSTRAINT [FK_globalMaster_templates]
GO
ALTER TABLE [dbo].[globalMasterHistory]  WITH CHECK ADD  CONSTRAINT [FK_globalMasterHistory_globalMaster] FOREIGN KEY([id])
REFERENCES [dbo].[globalMaster] ([id])
GO
ALTER TABLE [dbo].[globalMasterHistory] CHECK CONSTRAINT [FK_globalMasterHistory_globalMaster]
GO
ALTER TABLE [dbo].[pageAction]  WITH CHECK ADD  CONSTRAINT [FK_approval_globalMasterHistory] FOREIGN KEY([idHistory])
REFERENCES [dbo].[globalMasterHistory] ([idHistory])
GO
ALTER TABLE [dbo].[pageAction] CHECK CONSTRAINT [FK_approval_globalMasterHistory]
GO
ALTER TABLE [dbo].[pageMoveLog]  WITH CHECK ADD  CONSTRAINT [FK_pageMoveLog_globalMaster] FOREIGN KEY([id])
REFERENCES [dbo].[globalMaster] ([id])
GO
ALTER TABLE [dbo].[pageMoveLog] CHECK CONSTRAINT [FK_pageMoveLog_globalMaster]
GO
ALTER TABLE [dbo].[redirectsMaster]  WITH CHECK ADD  CONSTRAINT [FK_redirects_redirectTypes] FOREIGN KEY([redirectType])
REFERENCES [dbo].[redirectTypes] ([redirectType])
GO
ALTER TABLE [dbo].[redirectsMaster] CHECK CONSTRAINT [FK_redirects_redirectTypes]
GO
ALTER TABLE [dbo].[tblGroupMember]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupMember_tblGroup] FOREIGN KEY([GroupName])
REFERENCES [dbo].[tblGroup] ([GroupName])
GO
ALTER TABLE [dbo].[tblGroupMember] CHECK CONSTRAINT [FK_tblGroupMember_tblGroup]
GO
/****** Object:  StoredProcedure [dbo].[getBreadcrumbs]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<William Eatman>
-- Create date: <10-15-2008>
-- Description:	<get the breadcrumbs for a page id>
-- =============================================
CREATE PROCEDURE [dbo].[getBreadcrumbs]
	-- Add the parameters for the stored procedure here
	@ID int = -1,
	@public bit = 'true'
AS
BEGIN

DECLARE @view varchar(30)

-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

IF @public = 'true'
	BEGIN
		WITH PagesList (id, idparent, menu, mylevel)
		AS
		(
			-- Anchor member definition
			SELECT id, idparent, menu, (0) as mylevel FROM sitePublic WHERE id=@ID
			UNION ALL

			-- Recursive member definition
			SELECT c.id, c.idparent, c.menu, p.mylevel + 1 From sitePublic as c
			INNER JOIN PagesList as p
			ON c.id = p.idparent
		)
		-- Statement that executes the CTE
		SELECT id, idParent, menu FROM PagesList ORDER BY mylevel DESC
	END
ELSE
	BEGIN
		WITH PagesList (id, idparent, menu, mylevel)
		AS
		(
			-- Anchor member definition
			SELECT id, idparent, menu, (0) as mylevel FROM siteAdmin WHERE id=@ID
			UNION ALL

			-- Recursive member definition
			SELECT c.id, c.idparent, c.menu, p.mylevel + 1 From siteAdmin as c
			INNER JOIN PagesList as p
			ON c.id = p.idparent
		)
		-- Statement that executes the CTE
		SELECT id, idParent, menu FROM PagesList ORDER BY mylevel DESC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[getChildren]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<William Eatman>
-- Create date: <10-15-2008>
-- Description:	<get children pages by parent page id>
-- =============================================
CREATE PROCEDURE [dbo].[getChildren]
	-- Add the parameters for the stored procedure here
	@id int,				-- Parent ID
	@summary bit = 'true',	-- true for (id, idParent, menu, count, visible). False for * (good for getting custom info)
	@public bit = 'true',	-- true for all public pages, false for ALL pages (hidden, deleted, etc)
	@menuOrder bit = 'true'-- true for children ordered by menu
AS
BEGIN
	

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @menuOrder = 'true'
		begin	
		if @public = 'false'
			begin
			if @summary = 'false'
				begin
				SELECT *, (select count(*) from siteAdmin as SP2 where SP2.idParent = SP.id) as childCount FROM siteAdmin as SP WHERE idParent=@id Order By menu
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from siteAdmin as SP2 where SP2.idParent = SP.id) as childCount, visible FROM siteAdmin as SP WHERE idParent=@id Order By menu
				end
			end
		else
			begin
			if @summary = 'false'		
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM sitePublic as SP WHERE idParent=@id Order By menu
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM sitePublic as SP WHERE idParent=@id Order By menu
				end
			end
		end
	else
		begin	
		if @public = 'false'
			begin
			if @summary = 'false'
				begin
				SELECT *, (select count(*) from siteAdmin as SP2 where SP2.idParent = SP.id) as childCount FROM siteAdmin as SP WHERE idParent=@id Order By sortIndex
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from siteAdmin as SP2 where SP2.idParent = SP.id) as childCount, visible FROM siteAdmin as SP WHERE idParent=@id Order By sortIndex
				end
			end
		else
			begin
			if @summary = 'false'		
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM sitePublic as SP WHERE idParent=@id Order By sortIndex
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM sitePublic as SP WHERE idParent=@id Order By sortIndex
				end
			end
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[getFileDirectory]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getFileDirectory] 
	-- Add the parameters for the stored procedure here
	@dirId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* select * from fileDir */

	WITH dirList2(dirId, dirIdParent, directoryName, mylevel)
	AS
	(
		-- Anchor member definition
		SELECT dirId, dirIdParent, directoryName, (0) as mylevel FROM fileDir WHERE dirId = @dirId
		UNION ALL
		-- Recursive member definition
		SELECT c.dirId, c.dirIdParent, c.directoryName, p.mylevel + 1 From fileDir as c
		INNER JOIN DirList2 as p
		ON c.dirId = p.dirIdParent
	) 
	SELECT dirId, dirIdParent, directoryName, mylevel from dirList2

    -- Insert statements for procedure here
END
GO
/****** Object:  StoredProcedure [dbo].[getPage]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Andy Warner>
-- Create date: <5-6-2008>
-- Description:	<get a certain page by id>
-- =============================================
CREATE PROCEDURE [dbo].[getPage] 
	-- Add the parameters for the stored procedure here
	@id int,
	@public bit = 'true'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @public = 'true'
		BEGIN
		-- Insert statements for procedure here
		SELECT * FROM sitePublic WHERE id=@id
		END
	ELSE
		BEGIN
		-- Insert statements for procedure here
		SELECT * FROM siteAdmin WHERE id=@id
		END
END
GO
/****** Object:  StoredProcedure [dbo].[getPeers]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<William Eatman>
-- Create date: <10-15-2008>
-- Description:	<get peer pages by page id, NOTE: Also returns the passed page id>
-- =============================================
CREATE PROCEDURE [dbo].[getPeers]
	-- Add the parameters for the stored procedure here
	@id int,				-- Parent ID
	@summary bit = 'true',	-- true for (id, idParent, title, count, visible). False for * (good for getting custom info)
	@public bit = 'true',	-- true for all public pages, false for ALL pages (hidden, deleted, etc)
	@menuOrder bit = 'true'-- true for children ordered by menu
AS
BEGIN
	

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @menuOrder = 'true'
		begin
		if @public = 'false'
			begin
			if @summary = 'false'
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM siteAdmin as SP WHERE idParent = (SELECT idParent from siteAdmin where id = @id) Order By menu
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM siteAdmin as SP WHERE idParent = (SELECT idParent from siteAdmin where id = @id) Order By menu
				end
			end
		else
			begin
			if @summary = 'false'		
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM sitePublic as SP WHERE idParent=(SELECT idParent from sitePublic where id = @id) Order By menu
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM sitePublic as SP WHERE idParent=(SELECT idParent from sitePublic where id = @id) Order By menu
				end
			end
		end	
		else
		begin
			if @public = 'false'
			begin
			if @summary = 'false'
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM siteAdmin as SP WHERE idParent = (SELECT idParent from siteAdmin where id = @id) Order By sortIndex
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM siteAdmin as SP WHERE idParent = (SELECT idParent from siteAdmin where id = @id) Order By sortIndex
				end
			end
		else
			begin
			if @summary = 'false'		
				begin
				SELECT *, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount FROM sitePublic as SP WHERE idParent=(SELECT idParent from sitePublic where id = @id) Order By sortIndex
				end
			else
				begin
				SELECT id, idParent, menu, (select count(*) from sitePublic as SP2 where SP2.idParent = SP.id) as childCount, visible FROM sitePublic as SP WHERE idParent=(SELECT idParent from sitePublic where id = @id) Order By sortIndex
				end
			end
		end
END
GO
/****** Object:  StoredProcedure [dbo].[userFunctions]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andy Warner
-- Create date: 3/28/2008
-- Description:	get all the groups for the user
-- =============================================
CREATE PROCEDURE [dbo].[userFunctions] 
	-- Add the parameters for the stored procedure here
	@login nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT g.groupName, groupDesc from tblGroupMember  as gm 
	inner join tblGroup as g
	on g.groupName = gm.groupName
where @login = [login] and type = 'function'
ORDER BY groupDesc ASC
END
GO
/****** Object:  StoredProcedure [dbo].[userGroups]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andy Warner
-- Create date: 3/28/2008
-- Description:	get all the groups for the user
-- =============================================
CREATE PROCEDURE [dbo].[userGroups] 
	-- Add the parameters for the stored procedure here
	@login nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT g.groupName, groupDesc from tblGroupMember  as gm 
	inner join tblGroup as g
	on g.groupName = gm.groupName
where @login = [login] and type = 'pageGroup'
ORDER BY groupDesc ASC
END
GO
/****** Object:  StoredProcedure [dbo].[userRoles]    Script Date: 4/27/2015 4:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Andy Warner
-- Create date: 3/28/2008
-- Description:	get all the groups for the user
-- =============================================
CREATE PROCEDURE [dbo].[userRoles] 
	-- Add the parameters for the stored procedure here
	@login nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT g.groupName, groupDesc from tblGroupMember  as gm 
	inner join tblGroup as g
	on g.groupName = gm.groupName
where @login = [login] and type = 'role'
ORDER BY groupDesc ASC
END
GO
