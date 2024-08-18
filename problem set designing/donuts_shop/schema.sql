--Union Square Donuts
--Problem to Solve
--Around Boston, Brookline, and Somerville, you might catch sight of Union Square Donuts, a shop famous in the area for its delicious confections. Suppose that Union Square Donuts has been around for a while and, while their paper receipts have worked well so far, they’re hoping for a system to help them handle more customers. In fact, they’ve just hired you to design a database fitting for their shop. In exchange, free donuts? 🍩
--In a file called schema.sql in a folder called donuts, write a set of SQL statements to create a database that Union Square Donuts could use to manage their day-to-day operations.

--Specification
--Your task at hand is to create a SQLite database for Union Square Donuts from scratch, as by writing a set of CREATE TABLE statements in a schema.sql file. The implementation details are up to you, though you should minimally ensure that your database meets the team’s expectations and that it can represent the sample data.

--Expectations
--To understand the team’s expectations for their database, you sat down to talk with them after the shop closed for the day.

--Ingredients
  --We certainly need to keep track of our ingredients. Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar. Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).

-- Table Ingredients
CREATE TABLE ingredients (
    id INTEGER,
    ingredient_name TEXT NOT NULL,
    price_per_pound REAL NOT NULL,
    unit TEXT NOT NULL,
    PRIMARY KEY(id)
);


--Donuts
--We’ll need to include our selection of donuts, past and present! For each donut on the menu, we’d love to include three things:
       -- The name of the donut
       -- Whether the donut is gluten-free
        --The price per donut
-- Oh, and it’s important that we be able to look up the ingredients for each of the donuts!

CREATE TABLE donuts (
    id INTEGER,
    donut_name TEXT NOT NULL,
    gluten_free TEXT NOT NULL,
    price_donut REAL NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE donuts_ingredients (
    id INTEGER,
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

--Orders
--We love to see customers in person, though we realize a good number of people might order online nowadays. We’d love to be able to keep track of those online orders. We think we would need to store:
        --An order number, to keep track of each order internally
        --All the donuts in the order
        --The customer who placed the order. We suppose we could assume only one customer places any given order.
CREATE TABLE orders(
    id INTEGER,
    order_number INTEGER NOT NULL UNIQUE,
    customer_id INTEGER,
    order_date NUMERIC NOT NULL,
    PRIMARY KEY (id)
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE orders_item(
    id INTEGER,
    donut_id INTEGER,
    quantity_order INTEGER NOT NULL,
    PRIMARY KEY (id)
    FOREIGN KEY (donut_id) REFERENCES donuts(id)
);

--Customers
---Oh, and we realize it would be lovely to keep track of some information about each of our customers. We’d love to remember the history of the orders they’ve made. In that case, we think we should store:
        --A customer’s first and last name
        --A history of their orders

CREATE TABLE customers(
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);









