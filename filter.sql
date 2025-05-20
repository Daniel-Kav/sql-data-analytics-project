-- Create a sample database for an online bookstore
CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL, 
    birth_year INTEGER,
    country VARCHAR(50)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INTEGER REFERENCES authors(author_id),
    category_id INTEGER REFERENCES categories(category_id),
    publication_date DATE,
    price DECIMAL(6,2),
    stock_quantity INTEGER,
    is_bestseller BOOLEAN,
    description TEXT
);

-- Insert sample data
INSERT INTO authors (first_name, last_name, birth_year, country) VALUES
('Jane', 'Austen', 1775, 'United Kingdom'),
('George', 'Orwell', 1903, 'United Kingdom'),
('Ernest', 'Hemingway', 1899, 'United States'),
('Gabriel', 'García Márquez', 1927, 'Colombia'),
('Toni', 'Morrison', 1931, 'United States'),
('Haruki', 'Murakami', 1949, 'Japan'),
('Chimamanda', 'Adichie', 1977, 'Nigeria'),
('J.K.', 'Rowling', 1965, 'United Kingdom'),
('Leo', 'Tolstoy', 1828, 'Russia'),
('Virginia', 'Woolf', 1882, NULL);  -- NULL country for demonstration

INSERT INTO categories (category_name) VALUES
('Fiction'),
('Science Fiction'),
('Mystery'),
('Romance'),
('Biography'),
('Fantasy'),
('Historical Fiction'),
('Horror'),
('Young Adult'),
('Non-Fiction');

INSERT INTO books (title, author_id, category_id, publication_date, price, stock_quantity, is_bestseller, description) VALUES
('Pride and Prejudice', 1, 1, '1813-01-28', 12.99, 45, TRUE, 'A romantic novel of manners'),
('1984', 2, 2, '1949-06-08', 10.50, 32, TRUE, 'A dystopian social science fiction novel'),
('The Old Man and the Sea', 3, 1, '1952-09-01', 9.99, 12, FALSE, 'A short novel about an aging Cuban fisherman'),
('One Hundred Years of Solitude', 4, 1, '1967-05-30', 14.50, 23, TRUE, 'A landmark of magical realism'),
('Beloved', 5, 1, '1987-09-16', 11.25, 8, TRUE, 'A Pulitzer Prize-winning novel'),
('Norwegian Wood', 6, 1, '1987-08-04', 13.75, 15, FALSE, 'A nostalgic story of loss and sexuality'),
('Half of a Yellow Sun', 7, 7, '2006-08-11', 15.99, 20, FALSE, 'A novel set during the Biafran War'),
('Harry Potter and the Philosopher''s Stone', 8, 6, '1997-06-26', 9.99, 65, TRUE, 'First book in the Harry Potter series'),
('War and Peace', 9, 7, '1869-01-01', 16.50, 5, FALSE, 'A novel by Leo Tolstoy about Russian society'),
('To the Lighthouse', 10, 1, '1927-05-05', 10.25, 18, FALSE, 'A modernist novel about the Ramsay family'),
('Animal Farm', 2, 1, '1945-08-17', 8.99, 42, TRUE, 'An allegorical novella'),
('The Garden of Evening Mists', NULL, 7, '2012-02-21', 14.25, 7, FALSE, 'A historical fiction novel set in Malaya'),
('The Alchemist', NULL, 1, '1988-01-01', 11.99, NULL, TRUE, 'A philosophical novel by Paulo Coelho');

-- Now demonstrating all filtering concepts

-- 1. WHERE - Basic filtering
-- Find all books priced higher than $12
SELECT title, price
FROM books
WHERE price > 12.00;

-- 2. AND operator - Combining conditions
-- Find bestselling books with more than 30 copies in stock
SELECT title, stock_quantity, is_bestseller
FROM books
WHERE is_bestseller = TRUE AND stock_quantity > 30;

-- 3. OR operator - Alternative conditions
-- Find books that are either bestsellers or have "the" in the title
SELECT title, is_bestseller
FROM books
WHERE is_bestseller = TRUE OR title LIKE '%the%';

-- 4. LIMIT - Restricting number of results
-- Get only the 5 most expensive books
SELECT title, price
FROM books
ORDER BY price DESC
LIMIT 5;

-- 5. FETCH - Alternative to LIMIT
-- Get the first 3 books with the lowest stock
SELECT title, stock_quantity
FROM books
ORDER BY stock_quantity ASC
FETCH FIRST 3 ROWS ONLY;

