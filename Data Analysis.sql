 -- select from 12 months of data 
 SELECT COUNT(*) from trip_data_2022;  
 -- 5648312 records in the dataset

-- Alter column member_casual to rider_type
ALTER TABLE trip_data_2022 RENAME COLUMN member_casual TO rider_type;
 

 -- check for ride_length below 1 minute
 SELECT COUNT(*) FROM trip_data_2022 WHERE EXTRACT(EPOCH FROM ride_length) < 60;  -- we found 105229 records with ride_length below 1 minute we will remove them from our dataset

-- remove records with ride_length below 1 minute
DELETE FROM trip_data_2022 WHERE EXTRACT(EPOCH FROM ride_length) < 60;
-- 105229 records removed from the dataset WHICH IS 1.86% of the dataset


-- now we will check for ride_length above 1 day as in case study the said that Customers who purchase single-ride or full-day passes are referred to as casual riders. here the full-day passes is not clear so we will consider it as 1 day i mean 24 hours.

SELECT count(*) FROM trip_data_2022 WHERE rider_type = 'casual' AND ride_length > INTERVAL '24 hours';

-- we found 4075 records with ride_length above 1 day we will remove them from our dataset


-- remove records with ride_length above 1 day
 DELETE FROM trip_data_2022 WHERE rider_type = 'casual' AND ride_length > INTERVAL '24 hours';
    -- 4075 records removed from the dataset WHICH IS 0.07% of the dataset

-- check for valid ride_id which is not less than and greater than 16 characters
SELECT COUNT(*) AS count_invalid_ride_id FROM trip_data_2022 WHERE LENGTH(ride_id) < 16 OR LENGTH(ride_id) > 16;
    -- we found 16 records with invalid ride_id we will remove them from our dataset

-- remove records with invalid ride_id
DELETE FROM trip_data_2022 WHERE LENGTH(ride_id) < 16 OR LENGTH(ride_id) > 16;
    -- 16 records removed from the dataset WHICH IS 0.0002% of the dataset

-- Total number of Trips by Rider Type
SELECT rider_type, COUNT(*) AS total_trips FROM trip_data_2022 GROUP BY rider_type ORDER BY total_trips DESC;
    -- member  3270881
    -- casual  2268111