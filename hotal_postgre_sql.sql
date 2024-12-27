--Find the total number of reservations that were canceled:

SELECT COUNT(*) AS canceled_reservations
from hotel
where is_canceled='yes';

--Calculate the average lead time for reservations:
select * from hotel;

select avg(lead_time) as average_lead_time
from hotel;

--Get the number of reservations per year:
select arrival_date_year, count(*) as num_of_reser
from hotel
group by arrival_date_year;

--Find out the total number of special requests and their distribution:
select total_of_special_requests, count(*) as num_resvation
from hotel
group by total_of_special_requests;


--Identify reservations with the highest number of stays (weekend nights + week nights):

select (stays_in_weekend_nights+stays_in_week_nights) as higest_no_satys
from hotel
order by total_stay desc limit 5;


--Calculate the average daily rate (ADR) per customer type:
select avg(adr) as average_daily_rate
from hotel
group by customer_type;


--Find out the most common arrival month for reservations:
select arrival_date_month , count(*) as num_reservations1
from hotel
group by arrival_date_month
order by num_reservations1 desc;


select * from hotel

-- Calculate the average lead time, average ADR, and total number of reservations per customer type

SELECT 
    customer_type,
    AVG(lead_time) AS avg_lead_time,
    AVG(adr) AS avg_adr,
    COUNT(*) AS num_reservations
FROM 
    hotel
GROUP BY 
    customer_type;

-- Identify reservations with stays exclusively on weekend nights

SELECT 
    *
FROM 
    hotel
WHERE 
    stays_in_weekend_nights > 0
    AND stays_in_week_nights = 0;

-- Calculate the percentage of reservations that were canceled
SELECT 
    SUM(CASE WHEN is_canceled = 'yes' THEN 1 ELSE 0 END) AS canceled_reservations,
    COUNT(*) AS total_reservations,
    (SUM(CASE WHEN is_canceled = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS cancellation_rate
FROM 
    hotel;

select * from hotel;

-- Find out the total number of special requests and their distribution

select total_of_special_requests,count(*) as number_of_reservation
from hotel
group by total_of_special_requests;

-- Identify reservations with the highest total stay duration (weekend nights + week nights)

select *,(stays_in_week_nights+stays_in_weekend_nights) as total_highest_stay
from hotel 
order by total_stay desc
limit 10;

-- Find out the most common arrival month and year for reservations
select arrival_date_year,arrival_date_month,
count(*) as common_m_y_for_reservations
from hotel
group by arrival_date_year,arrival_date_month
order by common_m_y_for_reservations desc
limit 1;


--Identify reservations with the highest total stay duration (weekend nights + week nights) for each hotel type:

select * from hotel;
select arrival_date_year,arrival_date_month,arrival_date_week_number,arrival_date_day_of_month,
(stays_in_weekend_nights+stays_in_week_nights) as total_stay
from hotel
where( hotel= 'City Hotel' or hotel= 'Resort Hotel')
ORDER BY total_stay DESC;


--Calculate the average daily rate (ADR) and total revenue generated per hotel type per year:
SELECT hotel, arrival_date_year,
       AVG(adr) AS avg_adr,
       SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) AS total_revenue
FROM hotel
WHERE (hotel = 'Resort Hotel' OR hotel = 'City Hotel')
GROUP BY hotel, arrival_date_year
ORDER BY hotel, arrival_date_year;

--Find out the percentage of reservations that had special requests per month and year:
SELECT arrival_date_year, arrival_date_month,
       COUNT(*) AS total_reservations,
       SUM(CASE WHEN total_of_special_requests > 0 THEN 1 ELSE 0 END) AS reservations_with_special_requests,
       (SUM(CASE WHEN total_of_special_requests > 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_with_special_requests
FROM hotel
GROUP BY arrival_date_year, arrival_date_month
ORDER BY arrival_date_year, arrival_date_month;

--Identify customers who stayed for both weekend nights and week nights and had special requests:
SELECT *
FROM hotel
WHERE stays_in_weekend_nights > 0 AND stays_in_week_nights > 0 AND total_of_special_requests > 0;

--Find out the top 5 countries of origin for guests (assuming country information is available):

SELECT country, COUNT(*) AS num_guests
FROM hotel
WHERE country IS NOT NULL
GROUP BY country
ORDER BY num_guests DESC
LIMIT 5;

--Calculate the average lead time and cancellation rate for 
--reservations made through different distribution channels:

select distribution_channel, 
avg(lead_time) as avg_lead_time,
sum(case when is_canceled='yes' then 1 else 0 end) as canceled_reservations,
(sum(case when is_canceled='yes' then 1 else 0 end)/count(*))*100 as cancellation_rate
from hotel
group by distribution_channel
ORDER BY cancellation_rate DESC;


--Identify the peak months for reservations (by total number) across all years:
select arrival_date_month ,count(*) as num_reseravation
from hotel
group by arrival_date_month
order by num_reseravation desc;

--Calculate the average length of stay (in nights) per hotel type and customer type:
select hotel,avg(stays_in_weekend_nights+stays_in_week_nights) as avg_stays_in_nights
from hotel
group by hotel,customer_type;

--Find out the distribution of bookings by market segment and year:

SELECT market_segment, arrival_date_year,
       COUNT(*) AS num_bookings
FROM hotel
GROUP BY market_segment, arrival_date_year
ORDER BY market_segment, arrival_date_year;

--Identify the top 10 countries with the highest average daily rate (ADR) for reservations:
select country,avg(adr) as average_daily_rate_ADR
from hotel
where adr>0
group by country
order by average_daily_rate_ADR desc
limit 10;



























