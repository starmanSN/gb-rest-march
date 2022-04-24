DROP TABLE CART_PRODUCT;
DROP TABLE PRODUCT;
DROP TABLE CART;
DROP TABLE MANUFACTURER;

CREATE TABLE MANUFACTURER
(
    ID   BIGSERIAL    NOT NULL PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,

    UNIQUE (NAME)
);

DROP TABLE MANUFACTURER;

CREATE TABLE PRODUCT
(
    ID                 BIGSERIAL      NOT NULL PRIMARY KEY,
    TITLE              VARCHAR(255)   NOT NULL,
    COST               DECIMAL(10, 2) NOT NULL,
    MANUFACTURE_DATE   DATE           NOT NULL,
    VERSION            INT            NOT NULL DEFAULT 0,
    CREATED_BY         VARCHAR(255),
    CREATED_DATE       TIMESTAMP,
    LAST_MODIFIED_BY   VARCHAR(255),
    LAST_MODIFIED_DATE TIMESTAMP,
    STATUS             VARCHAR(20)    NOT NULL DEFAULT 'ACTIVE',
        UNIQUE (TITLE)
);

CREATE TABLE CART
(
    ID     BIGSERIAL NOT NULL PRIMARY KEY,
    STATUS VARCHAR(255) DEFAULT ''
);

CREATE TABLE CART_PRODUCT
(
    CART_ID    BIGINT NOT NULL,
    PRODUCT_ID BIGINT NOT NULL,

    PRIMARY KEY (CART_ID, PRODUCT_ID),

    CONSTRAINT fk_cart_product_cart
        FOREIGN KEY (CART_ID)
            REFERENCES CART (ID),


    CONSTRAINT fk_cart_product_product
        FOREIGN KEY (PRODUCT_ID)
            REFERENCES PRODUCT (ID)
);

SELECT *
FROM cart;

ALTER TABLE PRODUCT
    ADD COLUMN VERSION            INT NOT NULL DEFAULT 0,
    ADD COLUMN CREATED_BY         VARCHAR(255),
    ADD COLUMN CREATED_DATE       TIMESTAMP,
    ADD COLUMN LAST_MODIFIED_BY   VARCHAR(255),
    ADD COLUMN LAST_MODIFIED_DATE TIMESTAMP;

ALTER TABLE PRODUCT
    ADD COLUMN Manufacturer_id bigint;

SELECT *
FROM PRODUCT;-- WHERE ID=106;

delete from product where ID > 0;
delete from cart_product where CART_ID > 0;