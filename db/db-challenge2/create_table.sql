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
is_deleted tinyint(1) default 0 not null,
PRIMARY KEY(id)
 );

-- チャットルーム
CREATE TABLE chat_rooms
(id INT AUTO_INCREMENT not null,
create_user_id INT not null,
chat_name VARCHAR(100) not null,
chat_description VARCHAR(1000),
file_send_permit_flag tinyint(1) default TRUE not null,
direct_chat_flag tinyint(1) default 0 not null,
created_at datetime not null,
update_user_id INT not null,
updated_at datetime not null,
is_deleted tinyint(1) default 0 not null,
PRIMARY KEY(id),
FOREIGN KEY (create_user_id)
REFERENCES users (id),
FOREIGN KEY (update_user_id)
REFERENCES users (id)
);

-- チャット接続
CREATE TABLE chat_connections
(id INT AUTO_INCREMENT not null,
user_id INT not null,
chat_room_id INT not null,
created_at datetime not null,
PRIMARY KEY(id),
FOREIGN KEY (user_id)
REFERENCES users (id),
FOREIGN KEY (chat_room_id)
REFERENCES chat_rooms(id)
);

-- 投稿
CREATE TABLE posts
(id INT AUTO_INCREMENT not null,
create_user_id INT not null,
chat_room_id INT not null,
attachment_name VARCHAR(100) not null,
post_content VARCHAR(1000) not null,
post_time datetime not null,
update_user_id INT not null,
updated_at datetime not null,
is_deleted tinyint(1) default 0 not null,
PRIMARY KEY(id),
FOREIGN KEY (create_user_id)
REFERENCES users (id),
FOREIGN KEY (chat_room_id)
REFERENCES chat_rooms(id),
FOREIGN KEY (update_user_id)
REFERENCES users (id)	
);

-- タスク
CREATE TABLE tasks
(id INT AUTO_INCREMENT not null,
create_user_id INT not null,
chat_room_id INT not null,
task_rep_id INT not null,
task_detail VARCHAR(1000) not null,
time_limit datetime  not null,
complete_flag tinyint(1) default 0 not null,
created_at datetime not null,
update_user_id INT not null,
updated_at datetime not null,
is_deleted tinyint(1) default 0 not null,
PRIMARY KEY(id),
FOREIGN KEY (create_user_id)
REFERENCES users(id),
FOREIGN KEY (chat_room_id)
REFERENCES chat_rooms(id),
FOREIGN KEY (task_rep_id)
REFERENCES users(id),
FOREIGN KEY (update_user_id)
REFERENCES users(id)
);
