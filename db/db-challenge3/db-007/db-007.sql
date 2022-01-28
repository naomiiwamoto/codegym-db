SELECT id,create_user_id,chat_name,chat_description,file_send_permit_flag,direct_chat_flag,created_at,update_user_id,updated_at,is_deleted,
CASE direct_chat_flag 
WHEN 1 THEN '許可'
ELSE '禁止'
END
FROM chat_rooms
WHERE is_deleted=0 AND chat_description LIKE '%ダイレクトチャット' 
ORDER BY id ASC;
