INSERT INTO users (username, password, email)
VALUES ('john_doe', 'password123', 'john@example.com'),
       ('jane_doe', 'password456', 'jane@example.com');

INSERT INTO user_roles (user_id, role)
VALUES (1, 'ROLE_USER'),
       (2, 'ROLE_USER');

INSERT INTO properties (name, description, address, price_per_night, user_id)
VALUES ('Hotel Sunshine', 'A nice sunny hotel', '123 Sunny Street, Sunnyvale, USA', 100, 1),
       ('Mountain Resort', 'A cozy mountain resort', '456 Mountain Road, Hilltown, USA', 150, 2);

INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES (1, 1, '2024-07-01', '2024-07-07', 700.00, 'CONFIRMED'),
       (2, 2, '2024-08-01', '2024-08-10', 1000.00, 'PENDING');

INSERT INTO payments (booking_id, amount, payment_method, status)
VALUES (1, 700.00, 'CREDIT_CARD', 'PAID'),
       (2, 1000.00, 'PAYPAL', 'PENDING');