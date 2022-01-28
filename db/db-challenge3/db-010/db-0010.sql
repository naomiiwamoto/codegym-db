SELECT
u.name,c.chat_name,p.post_time
FROM posts AS p
INNER JOIN (
SELECT
chat_room_id,MAX(post_time) AS F2
FROM posts
INNER JOIN users AS u
ON u.id=posts.create_user_id
WHERE posts.is_deleted=0 AND u.is_deleted=0
GROUP BY chat_room_id ) AS T2
ON  T2.F2=p.post_time
INNER JOIN chat_rooms AS c
ON c.id = p.chat_room_id
INNER JOIN users AS u
ON p.create_user_id = u.id
ORDER BY p.chat_room_id DESC;
