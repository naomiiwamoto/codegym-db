SELECT u.name,r.chat_name, 
DATE_FORMAT(c.created_at,'%Y年%m月%d日') AS 参加日 
FROM chat_connections AS c JOIN users AS u 
ON c.user_id = u.id JOIN chat_rooms AS r ON c.chat_room_id = r.id 
WHERE u.is_deleted=0 AND r.is_deleted=0 
ORDER BY c.created_at ASC;
