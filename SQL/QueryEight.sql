-- List all attributes of Users who have posted comments to all users of a specific gender (choose the 
-- gender chosen your defined set; no aggregate operations allowed)

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