use PSLProject
GO
---**********************************************************************************************************************************************---
   ---------------------------------------------------------PSL Schema--------------------------------------------------------------------------
---**********************************************************************************************************************************************---
create schema PSLSchema
GO
---**********************************************************************************************************************************************---
   -----------------------------------------------------------ADMIN------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.ADMIN
(
	AdminName [varchar] (30) PRIMARY KEY not null,
	EmailID [varchar] (20) UNIQUE not null,
	Password [varchar] (15) not null,
	Picture [image] null
)
---**********************************************************************************************************************************************---
   ------------------------------------------------------------USERS-----------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.USERS
(
	UserID [int] IDENTITY(1,1) PRIMARY KEY not null,
	UserName [varchar] (30) UNIQUE not null,
	UserCategory [bit] not null,						---> 1 = account holder, 0 = non-account holder <----
	EmailID [varchar] (20) UNIQUE not null,
	Password [varchar] (15) not null,
	DateOfBirth [date] not null,
	Gender [bit] not null,								---> 1 = male, 0 = female <----
	Region [varchar] (30) null,
	Occupation [varchar] (30) null,
	Picture [image] null
)
---**********************************************************************************************************************************************---
   -----------------------------------------------------------SPONSORS---------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.SPONSORS
(
	SponsorID [int] IDENTITY(1,1) PRIMARY KEY not null,
	SponsorName [varchar] (30) UNIQUE not null,
	Investment [money] null
)
---**********************************************************************************************************************************************---
   -------------------------------------------------------PSLYearlyRecord------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.PSLYearlyRecord
(
	PSLID [int] IDENTITY(1,1) PRIMARY KEY not null,			   
	Administrator [varchar] (30) not null,		  
	PSLFormat [varchar] (30) not null,             
	TournamentYear	[int] not null,                
	TournamentFormat [varchar] (30) not null,      
	NumberOfTeams [int] not null,		
	NumberOfMatches	[int] not null,		  
	Winner [varchar] (30) not null,			       
	RunnerUp [varchar] (30) not null,			   
	TitleSponsor [int] FOREIGN KEY References SPONSORS(SponsorID) on delete cascade on update cascade not null,
	MostRuns [varchar] (30) not null,              
	MostWickets	[varchar] (30) not null,           
	PSLlogo [image] null
)
---**********************************************************************************************************************************************---
   -----------------------------------------------------------STADIUMS---------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.STADIUMS
(
	StadiumID [int] IDENTITY(1,1) PRIMARY KEY not null,
	StadiumName [varchar](30) not null,
	Location [varchar](50) not null,
	Capacity [bigint] not null						---> Number of Seats  <--
)
---**********************************************************************************************************************************************---
   -----------------------------------------------------------TEAMS------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.TEAMS
(
	TeamID [int] IDENTITY(1,1) PRIMARY KEY not null,
	TeamName [varchar] (30) UNIQUE not null,
	CityName [varchar](30) not null,
	TeamOwner [varchar](30) not null,
	Coach [varchar](30) not null,
	Captain [varchar](30) not null,
	Picture [image] null
)
---**********************************************************************************************************************************************---
   ---------------------------------------------------------POINTTABLE--------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.POINTTABLE
(
	PointID [int] IDENTITY(1,1) PRIMARY KEY not null,
	TeamID [int] FOREIGN KEY References TEAMS(TeamID) on delete no action on update cascade not null,
	TotalMatches [int] not null,
	WonMatches [int] not null,
	LostMatches [int] not null,
	DrawMatches [int] not null,
	TotalPoints [int] not null,
	RunRate [float] not null
)
---**********************************************************************************************************************************************---
   ----------------------------------------------------------MATCHES----------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.MATCHES
(
	MatchID [int] IDENTITY(1,1) PRIMARY KEY not null,
	MatchCategory [varchar](30) not null,				---> final,semifinal etc <---
	Team1 [int] FOREIGN KEY References TEAMS(TeamID) on delete no action on update no action not null,
	Team2 [int] FOREIGN KEY References TEAMS(TeamID) on delete no action on update no action not null,
	StadiumID [int] FOREIGN KEY References STADIUMS(StadiumID) on delete no action on update cascade not null,
	SponsorID [int] FOREIGN KEY References SPONSORS(SponsorID) on delete no action on update cascade not null,
	MatchStartsAt [datetime] not null,
	TotalTickets [bigint] not null,
	AvailableTickets [bigint] not null,
	SoldTickets [bigint] not null,
	MatchEndsAt [datetime] not null,
	MatchDescription [text] not null,
    CHECK (Team1 <> Team2)								---> Team1 != Team2 <---
)
---**********************************************************************************************************************************************---
   ---------------------------------------------------------BROADCAST-------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.BROADCAST 
