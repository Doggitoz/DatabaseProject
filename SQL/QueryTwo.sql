-- Display, without duplicates, the Posters of one gender who posted to Recipients of a different gender

SELECT DISTINCT C.Poster, P.Gender AS Poster_Gender, C.Recipient, R.Gender as Recipient_Gender
FROM users P
JOIN (comments C JOIN users R ON R.Id = C.Recipient) ON P.Id = Poster
WHERE P.Gender != R.Gender;