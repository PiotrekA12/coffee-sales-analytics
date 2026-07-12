/*
===============================================================================
Project: Coffee Sales Analytics - ETL & Data Modeling
Author: [Your Name]
Description: 
    This script builds the data infrastructure for the Coffee Sales Dashboard.
    It creates dimensional metadata tables, injects configuration data, 
    and exposes a unified Business Intelligence view (v_coffee_analysis) 
    with embedded feature engineering (seasonality, workday flags, time segments).
===============================================================================
*/



-- STEP 1: Create and Populate Product Metadata Table (Dimension)
SELECT 
coffee_name,
count(coffee_name)
from coffee_sales 
group by coffee_name 
order by count(coffee_name) desc


select 
distinct coffee_name
from coffee_sales

select *
from coffee_sales
where id_card is not null

create table coffee_metadata (
	coffee_name varchar(100),
	category varchar(30),
	caffeine_level varchar(10),
	contains_milk bit
)

insert into coffee_metadata
(coffee_name, category, caffeine_level, contains_milk)
values 
('Espresso', 'Coffee', 'High', 0),
('Double espresso', 'Coffee', 'Very High', 0),
('Double ristretto', 'Coffee', 'Very High', 0),
('Americano', 'Coffee', 'High', 0),
('Americano with milk', 'Coffee', 'High', 1),
('Cappuccino', 'Coffee', 'Medium', 1),
('Latte', 'Coffee', 'Medium', 1),
('Mochaccino', 'Coffee', 'Medium', 1),
('Cortado', 'Coffee', 'Medium', 1),
('Double espresso with milk', 'Coffee', 'Very High', 1),
('Vanilla coffee', 'Coffee', 'Medium', 0),
('Caramel coffee', 'Coffee', 'Medium', 0),
('Coffee with chocolate', 'Coffee', 'Medium', 0),
('Tea', 'Tea', 'Low', 0),
('Chocolate', 'Sweet', 'None', 0),
('Hot Chocolate', 'Sweet', 'None', 1),
('Cocoa', 'Sweet', 'None', 1),
('Double chocolate', 'Sweet', 'None', 0),
('Super chocolate', 'Sweet', 'None', 0),
('Caramel', 'Sweet', 'None', 0),
('Caramel with chocolate', 'Sweet', 'None', 0),
('Caramel with milk', 'Sweet', 'None', 1),
('Chocolate with milk', 'Sweet', 'None', 1),
('Hot milkshake', 'Sweet', 'None', 1),
('Double vanilla', 'Sweet', 'None', 0),
('Irish whiskey', 'Alcohol-based', 'None', 0),
('Double Irish whiskey', 'Alcohol-based', 'None', 0),
('Irish whiskey with milk', 'Alcohol-based', 'None', 1),
('Coffee with Irish whiskey', 'Alcohol-based', 'High', 0),
('Caramel with Irish whiskey', 'Alcohol-based', 'None', 0),
('Vanilla with Irish whiskey', 'Alcohol-based', 'None', 0),
('Irish with chocolate', 'Alcohol-based', 'None', 0),
('Chocolate with coffee', 'Coffee', 'Low', 0)

select * from coffee_metadata
order by contains_milk



select *,
	DAYNAME(sell_date) AS day_name
from coffee_sales cs 
left join coffee_metadata cm on cs.coffee_name = cm.coffee_name

-- STEP 2: Create and Populate Operational Time Segments (Dimension)
CREATE TABLE time_segments (
    segment_id INT PRIMARY KEY AUTO_INCREMENT,
    segment_name VARCHAR(30),
    start_time TIME,
    end_time TIME
)

select * from time_segments

drop table time_segments

insert into  time_segments
(segment_name, start_time, end_time)
values
('Morning', '00:00:00', '09:59:59'),
('Midday', '10:00:00', '12:59:59'),
('Afternoon', '13:00:00', '15:59:59'),
('Evening', '16:00:00', '23:59:59')



-- STEP 3: Create the Core BI View (Feature Engineering & Star-Schema Join)
CREATE VIEW v_coffee_analysis as
select 
	cs.sell_date,
	cs.date_time,
	DAYNAME(cs.sell_date) AS day_name,
	WEEKDAY(cs.sell_date) AS day_index,   
	CASE 
        WHEN WEEKDAY(cs.sell_date) IN (5, 6) THEN 0  
        ELSE 1
    END AS is_workday,
    CASE 
        WHEN MONTH(cs.sell_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(cs.sell_date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(cs.sell_date) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Autumn'
    END AS year_season,
    cs.money,
	cs.coffee_name,
	cm.category,
	cm.caffeine_level,
	cm.contains_milk,
	ts.segment_name,
	ts.segment_id # 
from coffee_sales cs 
left join coffee_metadata cm on cs.coffee_name = cm.coffee_name
left join time_segments ts on TIME(cs.date_time) BETWEEN ts.start_time AND ts.end_time


-- STEP 4: Final Data Verification Query
select * from v_coffee_analysis






