CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT,
    department_id INT,
    
    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES departments(id)
        ON DELETE SET NULL  
);