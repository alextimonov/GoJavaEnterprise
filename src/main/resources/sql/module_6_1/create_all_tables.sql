
CREATE SEQUENCE employee_id;
CREATE SEQUENCE dish_id;
CREATE SEQUENCE ingr_to_dish_id;
CREATE SEQUENCE ingredient_id;
CREATE SEQUENCE jobs_id;
CREATE SEQUENCE menu_id;
CREATE SEQUENCE orders_id;
CREATE SEQUENCE cooked_dish_id;

CREATE TABLE INGREDIENT(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('ingredient_id'),
  name VARCHAR(20) UNIQUE CONSTRAINT unique_ingredient_name NOT NULL,
  amount INT NOT NULL
);

CREATE TABLE DISH(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('dish_id'),
  name VARCHAR(20) UNIQUE CONSTRAINT unique_dish_name NOT NULL,
  description VARCHAR(50),
  cost REAL NOT NULL,
  weight int
);

CREATE TABLE INGREDIENT_TO_DISH(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('dish_id'),
  dish_id INT NOT NULL REFERENCES DISH(id),
  ingredient_id INT NOT NULL REFERENCES INGREDIENT(id),
  weight INT
);

CREATE TABLE MENU(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('menu_id'),
  name VARCHAR(20) UNIQUE CONSTRAINT unique_menu_name NOT NULL
);

CREATE TABLE DISH_TO_MENU(
  menu_id INT NOT NULL REFERENCES MENU(id),
  dish_id INT NOT NULL REFERENCES DISH(id)
);

CREATE TABLE JOBS(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('jobs_id'),
  position VARCHAR(20)
);

CREATE TABLE EMPLOYEE(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('employee_id'),
  surname VARCHAR(20) NOT NULL,
  name VARCHAR(20) NOT NULL,
  birthday DATE NOT NULL,
  position_id INT REFERENCES JOBS(id),
  salary REAL,
  dtype CHARACTER VARYING
);

CREATE TABLE ORDERS(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('orders_id'),
  employee_id INT NOT NULL REFERENCES EMPLOYEE(id),
  table_number INT,
  date DATE NOT NULL,
  closed BOOLEAN
);

CREATE TABLE DISH_TO_ORDERS(
  order_id INT NOT NULL REFERENCES ORDERS(id),
  dish_id INT NOT NULL REFERENCES DISH(id)
);

ALTER TABLE DISH_TO_ORDERS ADD CONSTRAINT dish_to_orders_pkey PRIMARY KEY(order_id, dish_id);

CREATE TABLE COOKED_DISH(
  id INT PRIMARY KEY NOT NULL DEFAULT nextval('cooked_dish_id'),
  order_id INT REFERENCES ORDERS(id),
  menu_dish_id INT REFERENCES DISH(id),
  cook_id INT REFERENCES EMPLOYEE(id)
);


