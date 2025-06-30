# SQL Data Analytics Project

A comprehensive collection of SQL scripts and datasets for data exploration, analytics, and reporting. This project is designed for data analysts and BI professionals to quickly explore, segment, and analyze data within a relational database using best-practice SQL queries.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Script Descriptions](#script-descriptions)
- [Data Pipeline & Datasets](#data-pipeline--datasets)
- [Example Analyses](#example-analyses)
- [Additional Resources](#additional-resources)
- [License](#license)

---

## Project Overview
This repository provides a full workflow for building and analyzing a data warehouse, including:
- Database initialization and schema creation
- Data loading from CSV files (bronze, silver, gold layers)
- A suite of SQL scripts for exploration, segmentation, ranking, time-series, and reporting
- Example scripts for filtering and analytics (see `filter.sql`)

The project demonstrates best practices in SQL for analytics, including the use of window functions, aggregations, segmentation, and reporting views.

---

## Project Structure

```
├── datasets/
│   └── csv-files/           # Raw and processed CSV data (bronze, silver, gold layers)
│   └── DataWarehouseAnalytics.bak  # Example database backup
├── docs/                   # Project documentation and roadmap
├── scripts/                # Main SQL scripts for each analysis theme
├── filter.sql              # Standalone SQL filtering demo (bookstore example)
├── README.md               # Project documentation (this file)
```

### Scripts Directory
- `00_init_database.sql` – Create/reset the database, schemas, and load gold-layer data
- `01_database_exploration.sql` – Explore tables, columns, and metadata
- `02_dimensions_exploration.sql` – Explore dimension tables (e.g., unique countries, categories)
- `03_date_range_exploration.sql` – Analyze date ranges and temporal boundaries
- `04_measures_exploration.sql` – Calculate key metrics (totals, averages, counts)
- `05_magnitude_analysis.sql` – Group and quantify data by dimensions (e.g., customers by country)
- `06_ranking_analysis.sql` – Rank products/customers by performance
- `07_change_over_time_analysis.sql` – Analyze trends and changes over time
- `08_cumulative_analysis.sql` – Calculate running totals and moving averages
- `09_performance_analysis.sql` – Year-over-year and benchmarking analysis
- `10_data_segmentation.sql` – Segment data (e.g., customer/product segments)
- `11_part_to_whole_analysis.sql` – Part-to-whole comparisons (e.g., category share of sales)
- `12_report_customers.sql` – Generate customer-level report view
- `13_report_products.sql` – Generate product-level report view

### Datasets Directory
- `csv-files/bronze.*.csv` – Raw source data (bronze layer)
- `csv-files/silver.*.csv` – Cleaned/standardized data (silver layer)
- `csv-files/gold.*.csv` – Final analytics-ready data (gold layer)
- `csv-files/gold.report_*.csv` – Example output reports

---

## Getting Started

### Prerequisites
- SQL Server (or compatible RDBMS)
- SQL client (e.g., SSMS, Azure Data Studio, DBeaver)
- Sufficient permissions to create/drop databases and bulk load data

### Database Setup & Data Loading
1. **Initialize the Database**
   - Run `scripts/00_init_database.sql` to create the `DataWarehouseAnalytics` database, schemas, and load gold-layer data from CSVs.
   - **Warning:** This script will drop the database if it exists. Backup any important data first.

2. **Explore and Analyze**
   - Use the scripts in the `scripts/` directory to perform various analyses. Each script is self-contained and can be run independently.

### Example: Running a Script
```sql
-- In your SQL client, after running 00_init_database.sql:
:r scripts/04_measures_exploration.sql
```

---

## Script Descriptions

- **00_init_database.sql**: Creates the database, schemas, and loads gold-layer data from CSV files.
- **01_database_exploration.sql**: Lists tables and columns, explores database structure.
- **02_dimensions_exploration.sql**: Explores unique values in dimension tables (countries, categories, products).
- **03_date_range_exploration.sql**: Analyzes date ranges (first/last order, customer ages).
- **04_measures_exploration.sql**: Calculates totals, averages, and other key metrics.
- **05_magnitude_analysis.sql**: Groups and quantifies data by country, gender, category, etc.
- **06_ranking_analysis.sql**: Ranks products/customers by revenue, orders, etc.
- **07_change_over_time_analysis.sql**: Tracks trends and changes in sales, customers, and quantity over time.
- **08_cumulative_analysis.sql**: Computes running totals and moving averages for sales and prices.
- **09_performance_analysis.sql**: Year-over-year and average performance analysis for products.
- **10_data_segmentation.sql**: Segments products and customers by cost, spending, and tenure.
- **11_part_to_whole_analysis.sql**: Analyzes category contributions to overall sales.
- **12_report_customers.sql**: Builds a customer report view with segmentation and KPIs.
- **13_report_products.sql**: Builds a product report view with segmentation and KPIs.

---

## Data Pipeline & Datasets

The project uses a layered data pipeline:
- **Bronze Layer**: Raw source data (e.g., CRM, ERP extracts)
- **Silver Layer**: Cleaned and standardized data
- **Gold Layer**: Analytics-ready, modeled data for reporting

**Key CSV Files:**
- `gold.dim_customers.csv`, `gold.dim_products.csv`, `gold.fact_sales.csv`: Main dimension and fact tables for analytics
- `gold.report_customers.csv`, `gold.report_products.csv`: Example output reports
- `bronze.*.csv`, `silver.*.csv`: Intermediate/raw data for ETL

---

## Example Analyses
- **Exploration**: Database structure, unique values, date ranges
- **Segmentation**: Customer/product segments, cost ranges, spending tiers
- **Ranking**: Top/bottom performers, sales leaders, customer value
- **Time Series**: Trends, seasonality, cumulative growth
- **Performance**: Year-over-year, benchmarking, part-to-whole
- **Reporting**: Customer and product-level KPIs, recency, frequency, value

---

## Additional Resources
- **`filter.sql`**: Standalone SQL script demonstrating 20+ filtering techniques using a sample bookstore database (PostgreSQL syntax)
- **`docs/`**: Project roadmap and additional documentation

---

## License
This project is provided for educational purposes. You are free to use, modify, and distribute it as you wish.

---

For questions or suggestions, please open an issue or contact the maintainer.
