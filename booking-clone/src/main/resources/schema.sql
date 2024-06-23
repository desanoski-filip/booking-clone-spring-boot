DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_roles;

CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_roles
(
    user_id INT         NOT NULL,
    role    VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE properties
(
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    description     VARCHAR(500) NOT NULL,
    address         VARCHAR(200) NOT NULL,
    price_per_night INT          NOT NULL,
    user_id         INT          NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE bookings
(
    id             SERIAL PRIMARY KEY,
    user_id        INT            NOT NULL,
    property_id    INT            NOT NULL,
    check_in_date  DATE           NOT NULL,
    check_out_date DATE           NOT NULL,
    total_price    DECIMAL(10, 2) NOT NULL,
    status         VARCHAR(20)    NOT NULL,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (property_id) REFERENCES properties (id)
);

CREATE TABLE payments
(
    id             SERIAL PRIMARY KEY,
    booking_id     INT            NOT NULL,
    amount         DECIMAL(10, 2) NOT NULL,
    payment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50)    NOT NULL,
    status         VARCHAR(20)    NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings (id)
);