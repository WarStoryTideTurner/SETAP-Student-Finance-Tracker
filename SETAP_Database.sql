CREATE DATABASE setap;
USE setap;

CREATE TABLE customer (
    cust_id SERIAL PRIMARY KEY,
    reliability INT NOT NULL,
    friendliness INT NOT NULL,
    hygenie INT NOT NULL,
    cust_name VARCHAR(50) NOT NULL,
    cust_surname VARCHAR(50) NOT NULL,
    cust_email VARCHAR(100) NOT NULL,
    cust_phone VARCHAR(15) NOT NULL,
    CHECK (reliability >=1 AND reliability <=5),
    CHECK (friendliness >=1 AND friendliness <=5),
	CHECK (hygenie >=1 AND hygenie <=5)
);

CREATE TABLE inbox (
    inbox_id SERIAL PRIMARY KEY,
    cust_id BIGINT UNSIGNED NOT NULL,
    sender VARCHAR(30) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    message TEXT NOT NULL,
    message_date DATE NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (cust_id)
        REFERENCES customer(cust_id)
);

CREATE TABLE house (
    house_id SERIAL PRIMARY KEY, 
    bedrooms INT NOT NULL,
    available_bedrooms INT NOT NULL,
    toilets INT NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    towncity VARCHAR(50) NOT NULL,
    county VARCHAR(50) NOT NULL,
    postcode VARCHAR(8) NOT NULL,
    house_rules TEXT NOT NULL
);

CREATE TABLE amenity (
    amenity_id SERIAL PRIMARY KEY,
    amenity_name VARCHAR(25) NOT NULL 
);

CREATE TABLE house_amenity (
    house_amenity_id SERIAL PRIMARY KEY,
    house_id BIGINT UNSIGNED NOT NULL,
    amenity_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT fk_house FOREIGN KEY (house_id)
        REFERENCES house(house_id),
    CONSTRAINT fk_amenity FOREIGN KEY (amenity_id)
        REFERENCES amenity(amenity_id)
);

CREATE TABLE cust_house (
    cust_house_id SERIAL PRIMARY KEY,
    cust_id BIGINT UNSIGNED NOT NULL,
    house_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT fk_customer2 FOREIGN KEY (cust_id)
        REFERENCES customer(cust_id),
    CONSTRAINT fk_house2 FOREIGN KEY (house_id)
        REFERENCES house(house_id)
);

CREATE TABLE poi (
    poi_id SERIAL PRIMARY KEY,
    poi_name VARCHAR(50) NOT NULL,
    poi_type CHAR(1) NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50),
    towncity VARCHAR(50) NOT NULL,
    county VARCHAR(50) NOT NULL,
    postcode VARCHAR(8) NOT NULL
);

CREATE TABLE event (
    event_id SERIAL PRIMARY KEY,
    poi_id BIGINT UNSIGNED NOT NULL,
    event_name VARCHAR(50) NOT NULL,
    event_date DATE NOT NULL,
    CONSTRAINT fk_poi FOREIGN KEY (poi_id)
        REFERENCES poi(poi_id)
);

CREATE TABLE event_bill (
    event_bill_id SERIAL PRIMARY KEY,
    event_id BIGINT UNSIGNED NOT NULL,
    description VARCHAR(30),
    event_bill DECIMAL(8,2) NOT NULL,
    event_bill_date DATE NOT NULL,
    CONSTRAINT fk_event FOREIGN KEY (event_id)
        REFERENCES event(event_id)
);

CREATE TABLE payer_payee (
    payer_payee_id SERIAL PRIMARY KEY,
    event_bill_id BIGINT UNSIGNED NOT NULL,
    payer_id BIGINT UNSIGNED NOT NULL,
    payee_id BIGINT UNSIGNED NOT NULL,
    CONSTRAINT fk_event_bill FOREIGN KEY (event_bill_id)
        REFERENCES event_bill(event_bill_id),
    CONSTRAINT fk_payer FOREIGN KEY (payer_id)
        REFERENCES cust_house(cust_house_id),
    CONSTRAINT fk_payee FOREIGN KEY (payee_id)
        REFERENCES cust_house(cust_house_id)
);

