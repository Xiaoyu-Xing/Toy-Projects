SELECT users.id, username FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;



SELECT photo_id, COUNT(*) 
FROM likes
JOIN photos 
    ON likes.photo_id = photos.id
GROUP BY likes.photo_id, photos.user_id
ORDER BY COUNT(*) DESC
LIMIT 1;

(SELECT count(*) FROM photos)/(SELECT count(count(*)) FROM photos GROUP BY user_id);

SELECT avg(*) FROM photos
GROUP BY photos.user_id;

SELECT MAX(count(*)) FROM photo_tags
JOIN tags
    ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY count(*) DESC
;

select count(*), user_id from likes
group by user_id

having count(*) = 257;