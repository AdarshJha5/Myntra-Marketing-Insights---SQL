use myntra;

select * from myntra.products;

-- User Specific
# 1. Which product categories witness the highest sales during the year?

select product_tag, sum(rating_count) as products_sold from myntra.products
group by product_tag
order by products_sold desc limit 5;


# 2. Which brand witnessed the highest sales during year?

select brand_tag, sum(rating_count) as products_sold from myntra.products
group by brand_tag
order by products_sold desc limit 5;

# 3. Which product categories of a specific brand witnessed maximum sales?

select brand_tag, product_tag, sum(rating_count) as products_sold from myntra.products
group by brand_tag, product_tag
order by products_sold desc limit 10;

# 4. Which product witnessed the maximum sales?

select * from myntra.products
order by rating_count desc limit 1;

# 5. Which brand witness the highest revenue during year?

select brand_tag, sum(discounted_price*rating_count) as revenue from myntra.products
group by brand_tag
order by revenue desc limit 5;

-- Merchant Specific
# 1. What is the average price point of products across different categories and brands?

select product_tag, round(avg(discounted_price)) as Avg_Price, round(avg(marked_price)) as MRP from myntra.products
group by product_tag
order by Avg_Price desc;


# 2. How much discount should be offered on each product to maximize revenue and profit?

select product_tag, round(avg(marked_price-discounted_price)) as avg_discount from myntra.products
group by product_tag
order by product_tag asc;

# 3. What is the average discount on tshirt we need to give?

select avg(marked_price-discounted_price) from myntra.products
where product_tag='tshirts';

select *, marked_price-discounted_price as dicount_offered from myntra.products
where product_tag='tshirts'
order by rating_count desc;


# 4. What are the biggest brands in tshirt market?

select brand_tag, sum(rating_count*discounted_price) as sales from myntra.products
where product_tag='tshirts'
group by brand_tag
order by sales desc limit 10;

## 5. How much market of tshirt is captured by roadster?

select brand_tag, product_tag, sum(rating_count*discounted_price) as revenue from myntra.products
where brand_tag='roadster' and product_tag='tshirts';


# 6. How much market of tshirt is captured by top 5 tshirt brands?

#By revenue
select brand_tag, product_tag, sum(rating_count*discounted_price) as revenue from myntra.products
where product_tag='tshirts'
group by brand_tag
order by revenue desc limit 5;

#By units sold
select brand_tag, product_tag, sum(rating_count) as units_sold from myntra.products
where product_tag='tshirts'
group by brand_tag
order by units_sold desc limit 5;

# 7. Which tshirt witnessed the maximum sales?

select * from myntra.products
where product_tag='tshirts'
order by rating_count desc limit 1;


-- Company Specific | Improvements
# 1.  Which products have the highest and lowest ratings and what insights can we glean from them?

select * from myntra.products
order by rating asc limit 10;

select * from myntra.products
order by rating desc limit 10;


-- Company Specific | Event
# 1. Which products/ brands should be promoted for the event or through personalized recommendations?

# Unisex Skin Care Gift Set by Biotique should be promoted heavily as it witnessed the maximum sales.
# Roadster, Biotique and Maybelline are the top 3 brands that generated the maximum sales.
# Brand-product that generated the highest sales - Roadster tshirts, Roadster shirts, roadster Jeans, Highlander Shirts and Biotique Skin care gift set.
# Top 5 brands that sold the most number of dresses are sassafras, athena, tokyo-talkies, uf and berrylush.
# Roadster and HRX generated the maximum revenue overall. Although Roadster's revenue was almost 3.5 times the revenue of HRX.

