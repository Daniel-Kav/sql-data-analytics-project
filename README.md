# Filtering Data in SQL: Online Bookstore Example

This project provides a comprehensive set of SQL scripts for creating and querying a sample database for an online bookstore. It demonstrates a wide range of SQL filtering techniques, making it a valuable resource for learning and teaching SQL data filtering concepts.

## Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Sample Data](#sample-data)
- [Filtering Query Examples](#filtering-query-examples)
- [How to Use](#how-to-use)
- [Requirements](#requirements)
- [License](#license)

---

## Overview

This codebase contains a single SQL script (`filter.sql`) that:

1. Creates tables for authors, categories, and books.
2. Populates them with sample data.
3. Demonstrates 20+ different SQL filtering techniques, including `WHERE`, `AND`, `OR`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`, `LIMIT`, subqueries, and more.

The script is ideal for anyone looking to learn or teach SQL filtering, or for use as a template for similar projects.

---

## Database Schema

The database consists of three main tables:

- **authors**: Stores author information.
  - `author_id` (Primary Key)
  - `first_name`
  - `last_name`
  - `birth_year`
  - `country`

- **categories**: Stores book category information.
  - `category_id` (Primary Key)
  - `category_name`

- **books**: Stores book information.
  - `book_id` (Primary Key)
  - `title`
  - `author_id` (Foreign Key to `authors`)
  - `category_id` (Foreign Key to `categories`)
  - `publication_date`
  - `price`
  - `stock_quantity`
  - `is_bestseller`
  - `description`

---

## Sample Data

The script inserts sample data for:

- 10 authors (from various countries and eras)
- 10 categories (genres)
- 13 books (with a mix of bestsellers, stock quantities, and missing data for demonstration)

---

## Filtering Query Examples

The script demonstrates the following SQL filtering concepts, each with a clear example:

1. **Basic Filtering**: Using `WHERE` to filter by price.
2. **Combining Conditions**: Using `AND` and `OR`.
3. **Pattern Matching**: Using `LIKE`.
4. **Restricting Results**: Using `LIMIT` and `FETCH`.
5. **Matching Lists**: Using `IN` and `NOT IN`.
6. **Range Filtering**: Using `BETWEEN` and `NOT BETWEEN`.
7. **Null Checks**: Using `IS NULL` and `IS NOT NULL`.
8. **Subqueries**: Filtering with subqueries.
9. **Pagination**: Using `OFFSET` and `FETCH`.
10. **Complex Queries**: Combining multiple filters and joins.

Each query is commented for clarity and can be run independently.

---

## How to Use

1. **Set Up a PostgreSQL Database**

   This script is designed for PostgreSQL. You can use any PostgreSQL-compatible environment (local installation, Docker, cloud service, etc.).

2. **Run the Script**

   - Open your SQL client (e.g., `psql`, DBeaver, pgAdmin).
   - Execute the contents of `filter.sql` in your database.

   ```sh
   psql -U your_username -d your_database -f filter.sql
   ```

3. **Explore the Queries**

   - Each query is self-contained and commented.
   - You can copy and run individual queries to see their results and learn how different filters work.

---

## Requirements

- PostgreSQL (recommended version 12+)
- SQL client (e.g., `psql`, DBeaver, pgAdmin)

---

## License

This project is provided for educational purposes. You are free to use, modify, and distribute it as you wish.

---

## Credits

Created by [Your Name].  
Inspired by real-world bookstore data and designed for SQL learners.

---

If you have any questions or suggestions, feel free to open an issue or contact the maintainer. 