CREATE TABLE rent (
    rent_id SERIAL PRIMARY KEY,
    cust_house_id BIGINT UNSIGNED NOT NULL,
    rent_total DECIMAL(8,2) NOT NULL,
    rent_due DATE NOT NULL,
    CONSTRAINT fk_cust_house FOREIGN KEY (cust_house_id)
        REFERENCES cust_house(cust_house_id)
);

CREATE TABLE transaction (
    transaction_id SERIAL PRIMARY KEY,
    cust_house_id BIGINT UNSIGNED NOT NULL,
    payer_payee_id BIGINT UNSIGNED,
    rent_id BIGINT UNSIGNED,
    payment_value DECIMAL(8,2) NOT NULL,
    payment_date DATE NOT NULL,
    CONSTRAINT fk_cust_house2 FOREIGN KEY (cust_house_id)
        REFERENCES cust_house(cust_house_id),
    CONSTRAINT fk_payer_payee FOREIGN KEY (payer_payee_id)
        REFERENCES payer_payee(payer_payee_id),
    CONSTRAINT fk_rent FOREIGN KEY (rent_id)
        REFERENCES rent(rent_id)
);

INSERT INTO customer (reliability, friendliness, hygenie, cust_name, cust_surname,
cust_email, cust_phone)
VALUES 
(3, 4, 2, 'Harold', 'Remus', 'haroldremus@gmail.com', '+446523183721'),
(4, 4, 4, 'Stevey', 'Shipman', 'stevey123@gmail.com', '+447829121890'),
(5, 3, 1, 'Hillary', 'Milton', 'miltonation@gmail.com', '+44891242525'),
(2, 2, 2, 'Gary', 'Linekon', 'garygary@gmail.com', '+444713092476'),
(1, 1, 1, 'Julian', 'Beauty', 'beautyboy@gmail.com', '+448274097087');

INSERT INTO inbox (cust_id, sender, subject, message, message_date)
VALUES
(1, 'System', 'Welcome to the App!', 'Get started by making or joining a house and adding your housemates!', '2023-04-08'),
(2, 'System', 'Welcome to the App!', 'Get started by making or joining a house and adding your housemates!', '2023-04-08'),
(3, 'System', 'Welcome to the App!', 'Get started by making or joining a house and adding your housemates!', '2023-04-08'),
(4, 'System', 'Welcome to the App!', 'Get started by making or joining a house and adding your housemates!', '2023-04-08'),
(5, 'System', 'Welcome to the App!', 'Get started by making or joining a house and adding your housemates!', '2023-04-08');

INSERT INTO house (bedrooms, available_bedrooms, toilets,
address1, address2, towncity, county, postcode, house_rules)
VALUES
(5, 0, 2, '55 Halterton Road', NULL, 'Portsmouth', 'Hampshire', 'PO3 5GB',
'No smoking inside. Do not turn off the boiler. No running in the house'),
(4, 4, 2, '17 Numenor Street', NULL, 'Portsmouth', 'Hampshire', 'PO3 1LP',
'No smoking inside. Do not turn off the boiler. No running in the house'),
(5, 5, 3, '31 Justindale Avenue', NULL, 'Portsmouth', 'Hampshire', 'PO4 8SB',
'No smoking inside. Do not turn off the boiler. No running in the house');

INSERT INTO amenity (amenity_name) 
VALUES
('TV'),
('Garden'),
('Dishwasher'),
('Washing Machine'),
('Dryer'),
('Bath');

INSERT INTO house_amenity (house_id, amenity_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 3),
(2, 6),
(3, 1),
(3, 2),
(3, 4),
(3, 5);

