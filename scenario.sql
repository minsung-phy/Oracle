-- 쇼핑몰의 회원은 의류 목록을 보고 주문을 한다.
--- shkang 고객의 경우 모자를 골라 주문을 한다
select * from product_list;
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (1, 5, 1, 'shkangg');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (1, 5, 100, 'shkangg');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (1, 5, 100, 'shkang');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (1, 50, 100, 'shkang');
commit;
select * from order_list;

--- mslee 고객의 경우 티셔츠와 바지를 골라 주문을 한다
select * from product_list;
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (2, 10, 200, 'mslee');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (3, 20, 200, 'mslee');
commit;
select * from order_list;

--- older man 고객의 경우 모자와 양말을 골라 주문을 한다
select * from product_list;
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (4, 30, 300, 'older man');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (5, 50, 300, 'older man');
commit;
select * from order_list;

-- 사장은 주문목록을 확인 후 older man 고객의 물건을 먼저 준비하여 배송 후, 주문 목록의 상태를 변경한다.
select * from order_list;
select * from order_list where ORDER_CUSTOMER_NAME='older man';

update order_list set STATUS='deliverying' where ORDER_CUSTOMER_ID=300;
commit;
select * from order_list;

-- 사장은 주문목록을 확인 후 mslee 고객의 바지를 배송 했는데, 로켓배송이라 바로 배송처리 되었다.
select * from order_list where ORDER_CUSTOMER_NAME='mslee';

select order_list.ORDER_ID, order_list.ORDER_PRODUCT_ID, product_list.PRODUCT_NAME, order_list.ORDER_CUSTOMER_NAME from order_list
join product_list on order_list.ORDER_PRODUCT_ID = product_list.PRODUCT_ID
where ORDER_CUSTOMER_NAME='mslee';

update order_list set STATUS='completed' where ORDER_ID=3;
commit;
select * from order_list where ORDER_CUSTOMER_NAME='mslee';
select * from order_list;

-- 완료된 주문건은 삭제한다.
delete from order_list where STATUS='completed';
commit;
select * from order_list;
