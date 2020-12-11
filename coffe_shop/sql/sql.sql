CREATE TABLE tbl_product_01(
pcode varchar2(10) NOT NULL,
name varchar(20),
cost number(10),
constraint PKPRODUCT PRIMARY KEY(pcode)
);

CREATE TABLE tbl_shop_01(
scode varchar2(10) NOT NULL,
sname varchar(20),
CONSTRAINT PKSHOP PRIMARY KEY(scode)
);

CREATE TABLE tbl_salelist_01(
saleno number(10) NOT NULL,
pcode varchar2(10) NOT NULL,
saledate date,
scode varchar(10) NOT NULL,
amount number(10),
Constraint PKSALELIST PRIMARY KEY(saleno)
);


INSERT INTO tbl_product_01 VALUES('AA01', '아메리카노', 3000);
INSERT INTO tbl_product_01 VALUES('AA02', '에스프레소', 3500);
INSERT INTO tbl_product_01 VALUES('AA03', '카페라떼 ',4000);
INSERT INTO tbl_product_01 VALUES('AA04', '카라멜마끼', 4500);
INSERT INTO tbl_product_01 VALUES('AA05', '카푸치노 ',5000);
INSERT INTO tbl_product_01 VALUES('AA06', '초코롤케익', 6000);
INSERT INTO tbl_product_01 VALUES('AA07', '녹차롤케익', 6500);
INSERT INTO tbl_product_01 VALUES('AA08', '망고쥬스 ',7000);
INSERT INTO tbl_product_01 VALUES('AA09', '핫초코 2',500);
INSERT INTO tbl_shop_01 VALUES('S001','강남점');
INSERT INTO tbl_shop_01 VALUES('S002','강서점');
INSERT INTO tbl_shop_01 VALUES('S003','강동점');
INSERT INTO tbl_shop_01 VALUES('S004','강북점');
INSERT INTO tbl_shop_01 VALUES('S005','동대문점');
INSERT INTO tbl_shop_01 VALUES('S006','인천점');
INSERT INTO tbl_salelist_01 VALUES(100001,'AA01','20180902','S001',50);
INSERT INTO tbl_salelist_01 VALUES(100002,'AA03','20180902','S002',40);
INSERT INTO tbl_salelist_01 VALUES(100003,'AA04','20180902','S002',20);
INSERT INTO tbl_salelist_01 VALUES(100004,'AA04','20180902','S001',30);
INSERT INTO tbl_salelist_01 VALUES(100005,'AA05','20180902','S004',40);
INSERT INTO tbl_salelist_01 VALUES(100006,'AA03','20180902','S004',30);
INSERT INTO tbl_salelist_01 VALUES(100007,'AA01','20180902','S003',40);
INSERT INTO tbl_salelist_01 VALUES(100008,'AA04','20180902','S004',10);
INSERT INTO tbl_salelist_01 VALUES(100009,'AA01','20180902','S003',20);
INSERT INTO tbl_salelist_01 VALUES(100010,'A005','20180902','S003',30);
INSERT INTO tbl_salelist_01 VALUES(100011,'AA01','20180902','S001',40);
INSERT INTO tbl_salelist_01 VALUES(100012,'AA03','20180902','S002',50);
INSERT INTO tbl_salelist_01 VALUES(100013,'AA04','20180902','S002',50);
INSERT INTO tbl_salelist_01 VALUES(100014,'AA05','20180902','S004',20);
INSERT INTO tbl_salelist_01 VALUES(100015,'AA01','20180902','S003',30);

select salelist.saleno, salelist.pcode, salelist.saledate, salelist.scode, product.name, salelist.amount, salelist.amount * product.cost from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode;

SELECT product.pcode, product.name, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode
GROUP BY product.pcode, product.name;

select shop.scode, shop.sname, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
WHERE salelist.pcode = product.pcode
AND shop.scode = salelist.scode
GROUP BY shop.scode, shop.sname
order by shop.scode;

select shop.scode, shop.sname, sum(product.cost * salelist.amount) from tbl_product_01 PRODUCT, tbl_shop_01 SHOP, tbl_salelist_01 SALELIST
				WHERE salelist.pcode = product.pcode
				AND shop.scode = salelist.scode
				GROUP BY shop.scode, shop.sname
				order by shop.scode;

commit;