INSERT INTO cust_house (cust_id, house_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

INSERT INTO poi (poi_name, poi_type, address1, address2, towncity, county, postcode)
VALUES
('Sakura Portsmouth', 'R', '9 Albert Road', NULL, 'Portsmouth', 'Hampshire', 'PO5 2SE'),
('Bold Forester', 'P', '177 Albert Road', NULL, 'Portsmouth', 'Hampshire', 'PO4 0JW'),
('7Bone Burger Co. Portsmouth', 'R', '16 Guildhall Walk', NULL, 'Portsmouth', 'Hampshire', 'PO1 2DD'),
('Brewhouse & Kitchen', 'P', '26 Guildhall Walk', NULL, 'Portsmouth', 'Hampshire', 'PO1 2DD'),
('The Astoria', 'C', '37-39 Guildhall Walk', NULL, 'Portsmouth', 'Hampshire', 'PO1 2RY'),
('Tesco Extra', 'S', 'Fratton Way', NULL, 'Portsmouth', 'Hampshire', 'PO4 8FD');

INSERT INTO event (poi_id, event_name, event_date)
VALUES
(2, 'Pub', '2023-04-10'),
(3, 'Burger night', '2023-04-15'),
(1, 'Dinner', '2023-04-25'),
(5, 'Astoria', '2023-04-25'),
(6, 'Shopping', '2023-05-02');

INSERT INTO event_bill (event_id, description, event_bill, event_bill_date)
VALUES
(1, 'Couple drinks', 10, '2023-04-10'),

(2, 'Burger payment', 30, '2023-04-15'),

(3, 'Equal sushi repay', 120, '2023-04-25'),

(4, 'Jagerbomb', 2.50, '2023-04-25'),
(4, 'Jagerbomb', 2.50, '2023-04-25'),
(4, 'Whiskey and coke', 10, '2023-04-26'),
(4, 'Uber', 20, '2023-04-26'),

(5, 'Tesco equal', 100, '2023-05-02');

INSERT INTO payer_payee (event_bill_id, payer_id, payee_id)
VALUES
(1, 1, 2),
(2, 3, 1),
(2, 3, 2),
(3, 4, 1),
(3, 4, 2),
(3, 4, 3),
(3, 4, 5),
(4, 2, 4),
(5, 2, 3),
(6, 5, 1),
(7, 2, 1),
(7, 2, 3),
(7, 2, 4),
(7, 2, 5),
(8, 1, 2),
(8, 1, 3),
(8, 1, 4),
(8, 1, 5);

INSERT INTO rent (cust_house_id, rent_total, rent_due)
VALUES
(1, 1800, '2023-05-10'),
(2, 1800, '2023-05-10'),
(3, 1800, '2023-05-10'),
(4, 1800, '2023-05-10'),
(5, 1800, '2023-05-10');

INSERT INTO transaction (cust_house_id, payer_payee_id, rent_id, payment_value, payment_date)
VALUES
(2, 1, NULL, 10, '2023-04-10'),
(1, 2, NULL, 15, '2023-04-16'),
(2, 3, NULL, 15, '2023-04-20'),
(1, 4, NULL, 30, '2023-04-26'),
(2, 5, NULL, 30, '2023-04-26'),
(1, 10, NULL, 10, '2023-04-26'),
(1, 11, NULL, 5, '2023-04-26'),
(2, NULL, 2, 1800, '2023-04-28'),
(3, NULL, 3, 1800, '2023-04-28'),
(3, 6, NULL, 30, '2023-04-28'),
(3, 9, NULL, 2.50, '2023-04-28'),
(3, 12, NULL, 5, '2023-04-28'),
(5, 7, NULL, 30, '2023-04-30'),
(4, NULL, 4, 1800, '2023-04-30'),
(5, 14, NULL, 5, '2023-04-30'),
(2, 15, NULL, 25, '2023-05-02'),
(3, 16, NULL, 25, '2023-05-02'),
(1, NULL, 1, 1800, '2023-05-02'),
(4, 8, NULL, 2.50, '2023-05-02'), 
(4, 17, NULL, 25, '2023-05-02'),
(4, 13, NULL, 5, '2023-05-02'),
(5, 18, NULL, 25, '2023-05-05'),
(5, NULL, 5, 1800, '2023-05-05');