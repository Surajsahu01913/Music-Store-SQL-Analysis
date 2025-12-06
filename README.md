# Music-Store-SQL-Analysis
This project contains a complete SQL analysis of a Music Store database. It includes beginner to advanced SQL queries designed to extract meaningful business insights from customer data, sales performance, artist popularity, and music genre trends.

🎵 Music Store SQL Data Analysis Project

This repository contains a complete SQL-based data analysis project using the classic Music Store Database. The project explores real business questions related to customer behavior, revenue trends, popular artists, and genre performance.
It includes beginner, intermediate, and advanced SQL queries to help you understand data analytics using SQL in a structured and practical way.

📖 Project Overview
The Music Store Database simulates a real-world digital music shop. It has customer records, employee details, invoice-level purchase data, songs (tracks), playlists, artists, albums, and genres.
This project uses SQL to answer important business problems such as:
Who are the top customers?
Which country generates the highest revenue?
Which genre is most popular among customers?
Which artists perform best in terms of sales?
What patterns do we observe in customer spending across regions?
The goal of this project is to show how SQL can be used to gain insights and support business decision-making.
🗂️ Dataset Details (Tables Included)
The database contains the following tables:
Table Name	Description
Customer	Customer personal and location details
Employee	Store staff and reporting structure
Invoice	Complete order-level purchase records
Invoice_Line	Item-level details of each invoice
Track	Song list with metadata
Genre	Music genres (Rock, Pop, Jazz, etc.)
Album	Album details for each track
Artist	Artist information
Playlist	User playlists
Playlist_Track	Mapping of tracks added to playlists
Media_Type	Formats of tracks (MPEG, AAC, etc.)

🎯 Project Objectives
✔ Understand the structure of a relational database
✔ Perform joins across multiple tables
✔ Use Aggregate Functions to generate insights
✔ Apply Window Functions for ranking and partitioning
✔ Use CTEs (Common Table Expressions) for complex queries
✔ Solve real-world analytical questions

📊 Key Business Insights Generated
🏆 1. Senior-most Employee
Identified the employee with the most years of service using ranking functions.

🌍 2. Country with Highest Invoices
Ranked countries based on total invoice counts and revenue contribution.

🏙️ 3. Top Revenue-Generating City
Discovered the city with the highest total invoice amount for planning promotional events.

👑 4. Best Customer
Found the customer who spent the most money in the store.

🎸 5. Rock Music Listeners
Extracted customers who purchased Rock tracks using multi-table joins.

🎤 6. Most Popular Rock Artists
Ranked artists based on the number of rock songs sold.

⏱️ 7. Songs Longer Than Average Duration
Filtered tracks above average length.

🌎 8. Popular Genre by Country
Used window functions to find the most purchased genre per country.

💳 9. Top-Spending Customer Per Country
Identified the customer who spent the most in each region.

🧠 Skills Demonstrated
This project demonstrates strong command of SQL including:

🔹 SQL Concepts
SELECT, WHERE, ORDER BY
GROUP BY & Aggregation
DISTINCT
JOINS (INNER, LEFT, RIGHT)
Subqueries
Common Table Expressions (CTEs)
Window Functions (DENSE_RANK, RANK, OVER())

🔹 Data Analysis Skills
Revenue analysis
Customer segmentation
Artist and genre ranking
Country-level insights
Trend identification

🔹 Business Intelligence
Understanding business metrics
Converting data into actionable insights
Structuring analysis in a clean, readable format

🧩 Project Structure
📁 Music-Store-SQL-Project
│
├── 📄 music_store SQL PROJECT.sql   # Main SQL file with all queries
├── 📘 README.md                      # Documentation
└── 📁 Assets/                        # (Optional) Screenshots, diagrams

🚀 How to Run This Project
Download or clone the repository:
git clone https://github.com/your-username/Music-Store-SQL-Project.git
Open your SQL environment (SQL Server, MySQL, PostgreSQL depending on DB format).
Load the Music Store Database.
Open the SQL file from this repository.
cute the queries section-by-section to explore insights.

📈 Future Improvements
You can expand this project by adding:
Data visualization dashboards (Power BI / Tableau)
Stored procedures for common analysis
Optimization of long SQL queries
ER Diagram for database relationships
Python integration for automated analytics

🙋 About the Author
Suraj Sahu
Aspiring Data Analyst | SQL | Python | Power BI | Data Visualization
