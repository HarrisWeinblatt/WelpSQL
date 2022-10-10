/* difficult reviewers - those with the most reviews below the average rating */
SELECT username, COUNT(*)
AS counter
FROM reviews
JOIN places
ON reviews.place_id = places.id
WHERE rating < average_rating
GROUP BY reviews.username
ORDER BY counter DESC;

/* Reviews from 2020 joined with the other table to show the Restaurant name for each review from 2020 */
WITH reviews_2020 AS (
  SELECT *
  FROM reviews
  WHERE strftime("%Y", review_date) = '2020'
)
SELECT places.name, review_date, note
FROM reviews_2020
JOIN places
 ON places.id = reviews_2020.place_id;

/* places without reviews */
SELECT places.name AS "Places without Reviews"
FROM places
LEFT JOIN reviews
  ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;

/* condensced the last query of reviews to ONLY show relevant info and not show the other columns */
SELECT places.name, places.average_rating, reviews.username, reviews.rating, reviews.review_date, reviews.note
FROM places
INNER JOIN reviews
  ON places.id = reviews.place_id;


/* show places that have at least 1 review */
SELECT *
FROM reviews
INNER JOIN places
  ON places.id = reviews.place_id;

/* show the places that cost 20 or less ($ or $$) */
SELECT price_point, name, average_rating
FROM places
WHERE price_point = '$'
  OR price_point = '$$';


/* show data in both tables */
SELECT *
FROM places;
SELECT *
FROM reviews;

