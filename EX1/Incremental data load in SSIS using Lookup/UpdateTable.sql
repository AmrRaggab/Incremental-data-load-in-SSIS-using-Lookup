USE [test]
GO
declare @updated int
UPDATE a
   SET
      a.First_name =  b.First_name ,
      a.Last_name = b.Last_name ,
      a.Email = b.Email ,
      a.Gender = b.Gender
from [dbo].[Emails] as a inner join [dbo].[ZZ_Email_Updated] as b
on a.id = b.id
set @updated = @@ROWCOUNT 
insert into [dbo].[audit_log]
select 'Package.dtsx' , 'Emails' , ? , @updated , GETDATE()


truncate table Emails
truncate table ZZ_Email_Updated
truncate table audit_log


select * from [dbo].[Emails]
select * from [dbo].[audit_log]
select * from [dbo].[ZZ_Email_Updated]


