-- ユーザ
CREATE TABLE users
(id INT AUTO_INCREMENT not null,
email VARCHAR(100) not null,
password VARCHAR(100) not null,
name VARCHAR(100) not null,
profile VARCHAR(1000),
mobile_phone_number VARCHAR(13),
work_phone_number VARCHAR(13),
updated_at datetime not null,
created_at datetime not null,
is_deleted tinyint(1),
PRIMARY KEY(id)
 );

-- チャットルーム
CREATE TABLE chat_room
(id INT AUTO_INCREMENT not null,
user_id INT not null,
chat_name VARCHAR(100) not null,
chat_description VARCHAR(100),
file_send_permit_flag tinyint(1),
direct_chat_flag tinyint(1),
created_at datetime not null,
update_user_id INT not null,
updated_at datetime not null,
is_deleted tinyint(1),
PRIMARY KEY(id),
FOREIGN KEY (user_id)
REFERENCES users (id),
FOREIGN KEY (update_user_id)
REFERENCES users (id)
);

-- チャット接続
CREATE TABLE chat_connection
(id INT AUTO_INCREMENT not null,
user_id INT not null,
chat_room_id INT not null,
created_at datetime not null,
PRIMARY KEY(id),
FOREIGN KEY (user_id)
REFERENCES users (id),
FOREIGN KEY (chat_room_id)
REFERENCES chat_room(id)
);

-- 投稿
CREATE TABLE posts
(id INT AUTO_INCREMENT not null,
user_id INT not null,
chat_room_id INT not null,
attachment_name VARCHAR(100) not null,
post_content VARCHAR(100),
post_time datetime not null,
update_user_id INT,
updated_at datetime not null,
is_deleted tinyint(1),
PRIMARY KEY(id),
FOREIGN KEY (user_id)
REFERENCES users (id),
FOREIGN KEY (chat_room_id)
REFERENCES  chat_room(id),
FOREIGN KEY (update_user_id)
REFERENCES users (id)	
);

-- タスク
CREATE TABLE todo
(id INT AUTO_INCREMENT not null,
user_id INT not null,
chat_room_id INT not null,
task_rep_id INT not null,
task_detail VARCHAR(100) not null,
time_limit datetime  not null,
complete_flag tinyint(1),
created_at datetime not null,
update_user_id INT not null,
updated_at datetime not null,
is_deleted tinyint(1),
PRIMARY KEY(id),
FOREIGN KEY (user_id)
REFERENCES users(id),
FOREIGN KEY (chat_room_id)
REFERENCES chat_room(id),
FOREIGN KEY (task_rep_id)
REFERENCES users(id),
FOREIGN KEY (update_user_id)
REFERENCES users(id)
);
