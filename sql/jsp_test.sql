CREATE TABLE product (
    product_id number(10) NOT NULL,
    name varchar2(40),
    price number(10),
    category_id number(10) NOT NULL,
    
    CONSTRAINT PK_PRODUCT PRIMARY KEY (product_id)
);
CREATE TABLE category(
    category_id number(10) NOT NULL,
    name varchar2(20),
    CONSTRAINT PK_CATEGORY PRIMARY KEY (category_id)
);

CREATE TABLE sale(
    sale_id number(10) NOT NULL,
    product_id number(10) NOT NULL,
    purchase_date date,
    sale_price number(10) NOT NULL,
    amount number(5) NOT NULL,
    CONSTRAINT PK_SALE PRIMARY KEY (sale_id)
);

INSERT INTO product VALUES('1', '컴퓨터', 1000000,'1');
INSERT INTO product VALUES('2', '태블릿PC', 800000,'1');
INSERT INTO product VALUES('3', '핸드폰', 1200000,'1');
INSERT INTO product VALUES('4', '헤드셋', 80000,'1');
INSERT INTO product VALUES('5', '무선 이어폰', 210000,'1');
INSERT INTO product VALUES('6', '책상', 160000,'2');
INSERT INTO product VALUES('7', '의자', 90000,'2');
INSERT INTO product VALUES('8', '소고기', 12000,'3');
INSERT INTO product VALUES('9', '티셔츠', 58000,'4');

INSERT INTO category VALUES('1', '전자제품');
INSERT INTO category VALUES('2', '가구');
INSERT INTO category VALUES('3', '식품');
INSERT INTO category VALUES('4', '의류');

INSERT INTO sale VALUES('1', '1', 20200101,'1000000','1');
INSERT INTO sale VALUES('2', '2', 20200101,'1600000','2');
INSERT INTO sale VALUES('3', '1', 20200101,'2000000','2');
INSERT INTO sale VALUES('4', '4', 20200102,'240000','3');
INSERT INTO sale VALUES('5', '5', 20200104,'210000','1');
INSERT INTO sale VALUES('6', '6', 20200106,'320000','2');
INSERT INTO sale VALUES('7', '7', 20200111,'360000','4');
INSERT INTO sale VALUES('8', '8', 20200115,'60000','5');
INSERT INTO sale VALUES('9', '9', 20200117,'58000','1');
INSERT INTO sale VALUES('10', '9',20200120,'580000','10');
INSERT INTO sale VALUES('11', '2',20200121,'1600000','2');
INSERT INTO sale VALUES('12', '1',20200122,'1000000','1');
INSERT INTO sale VALUES('13', '4',20200124,'80000','1');
INSERT INTO sale VALUES('14', '5',20200126,'210000','1');
INSERT INTO sale VALUES('15', '6',20200129,'160000','1');

