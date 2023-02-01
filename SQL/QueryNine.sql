-- List all attributes of User(s) who have received comments from the most number of Users.

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