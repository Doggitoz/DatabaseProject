CREATE TABLE `users` (
  `Id` char(5) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `comments` (
  `CommentId` int NOT NULL,
  `Poster` char(5) DEFAULT NULL,
  `Recipient` char(5) DEFAULT NULL,
  `Text` varchar(45) NOT NULL,
  `PostDate` date DEFAULT NULL,
  PRIMARY KEY (`CommentId`),
  KEY `Poster_idx` (`Poster`),
  KEY `Recipient_idx` (`Recipient`),
  CONSTRAINT `Poster` FOREIGN KEY (`Poster`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Recipient` FOREIGN KEY (`Recipient`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `friends` (
  `Id1` char(5) NOT NULL,
  `Id2` char(5) NOT NULL,
  `StartDate` date DEFAULT NULL,
  PRIMARY KEY (`Id1`,`Id2`),
  KEY `Id2_idx` (`Id2`),
  CONSTRAINT `Id1` FOREIGN KEY (`Id1`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Id2` FOREIGN KEY (`Id2`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into users (Id, Name, Gender)
values
('12034', 'Alec', 'M'),
('30234', 'Tulsano', 'M'),
('39405', 'Steven', 'M'),
('43523', 'Tyler', 'M'),
('49502', 'Devin', 'M'),
('53804', 'Stanita', 'F'),
('55305', 'Coleton', 'M'),
('59033', 'Justin', 'M'),
('63409', 'Akram', 'F'),
('76340', 'Connor', 'M'),
('93032', 'Marion', 'F'),
('93485', 'Ava', 'F')
;

insert into comments (CommentId, Poster, Recipient, text, PostDate)
values
('9745', '55305', '76340', 'Reminds me of that one thing', '2019-04-04'),
('16518', '53804', '55305', 'wow... so lame. I cant believe you', '2020-05-15'),
('21548', '53804', '43523', 'this is a test to comment on all males', '2016-05-28'),
('23424', '55305', '59033', 'im tired can you carry me', '2017-04-09'),
('46522', '93485', '93032', 'this is to get marion comments to 6', '2020-05-15'),
('46532', '93032', '55305', 'are you busy today?', '2020-05-15'),
('46543', '93485', '63409', 'can you help check this code for me', '2021-12-02'),
('46841', '59033', '93032', 'this is to get marion comments to 6', '2020-05-15'),
('48324', '53804', '30234', 'this is a test to comment on all males', '2016-05-28'),
('48513', '53804', '55305', 'this is a test to comment on all males', '2016-05-28'),
('48621', '93485', '55305', 'sure!', '2022-10-12'),
('48875', '53804', '49502', 'this is a test to comment on all males', '2016-05-28'),
('53477', '49502', '55305', 'Wanna play mtg today?', '2017-09-22'),
('56832', '39405', '93032', 'this is to get marion comments to 6', '2020-05-15'),
('58862', '53804', '59033', 'this is a test to comment on all males', '2016-05-28'),
('59034', '30234', '59033', 'The target', '2022-06-16'),
('63453', '59033', '30234', 'WHICH TARGET', '2022-06-16'),
('65315', '55305', '93032', 'sending this three times for testing purposes', '2002-07-15'),
('69744', '53804', '12034', 'this is a test to comment on all males', '2016-05-28'),
('86152', '55305', '93485', 'do you wanna play kirby today?', '2022-10-12'),
('89465', '55305', '93032', 'sending this three times for testing purposes', '2002-07-15'),
('89844', '53804', '76340', 'commenting on all males', '2020-05-15'),
('96451', '93032', '55305', 'this sims character right...', '2022-10-13'),
('97884', '53804', '39405', 'this is a test to comment on all males', '2016-05-28'),
('98463', '55305', '12034', 'wow you know so much about watches...', '2020-05-15'),
('99321', '55305', '93032', 'sending this three times for testing purposes', '2002-07-15')
;

insert into friends (Id1, Id2, StartDate)
values
('30234', '53804', '2020-10-22'),
('30234', '59033', '2015-08-22'),
('39405', '55305', '2007-08-22'),
('43523', '55305', '2022-09-03'),
('49502', '76340', '2022-01-24'),
('53804', '30234', '2020-10-22'),
('53804', '55305', '2018-01-15'),
('55305', '39405', '2007-08-22'),
('55305', '43523', '2022-09-03'),
('55305', '53804', '2018-01-15'),
('55305', '93032', '2019-07-13'),
('55305', '93485', '2022-02-13'),
('59033', '30234', '2015-08-22'),
('63409', '93485', '2020-11-04'),
('76340', '49502', '2022-01-24'),
('93032', '55305', '2019-07-13'),
('93485', '55305', '2022-02-13'),
('93485', '63409', '2020-11-04')
;