----------------------------------------------------------- VIEWS & Triggers ---------------------------------------------------------------------------------------------

----------- SAFETY TRIGGER ---------------

CREATE TRIGGER Safety
ON DATABASE
FOR DROP_TABLE,CREATE_TABLE,ALTER_TABLE
AS
	PRINT 'You are not authorized to create,drop or alter database tables'
ROLLBACK 
ENABLE TRIGGER Safety 
ON Database
go

-----------FURTHER COMMENT TRIGGER--------

CREATE TRIGGER FURTHERCOMPLAINT
ON COMPLAINT
FOR INSERT
AS
DECLARE @myComplaintID int, @myUserID int
SET @myComplaintID=(SELECT ComplaintID FROM INSERTED)
SET @myUserID=(SELECT UserID FROM COMPLAINT WHERE ComplaintID=@myComplaintID	
				AND 
				SELECT UserName FROM Users AS U JOIN COMPLAINT AS C ON U.UserName = C.UserName )
PRINT 'Your comment has received a further comment.'
go

----------- UPDATE TRIGGER ---------------
CREATE	TRIGGER TriggerForUpdate
ON		DBO.TICKETS
FOR		UPDATE
AS 

UPDATE TICKETS
SET TicketStatus = 'CANCEL & changed with for update trigger'
WHERE TicketID = 1
go 

UPDATE TICKETS
SET TicketStatus = 'Bought & changed with for update trigger'
WHERE TicketID = 4
go

-----------instead of insert TRIGGER ---------------

create TRIGGER SelectTrigger
ON  DBO.MATCHES
INSTEAD OF INSERT
AS 
SELECT * FROM MATCHES
print 'sorry this table cannot be modified'
go 

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('3rdPlayoff',1,4,1,1,'20160221 20:00:00.000 PM',25000,25000,0,'20160222 02:00:00.000 AM','3rdPlayoffAndIUWonBy50Runs')
go

SELECT * FROM MATCHES -- NO CHANGE IN THE TABLE

go

-----------DML -- NOT ALLOWING DELETE TRIGGER ---------------

alter TRIGGER [dbo].[T_MATCHES]
ON	[dbo].MATCHES
INSTEAD OF delete
AS
	IF 
		(
			SELECT COUNT(*)
			FROM MATCHES AS M
					
		) >0
		
	BEGIN
		PRINT 'CAN NOT BE DELETED'
	END

go

DELETE from MATCHES WHERE MatchID= 1
select *
From MATCHES
go

------------- DDL -- trigger for adding column  ---------------

CREATE TRIGGER [AlterTable_AddCol]
ON	DatabASE
FOR ALTER_TABLE
AS
	PRINT 'Column Added'
go 

ALTER TABLE dbo.Matches ADD  SecondBestPlayer VARCHAR(50) NOT NULL ; 		

go
SELECT * FROM dbo.MATCHES
go


------------- DDL -- trigger for not adding column  ---------------

CREATE TRIGGER [AlterTable_AddCol]
ON	DatabASE
FOR ALTER_TABLE
AS
	PRINT 'Column Added'
	ROLLBACK
go 

ALTER TABLE dbo.Matches ADD  ThirdBestPlayer VARCHAR(50) NOT NULL ; 		

go
SELECT * FROM dbo.MATCHES
go

----------- PSL sponsor info VIEW---------------
CREATE VIEW PSLSponsorInfo
AS

Select  PYR.PSLID,PYR.SponsorID
From PSLYearlyRecord AS PYR
JOIN SPONSORS AS S ON S.SponsorID =  PYR.SponsorID
WHERE PSLID = 1

go
select * from PSLSponsorInfo
go

----------- Match in a particular stadium VIEW---------------
CREATE VIEW PSLMATCHPLAYINGInfo
AS

Select M.MatchCategory,M.Team1,M.Team2,M.StadiumID,M.SponsorID,M.MatchStartsAt,M.TotalTickets,M.AvailableTickets,M.SoldTickets,M.MatchEndsAt,M.MatchDescription
From MATCHES AS M
LEFT OUTER JOIN STADIUM AS S ON M.StadiumID =  S.StadiumID
WHERE M.MatchCategory = 'Final'

go
select * from PSLMATCHPLAYINGInfo
go


----------- POINTS TABLE VIEW---------------

CREATE VIEW PointsTable
AS

SELECT  t.TeamName, p.TotalMatches, p.WonMatches, p.LostMatches, p.DrawMatches, p.TotalPoints, p.RunRate 
FROM pointtable AS p
join TEAMS AS t ON t.teamid = p.teamid
ORDER BY p.TotalPoints DESC, p.RunRate DESC

go
select * from PointsTable
go


----------- TEAM INFO VIEW---------------

CREATE  View TeamInfo
AS

