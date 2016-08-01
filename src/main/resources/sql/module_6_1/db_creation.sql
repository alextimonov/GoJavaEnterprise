
CREATE TABLE INGREDIENT(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE DISH(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(20) NOT NULL,
  description VARCHAR(50),
  cost REAL NOT NULL,
  weight int
);

CREATE TABLE INGREDIENT_TO_DISH(
  id INT PRIMARY KEY NOT NULL,
  dish_id INT NOT NULL REFERENCES DISH(id),
  ingredient_id INT NOT NULL REFERENCES INGREDIENT(id),
  weight INT
);

CREATE TABLE MENU(
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(20) NOT NULL
);

CREATE TABLE DISH_TO_MENU(
  id INT PRIMARY KEY NOT NULL,
  menu_id INT NOT NULL REFERENCES MENU(id),
  dish_id INT NOT NULL REFERENCES DISH(id)
);


CREATE TABLE STORAGE(
  ingredient_id INT NOT NULL REFERENCES INGREDIENT(id),
  amount INT
);

CREATE TABLE JOBS(
  id INT PRIMARY KEY NOT NULL,
  position VARCHAR(20)
);

CREATE TABLE EMPLOYEE(
  id INT PRIMARY KEY NOT NULL,
  surname VARCHAR(20) NOT NULL,
  name VARCHAR(20) NOT NULL,
  birthday DATE NOT NULL,
  position_id INT REFERENCES JOBS(id),
  salary REAL
);

CREATE TABLE ORDERING(
  id INT PRIMARY KEY NOT NULL,
  employee_id INT NOT NULL REFERENCES EMPLOYEE(id),
  table_number INT,
  date DATE NOT NULL
);
ALTER TABLE ORDERING ADD closed BOOLEAN;

CREATE TABLE DISH_TO_ORDERING(
  id INT PRIMARY KEY NOT NULL,
  order_id INT NOT NULL REFERENCES ORDERING(id),
  dish_id INT NOT NULL REFERENCES DISH(id)
);

CREATE TABLE COOKED_DISH(
  id INT PRIMARY KEY NOT NULL,
  ordered_dish_id INT NOT NULL REFERENCES DISH_TO_ORDERING(id),
  cook_id INT REFERENCES EMPLOYEE(id),
  cancelled BOOLEAN
);
