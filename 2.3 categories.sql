CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,                   
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),  
    category_id INT REFERENCES categories(id)
);