(
	BroadcastID [int] IDENTITY(1,1) PRIMARY KEY not null,
	MatchID [int] FOREIGN KEY References MATCHES(MatchID) on delete no action on update cascade not null,
	TimeWhenBroadcasted [datetime] not null,
	Country [varchar] (30) not null,
	TVChannel [varchar] (30) not null
)
---**********************************************************************************************************************************************---
------------------------------------------------------------MATCHSTATS--------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.MATCHSTATS
(
	MatchStatsID [int] IDENTITY(1,1) PRIMARY KEY not null,
	MatchID [int] FOREIGN KEY References MATCHES(MatchID) on delete no action on update cascade not null,
	Team1 [int] FOREIGN KEY References TEAMS(TeamID) on delete no action on update no action not null,
	Team2 [int] FOREIGN KEY References TEAMS(TeamID) on delete no action on update no action not null,
	TossWinner [varchar](30) not null,
	Team1Score [int] not null,
	Team2Score [int] not null,
	Team1Wickets [int] not null,
	Team2Wickets [int] not null,
	Team1Fours [int] not null,
	Team2Fours [int] not null,
	Team1Sixes [int] not null,
	Team2Sixes [int] not null,
	HighestWickets [int] not null,
	HighestRuns [float] not null,
	WinnerTeam [varchar](30) not null,
	Team1OverPlayed [float] not null,
	Team2OverPlayed [float] not null,
	CHECK (Team1OverPlayed >-1 AND Team1OverPlayed< 20 ),
	CHECK (Team2OverPlayed >-1 AND Team1OverPlayed< 20 ),
	CHECK (Team1 <> Team2)								---> Team1 != Team2 <---
)
---**********************************************************************************************************************************************---
   ---------------------------------------------------------PLAYERS-----------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.PLAYERS
(
	PlayerID [int] IDENTITY(1,1) PRIMARY KEY not null,
	PlayerName [varchar] (30) UNIQUE not null,
	TeamID [int] FOREIGN KEY References TEAMS(TeamID) on delete cascade on update cascade not null,	
	PlayerCategory [varchar](30) not null,		
	PlayerType [varchar](30) not null,
	DateOfBirth [varchar](30) not null,
	Height [float] null,
	Fitness [bit] not null,							---> 1 = well , 0 = sick <----
	Picture [image] null
)
---**********************************************************************************************************************************************---
   -------------------------------------------------------PLAYERSTATS---------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.PLAYERSTATS
(
	PlayerStatsID [int] IDENTITY(1,1) PRIMARY KEY not null,
	PlayerID [int] FOREIGN KEY References PLAYERS(PlayerID) on delete no action on update cascade not null,
	TotalMatchesPlayed [int] null,
	Runs [int] null,
	Wickets [int] null,
	TopScore [int] null,
	TotalCenturies [int] null,
	BattingAverage [float] null,
	BallingAverage [float] null,
	BattingStyle [varchar](30) not null,
	BallingStyle [varchar](30) not null,
	Catches [int] null,
	StrikeRate [float] not null
)
---**********************************************************************************************************************************************---
   --------------------------------------------------------TICKETS------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.TICKETS
(
	TicketID [int] IDENTITY(1,1) PRIMARY KEY not null,
	MatchID [int] FOREIGN KEY References MATCHES(MatchID) on delete no action on update cascade not null,
	StadiumID [int] FOREIGN KEY References STADIUMS(StadiumID) on delete no action on update no action not null,
	UserID [int] FOREIGN KEY References USERS(UserID) on delete no action on update cascade not null,
	BookingTimeDate [datetime] not null,
	TicketStatus [varchar](30) not null,
	Price [money] not null,
)
---**********************************************************************************************************************************************---
   -------------------------------------------------------COMPLAINT-----------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.COMPLAINT
