CREATE TYPE card_status AS ENUM ('OPEN', 'ORDERED');
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE carts (
   id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
   user_id uuid NOT NULL,
   created_at DATE NOT NULL,
   updated_at DATE NOT NULL,
   status card_status,
   FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE cart_items (
   product_id uuid DEFAULT uuid_generate_v4(),
   cart_id uuid,
   count int,
   FOREIGN KEY (cart_id) REFERENCES carts (id)
   ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO users (name, email, password) VALUES 
('Test User', 'testuser@example.com', 'password123'),
('Test User 2', 'testuser2@example.com', 'password123');

INSERT INTO carts (user_id, created_at, updated_at, status) VALUES 
('e68b86a6-be09-484a-920f-d503a57cf08d', '2023-01-01', '2023-01-01', 'OPEN'),
('50cdbc5e-b855-44da-86a4-9761725ef7d6', '2023-01-02', '2023-01-02', 'OPEN'),
('e68b86a6-be09-484a-920f-d503a57cf08d', '2023-01-01', '2023-01-01', 'ORDERED');

INSERT INTO cart_items (cart_id, count) VALUES 
('962f5f6d-fbb7-4293-8338-4c9c35f9a667', 1),
('b993cf9d-cbeb-4a1d-bc2b-25599d6ed30b', 2),
('fc5e6bec-f8f8-4b5a-b667-ec09aae73245', 3);
