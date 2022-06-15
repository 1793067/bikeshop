SET client_min_messages TO WARNING;

CREATE TABLE IF NOT EXISTS bikes (
    bike_id SERIAL PRIMARY KEY,
    type VARCHAR(20) NOT NULL,
    size INT NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

INSERT INTO bikes(bike_id, type, size) VALUES(1, 'Mountain', 26),
(2, 'Mountain', 26), (3, 'Mountain', 29), (4, 'BMX', 14), (5, 'BMX', 13),
(6, 'Racing', 27), (7, 'Racing', 27), (8, 'Racing', 28),
(9, 'Exersize', 0), (10, 'Rickshaw', 28), (11, 'Electric', 15)
ON CONFLICT(bike_id) DO NOTHING;

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS rentals (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    bike_id INT REFERENCES bikes(bike_id),
    date_rent TIMESTAMP DEFAULT now(),
    date_returned TIMESTAMP
);