(
	ComplaintID [int] IDENTITY(1,1) PRIMARY KEY not null,
	ComplaintCategory [varchar](30) not null,				---> Suggestion, complain etc <---
	UserName [varchar](30) FOREIGN KEY References USERS(UserName) on delete no action on update no action not null,
	UserEmailID [varchar](20) FOREIGN KEY References USERS(EmailID) on delete no action on update no action not null,
	TimeDate [datetime] not null,							---> Time when user comments <---
	ComplaintContent [text] not null
)
---**********************************************************************************************************************************************---
   --------------------------------------------------------REVIEW-------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.REVIEW
(
	ReviewID [int] IDENTITY(1,1) PRIMARY KEY not null,
	MatchID [int] FOREIGN KEY References MATCHES(MatchID) on delete no action on update cascade not null,
	ReviewContent [text] not null
)
---**********************************************************************************************************************************************---
   --------------------------------------------------------RATING------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
CREATE TABLE dbo.RATING
(
	RatingID [int] IDENTITY(1,1) PRIMARY KEY not null,  
	MatchID [int] FOREIGN KEY References MATCHES(MatchID) on delete no action on update cascade not null,
	UserID [int] FOREIGN KEY References USERS(UserID) on delete no action on update cascade not null,
	RatingPoints decimal(2,1) 
	CONSTRAINT chk_Ratings CHECK (RatingPoints >= 0 AND RatingPoints <= 5)
)
---**********************************************************************************************************************************************---
   -----------------------------------------------------Admin State------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
INSERT INTO ADMIN 
	SELECT 'abcd', 'abcd@gmail.com', 'abcd@1', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\PSLAdmins.jpg', single_blob)
	AS BLOB
---**********************************************************************************************************************************************---
   --------------------------------------------------Sponsors State------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into SPONSORS (SponsorName, Investment) VALUES ('Habib Bank Limited',1000000)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Huawei',50000)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Mobilink',10000)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Brighto Paints',10500)
