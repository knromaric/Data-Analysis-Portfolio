
/*
 * ============================================
 * Retail Sales Data Analysis Using SQL 
 * 
 * ============================================ 
 */


-- **************
-- QUESTION 1
-- **************
-- 1- Which industry has the highest sales revenue for 2022
-- TO ANSWER WE NEED TO : 
	-- * find the total sales group by industry
	-- * filter year to 2022 since the question is asking about 2022 only
	-- * Order by sum of sales in descending order to easily see the highest sales on top

select 
	industry, 
	sum(sales) revenue
from
	retail_sales rs
where
	year = 2022
group by
	industry
order by
	revenue desc;

/*
 * INSIGHTS: 
 * 
 * THE automotive industry which has 6 differents kind of businesses (Motor vehicle and parts dealers, 
 * Automobile and other motor vehicle dealers, Automobile dealers, New car dealers, Used car dealers, "Automotive parts, acc., and tire stores") has 
 * the highest to total sales revenue for the year 2022 with and impressive total sales revenue of 5.62 trillions dollars. In the other hand the Office
 * Supply and Gifts industry which has 3 differents kind of business ("Office supplies, stationery, and gift stores", 
 * "Office supplies and stationery stores", "Gift, novelty, and souvenir stores") has the lowest revenue with 64millions dollars for the year of 2022.
 * 
 */


-- **************
-- QUESTION 2
-- **************
-- 2- Which kind of business within the Automotive industry had the highest sales revenue for 2022
-- TO ANSWER WE NEED TO : 
	-- * find the total sales group by kind_of_business
	-- * filter year to 2022 and industry to "Automotive" since the question is stating that.
	-- * Order by sum of sales in descending order to easily see the highest sales on top

select
	kind_of_business,
	sum(sales) Revenue
from
	retail_sales rs
where
	year = 2022
	and industry like "Automotive%"
group by
	kind_of_business
order by
	Revenue desc;

select sum(sales) from retail_sales rs2 where industry like "Automotive%";

/*
 * INSIGHTS: 
 * 
 * "The Motor Vehicle and parts dealers" make the largest contribution (27%) to high total sales in the automotive industry, closely followed by 
 * "Automobile and other motor vehicle dealers" which contribute (24%) of total sales in the same industry.  
 * In Contrast "Automotive Parts, acc, and tire stores" has the least impact in the total sales automotive industry revenue (2.2 %) 
 * 
 */


-- **************
-- QUESTION 3
-- **************
-- 3- What is the contribution percentage of each within the Automotive industry in 2022
-- TO ANSWER WE NEED TO : 
	-- * find the total sales group by kind_of_business
	-- * find the total overall sales for the automotive industry in 2022 which will divide the total sales by group to get the percentage
	-- * filter year to 2022 and industry to "Automotive" since the question is stating that.
	-- * Order by sum of sales in descending order to easily see the highest sales on top


select
	kind_of_business, 
	sum(sales) / (
				select
					sum(sales)
				from
					retail_sales rs2
				where
					industry like "Automotive%"
					and year = 2022) * 100 perc_revenue
from
	retail_sales rs
where
	year = 2022
	and industry like "Automotive%"
group by
	kind_of_business
order by
	perc_revenue desc;


-- **************
-- QUESTION 4
-- **************
-- 4- How has the sales revenue changed over time for the Motor vehicle and part dealers
-- TO ANSWER WE NEED TO : 
	-- * find the total sales group by year
	-- * filter kind of business to "Motor vehicle and parts dealers" since the question is stating that.
	-- * Order by year descendant

select year, sum(sales) yearly_revenue
from retail_sales rs 
where kind_of_business = "Motor vehicle and parts dealers"
group by year
order by year desc;

/*
 * INSIGHTS: 
 * 
 * The "Motor Vehicle and parts dealers" business have seen steady growth in total sales revenue over the past several year however a notable 
 * exception in 2020 where the total sales declined compared to the total sales of the previous year. So in 2020 this business lost a bit of revenue, 
 * indicating a negative growth. We are going to further study the year 2020 to understand the effect of the covid-19 pandemy. So we will look deeper
 * into every kind of business to understand how the pandemic impacted their industry.
 * 
 */


-- **************
-- QUESTION 5
-- **************
-- 5- How much did "Motor Vehicle and parts dealers" experience a month-over-month growth rate in 2020?
-- TO ANSWER WE NEED TO : 
	-- * select the previous month and the current month by using self-join
	-- * filter kind of business to "Motor vehicle and parts dealers" and year = 2020.
	-- * calculate the growth rate using the formula (current - previous)/previous

select 
	curr.month current_month,
	prev.month previous_month, 
	(curr.sales - prev.sales)/prev.sales * 100 MoM_growth_rate
from retail_sales curr
join retail_sales prev on curr.month = prev.month + 1
						and curr.year = prev.year
						and curr.kind_of_business  = prev.kind_of_business 
where curr.year = 2020
   and curr.kind_of_business  = "Motor vehicle and parts dealers";

