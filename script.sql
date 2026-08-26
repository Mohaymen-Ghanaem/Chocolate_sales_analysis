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

Select * from chocolate_sales
/*Queries to answer business questions*/
