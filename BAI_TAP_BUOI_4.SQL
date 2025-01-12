
-- Tạo bảng người dùng
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng nhà hàng
CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng đơn hàng
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Tạo bảng like
CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    like_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Tạo bảng đánh giá
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Thêm dữ liệu mẫu vào bảng users
INSERT INTO users (name, email) VALUES
('Nguyen Van A', 'a@gmail.com'),
('Tran Thi B', 'b@gmail.com'),
('Le Van C', 'c@gmail.com'),
('Hoang Thi D', 'd@gmail.com'),
('Pham Van E', 'e@gmail.com');

-- Thêm dữ liệu mẫu vào bảng restaurants
INSERT INTO restaurants (name, location) VALUES
('Pizza Hut', 'Hanoi'),
('KFC', 'Ho Chi Minh City'),
('Lotteria', 'Da Nang'),
('Highlands Coffee', 'Can Tho'),
('Starbucks', 'Hue');

-- Thêm dữ liệu mẫu vào bảng orders
INSERT INTO orders (user_id, restaurant_id, amount) VALUES
(1, 1, 200.00),
(2, 1, 150.00),
(1, 2, 300.00),
(3, 3, 100.00),
(4, 2, 250.00),
(5, 4, 400.00);

-- Thêm dữ liệu mẫu vào bảng likes
INSERT INTO likes (user_id, restaurant_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 4),
(5, 5);

-- Thêm dữ liệu mẫu vào bảng reviews
INSERT INTO reviews (user_id, restaurant_id, rating, comment) VALUES
(1, 1, 5, 'Great food!'),
(2, 1, 4, 'Nice place'),
(3, 3, 3, 'Average service'),
(4, 4, 5, 'Excellent coffee'),
(5, 5, 4, 'Good ambiance');

-- CÂU 1: Tìm 5 người đã like nhà hàng nhiều nhất
SELECT user_id, COUNT(*) AS total_likes
FROM likes
GROUP BY user_id
ORDER BY total_likes DESC
LIMIT 5;

-- CÂU 2: Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT restaurant_id, COUNT(*) AS total_likes
FROM likes
GROUP BY restaurant_id
ORDER BY total_likes DESC
LIMIT 2;

-- CÂU 3: Tìm người đã đặt hàng nhiều nhất
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 1;

-- CÂU 4: Tìm người dùng không hoạt động trong hệ thống
SELECT users.user_id, users.name
FROM users
LEFT JOIN orders ON users.user_id = orders.user_id
LEFT JOIN likes ON users.user_id = likes.user_id
LEFT JOIN reviews ON users.user_id = reviews.user_id
WHERE orders.user_id IS NULL 
  AND likes.user_id IS NULL 
  AND reviews.user_id IS NULL;
