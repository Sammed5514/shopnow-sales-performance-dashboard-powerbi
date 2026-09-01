use globalelecpjt1;

select * from customers;
select * from data_dictionary;
select * from exchange_rates;
select * from products;
select * from sales;
select * from stores;

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Customers $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ------------------------------------------------------- Converting to Date type ------------------------------------------------------------------
-- select CustomerKey ,Birthday, str_to_date(Birthday, '%m/%d/%Y') as conevrted_date from customers;
set sql_safe_updates = 0;
update customers
set Birthday = str_to_date(Birthday, '%m/%d/%Y');
set sql_safe_updates = 1;

set sql_safe_updates = 0;
update customers
set Birthday = str_to_date(Birthday, '%m/%d/%Y');
set sql_safe_updates = 1;

set sql_safe_updates = 0;
call convert_date_column(
'sales',
'Order Date',
'%m/%d/%Y'
);
set sql_safe_updates = 1;

-- tried updating `Delivery Date` but failed due to empty strings.
set sql_safe_updates = 0;
call convert_date_column(
'sales',
'Delivery Date',
'%m/%d/%Y'
);
set sql_safe_updates = 1;

SELECT *
FROM sales
WHERE trim(`Delivery Date`) = '';

-- replaced empty strings with null values
update sales
set `Delivery Date` = null
where trim(`Delivery Date`) = '';

call convert_date_column(
'sales',
'Delivery Date',
'%m/%d/%Y'
);
set sql_safe_updates = 1;

-- checking null or empty values for Open date from stores
SELECT *
FROM stores
WHERE trim(`Open Date`) = '';

set sql_safe_updates = 0;
call convert_date_column(
'stores',
'Open Date',
'%m/%d/%Y'
);
set sql_safe_updates = 1;


-- ------------------------------------------------------- Trimming the white space ------------------------------------------------------------------
select * from customers;
set sql_safe_updates = 0;
call trimming(
'customers',
'Gender'
);

call trimming(
'customers',
'Name'
);

call trimming(
'customers',
'City'
);

call trimming(
'customers',
'State Code'
);

call trimming(
'customers',
'State'
);

call trimming(
'customers',
'Country'
);

call trimming(
'customers',
'Continent'
);
set sql_safe_updates = 1;
-- ------------------------------------------------------- Changing Data type------------------------------------------------------------------
call changingDataType(
'customers',
'Birthday',
'DATE');

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ exchange_rates $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ------------------------------------------------------- Converting to Date type ------------------------------------------------------------------
select * from exchange_rates;
set sql_safe_updates = 0;
call convert_date_column(
'exchange_rates',
'Date',
'%m/%d/%Y'
);
set sql_safe_updates = 1;

-- ------------------------------------------------------- trimming --------------------------------------------------------------------------------
set sql_safe_updates = 0;
call trimming(
'exchange_rates',
'Currency'
);
set sql_safe_updates = 1;
-- ------------------------------------------------------- Converting to Date type ------------------------------------------------------------------
set sql_safe_updates = 0;
call changingDataType(
'exchange_rates',
'Date',
'DATE');
set sql_safe_updates = 1;

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ products $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ------------------------------------------------------- trimming --------------------------------------------------------------------------------
select * from products;
set sql_safe_updates = 0;
call trimming(
'products',
'Product Name'
);

call trimming(
'products',
'Brand'
);

call trimming(
'products',
'Brand'
);

call trimming(
'products',
'Color'
);

call trimming(
'products',
'Unit Cost USD'
);

call trimming(
'products',
'Unit Price USD'
);

call trimming(
'products',
'SubcategoryKey'
);

call trimming(
'products',
'Subcategory'
);

call trimming(
'products',
'CategoryKey'
);

call trimming(
'products',
'Category'
);

-- --------------------------------- replacing $ and ',' and converting TEXT datatype to DECIMAL ---------------------------------------------------
-- 1909 1060.22
select * from products;
with cte1 as(
select ProductKey,replace(`Unit Cost USD`,'$','') ut from products),
cte2 as(
select ProductKey,replace(ut,',','') yt from cte1)
select * from cte2;
call removeCharchter(
    'products',
    'Unit Cost USD',
   '$'
);
call removeCharchter(
    'products',
    'Unit Cost USD',
   ','
);

SELECT COUNT(*)
FROM products
WHERE `Unit Cost USD`  REGEXP '[^0-9.]';

call changingDataType(
    'products',
    'Unit Cost USD',
   'DECIMAL(10,2)'
);
-- --------
call removeCharchter(
    'products',
    'Unit Price USD',
   '$'
);
call removeCharchter(
    'products',
    'Unit Price USD',
   ','
);

SELECT COUNT(*)
FROM products
WHERE `Unit Price USD`  REGEXP '[^0-9.]';

call changingDataType(
    'products',
    'Unit Price USD',
   'DECIMAL(10,2)'
);

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ sales $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
select * from sales;

call trimming(
'sales',
'Currency Code'
);
-- ------------------------------------------------------- Converting to Date type ------------------------------------------------------------------
call changingDataType(
'sales',
'Order Date',
'DATE');

call changingDataType(
'sales',
'Delivery Date',
'DATE');

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ stores $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
select * from stores;

call trimming(
'stores',
'Country'
);
call trimming(
'stores',
'State'
);
-- ------------------------------------------------------- Converting to Date type -----------------------------------------------------------------
call changingDataType(
'stores',
'Open Date',
'DATE');

SELECT *
FROM sales s
LEFT JOIN customers c ON s.CustomerKey = c.CustomerKey
WHERE c.CustomerKey IS NULL;

SELECT `Order Number`, COUNT(*) 
FROM globalelecpjt1.sales 
GROUP BY `Order Number` 
HAVING COUNT(*) > 1;

select * from sales where `Order Number` = '367005';

SELECT distinct *
FROM sales s
LEFT JOIN stores c ON s.StoreKey = c.StoreKey
WHERE c.StoreKey IS NULL;