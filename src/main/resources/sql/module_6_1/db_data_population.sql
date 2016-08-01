INSERT INTO JOBS VALUES(1, 'director');
INSERT INTO JOBS VALUES(2, 'manager');
INSERT INTO JOBS VALUES(3, 'cook');
INSERT INTO JOBS VALUES(4, 'cook assistant');
INSERT INTO JOBS VALUES(5, 'headwaiter');
INSERT INTO JOBS VALUES(6, 'waiter');
INSERT INTO JOBS VALUES(7, 'cleaner');


INSERT INTO EMPLOYEE VALUES(1, 'White', 'Davis', '1965-06-20', 1, 90000.0);
INSERT INTO EMPLOYEE VALUES(2, 'Black', 'Sarah', '1975-09-10', 2, 75000.0);
INSERT INTO EMPLOYEE VALUES(3, 'Green', 'Piter', '1980-10-05', 3, 60000.0);
INSERT INTO EMPLOYEE VALUES(4, 'Brown', 'Stiven', '1985-08-08', 4, 50000.0);
INSERT INTO EMPLOYEE VALUES(5, 'Gray', 'Stew', '1990-09-10', 6, 40000.0);
INSERT INTO EMPLOYEE VALUES(6, 'Orange', 'John', '1995-10-23', 6, 40000.0);
INSERT INTO EMPLOYEE VALUES(7, 'Red', 'Marion', '1997-11-25', 7, 30000.0);


INSERT INTO INGREDIENT VALUES(1, 'potato');
INSERT INTO INGREDIENT VALUES(2, 'beef');
INSERT INTO INGREDIENT VALUES(3, 'chicken egg');
INSERT INTO INGREDIENT VALUES(4, 'butter');
INSERT INTO INGREDIENT VALUES(5, 'sunflower oil');
INSERT INTO INGREDIENT VALUES(6, 'salt');
INSERT INTO INGREDIENT VALUES(7, 'chicken');
INSERT INTO INGREDIENT VALUES(8, 'pasta');
INSERT INTO INGREDIENT VALUES(9, 'water');
INSERT INTO INGREDIENT VALUES(10, 'dill');
INSERT INTO INGREDIENT VALUES(11, 'parsley');
INSERT INTO INGREDIENT VALUES(12, 'onion');
INSERT INTO INGREDIENT VALUES(13, 'flour');
INSERT INTO INGREDIENT VALUES(14, 'sour cream');
INSERT INTO INGREDIENT VALUES(15, 'tomato paste');
INSERT INTO INGREDIENT VALUES(16, 'lettuce');
INSERT INTO INGREDIENT VALUES(17, 'cabbage');
INSERT INTO INGREDIENT VALUES(18, 'tomato');
INSERT INTO INGREDIENT VALUES(19, 'cucumber');
INSERT INTO INGREDIENT VALUES(20, 'basil');
INSERT INTO INGREDIENT VALUES(21, 'sesame');
INSERT INTO INGREDIENT VALUES(22, 'carrots');
INSERT INTO INGREDIENT VALUES(23, 'mayonnaise');


INSERT INTO STORAGE VALUES(1, 50000);
INSERT INTO STORAGE VALUES(2, 30000);
INSERT INTO STORAGE VALUES(3, 50);
INSERT INTO STORAGE VALUES(4, 2000);
INSERT INTO STORAGE VALUES(5, 5000);
INSERT INTO STORAGE VALUES(6, 3000);
INSERT INTO STORAGE VALUES(7, 20000);
INSERT INTO STORAGE VALUES(8, 10000);
INSERT INTO STORAGE VALUES(9, 25000);
INSERT INTO STORAGE VALUES(10, 400);
INSERT INTO STORAGE VALUES(11, 400);
INSERT INTO STORAGE VALUES(12, 3000);
INSERT INTO STORAGE VALUES(13, 5000);
INSERT INTO STORAGE VALUES(14, 2000);
INSERT INTO STORAGE VALUES(15, 2000);
INSERT INTO STORAGE VALUES(16, 1500);
INSERT INTO STORAGE VALUES(17, 5000);
INSERT INTO STORAGE VALUES(18, 7000);
INSERT INTO STORAGE VALUES(19, 8000);
INSERT INTO STORAGE VALUES(20, 400);
INSERT INTO STORAGE VALUES(21, 300);
INSERT INTO STORAGE VALUES(22, 5000);
INSERT INTO STORAGE VALUES(23, 3000);


