-- CREATE TABLE customers (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     phone VARCHAR(20)
--     );

CREATE TABLE books 
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (150) not NULL ,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    price DECIMAL(6,2) CHECK (price > 0),
    format ENUM('Paperback', 'Hardcover', 'eBook') NOT NULL,
    stock INT CHECK (stock >= 0),
    genre VARCHAR(50);

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(8,2) CHECK (amount > 0),
    method ENUM('Credit Card', 'PayPal', 'Cash') NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at DATE DEFAULT CURRENT_DATE
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    price DECIMAL(6,2) CHECK (price > 0),
    format ENUM('Paperback', 'Hardcover', 'eBook') NOT NULL,
    stock INT CHECK (stock >= 0),
    genre VARCHAR(50)
);

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE TABLE book_authors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(8,2) CHECK (amount > 0),
    method ENUM('Credit Card', 'PayPal', 'Cash') NOT NULL,
    status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


INSERT INTO customers (name, email, phone) VALUES
('Sara Ali', 'sara@example.com', '01012345678'),
('Omar Youssef', 'omar@example.com', '01098765432');



INSERT INTO books (title, isbn, price, format, stock, genre) VALUES
('The Art of SQL', '9781234567890', 150.00, 'Paperback', 20, 'Technology'),
('Digital Painting Basics', '9780987654321', 200.00, 'eBook', 50, 'Art');



INSERT INTO authors (name, bio) VALUES
('John Smith', 'Expert in databases.'),
('Laila Hassan', 'Digital artist and educator.');


INSERT INTO book_authors (book_id, author_id) VALUES
(1, 1),
(2, 2);


INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2025-09-01', 'Delivered'),
(2, '2025-09-03', 'Pending');

INSERT INTO order_items (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 3);


INSERT INTO payments (order_id, payment_date, amount, method, status) VALUES
(1, '2025-09-01', 450.00, 'Credit Card', 'Completed'),
(2, '2025-09-03', 600.00, 'PayPal', 'Pending');


