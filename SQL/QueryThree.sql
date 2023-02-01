-- List all attributes of comments posted this year either by Poster with name X or to Recipient with name Y. (6 points)

SELECT P.Name as Poster_Name, C.*
FROM comments C
JOIN users P ON P.Id = C.Poster
WHERE YEAR(C.PostDate) IN (SELECT EXTRACT(YEAR FROM CURRENT_DATE))
ORDER BY c.PostDate ASC;