INSERT INTO DISH VALUES(1, 'steak', 'nutritious dish, rich in protein', 65, 400);
INSERT INTO DISH VALUES(2, 'chicken broth', 'first dish', 30, 300);
INSERT INTO DISH VALUES(3, 'beef Stroganoff', 'meat dish on the classic recipe', 80, 350);
INSERT INTO DISH VALUES(4, 'fries', 'fried potato', 30, 350);
INSERT INTO DISH VALUES(5, 'spring breeze salad', 'light salad with delicious vegetables', 55, 250);
INSERT INTO DISH VALUES(6, 'olivier', 'salad on the classic recipe', 65, 400);


INSERT INTO MENU VALUES(1, 'summer');
INSERT INTO MENU VALUES(2, 'winter');


INSERT INTO DISH_TO_MENU VALUES(1, 1, 2);
INSERT INTO DISH_TO_MENU VALUES(2, 1, 3);
INSERT INTO DISH_TO_MENU VALUES(3, 1, 4);
INSERT INTO DISH_TO_MENU VALUES(4, 1, 5);

INSERT INTO DISH_TO_MENU VALUES(5, 2, 1);
INSERT INTO DISH_TO_MENU VALUES(6, 2, 2);
INSERT INTO DISH_TO_MENU VALUES(7, 2, 4);
INSERT INTO DISH_TO_MENU VALUES(8, 2, 6);


INSERT INTO INGREDIENT_TO_DISH VALUES(1, 1, 1, 300);
INSERT INTO INGREDIENT_TO_DISH VALUES(2, 1, 2, 200);
INSERT INTO INGREDIENT_TO_DISH VALUES(3, 1, 3, 1);
INSERT INTO INGREDIENT_TO_DISH VALUES(4, 1, 4, 30);
INSERT INTO INGREDIENT_TO_DISH VALUES(5, 1, 5, 20);
INSERT INTO INGREDIENT_TO_DISH VALUES(6, 1, 6, 10);

INSERT INTO INGREDIENT_TO_DISH VALUES(7, 2, 7, 300);
INSERT INTO INGREDIENT_TO_DISH VALUES(8, 2, 8, 50);
INSERT INTO INGREDIENT_TO_DISH VALUES(9, 2, 9, 200);
INSERT INTO INGREDIENT_TO_DISH VALUES(10, 2, 10, 10);
INSERT INTO INGREDIENT_TO_DISH VALUES(11, 2, 11, 10);
INSERT INTO INGREDIENT_TO_DISH VALUES(12, 2, 6, 5);

INSERT INTO INGREDIENT_TO_DISH VALUES(13, 3, 2, 400);
INSERT INTO INGREDIENT_TO_DISH VALUES(14, 3, 12, 100);
INSERT INTO INGREDIENT_TO_DISH VALUES(15, 3, 13, 25);
INSERT INTO INGREDIENT_TO_DISH VALUES(16, 3, 14, 30);
INSERT INTO INGREDIENT_TO_DISH VALUES(17, 3, 15, 30);
INSERT INTO INGREDIENT_TO_DISH VALUES(18, 3, 5, 50);
INSERT INTO INGREDIENT_TO_DISH VALUES(19, 3, 6, 5);

INSERT INTO INGREDIENT_TO_DISH VALUES(20, 4, 1, 300);
INSERT INTO INGREDIENT_TO_DISH VALUES(21, 4, 6, 10);
INSERT INTO INGREDIENT_TO_DISH VALUES(22, 4, 5, 500);

