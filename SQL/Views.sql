CREATE VIEW `USER_FRIEND_COUNT`(User_Id, User_Name, No_Of_Friends)
AS SELECT U.Id, U.Name, COUNT(*)
FROM Users U, Friends
WHERE U.Id = F.Id1;