-- ���θ��� ȸ���� �Ƿ� ����� ���� �ֹ��� �Ѵ�.
--- shkang ���� ��� ���ڸ� ��� �ֹ��� �Ѵ�
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

--- mslee ���� ��� Ƽ������ ������ ��� �ֹ��� �Ѵ�
select * from product_list;
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (2, 10, 200, 'mslee');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (3, 20, 200, 'mslee');
commit;
select * from order_list;

--- older man ���� ��� ���ڿ� �縻�� ��� �ֹ��� �Ѵ�
select * from product_list;
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (4, 30, 300, 'older man');
insert into order_list (order_id, order_product_id, order_customer_id, order_customer_name)
values (5, 50, 300, 'older man');
commit;
select * from order_list;

-- ������ �ֹ������ Ȯ�� �� older man ���� ������ ���� �غ��Ͽ� ��� ��, �ֹ� ����� ���¸� �����Ѵ�.
select * from order_list;
select * from order_list where ORDER_CUSTOMER_NAME='older man';

update order_list set STATUS='deliverying' where ORDER_CUSTOMER_ID=300;
commit;
select * from order_list;

-- ������ �ֹ������ Ȯ�� �� mslee ���� ������ ��� �ߴµ�, ���Ϲ���̶� �ٷ� ���ó�� �Ǿ���.
select * from order_list where ORDER_CUSTOMER_NAME='mslee';

select order_list.ORDER_ID, order_list.ORDER_PRODUCT_ID, product_list.PRODUCT_NAME, order_list.ORDER_CUSTOMER_NAME from order_list
join product_list on order_list.ORDER_PRODUCT_ID = product_list.PRODUCT_ID
where ORDER_CUSTOMER_NAME='mslee';

update order_list set STATUS='completed' where ORDER_ID=3;
commit;
select * from order_list where ORDER_CUSTOMER_NAME='mslee';
select * from order_list;

-- �Ϸ�� �ֹ����� �����Ѵ�.
delete from order_list where STATUS='completed';
commit;
select * from order_list;
