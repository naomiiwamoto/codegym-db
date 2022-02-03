BEGIN;

DELETE chat_connections 
FROM chat_connections 
INNER JOIN users ON 
chat_connections.user_id = users.id 
WHERE users.is_deleted =1;

COMMIT;
