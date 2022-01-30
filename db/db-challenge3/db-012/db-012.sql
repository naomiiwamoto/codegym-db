UPDATE chat_rooms 
SET file_send_permit_flag =0,updated_at=CURRENT_TIMESTAMP 
WHERE is_deleted=0 
AND id IN (SELECT chat_room_id FROM chat_connections WHERE chat_room_id NOT IN (SELECT chat_room_id FROM chat_connections WHERE user_id=1));
