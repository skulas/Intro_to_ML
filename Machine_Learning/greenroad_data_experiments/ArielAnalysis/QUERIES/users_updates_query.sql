/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ApplicationId]
      ,[UserId]
      ,[UserName]
      ,[LoweredUserName]
      ,[MobileAlias]
      ,[IsAnonymous]
      ,[LastActivityDate]
  FROM [SafetyCenter2].[dbo].[aspnet_Users]

  Where UserName like '%Musicant%' 


  select * from userlastdata where username like '%Musicant%' 

  select * from users_shadow where id = 266573 order by 1 desc