-- 6. IN - Matching against a list of values
-- Find books in Fiction or Fantasy categories
SELECT b.title, c.category_name
FROM books b
JOIN categories c ON b.category_id = c.category_id
WHERE c.category_name IN ('Fiction', 'Fantasy', 'Historical Fiction');

-- 7. BETWEEN - Range filtering
-- Find books published between 1950 and 2000
SELECT title, publication_date
FROM books
WHERE publication_date BETWEEN '1950-01-01' AND '2000-12-31';

-- 8. LIKE - Pattern matching
-- Find books with titles containing "and"
SELECT title
FROM books
WHERE title LIKE '%and%';

-- 9. IS NULL - Checking for null values
-- Find books where the author is not specified
SELECT title, author_id
FROM books
WHERE author_id IS NULL;

-- 10. Combining multiple filtering concepts
-- Find bestselling fiction books priced between $10-$15, with "the" in the title,
-- published after 1950 or with stock quantity less than 20
SELECT b.title, b.price, b.publication_date, b.stock_quantity, c.category_name
FROM books b
JOIN categories c ON b.category_id = c.category_id
WHERE b.is_bestseller = TRUE
  AND c.category_name IN ('Fiction', 'Science Fiction', 'Historical Fiction')
  AND b.price BETWEEN 10.00 AND 15.00
  AND b.title LIKE '%the%'
  AND (b.publication_date > '1950-01-01' OR b.stock_quantity < 20)
ORDER BY b.price DESC
LIMIT 5;

-- 11. Books by authors from specific countries
SELECT b.title, a.first_name, a.last_name, a.country
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.country IN ('United States', 'United Kingdom', 'Japan')
  AND a.birth_year BETWEEN 1850 AND 1950;

-- 12. Finding books with missing information
-- Books with either no stock quantity or no author information
SELECT title, author_id, stock_quantity
FROM books
WHERE author_id IS NULL OR stock_quantity IS NULL;

-- 13. Filtering with complex date logic
-- Books published more than 50 years ago but still bestsellers
SELECT title, publication_date, is_bestseller
FROM books
WHERE publication_date < (CURRENT_DATE - INTERVAL '50 years')
  AND is_bestseller = TRUE;

-- 14. FETCH with OFFSET (pagination example)
-- Get the second page of results (3 per page)
SELECT title, price
FROM books
ORDER BY price DESC
OFFSET 3
FETCH NEXT 3 ROWS ONLY;

-- 15. Complex filtering with subqueries
-- Find books by authors born before 1900
SELECT b.title, a.first_name, a.last_name, a.birth_year
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE a.author_id IN (
    SELECT author_id
    FROM authors
    WHERE birth_year < 1900
);

-- 16. NOT IN example
-- Find books not in Young Adult or Horror categories
SELECT b.title, c.category_name
FROM books b
JOIN categories c ON b.category_id = c.category_id
WHERE c.category_name NOT IN ('Young Adult', 'Horror');

-- 17. NOT BETWEEN example
-- Find very cheap or very expensive books
SELECT title, price
FROM books
WHERE price NOT BETWEEN 10.00 AND 15.00
ORDER BY price;

-- 18. NOT LIKE example
-- Find books whose titles don't start with 'The'
SELECT title
FROM books
WHERE title NOT LIKE 'The%';

-- 19. IS NOT NULL example
-- Find books with known stock quantities
SELECT title, stock_quantity
FROM books
WHERE stock_quantity IS NOT NULL
ORDER BY stock_quantity;

-- 20. Using all filters in one complex query
SELECT 
    b.title,
    b.price,
    b.stock_quantity,
    a.first_name || ' ' || a.last_name AS author_name,
    c.category_name
FROM 
    books b
LEFT JOIN 
    authors a ON b.author_id = a.author_id
JOIN 
    categories c ON b.category_id = c.category_id
WHERE 
    (a.country IN ('United Kingdom', 'United States') OR a.country IS NULL)
    AND b.price BETWEEN 9.00 AND 15.00
    AND (b.title LIKE '%the%' OR b.title LIKE '%and%')
    AND b.publication_date NOT BETWEEN '1960-01-01' AND '1980-12-31'
    AND b.stock_quantity IS NOT NULL
    AND b.is_bestseller = TRUE
ORDER BY 
    b.price DESC
LIMIT 5;