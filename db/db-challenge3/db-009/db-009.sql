SELECT r.chat_name,
COUNT(p.chat_room_id) AS 投稿数
FROM posts AS p
JOIN chat_rooms AS r
ON p.chat_room_id = r.id
JOIN users AS u
ON u.id= p.create_user_id
WHERE p.is_deleted=0 AND u.is_deleted=0
GROUP BY p.chat_room_id
ORDER BY 投稿数 ASC;
