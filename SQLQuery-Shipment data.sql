Use Itrechio
go
Select * from ShipmentData

--1. Which Warehouse block has the highest weight load?

select Warehouse_block, sum(Weight_in_kg) as weight_load from ShipmentData
group by Warehouse_block
order by weight_load;

--2. What is the total cost of production with reference to Product importance?

select Product_Importance, sum(Cost_of_the_Product) as production_cost, count(*) as product_count from ShipmentData
group by Product_Importance
order by production_cost desc;

--3. What is the sum of product that arrived On-time?

select count(*) as On_time_deliveries from ShipmentData
where Reached_on_Time_Y_N = 'On time'

-- 4. How many male customers get discounts above 30?

select top 1 Gender, count(*) as mid_level_discounts from ShipmentData
where Discount_offered > 30
group by Gender;

-- 5. What is the average weight by Product importance?

select Product_Importance, avg(Weight_in_kg) as average_weight from ShipmentData
group by Product_Importance
order by average_weight desc;

-- 6. Which mode of shipment is the least used by male?

select top 1 Gender, Mode_of_Shipment, count(*) as customer_count from ShipmentData
where Gender = 'Male'
group by Gender, Mode_of_Shipment
order by customer_count asc;

--7. Which mode of shipment is the least used by male?

select top 1 Gender, Mode_of_Shipment, count(*) as customer_count from ShipmentData
where Gender = 'Female'
group by Gender, Mode_of_Shipment
order by customer_count asc;

-- 8. Does number of customer care calls influence customer review?

select
    case
        when Customer_rating = 1 then 'Not satisfied'
        when Customer_rating = 2 then 'Poor'
        when Customer_rating = 3 then 'Fair'
        when Customer_rating = 4 then 'Good'
        when Customer_rating = 5 then 'Satisfied'
    end as Customer_satisfaction,
    sum(Customer_care_calls) as customer_calls, count(*) as Count
from ShipmentData
group by Customer_rating
order by Count desc;

-- 9. For "High" importance products, which method leads to the highest satisfaction?

select
    Mode_of_Shipment,
    avg(Customer_rating) as average_rating
from ShipmentData
where Product_Importance = 'High'
group by Mode_of_Shipment
order by average_rating desc;

-- 10. What is the gender distribution of customers?

select Gender, count(*) as gender_distribution from ShipmentData
group by Gender;

