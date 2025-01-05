-- -- Cách 1: tao databse trực tiếp từ tablePlus
-- Comment: Ctrl + ?
-- Chạy code: ctrl + enter
-- Cách 2: tạo databse từ code SQL
CREATE DATABASE node48_test
-- chỉ tạo database 1 lần
-- để dụng database mới tạo thì dùng use
USE node48_test
-- tạo table
-- kiểu dự liệu: 3 loại chính
-- 1. NUMBER
-- 2. SUBSTRING
-- 3. date, time
-- CREATE TABLE product (
-- -- <tên COLUMN> <kiểu dữ liệu> <CONSTRAINT>
-- product_name VARCHAR(100) NOT NULL,
-- image VARCHAR(255),
-- price DOUBLE,
-- rate INT
-- )

CREATE TABLE product (
    product_name VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    price DOUBLE,
    rate INT
);


--tạo data cho product, dùng AI nhé
INSERT INTO product (product_name, image, price, rate) VALUES
('Smartphone XYZ', 'images/smartphone_xyz.jpg', 899.99, 4),
('Laptop Pro 15', 'images/laptop_pro_15.jpg', 1299.49, 5),
('Wireless Earbuds', 'images/wireless_earbuds.jpg', 149.95, 4),
('Smart TV 50"', 'images/smart_tv_50.jpg', 599.99, 5),
('Gaming Mouse', 'images/gaming_mouse.jpg', 59.99, 4),
('Mechanical Keyboard', 'images/mechanical_keyboard.jpg', 109.99, 4),
('Fitness Tracker', 'images/fitness_tracker.jpg', 89.99, 3),
('Tablet Gen 10', 'images/tablet_gen_10.jpg', 329.99, 4),
('Bluetooth Speaker', 'images/bluetooth_speaker.jpg', 79.99, 5),
('Digital Camera', 'images/digital_camera.jpg', 450.00, 4),
('Gaming Chair', 'images/gaming_chair.jpg', 220.00, 4),
('Smartwatch Classic', 'images/smartwatch_classic.jpg', 199.99, 4),
('4K Action Camera', 'images/4k_action_camera.jpg', 300.00, 5),
('Portable Power Bank', 'images/portable_power_bank.jpg', 39.99, 3),
('Noise-Canceling Headphones', 'images/noise_canceling_headphones.jpg', 199.95, 4),
('Electric Scooter', 'images/electric_scooter.jpg', 499.99, 5),
('Home Security Camera', 'images/home_security_camera.jpg', 149.99, 4),
('Drone X500', 'images/drone_x500.jpg', 799.99, 5),
('LED Desk Lamp', 'images/led_desk_lamp.jpg', 29.99, 4),
('Portable Air Purifier', 'images/portable_air_purifier.jpg', 89.95, 4);




-- dùng code SQL để query data

SELECT * FROM product
SELECT product_name, image FROM product
-- AS: đổi tên column mỗi lần lấ ydữ liệu, tên column trong table vẫn giữ nguyên
SELECT product_name AS 'TÊN SẢN PHẨM' FROM product
-- *: lấy hết tất cả column trong table đó


-- tạo table users (
-- full_name,
-- email,
-- phone,
-- address,
-- age)

CREATE TABLE users (
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    age INT
);

INSERT INTO users (full_name, email, phone, address, age) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street, Springfield', 28),
('Jane Smith', 'jane.smith@example.com', '456-789-1234', '456 Oak Avenue, Springfield', 32),
('Michael Brown', 'michael.brown@example.com', '789-123-4567', '789 Pine Lane, Metropolis', 40),
('Emily Davis', 'emily.davis@example.com', '321-654-9870', '321 Maple Drive, Gotham', 25),
('Daniel Wilson', 'daniel.wilson@example.com', '654-987-3210', '654 Birch Way, Star City', 30),
('Sophia Johnson', 'sophia.johnson@example.com', '987-321-6540', '987 Cedar Boulevard, Central City', 27),
('Ethan Lee', 'ethan.lee@example.com', '111-222-3333', '111 Willow Crescent, Coast City', 35),
('Olivia Martinez', 'olivia.martinez@example.com', '222-333-4444', '222 Cherry Court, Smallville', 29),
('William Taylor', 'william.taylor@example.com', '333-444-5555', '333 Magnolia Road, Hill Valley', 38),
('Isabella Moore', 'isabella.moore@example.com', '444-555-6666', '444 Aspen Circle, Riverdale', 26),
('James Anderson', 'james.anderson@example.com', '555-666-7777', '555 Redwood Terrace, Sunnydale', 45),
('Mia Thomas', 'mia.thomas@example.com', '666-777-8888', '666 Laurel Street, Emerald City', 24),
('Alexander White', 'alexander.white@example.com', '777-888-9999', '777 Dogwood Lane, Springfield', 33),
('Charlotte Harris', 'charlotte.harris@example.com', '888-999-0000', '888 Elmwood Place, Metropolis', 31),
('Benjamin Martin', 'benjamin.martin@example.com', '999-000-1111', '999 Sycamore Trail, Gotham', 37),
('Amelia Clark', 'amelia.clark@example.com', '000-111-2222', '000 Walnut Grove, Star City', 22),
('Lucas Wright', 'lucas.wright@example.com', '123-123-1234', '123 Poplar Path, Central City', 28),
('Emma Hall', 'emma.hall@example.com', '234-234-2345', '234 Spruce Drive, Coast City', 36),
('Henry Walker', 'henry.walker@example.com', '345-345-3456', '345 Hickory Street, Smallville', 39),
('Grace Young', 'grace.young@example.com', '456-456-4567', '456 Olive Avenue, Hill Valley', 41);



SELECT * FROM users

-- query (filter data)
-- câu 1: liệt kê những user có tuổi từ 25-30
-- và sắp xếp tăng (asc) hoặc giảm dần (desc)
SELECT * FROM users
WHERE age BETWEEN 25 AND 30
ORDER BY age ASC


-- 25 < age < 30
SELECT * FROM users
WHERE age > 25 and age < 30
ORDER BY age DESC

-- câu 2: tìm những người có tên là john
SELECT * FROM users
WHERE full_name LIKE '%john%'
-- %: bỏ qua những ký tự

-- câu 3: tìm những người có tuổi lớn nhất
-- b1: tìm tuổi lớn nhất trong danh sách
-- b2: query những người bằng với tuổi lớn nhất

-- c1: query lồng nhau
SELECT * FROM users
WHERE age = (SELECT age FROM users ORDER BY age desc limit 1)

-- c2: dùng max + query lồng
SELECT * FROM users
WHERE age = (SELECT MAX(age) FROM users);

-- câu 4: đếm số lượng user trong danh sách
SELECT COUNT(*) AS 'Tổng số users' FROM users


-- Update data, delete data
-- => phải thêm where để update, delete data cụ thể
update users set age = 95

where full_name = 'John Doe'where full_name = 'John Doe'

--update list user
update users set age = 40
where full_name in ('John Doe', 'Jane Smith')

-- delete user
-- hard delete
delete from users 
where full_name = 'Grace Young'

--soft delete
-- is_delete hoặc delete_at để show hoặc hidden data

-- update table
-- case 1: thêm column
alter table users 
add column gender int DEFAULT 1 

-- case 2: update datatype cho coulmn
alter table users 
modify column full_name varchar(100) not null 

-- -- TỔNG KẾT
-- - khái niệm cơ bản về cơ sở dữ liệu 
-- - cách tạo database, table, DATABASE
-- - query data, filer data, update, delete DATABASE
-- - update table