UPDATE users
SET is_deleted =1, updated_at=CURRENT_TIMESTAMP
WHERE (work_phone_number IS NULL OR work_phone_number IN ('')) AND (mobile_phone_number IS NULL OR mobile_phone_number IN(''));
