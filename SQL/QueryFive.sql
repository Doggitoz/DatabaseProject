--  List all attributes of Users who have not received comments from Users of a different gender.

SELECT *
FROM users U
WHERE U.Id NOT IN (
	SELECT R.Id
    FROM users R
    JOIN (comments C JOIN users P ON C.Poster = P.Id) ON C.Recipient = R.Id
    WHERE R.Gender != P.Gender)