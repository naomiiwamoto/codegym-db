UPDATE tasks
SET complete_flag = 1,updated_at=CURRENT_TIMESTAMP
WHERE  is_deleted =0 AND update_user_id =1 AND created_at BETWEEN '2020-4-26 09:00:00' AND '2020-4-26 11:30:00;
