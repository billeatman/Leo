-- Populate Leo CMS

-- Default User
declare @user varchar(100) 
SET @user = 'test@example.com'

-- Create Functions / Roles
delete from pageAction
delete from comments
DBCC CHECKIDENT ('pageAction', RESEED, 0) 
delete from globalMasterHistory
DBCC CHECKIDENT ('globalMasterHistory', RESEED, 0) 
delete from globalMaster
DBCC CHECKIDENT ('globalMaster', RESEED, 0) 
delete from templates
delete from tblGroupMember
delete from tblGroup
delete from pageMoveLog
delete from loginHistory
delete from userActivity
delete from userSettings
delete from redirectTypes
delete from redirectsMaster
delete from lockout
delete from iCache
delete from errorLog
delete from dataCache
delete from config
DBCC CHECKIDENT ('config', RESEED, 0) 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('PageAdd', 'Page Add', 'T', 'system', '0', 'function') 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('PageMove', 'Page Move', 'T', 'system', '0', 'function') 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('PageApprove', 'Page Move', 'T', 'system', '0', 'function') 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('UserMan', 'User Manager', 'T', 'system', '0', 'function') 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('Developer', 'Developer Mode', 'T', 'system', '0', 'function') 

INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('TopLevel', 'Administrator', 'T', 'system', '0', 'role') 

-- Create Default Page Group
INSERT INTO [tblGroup]
           ([GroupName],[GroupDesc],[active],[OwnerMail],[securityLevel],[type])
     VALUES
           ('default', 'default', 'T', @user, '0', 'pagegroup') 

-- Add Default User to Default Page Group and ALL FUNCTIONS and ROLES
INSERT INTO [tblGroupMember] 
			([GroupName],[login])
     SELECT [GroupName], @user as [login]
	 FROM [tblGroup]

-- Add a default template --
INSERT INTO [templates]
           ([templateName],[templateDesc],[cfcName],[author],[disabled],[tinyMCEWidth],[tinyMCEStyleSheet])
     VALUES
           ('leotest','default test template','leotest','william eatman','F','500','500')
