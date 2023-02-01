-- For each user, find the number of friends of each gender (output should have 3 columns: Id, Gender, Count).

SELECT F.Id1 AS Id, O.Gender AS Friend_Gender, COUNT(*) AS Amount
FROM friends F
JOIN users O ON F.Id2 = O.Id 
GROUP BY F.Id1, O.Gender
ORDER BY Id ASC;