SELECT * 
FROM TEAMS AS t LEFT OUTER JOIN MATCHES as M
ON t.TeamID = M.Team1
Where t.TeamID = 10

go
select * from  TeamInfo
go


----------- USER INFO VIEW---------------

CREATE View UserInfo
AS

SELECT * 
FROM USERS AS u 
RIGHT OUTER JOIN COMPLAINT AS c 
Where c.UserName = (Select u.UserName
					From Users AS U1
					Where U1.UserID = u.UserID)

go
select * from UserInfo
go

----------- BROADCAST INFO VIEW ---------------

CREATE View BroadcastInfo        
AS

SELECT * 
FROM BROADCAST AS b 
left outer join MATCHES AS M 
ON b.MatchID = M.MatchID
Where b.MatchID = 4

go
select * from BroadcastInfo
go

----------- MATCH INFO VIEW---------------

CREATE View MatchInfo           
AS

SELECT * 
FROM MATCHES AS m RIGHT OUTER JOIN MATCHSTATS AS M1
ON M1.MatchID = m.MatchID 
WHERE m.MatchID = 6

go
select * from MatchInfo 
go

----------- MATCH STATS INFO VIEW ---------------

CREATE View MatchStatsInfo           
AS

SELECT *
FROM MATCHSTATS AS ms OUTER JOIN MATCHSTATS AS M1
ON M1.MatchID = ms.MatchID 
WHERE ms.MatchID = 7

go
select * from MatchStatsInfo
go

----------- MATCH SCHEDULE VIEW ---------------

CREATE View MatchSchedule
AS

SELECT m.Team1, m.Team2, m.StadiumID, m.MatchStartsAt
FROM MATCHES AS m LEFT OUTER JOIN STADIUM AS S 
on m.StadiumID = S.StadiumID
ORDER BY m.MatchStartsAt

go
select * from MatchSchedule
go


----------- PLAYER INFO VIEW---------------

CREATE View PlayerInfo       
AS

SELECT * 
FROM PLAYERS AS p LEFT OUTER JOIN PLAYERSTATS AS ps 
ON p.PlayerID = ps.PlayerID
Where p.PlayerID = 1

go
select * from PlayerInfo
go

----------- PLAYER STATS INFO VIEW---------------

CREATE View PlayerStatsInfo           
AS

SELECT p.PlayerName, ps.TotalMatchesPlayed, ps.Runs, ps.Wickets, ps.TotalScore, ps.TotalCenturies, 
ps.BestPerformance, ps.BattingAverage, ps.BallingAverage, ps.Catches, ps.StrikeRate 
FROM PLAYERS AS p
JOIN PLAYERSTATS AS ps
ON p.PlayerID = ps.PlayerID
Where p.PlayerID = @ID

go
select * from  PlayerStatsInfo
go


----------- PSL INFO VIEW---------------
--all the psl matches were played either in stadium 1 or in 2
CREATE View PSLSeasonInfo
AS

SELECT * 
FROM PSL AS psl 
Where psl.PSLID = 1

UNION
SELECT * 
FROM STADIUM AS S
Where S.StadiumID = 1 OR S.StadiumID = 2


go
select * from PSLSeasonInfo
go

----------- RATINGS INFO VIEW---------------

CREATE View RatingsInfo     
AS

SELECT u.UserName,r.Rating 
FROM RATING AS r
join USERS AS u 
ON u.UserID = r.UserID
Where r.MatchID = 1				--> THIS WILL BE THE MATCH ID, WILL DISPLAY ALL RATINGS FOR THE PARTICULAR MATCH

go
select * from RatingsInfo 
go

----------- REVIEW INFO VIEW---------------

CREATE View ReviewInfo
AS

SELECT * 
FROM REVIEW AS r LEFT OUTER JOIN MATCHES AS M 
ON r.MatchID = M.MatchID
Where r.MatchID = 5

go
select * from ReviewInfo
go


----------- STADIUM INFO VIEW---------------

CREATE View StadiumInfo
AS

SELECT * 
FROM STADIUMS AS s LEFT OUTER JOIN Tickets AS t on s.StadiumID = t.StadiumID
Where s.StadiumID = 2

go
select * from StadiumInfo
go


----------- TICKETS INFO VIEW---------------

CREATE View TicketsInfo         
AS

SELECT m.Team1, m.Team2, m.TotalTickets, m.AvailableTickets
FROM MATCHES AS m left outer join tickets as t on t.MatchID = m.MatchID
WHERE m.MatchID = 1

go
select * from TicketsInfo 
go

----------- COMPLAINTS FOR ADMIN VIEW---------------

CREATE View ComplaintsForAdmin           
AS

SELECT *
FROM COMPLAINT AS c left outer join users as u on u.UserID = c.UserID
WHERE c.ComplaintCategory = 'Admin' AND @ComplaintID = 1

go
select * from ComplaintsForAdmin
go