INSERT INTO INGREDIENT_TO_DISH VALUES(23, 5, 16, 100);
INSERT INTO INGREDIENT_TO_DISH VALUES(24, 5, 17, 50);
INSERT INTO INGREDIENT_TO_DISH VALUES(25, 5, 18, 50);
INSERT INTO INGREDIENT_TO_DISH VALUES(26, 5, 19, 50);
INSERT INTO INGREDIENT_TO_DISH VALUES(27, 5, 20, 20);
INSERT INTO INGREDIENT_TO_DISH VALUES(28, 5, 5, 30);
INSERT INTO INGREDIENT_TO_DISH VALUES(29, 5, 6, 5);
INSERT INTO INGREDIENT_TO_DISH VALUES(30, 5, 21, 5);

INSERT INTO INGREDIENT_TO_DISH VALUES(31, 6, 1, 60);
INSERT INTO INGREDIENT_TO_DISH VALUES(32, 6, 7, 60);
INSERT INTO INGREDIENT_TO_DISH VALUES(33, 6, 3, 1);
INSERT INTO INGREDIENT_TO_DISH VALUES(34, 6, 19, 60);
INSERT INTO INGREDIENT_TO_DISH VALUES(35, 6, 22, 40);
INSERT INTO INGREDIENT_TO_DISH VALUES(36, 6, 23, 20);
INSERT INTO INGREDIENT_TO_DISH VALUES(37, 6, 6, 5);


INSERT INTO ORDERING VALUES(1, 5, 2, '2015-07-01');
INSERT INTO ORDERING VALUES(2, 5, 3, '2015-07-02');
INSERT INTO ORDERING VALUES(3, 6, 1, '2015-07-02');
INSERT INTO ORDERING VALUES(4, 5, 4, '2015-07-03');
INSERT INTO ORDERING VALUES(5, 6, 2, '2015-07-03');
INSERT INTO ORDERING VALUES(6, 6, 3, '2015-07-04');

UPDATE ordering SET closed = true WHERE id <= 3;
UPDATE ordering SET closed = false WHERE id > 3;


INSERT INTO DISH_TO_ORDERING VALUES(1, 1, 1);
INSERT INTO DISH_TO_ORDERING VALUES(2, 1, 2);
INSERT INTO DISH_TO_ORDERING VALUES(3, 1, 3);

INSERT INTO DISH_TO_ORDERING VALUES(4, 2, 2);
INSERT INTO DISH_TO_ORDERING VALUES(5, 2, 4);
INSERT INTO DISH_TO_ORDERING VALUES(6, 2, 5);
INSERT INTO DISH_TO_ORDERING VALUES(7, 2, 6);

INSERT INTO DISH_TO_ORDERING VALUES(8, 3, 2);
INSERT INTO DISH_TO_ORDERING VALUES(9, 3, 3);
INSERT INTO DISH_TO_ORDERING VALUES(10, 3, 4);

INSERT INTO DISH_TO_ORDERING VALUES(11, 4, 4);
INSERT INTO DISH_TO_ORDERING VALUES(12, 4, 5);

INSERT INTO DISH_TO_ORDERING VALUES(13, 5, 4);
INSERT INTO DISH_TO_ORDERING VALUES(14, 5, 6);

INSERT INTO DISH_TO_ORDERING VALUES(15, 6, 3);
INSERT INTO DISH_TO_ORDERING VALUES(16, 6, 4);
INSERT INTO DISH_TO_ORDERING VALUES(17, 6, 5);
INSERT INTO DISH_TO_ORDERING VALUES(18, 6, 6);


INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES(1, 1, 3);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES(2, 2, 3);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES(3, 3, 4);

INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES  (4, 4, 3);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cancelled) VALUES(5, 5, TRUE);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cancelled) VALUES(6, 6, TRUE);


INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (7, 8,  3);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (8, 9,  4);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (9, 10, 4);

INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES(10, 11, 3);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES(11, 12, 3);

INSERT INTO COOKED_DISH (id, ordered_dish_id, cancelled) VALUES(12, 13, TRUE);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cancelled) VALUES(13, 14, TRUE);

INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (14, 15, 4);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (15, 16, 4);
INSERT INTO COOKED_DISH (id, ordered_dish_id, cook_id) VALUES (16, 18, 3);
