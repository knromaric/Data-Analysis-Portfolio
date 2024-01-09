# Data-Analysis-Portfolio
Portfolio data analysis projects using SQL, Python and Power BI.   
This repo consists of the following following project   

## Project 1: US Retail Sales Trend Analysis Using SQL

In this analysis we dive deep into a comprehensive sales trends analysis of the United
States Retail Services from 2010 to 2022 using the power of SQL.

**Data Source**: [https://www.kaggle.com/datasets/mohammadkaiftahir/us-store-sales-dataset](url)   

Our sales data spans from January 2010 to December 2022 and includes information such as:   

**Month**: month number of the sales   

**Year**: year of the sales   

**Naics_code**: North American Industry Classification System (NAICS) is the standard used by
Federal statistical agencies in classifying business establishments   
(https://www.census.gov/naics/)   

**Kind_of_business**: specific type of the business   

**Industry**: which industry the business belongs to   

**Sales**: total sales recorded by the business   

In Order to achieve this Data Exploration we wrote SQL queries to answer the following questions:   
* Which industry has the highest sales revenue for 2022? 
* What is the contribution percentage of each within the Automotive industry in 2022?
* How has the sales revenue changed over time for the Motor vehicle and part dealers?
* which businesses have the highest total sales for the "food and beverage" industry for each year?
* what is the revenue change in percentage for each industry from 2019 to 2020?
* What is the year-over-year growth rate for each industry per year?
* ...

[**Code** ](https://github.com/knromaric/Data-Analysis-Portfolio/blob/main/SQL%20DATA%20ANALYSIS/Retail%20Sales%20Analysis%20With%20SQL.sql)   

[**Analysis Report**](https://github.com/knromaric/Data-Analysis-Portfolio/blob/main/SQL%20DATA%20ANALYSIS/Sales%20Trends%20Analysis%20Report.pdf)

## Project 2: Toys Sales Performance Analysis Using Power BI   

**Purpose**:   

Toys company Marketing Team is creating a business plan for next year. The team wants to
understand the Keys drivers of their revenue; their top priority is identifying their product sales
and stores sales at different station locations. The dataset includes almost a million of sales
records for the year 2022 and 2023, so the team wants a dashboard that summarizes key
insights. Business plans that are driven by performance insights are more successful than plans
driven by just internal staff observations. The sales view must include key data points that are
summarized and aggregated in order for the leadership team to get a clear vision of the current
performance of the company.   

**Requirements**:   

In order to continuously improve and effectively market products, the dashboard must help Toys
Company decision-makers understand how their performance and the demand at different
locations, including clear projection on whether or not the company is reaching target goal.
* A table or map visualization exploring different store’s location and their revenue 
* Tracking current revenue, current revenue vs previous year revenue, Revenue vs Target
goal. 
* A visualization that focuses on product group that are performing well vs
underperforming product. 
* A visualization showing the percent growth in revenue year over year across different
store. 
* Inventory analysis: how much inventory different stores have on hand? Is the inventory
enough? Display stores that have less than a day of inventory. 
* Goal projection calculator. 

**Tasks**:   
To achieve our objectives we went through these steps :    
* Importing the datasets
* Building the data model. we use the **star schema** because of its query perfomance efficiency
![Data model of the Toys sales Analysis Dashboard](https://github.com/knromaric/Data-Analysis-Portfolio/blob/main/Toys%20Company%20Dashboard/Dashboard/data%20model.png)
* Creating all necessary metrics (Measures) using **DAX**
* Creating visualizations and our multipage dashboard

[**Interact with the Dashboard**](https://app.powerbi.com/view?r=eyJrIjoiNjdjNDQyNmYtMzk4MC00MGJkLWExODktYWE1MzI2ZmRlNzA5IiwidCI6ImY2YzIwZGM3LWMwYmMtNDAxYy05MWI2LTRiNGVkYWZmNWQ0YyJ9)


## Project 3: Perpetrators of Child Abuse Data Visualization Challenge    

By **D'Challenger** on LinkedIn 

The Dashboard is judged on: 
1.	Overall readability
2.	Color selection
3.	Creativity
4.	Story being told
5.	View of insights gained

Objective: create a single page dashboard that tells clear story
about child abuse.

Dashboard requirements:
1. KPI's for relevant information
2. Where do we have the highest child care providers states?
3. Top states with highest child legal guidance
4. What is the top state with the highest parents?
5. Where do we have the highest perpetrators?

[**Interact with the Dashboard**](https://app.powerbi.com/view?r=eyJrIjoiZDI0NGFkZTItZWMzOS00MDQ4LWFmN2QtNzFkZGY3NzFmMjA0IiwidCI6ImY2YzIwZGM3LWMwYmMtNDAxYy05MWI2LTRiNGVkYWZmNWQ0YyJ9)


