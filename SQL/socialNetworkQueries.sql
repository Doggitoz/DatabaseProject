-- Coleton Wheeler
-- Sen
-- CS-4163-01

-- 1. List all attributes of comments containing the ‘word’ wow, ordered by increasing Poster and decreasing Recipient

SELECT *
FROM comments C
WHERE C.Text LIKE '%wow%'
ORDER BY Poster ASC, recipient DESC
;

-- 2. Display, without duplicates, the Posters of one gender who posted to Recipients of a different gender

SELECT DISTINCT C.Poster, P.Gender AS Poster_Gender, C.Recipient, R.Gender as Recipient_Gender
FROM users P
JOIN (comments C JOIN users R ON R.Id = C.Recipient) ON P.Id = Poster
WHERE P.Gender != R.Gender
;

-- 3. List all attributes of comments posted this year either by Poster with name X or to Recipient with name Y. (6 points)

SELECT P.Name as Poster_Name, C.*
FROM comments C
JOIN users P ON P.Id = C.Poster
WHERE YEAR(C.PostDate) IN (SELECT EXTRACT(YEAR FROM CURRENT_DATE))
ORDER BY c.PostDate ASC
;

-- 4. For each user, find the number of friends of each gender (output should have 3 columns: Id, Gender, Count).

SELECT F.Id1 AS Id, O.Gender AS Friend_Gender, COUNT(*) AS Amount
FROM friends F
JOIN users O ON F.Id2 = O.Id 
GROUP BY F.Id1, O.Gender
ORDER BY Id ASC
;

-- 5. List all attributes of Users who have not received comments from Users of a different gender.

SELECT *
FROM users U
WHERE U.Id NOT IN (
	SELECT R.Id
    FROM users R
    JOIN (comments C JOIN users P ON C.Poster = P.Id) ON C.Recipient = R.Id
    WHERE R.Gender != P.Gender
	)
;

-- 6. List all attributes of Users who have commented at least thrice to the same User.

SELECT P.*
FROM users P, comments C
WHERE P.Id = C.Poster
GROUP BY C.Poster, C.Recipient
HAVING COUNT(*) >=3
;

-- 7. List all User attributes and the number of friends of users who have posted comments to at least two different users

SELECT U.*, COUNT(*) AS Amount_Of_Friends
FROM users U
JOIN friends F ON U.Id = F.Id1
WHERE U.Id IN (
	SELECT P.Id
	FROM users P
	JOIN (comments C JOIN users R ON R.Id = C.Recipient) ON P.Id = Poster
	GROUP BY P.Id
	HAVING COUNT(DISTINCT R.Id) > 1
	)
GROUP BY U.Id
;

-- 8. List all attributes of Users who have posted comments to all users of a specific gender (choose the gender chosen your defined set; no aggregate operations allowed)

SELECT *
FROM users U
WHERE NOT EXISTS(
	SELECT *
    FROM users O
    WHERE O.Gender = 'M'
    AND NOT EXISTS(
		SELECT *
        FROM comments C
        WHERE O.Id = C.Recipient AND C.Poster = U.Id
        )
	)
;

-- 9. List all attributes of User(s) who have received comments from the most number of Users.

SELECT R.*, COUNT(*) AS NumCommentsReceived
FROM users R
JOIN comments C ON R.Id = C.Recipient
GROUP BY C.Recipient
HAVING COUNT(*) = (
	SELECT MAX(Cnt)
	FROM (
		SELECT COUNT(*) AS Cnt
		FROM comments C
        GROUP BY C.Recipient
        ) AS S
	)
;