Insert into SPONSORS (SponsorName, Investment) VALUES ('J. Triptym',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('OLX',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('PTCL',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Qatar Airways',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Zong 4G',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Cool and Cool',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('ZIC Lubricant Oil',NULL)
Insert into SPONSORS (SponsorName, Investment) VALUES ('Giggly Boom Boom Bubble',NULL)
---**********************************************************************************************************************************************---
   ------------------------------------------------PSLYearlyRecord State-------------------------------------------------------------------------
---**********************************************************************************************************************************************---
INSERT INTO PSLYearlyRecord
	SELECT 'PakistanCricketBoard','Twenty20',2016,'DoubleRoundRobinAndPlayoffs',5,24,'IslamabadUnited','QuettaGladiators',1,'UmarAkmal',
		   'AndreRussell', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\PSLLogo.jpg', single_blob)
	AS BLOB
---**********************************************************************************************************************************************---
   -------------------------------------------------STADIUMS State-------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into STADIUMS (StadiumName, Location, Capacity) VALUES ('DubaiCricketStadium','Dubai',25000)
Insert into STADIUMS (StadiumName, Location, Capacity) VALUES ('SharjahCricketStadium','Sharjah',15000)
---**********************************************************************************************************************************************---
   --------------------------------------------------TEAMS State---------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
INSERT INTO TEAMS 
	SELECT 'IslamabadUnited', 'Islamabad,CapitalTerritory', 'LeonineGlobalSports','DeanJones','Misbah-ul-Haq', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\IslamabadUnited.jpg', single_blob)
	AS BLOB
INSERT INTO TEAMS 
	SELECT 'KarachiKings', 'Karachi,Sindh', 'ARYMediaGroup','MickeyArthur','RaviBopara', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\KarachiKings.jpg', single_blob)
	AS BLOB
INSERT INTO TEAMS 
	SELECT 'LahoreQalandars', 'Lahore,Punjab', 'QatarLubricantsCompany','PaddyUpton','AzharAli', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\LahoreQalandars.jpg', single_blob)
	AS BLOB
INSERT INTO TEAMS 
	SELECT 'PeshawarZalmi', 'Peshawar,KhyberPakthunkhwa', 'HaierPakistan','MohammadAkram','ShahidAfridi', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\PeshawarZalmi.jpg', single_blob)
	AS BLOB
INSERT INTO TEAMS 
	SELECT 'QuettaGladiators', 'Quetta,Balochistan', 'OmarAssociates','MoinKhan','SarfrazAhmed', bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\QuettaGladiators.jpg', single_blob)
	AS BLOB
---**********************************************************************************************************************************************---
   -----------------------------------------------POINTTABLE State-------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into POINTTABLE(TeamID,TotalMatches,WonMatches,LostMatches,DrawMatches,TotalPoints,RunRate) VALUES (1,8,4,4,0,8,-0.282)
Insert into POINTTABLE(TeamID,TotalMatches,WonMatches,LostMatches,DrawMatches,TotalPoints,RunRate) VALUES (2,8,2,6,0,4,-0.036)
Insert into POINTTABLE(TeamID,TotalMatches,WonMatches,LostMatches,DrawMatches,TotalPoints,RunRate) VALUES (3,8,2,6,0,4,-0.536)
Insert into POINTTABLE(TeamID,TotalMatches,WonMatches,LostMatches,DrawMatches,TotalPoints,RunRate) VALUES (4,8,6,2,0,12,+0.573)
Insert into POINTTABLE(TeamID,TotalMatches,WonMatches,LostMatches,DrawMatches,TotalPoints,RunRate) VALUES (5,8,6,2,0,12,+0.216)
---**********************************************************************************************************************************************---
   -----------------------------------------------MATCHES State----------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('1stT20',1,5,1,1,'20160204 20:00:00.000 PM',25000,25000,0,'20160205 02:00:00.000 AM','FirstTournamentAndQGWonBy8Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('2ndT20',2,3,1,1,'20160205 15:30:00.000 PM',25000,25000,0,'20160205 21:30:00.000 PM','2ndTournamentAndKKWonBy7Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('3rdT20',4,1,1,1,'20160205 20:00:00.000 PM',25000,25000,0,'20160206 02:00:00.000 AM','3rdTournamentAndPZWonBy24Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('4thT20',5,2,1,1,'20160206 15:30:00.000 PM',25000,25000,0,'20160206 21:30:00.000 PM','4thTournamentAndQGWonBy8Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('5thT20',3,4,1,1,'20160206 20:00:00.000 PM',25000,25000,0,'20160207 02:00:00.000 AM','5thTournamentAndPZWonBy9Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('6thT20',1,2,1,1,'20160207 15:30:00.000 PM',25000,25000,0,'20160207 21:30:00.000 PM','6thTournamentAndIUWonBy2Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('7thT20',4,5,1,1,'20160207 20:00:00.000 PM',25000,25000,0,'20160208 02:00:00.000 AM','7thTournamentAndQGWonBy3Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('8thT20',3,5,1,1,'20160208 20:00:00.000 PM',25000,25000,0,'20160209 02:00:00.000 AM','8thTournamentAndLQWonBy63Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('9thT20',3,1,2,1,'20160210 20:00:00.000 PM',15000,15000,0,'20160211 02:00:00.000 AM','9thTournamentAndIUWonBy8Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('10thT20',4,2,2,1,'20160211 15:30:00.000 PM',15000,15000,0,'20160211 21:30:00.000 PM','10thTournamentAndPZWonBy3Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('11thT20',1,5,2,1,'20160211 20:00:00.000 PM',15000,15000,0,'20160212 02:00:00.000 AM','11thTournamentAndQGWonBy7Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('12thT20',3,2,2,1,'20160212 15:30:00.000 PM',15000,15000,0,'20160212 21:30:00.000 PM','12thTournamentAndKKWonBy27Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('13thT20',1,4,2,1,'20160212 20:00:00.000 PM',15000,15000,0,'20160214 02:00:00.000 AM','13thTournamentAndPZWonBy7Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('14thT20',5,2,2,1,'20160214 15:30:00.000 PM',15000,15000,0,'20160214 21:30:00.000 PM','14thTournamentAndQGWonBy5Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('15thT20',3,4,2,1,'20160214 20:00:00.000 PM',15000,15000,0,'20160215 02:00:00.000 AM','15thTournamentAndLQWonBy4Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('16thT20',1,2,2,1,'20160215 15:30:00.000 PM',15000,15000,0,'20160215 21:30:00.000 PM','16thTournamentAndIUWonBy5Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('17thT20',4,5,2,1,'20160215 20:00:00.000 PM',15000,15000,0,'20160216 02:00:00.000 AM','17thTournamentAndPZWonBy8Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('18thT20',3,5,1,1,'20160216 20:00:00.000 PM',25000,25000,0,'20160217 02:00:00.000 AM','18thTournamentAndQGWonBy2Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('19thT20',2,4,1,1,'20160217 15:30:00.000 PM',25000,25000,0,'20160217 21:30:00.000 PM','19thTournamentAndPZWonBy5Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('20thT20',3,1,1,1,'20160217 20:00:00.000 PM',25000,25000,0,'20160218 02:00:00.000 AM','20thTournamentAndIUWonBy5Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('1stPlayoff',4,5,1,1,'20160219 20:00:00.000 PM',25000,25000,0,'20160220 02:00:00.000 AM','1stPlayoffAndQGWonBy1Run')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('2ndPlayoff',1,2,1,1,'20160220 20:00:00.000 PM',25000,25000,0,'20160221 02:00:00.000 AM','2ndPlayoffAndIUWonBy9Wickets')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('3rdPlayoff',1,4,1,1,'20160221 20:00:00.000 PM',25000,25000,0,'20160222 02:00:00.000 AM','3rdPlayoffAndIUWonBy50Runs')

Insert into MATCHES(MatchCategory,Team1,Team2,StadiumID,SponsorID,MatchStartsAt,TotalTickets,AvailableTickets,SoldTickets,MatchEndsAt,
MatchDescription) VALUES ('Final',1,5,1,1,'20160223 20:00:00.000 PM',25000,25000,0,'20160224 02:00:00.000 AM','FinalAndQGWonBy6Wickets')

---**********************************************************************************************************************************************---
   ---------------------------------------------------BROADCAST----------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (1,'20160204 20:00:00.000 PM','Pakistan','PTVSports')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (3,'20160206 02:00:00.000 AM','Pakistan','TenSports')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (4,'20160206 21:30:00.000 PM','Pakistan','GeoSuper')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (6,'20160207 21:30:00.000 PM','SriLanka','TenSports')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (8,'20160209 02:00:00.000 AM','SriLanka','CSN')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (10,'20160211 15:30:00.000 PM','UAE','OSN')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (12,'20160212 21:30:00.000 PM','UK','Prime TV')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (15,'20160215 02:00:00.000 AM','Australia','Prime TV')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (20,'20160218 02:00:00.000 AM','Bangladesh','Gazi TV')
Insert into BROADCAST (MatchID,TimeWhenBroadcasted,Country,TVChannel) VALUES (24,'20160224 02:00:00.000 AM','WestIndies','Flow TV')


---**********************************************************************************************************************************************---
   ----------------------------------------------------MATCHSTATS------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(1,1,5,5,128,132,7,2,10,14,4,4,7,8.25,'QG',19.6,15.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(2,2,3,2,131,125,3,8,11,8,7,2,8,8.27,'KK',15.5,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(3,4,1,4,145,121,7,9,9,10,3,2,9,7.25,'PZ',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(4,5,2,5,153,147,2,7,10,9,8,3,10,8.83,'QG',17.2,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(5,3,4,3,117,118,6,1,11,10,1,3,6,7.38,'PZ',19.6,15.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(6,1,2,2,132,130,8,9,7,12,5,2,9,6.6,'IU',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(7,4,5,5,135,139,7,7,5,11,5,3,7,7.01,'QG',19.6,19.5)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(8,3,5,5,194,131,3,10,15,13,13,2,10,9.7,'LQ',19.6,16.2)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(9,3,1,1,166,169,6,2,15,9,6,14,6,10.67,'IU',19.6,15.5)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(10,4,2,4,182,179,4,9,15,16,8,8,9,9.1,'PZ',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(11,1,5,5,117,118,10,3,5,12,8,1,10,7.3,'QG',19.1,16.1)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(12,3,2,3,152,178,8,5,14,9,4,8,8,8.9,'KK',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(13,1,4,4,152,153,6,3,10,13,8,6,6,8.27,'PZ',19.6,18.3)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(14,5,2,2,127,126,5,9,15,16,8,8,9,6.74,'QG',18.5,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(15,3,4,4,164,160,3,7,15,11,3,6,7,8.2,'LQ',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(16,1,2,1,131,128,5,5,9,11,7,2,5,6.96,'IU',18.5,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(17,4,5,5,130,129,2,10,6,11,6,2,10,7.17,'PZ',18.4,17.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(18,3,5,5,201,203,2,8,17,26,12,3,8,10.15,'QG',19.6,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(19,2,4,2,152,157,7,5,10,14,5,7,7,8.49,'PZ',19.6,18.3)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(20,3,1,1,150,151,5,5,10,18,6,2,5,7.95,'IU',19.6,18.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(21,4,5,4,132,133,9,10,16,14,1,4,10,6.82,'QG',19.6,19.3)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(22,1,2,1,115,111,1,9,13,7,4,2,9,8.02,'IU',14.2,19.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(23,1,4,4,176,126,3,10,15,15,3,8,10,8.8,'IU',19.6,17.6)

Insert into MATCHSTATS(MatchID,Team1,Team2,TossWinner,Team1Score,Team2Score,Team1Wickets,Team2Wickets,Team1Fours,Team2Fours,Team1Sixes,Team2Sixes,
HighestWickets,HighestRuns,WinnerTeam,Team1OverPlayed,Team2OverPlayed) VALUES 
(24,1,5,1,175,174,4,7,13,18,11,7,7,9.38,'IU',18.4,19.6)

---**********************************************************************************************************************************************---
   -----------------------------------------------------PLAYERS--------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
INSERT INTO PLAYERS 
	SELECT 'BabarAzam',1,'Silver','Batsman','15-10-1994',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\BabarAzam.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'BradHaddin',1,'Diamond','WicketKeeper','23-10-1977',5.95,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\BradHaddin.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'Misbah-ul-Haq',1,'Platinum','Batsman','28-5-1974',6.03,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\MisbahUlHaq.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MohammadIrfan',1,'Platinum','Bowler','06-06-1982',7.1,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\MIrfan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SaeedAjmal',1,'Gold','Bowler','14-10-1977',5.10,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\SaeedAjmal.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SamuelBadree',1,'Diamond','Bowler','09-03-1981',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\SamuelBadree.jpeg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ShaneWatson',1,'Platinum','AllRounder','17-06-1981',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ShaneWatson.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'UmarAmin',1,'Platinum','Batsman','16-10-1989',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\UmarAmin.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SharjeelKhan',1,'Gold','Batsman','14-10-1989',5.11,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\sharjeelKhan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MohammadSami',1,'Gold','Bowler','24-02-1981',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\MSami.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AndreRussel',1,'Platinum','AllRounder','29-4-1988',6.1,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\AndreRussel.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KhalidLatif',1,'Gold','Batsman','04-11-1985',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\KhalidLateef.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SamBillings',1,'Silver','WicketKeeper','15-06-1991',5.10,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\SamBillings.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KamranGhulam',1,'Silver','AllRounder','10-10-1995',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\KamranGhulam.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ShoaibMalik',2,'Platinum','AllRounder','01-02-1982',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ShoaibMalik.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SohailTanvir',2,'Platinum','Bowler','12-12-1984',6.5,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\SohailTanvir.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ShakibAlHasan',2,'Platinum','AllRounder','24-03-1987',5.9,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\shakibalhasan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'RaviBopara',2,'Diamond','AllRounder','04-05-1985',5.10,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\raviBopara.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'LendlSimmons',2,'Diamond','Batsman','25-01-1985',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\LendlSimmons.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MohammadAmir',2,'Gold','Bowler','13-04-1992',6.2,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\mohammadAmir.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MushfiqurRahim',2,'Silver','WicketKeeper','09-05-1987',5.3,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\mushfiqurRahim.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'BilawalBhatti',2,'Gold','Bowler','17-09-1991',5.6,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\bilawalBhatti.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'UsamaMir',2,'Silver','Bowler','23-12-1995',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\usamaMir.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MirHamza',2,'Emerging','Bowler','10-09-1992',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\MirHamza.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SohailKhan',2,'Silver','Bowler','06-03-1984',6.4,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\sohailKhan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SaifullahBangash',2,'Emerging','WicketKeeper','21-03-1995',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\saifullahBangash.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ImadWasim',2,'Diamond','AllRounder','18-12-1988',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ImadWasim.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'JamesVince',2,'Gold','Batsman','14-03-1991',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\jamesVince.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ChrisGayle',3,'Platinum','Batsman','21-09-1978',6.2,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ChrisGayle.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'DwayneBravo',3,'Platinum','ALLRounder','07-10-1983',5.9,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\dwaynebravo.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SohaibMaqsood',3,'Diamond','Batsman','15-04-1987',6.2,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\SOHAIBKhurramManzoor.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'UmarAkmal',3,'Platinum','Batsman','26-05-1990',5.9,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\umarAkmal.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'YasirShah',3,'Diamond','Bowler','02-05-1986',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\YasirShah.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MuhammadRizwan',3,'Diamond','Wicketkeeper','01-06-1992',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\M.rizwan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MustafizurRahman',3,'Gold','Bowler','06-09-1995',5.11,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\mustafizurRahman.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'HammadAzam',3,'Silver','AllRounder','16-03-1991',1.88,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\hammadazam.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'EhsanAdil',3,'Silver','Bowler','15-03-1993',6.33,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ehsanadil.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AzharAli',3,'Silver','Batsman','19-03-1985',5.11,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\AzharAli.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AbdulRazzaq',3,'Gold','AllRounder','02-12-1979',5.11,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\AbdulRazzaq.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ZafarGohar',3,'Silver','Bowler','01-02-1995',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\zafargohar.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'CameronDelport',3,'Gold','AllRounder','12-05-1989',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\Cameron.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KevonCooper',3,'Gold','Bowler','16-02-1989',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\kevoncooper.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ShahidAfridi',4,'Platinum','AllRounder','01-03-1980',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\shahidAfridi.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'WahabRiaz',4,'Platinum','Bowler','28-06-1985',6.1,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\WahabRiaz.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'DarrenSammy',4,'Platinum','AllRounder','20-12-1983',6.6,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\darrensammy.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KamranAkmal',4,'Diamond','WicketKeeper','13-01-1982',5.6,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\kamranakmal.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MohammadHafeez',4,'Diamond','Batsman','17-10-1980',5.9,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\mohammadhafeez.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ChrisJordan',4,'Diamond','Bowler','04-10-1988',6.2,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\chrisjordan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'JimAllenby',4,'Gold','AllRounder','12-09-1982',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\jim-allenby.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'JunaidKhan',4,'Gold','Bowler','24-12-1989',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\junaidkhan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'DawidMalan',4,'Silver','Batsman','03-09-1987',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\dawidmalan.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AbdurRehman',4,'Silver','Bowler','01-03-1980',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\Abdurrahman.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'TamimIqbal',4,'Gold','Batsman','20-03-1989',5.11,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\tamimiqbal.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ShahidYousuf',4,'Silver','Batsman','15-0-1986',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\shahidyousaf.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MusadiqAhmed',4,'Emerging','Batsman','01-05-1986',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\musadiqahmed.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'BradHodge',4,'Diamond','Batsman','29-12-1974',5.10,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\bradhodge.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SarfrazAhmed',5,'Platinum','WicketKeeper','22-05-1987',5.9,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\sarfrazahmed.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AhmedShehzad',5,'Platinum','Batsman','23-11-1991',5.7,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\ahmedshehzad.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AnwarAli',5,'Diamond','AllRounder','25-11-1987',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\anwarali.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'ZulfiqarBabar',5,'Gold','Bowler','10-12-1978',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\zulfiqarbabar.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'UmarGul',5,'Gold','Bowler','14-05-1984',6.3,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\umargul.jpeg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'JasonHolder',5,'Diamond','AllRounder','05-11-1991',6.7,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\Jason.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'LukeWright',5,'Diamond','AllRounder','07-03-1985',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\lukewright.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'EltonChigumbura',5,'Gold','AllRounder','14-03-1986',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\eltonchigumbura.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KevinPietersen',5,'Platinum','Batsman','27-06-1980',6.5,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\kevinpietersen.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'SaadNasim',5,'Silver','AllRounder','29-04-1990',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\saadnasim.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'MohammadNabi',5,'Silver','AllRounder','01-01-1985',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\mohammad_nabi.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'KumarSangakkara',5,'Platinum','WicketKeeper','27-10-1977',5.10,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\kumarsangakkara.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AizazCheema',5,'Silver','Bowler','05-09-1979',6.0,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\Aizaz-Cheema.jpg', single_blob)
	AS BLOB

INSERT INTO PLAYERS 
	SELECT 'AsadShafiq',5.5,'Silver','Batsman','28-01-1986',NULL,1,bulkcolumn
	FROM OPENROWSET (BULK 'C:\Users\Ayesha Tahreem\Desktop\PSLPics\asadshafiq.jpg', single_blob)
	AS BLOB
---**********************************************************************************************************************************************---
   ----------------------------------------------------PLAYERSTATS------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into PLAYERSTATS(PlayerID,TotalMatchesPlayed,Runs,Wickets,TopScore,TotalCenturies,BattingAverage,BallingAverage,BattingStyle,BallingStyle,Catches,StrikeRate) 
VALUES (1,78,1468,0,77,0,45.83,21.25,'RightHand','RightArmOffBreak',12,41.67)
Insert into PLAYERSTATS(PlayerID,TotalMatchesPlayed,Runs,Wickets,TopScore,TotalCenturies,BattingAverage,BallingAverage,BattingStyle,BallingStyle,Catches,StrikeRate)
VALUES (2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'RightHand','Spinner',NULL,84.58)
Insert into PLAYERSTATS(PlayerID,TotalMatchesPlayed,Runs,Wickets,TopScore,TotalCenturies,BattingAverage,BallingAverage,BattingStyle,BallingStyle,Catches,StrikeRate)
VALUES (3,208,788,3,87,0,37.52,NULL,'RightHand','RightArmLegBreak',14,92.40)
---**********************************************************************************************************************************************---
   ------------------------------------------------------REVIEW----------------------------------------------------------------------------------
---**********************************************************************************************************************************************---
Insert into REVIEW(MatchID,ReviewContent) VALUES (1,'MatchBetweenIslamabadUnitedandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (2,'MatchBetweenKarachiKingsandLahoreQalandars,TossWinner:KarachiKings,MatchWinner:KarachiKings')
Insert into REVIEW(MatchID,ReviewContent) VALUES (3,'MatchBetweenPeshawarZalmiandIslamabadUnited,TossWinner:PeshawarZalmi,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (4,'MatchBetweenKarachiKingsandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (5,'MatchBetweenLahoreQalandarsandPeshawarZalmi,TossWinner:LahoreQalandars,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (6,'MatchBetweenIslamabadUnitedandKarachiKings,TossWinner:KarachiKings,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (7,'MatchBetweenPeshawarZalmiandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (8,'MatchBetweenLahoreQalandarsandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:LahoreQalandars')
Insert into REVIEW(MatchID,ReviewContent) VALUES (9,'MatchBetweenLahoreQalandarsandIslamabadUnited,TossWinner:IslamabadUnited,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (10,'MatchBetweenKarachiKingsandPeshawarZalmi,TossWinner:PeshawarZalmi,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (11,'MatchBetweenIslamabadUnitedandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (12,'MatchBetweenKarachiKingsandLahoreQalandars,TossWinner:LahoreQalandars,MatchWinner:KarachiKings')
Insert into REVIEW(MatchID,ReviewContent) VALUES (13,'MatchBetweenIslamabadUnitedandPeshawarZalmi,TossWinner:PeshawarZalmi,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (14,'MatchBetweenQuettaGladiatorsandKarachiKings,TossWinner:KarachiKings,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (15,'MatchBetweenLahoreQalandarsandPeshawarZalmi,TossWinner:PeshawarZalmi,MatchWinner:LahoreQalandars')
Insert into REVIEW(MatchID,ReviewContent) VALUES (16,'MatchBetweenIslamabadUnitedandKarachiKings,TossWinner:IslamabadUnited,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (17,'MatchBetweenPeshawarZalmiandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (18,'MatchBetweenLahoreQalandarsandQuettaGladiators,TossWinner:QuettaGladiators,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (19,'MatchBetweenKarachiKingsandPeshawarZalmi,TossWinner:KarachiKings,MatchWinner:PeshawarZalmi')
Insert into REVIEW(MatchID,ReviewContent) VALUES (20,'MatchBetweenLahoreQalandarsandIslamabadUnited,TossWinner:IslamabadUnited,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (21,'MatchBetweenPeshawarZalmiandQuettaGladiators,TossWinner:PeshawarZalmi,MatchWinner:QuettaGladiators')
Insert into REVIEW(MatchID,ReviewContent) VALUES (22,'MatchBetweenIslamabadUnitedandKarachiKings,TossWinner:IslamabadUnited,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (23,'MatchBetweenIslamabadUnitedandPeshawarZalmi,TossWinner:PeshawarZalmi,MatchWinner:IslamabadUnited')
Insert into REVIEW(MatchID,ReviewContent) VALUES (24,'MatchBetweenIslamabadUnitedandQuettaGladiators,TossWinner:IslamabadUnited,MatchWinner:IslamabadUnited')

select * from ADMIN
select * from USERS
select * from SPONSORS
select * from PSLYearlyRecord
select * from STADIUMS
select * from TEAMS
select * from MATCHES
select * from BROADCAST
select * from MATCHSTATS
select * from POINTTABLE
select * from PLAYERS
select * from PLAYERSTATS
select * from TICKETS
select * from COMPLAINT
select * from REVIEW
select * from RATING
