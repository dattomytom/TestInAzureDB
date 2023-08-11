/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
print 'Insert seed data for Users'
insert into dbo.Users 
values (NEWID(),'admin247@gmail.com','Admin','Admin',1)
print 'data in User'
declare @selectUser nvarchar(MAX)=N'';
  select @selectUser +=N'select * from dbo.Users'
  print @selectUser
EXEC sp_executesql @selectUser;