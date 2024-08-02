drop table order_list purge;
drop table customer_list purge;
drop table product_list purge;

create table product_list (
product_id number primary key,
product_name varchar2(30) not null,
description varchar2(100)
);
create table customer_list (
customer_id number,
customer_name varchar2(20),
age number
);
alter table customer_list add constraint pk_customer_list primary key(customer_id, customer_name);
create table order_list (
order_id number primary key,
order_product_id number,
order_customer_id number,
order_customer_name varchar2(30),
status varchar2(30) default 'prepare' not null
);
alter table order_list add constraint fk_product_list
foreign key (order_product_id) references product_list (product_id);
alter table order_list add constraint fk_customer_list
foreign key (order_customer_id, order_customer_name) references customer_list (customer_id, customer_name);
