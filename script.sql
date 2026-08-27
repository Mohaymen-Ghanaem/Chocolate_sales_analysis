/*Displaying the full schema*/
SELECT * from chocolate_sales;

/*Data cleaning and format change*/
Select  amount as unformatted_amount,
        CAST(replace(replace(amount, '$', ''), ',', '') AS NUMERIC) AS formatted_amount
from chocolate_sales;
ALTER Table chocolate_sales
ADD COLUMN formatted_amount NUMERIC(10, 2);
Update chocolate_sales
SET formatted_amount = CAST(replace(replace(amount, '$', ''), ',', '') AS NUMERIC);
/*Selecting new formatted amount*/
SELECT formatted_amount from chocolate_sales;

Select * from chocolate_sales;
/*Queries to answer business questions*/
/*Selecting distinct countries*/
Select Distinct country from chocolate_sales;
/*Profit of each country for the past three years*/

/*Canada*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'Canada';

/*India*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'India';

/*USA*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'USA';

/*New Zealand*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'New Zealand';

/*Australia*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'Australia';

/*UK*/
Select SUM(formatted_amount) FROM chocolate_sales where country = 'UK';

/*Finding all the profit for each country by grouping*/
Select country, sum(formatted_amount) as total_amount_country FROM chocolate_sales
group by country;

/*Most sold chocolate from each country*/
SELECT product, sum(chocolate_sales.formatted_amount) as total_amount_product FROM chocolate_sales
group by product;

/*Salesperson and how much they sold*/
SELECT "Sales Person", SUM(formatted_amount) as total_amout_sales from chocolate_sales
group by "Sales Person"
order by total_amout_sales desc ;
