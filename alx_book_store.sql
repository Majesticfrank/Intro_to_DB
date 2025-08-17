-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- AUTHORS TABLE
CREATE TABLE `alx_book_store`.Authors (
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL,
  PRIMARY KEY (`author_id`)
);

-- CUSTOMERS TABLE
CREATE TABLE `alx_book_store`.`Customers` (
  customer_id INT NOT NULL AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL,
  address TEXT,
  PRIMARY KEY (`customer_id`)
);

-- BOOKS TABLE
CREATE TABLE `alx_book_store`.`Books` (
  book_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NULL,
  publication_date DATE NULL,
  PRIMARY KEY (`book_id`),
  INDEX `author_id_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `alx_book_store`.`authors` (`author_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- ORDERS TABLE
CREATE TABLE `alx_book_store`.`Orders` (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customers`
   FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- ORDER DETAILS TABLE
CREATE TABLE `alx_book_store`. Order_details (
  orderdetailid INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `book_id_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_orderdetails_orders`
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orderdetails_books`
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);