-- List all User attributes and the number of friends of users who have posted comments to at least two different users

SELECT U.*, COUNT(*) AS Amount_Of_Friends
FROM users U
JOIN friends F ON U.Id = F.Id1
WHERE U.Id IN (SELECT P.Id
				FROM users P
				JOIN (comments C JOIN users R ON R.Id = C.Recipient) ON P.Id = Poster
				GROUP BY P.Id
				HAVING COUNT(DISTINCT R.Id) > 1)
GROUP BY U.Id
;