/*
 * INSIGHTS: 
 * 
 * we examined the MoM growth rate in 2020 for "Motor vehicle and parts dealers" industry and observed a rise in sales during February
 * however sales  declined in march and april before showing significant improvement in may leading to positive growth which persisted 
 * through july before declining in august,september and november. December marks a better month with a growth rate of 12. This indicates 
 * that 2020 was a volatile year for this businesses with fluctuations in sales throughout the year.
 * 
 */
  
-- **************
-- QUESTION 6
-- **************
-- 6- which businesses have the highest total sales for the "food and beverage" industry for each year.
-- TO ANSWER WE NEED TO : 
	-- find the yearly total sales of each business in the food & beverage industry 
  	-- total sales group by kind_of_business and year
    -- filter data so that industry = "Food & Beverage"
  
  	-- Next, we need to get the maximum total sale for each year for business within the food and beverage industry
  	-- maximum of total sales grouped by year
    -- and kind_of_business that this maximum of total sales belongs to
  

with yearly_total_sales as (
	select year,kind_of_business, sum(sales) total_sales
	from retail_sales
	where industry = "Food & Beverage"
	group by year, kind_of_business
),
top_yearly_sales as ( 
	select year, max(total_sales) max_sales
	from yearly_total_sales 
	group by year
)
select cte1.year , cte1.kind_of_business, cte2.max_sales
from yearly_total_sales as cte1
join top_yearly_sales cte2 on cte1.year = cte2.year and 
						      cte1.total_sales = cte2.max_sales;
						     
## Get the 5 distinct business within the Food & Beverage industry 
SELECT DISTINCT kind_of_business
FROM retail_sales rs 
WHERE industry = 'Food & Beverage';
						 
/*
 * INSIGHTS: 
 * 
 * within the food and beverages industry there are 5 distinct business type "Food and beverage stores", "Grocery stores"
 * "Supermarkets and other grocery (except convenience) stores", "Beer, wine, and liquor stores", "Warehouse clubs and superstores", from 
 * 2010 to 2022 "Food and beverage stores" consistently reported the highest total sales however it's unclear how many businesses exist within 
 * each business type and this can potentially explain the observed trend, despite this the "Food and beverage stores" remains the largest contributor to 
 * this industry overall sales. To make a more accurate comparison between business type we can calculate the maximum average sale instead of the maximum 
 * total sales, that way we can have a fair comparison of sales figures. 
 * 
 */


-- **************
-- QUESTION 7
-- **************
-- 7- what is the revenue change in percentage for each industry from 2019 to 2020?
-- TO ANSWER WE NEED TO : 
	-- find the sum of sales for each industry for 2019 as the previous year and 2020 as the current year.
		-- we need the sum of sales grouped by the industry for the year 2019. this with be the previous year's total sales  
		-- we need the sum of sales grouped by the industry for the year 2020. this will be the current industry
  	-- second, after having both previous and current sales, we can calculate the growth rate with (current -previous)/previous * 100
		-- create a CTE for sales in 2019 and another CTE for sales in 2020
		-- join the 2 CTE to get the previous 

with rev_2020 as ( 
	select industry, sum(sales) sales_2020
	from retail_sales rs 
	where year = 2020
	group by industry
), 
rev_2019 as (
	select industry, sum(sales) sales_2019
	from retail_sales rs 
	where year = 2019
	group by industry
)
select
	rev_2020.industry,
	sales_2019,
	sales_2020,
	(sales_2020 - sales_2019)/sales_2019 * 100 YoY_growth
from
	rev_2020
join rev_2019 on
	rev_2020.industry = rev_2019.industry
order by
	YoY_growth desc;

-- BUSINESS CHECK
-- what kind of business are included in "miscellaneous" industry
select distinct  kind_of_business , naics_code 
from retail_sales rs 
where industry = 'Miscellaneous';


/*
 * INSIGHTS: 
 * 
 * This result shows that miscellaneous store have seen a 24% increase in their revenue from 2019 to 2020. There are 3 different kinds of businesses in the
 * "miscellaneous industry": "Miscellaneous store retailers", "Used merchandise stores", "Nonstore retailers"
 * 
 * followed by "Home goods and building supplies" with 13%, 
 * 
 * the definition of this business is located on https://www.census.gov/naics/
 * 
 * NAICS = North American industrial Classification System
 * 
 * looking at the definition must to the business in this categories are business havins sales made directly to home and this make sens 
 * because in 2020 people were at home due to covid-19 pandemy.
 */


-- what is the contribution percentage of the miscellaneous businesses in 2020?

select
	kind_of_business, 
	sum(sales)/(select
					sum(sales)
				from
					retail_sales rs
				where year = 2020 and
					industry = "Miscellaneous") * 100 perc
from
	retail_sales rs2
where year = 2020 and
	industry = "Miscellaneous"
group by
	kind_of_business
order by
	2 desc;

