--  List all attributes of comments containing the ‘word’ wow, ordered by increasing Poster and decreasing Recipient

SELECT *
FROM comments C
WHERE C.Text LIKE '%wow%'
ORDER BY Poster ASC, recipient DESC;