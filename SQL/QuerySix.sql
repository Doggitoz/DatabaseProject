-- List all attributes of Users who have commented at least thrice to the same User.

SELECT P.*
FROM users P, comments C
WHERE P.Id = C.Poster
GROUP BY C.Poster, C.Recipient
HAVING COUNT(*) >=3
;