-- INSIGHT: 87% of the sales in 2020 in "Miscellaneous" industry comes from the "Nonstore retailers", this could be attributed to the fact that people 
-- spent more time either due to remote work or to quarantine measures leading to an increase demand of door to door sales or home ordering like "AMAZON"]
-- "Sport and recreation" has 6% growth in revenue let's check the kind of businesses insight this industry

select distinct kind_of_business
from retail_sales rs 
where industry like "Sports%";

/*
 * "Sporting goods, hobby, musical instrument, and book stores"
 * "Sporting goods stores"
 * "Hobby, toy, and game stores"
 * "Book stores"
 * 
 * this make sense because people have more time, so they find various hobbies to spend their time on
 */



-- **************
-- QUESTION 8
-- **************
-- 8- What are the year-over-year growth rates for each industry per year?
-- first, we need the sum of sales by year and the industry
-- next we can use this above query  as a temporary table
	-- do a self-join so we can have the current year and the previous year together.
with total_sales as (
	select year, industry, sum(sales) revenue
	from retail_sales rs 
	group by year, industry
)
select curr.industry,
	prev.year, 
	curr.year, 
	(curr.revenue - prev.revenue)/prev.revenue * 100 YoY_growth
from total_sales curr
join total_sales prev on curr.year = prev.year + 1 
					 	and curr.industry = prev.industry
order by curr.industry, curr.year desc ;

-- INSIGHTS 
/*
 * over all the YoY growth of various industries indicates that the pandemic negatively
 * impacted the Automotive, Fashion & Accessories, Office Supplies & Gifts, Fuel & Gasoline, 
 * and the Restaurants & Bars industries in 2020. How ever these same industries experience 
 * significant growth in the subsequent year in 2021. The "Food & Beverage", "Miscelleanous", 
 * "Home Goods & Building Supplies" has seen a direct positive impact in 2020 and 2021, although
 * the growth rate was heading back to the normal ranges in 2022
 * 
 */


-- **************
-- QUESTION 9
-- **************
-- 9- What are the yearly total sales for women's clothing stores and men's clothing stores?
-- write a case statement to return both total sales in the same table


select 
	year, 
	sum(case when kind_of_business like "Women's clothing%" then sales end) women_sales, 
	sum(case when kind_of_business like "Men's clothing%" then sales end) men_sales
from
	retail_sales rs 
group by year;


-- INSIGHT: we can clearly see that women's clothing sales are much higher than men's clothing sales


-- **************
-- QUESTION 10
-- **************
-- 10- What is the yearly ratio of total sales for women's clothing stores to total sales for men's clothing stores?

-- To answer this question
-- we can use our above query as our subquery
-- from that table we can divide women's sales by men's sales 

with clothing_sales as (
	select 
	year, 
	sum(case when kind_of_business like "Women's clothing%" then sales end) women_sales, 
	sum(case when kind_of_business like "Men's clothing%" then sales end) men_sales
	from
		retail_sales rs 
	group by year

)
select 
	year,
	women_sales / men_sales men_to_women_ratio
from
	clothing_sales;
	
-- INSIGHT: the difference between women and men clothing sales increase Substantially in 2021 compare to 
-- previous years and in 2021 the women's total sales was 18% higher than men.


-- **************
-- QUESTION 11
-- **************
-- 11- What is the year-to-date total sale fo each month for 2019, 2020, 2021, 2022 for women's clothing stores?
-- To answer the question : 
-- we need the cumulative total sales for each month in a year to find year-to-date sales 
	-- for exemple in month 3, the YTD sales with be the total sales from month 1, 2, and 3.

select 
	month, 
	year, 
	sales ,
	sum(sales) over(partition by year
order by
	month) ytd_sales
from
	retail_sales
where
	kind_of_business like "Women's clothing%"
	and year in (2022, 2021, 2020, 2019)
order by
	year desc,
	month;
	
-- INSIGHT: in the first half of 2019 the women's clothing store revenue was 18 billions, and in the first halh of 2020 it decreased to 
-- 10 billions dollars due to covid pandemic, the revenue bounce back in the first half of 2021 to 17 billions, and 19 billions in the first
-- half of 2022.



-- **************
-- QUESTION 12
-- **************
-- 12- What is the month-over-month growth rate of women's clothing business in 2022;
-- To Answer this question 
-- we need the current month sales and the previous month sales to calculate MoM growth rate
-- the final table return the month, current monthly sales, which are already available in the data
-- and it returns the growth rate which is (current - previous) / previous * 100

select *, 
	(current_month_sales - prev_month_sales)/prev_month_sales*100 MoM_growth_rate
from (
		select month, 
			sales current_month_sales, 
			lag(sales, 1) over (order by month) prev_month_sales
		from retail_sales rs 
		where kind_of_business like "Women's clothing%"
			and year = 2022) temp;

-- INSIGHT: this result shows that the women's clothing sales fluctuated alot during 2022 were we can notice
-- 4 months (april, june, july, september) with negative growth. Overall the first month of the year and the 
-- last month of the year have perform the best for the women's clothing business
		











