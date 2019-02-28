 set names utf8;
set foreign_key_checks=0;
drop database if exists ecsite2;

create database if not exists ecsite2;
use ecsite2;

drop table if exists login_user_transaction;

create table login_user_transaction(
	id int not null primary key auto_increment,
	login_id varchar(16) unique,
	login_pass varchar(16),
	user_name varchar(50),
	admin_flg varchar(1),
	insert_date datetime,
	updated_date datetime
);

drop table if exists item_info_transaction;

create table item_info_transaction(
	id int not null primary key auto_increment,
	item_name varchar(30),
	item_price int,
	item_stock int,
	insert_date datetime,
	update_date datetime
);


drop table if exists user_buy_item_transaction;

create table user_buy_item_transaction(
	id int not null primary key auto_increment,
	item_transaction_id int,
	total_price int,
	total_count int,
	user_master_id varchar(16),
	pay varchar(30),
	insert_date datetime,
	delete_date datetime
);

create table inquiry(
name varchar(255),
qtype varchar(255),
body varchar(255)
);

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
item_price int not null comment "値段",
pay varchar(50) comment "支払い方法",
regist_date DATETIME NOT NULL comment "登録日",
	update_date DATETIME comment "更新日"
);

INSERT INTO item_info_transaction(item_name,item_price,item_stock)VALUES("ノートBook",100,50);
INSERT INTO login_user_transaction(login_id,login_pass,user_name,admin_flg)VALUES("internous","internous01","test","0");
INSERT INTO login_user_transaction(login_id,login_pass,user_name,admin_flg)VALUES("admin","admin","admin","1");