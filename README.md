Auto Sales Data Analysis Project
Overview
This project contains SQL scripts designed to clean and analyze a dataset of auto sales. 
The dataset includes sales transactions with details on order numbers, customer names, order dates, product lines, and more. 
The project aims to derive insights from this data, such as sales trends, top customers, and product popularity.

Data
The dataset used in this project is Auto Sales data.csv, which includes various fields related to auto sales transactions. 
Key columns include ORDERNUMBER, CUSTOMERNAME, ORDERDATE, PRODUCTLINE, SALES, etc.

Data Cleaning

The data cleaning process involves several steps:
•	Identifying and counting missing values in important columns.
•	Removing duplicate records based on a combination of ORDERNUMBER, CUSTOMERNAME, and ORDERDATE.
•	Checking data consistency, particularly in the COUNTRY column.
•	Verifying the range of dates in the ORDERDATE column.

Data Analysis

The analysis includes:
1. Total Sales by Product
In the analysis of total sales by product, Classic Cars and Vintage Cars emerge as the top revenue generators, with sales exceeding $3.8 million and $1.8 million respectively. Conversely, categories like Trains and Ships garner comparatively lower revenues, approximately $700,000 and $225,000.

2. Monthly and Yearly Trends
The examination of sales trends reveals a consistent yearly growth rate, even though the dataset for 2020 is only complete up to May. A notable pattern is observed in November each year, where a significant spike in sales occurs. However, this uptick is followed by a dramatic drop in December, presenting a curious and recurrent sales pattern.

3. Top Customers Based on Sales
Euro Shopping Channel and Mini Gifts Distributors Ltd. lead as top buyers, with impressive sales figures of around $900,000 and $650,000 respectively. The distribution of sales to other customers in the auto sales sector remains remarkably even, indicating a broad and diverse customer base.

4. Geographical Distribution of Sales
Regarding geographical distribution, the United States stands out as the largest importer of automobiles, with total sales amounting to $3,355,476. In contrast, Australia shows relatively lower import volumes, totaling $630,623, suggesting varying market demands across regions.

5. Product Popularity by Quantity
In product popularity based on quantity sold, Classic Cars secure the top position with over 33,000 units sold, followed by Vintage Cars at roughly 20,000 units. Meanwhile, sales of Motorcycles, Planes, and Trucks display a more uniform distribution, highlighting diverse consumer preferences.

6. Year-to-Year Comparison
A significant trend is noted in the year-to-year revenue comparison. The year 2019 witnessed a remarkable increase in revenue of 133%, indicating substantial growth. However, this surge was followed by an unexpected downturn in 2020, where a decrease of -2.39% was recorded, illustrating the fluctuating nature of market trends.



Usage

To use these scripts:
•	Ensure you have access to a SQL environment compatible with the syntax used (e.g., Google BigQuery).
•	Import the Auto Sales data.csv dataset into your SQL environment.
•	Execute the SQL scripts to clean and analyze the data .
•	Open the tableau file in tableau workbook to see the visualization and gain insights.




