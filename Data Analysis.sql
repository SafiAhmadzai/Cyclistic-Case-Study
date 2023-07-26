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


-- calculate the average length for both  member and casual riders
SELECT rider_type, AVG(ride_length) AS avg_ride_length FROM trip_data_2022 GROUP BY rider_type ORDER BY avg_ride_length DESC;
    -- casual  00:22:18.217739
    -- member  00:12:59.222967

-- Total number of Trips by Rider Type
SELECT rider_type, COUNT(*) AS total_trips FROM trip_data_2022 GROUP BY rider_type ORDER BY total_trips DESC;
    -- member  3270881
    -- casual  2268111
   
-- average ride_length by rider_type and weekday 
SELECT rider_type, day_of_week, AVG(ride_length) AS avg_ride_length FROM trip_data_2022 GROUP BY rider_type, day_of_week ORDER BY avg_ride_length DESC;
    -- "casual"	"Sunday"	"00:25:30.40271"
    -- "casual"	"Saturday"	"00:25:00.987966"
    -- "casual"	"Monday"	"00:22:47.488923"
    -- "casual"	"Friday"	"00:20:55.136089"
    -- "casual"	"Tuesday"	"00:19:58.896226"
    -- "casual"	"Thursday"	"00:19:53.89254"
    -- "casual"	"Wednesday"	"00:19:13.806731"
    -- "member"	"Saturday"	"00:14:28.079294"
    -- "member"	"Sunday"	"00:14:21.26958"
    -- "member"	"Friday"	"00:12:47.709014"
    -- "member"	"Thursday"	"00:12:33.196703"
    -- "member"	"Monday"	"00:12:31.503151"
    -- "member"	"Tuesday"	"00:12:22.665786"
    -- "member"	"Wednesday"	"00:12:21.621035"
  

-- create column name month
ALTER TABLE trip_data_2022 ADD COLUMN month VARCHAR(20);

-- update month column with month name
UPDATE trip_data_2022 SET month = TO_CHAR(started_at, 'Month');

-- average ride length by rider_type and month
SELECT rider_type, month, AVG(EXTRACT(EPOCH FROM ride_length)) AS avg_ride_length 
FROM trip_data_2022 GROUP BY rider_type, month ORDER BY avg_ride_length DESC;
 /* 
    "casual"	"May      "	1560.6621338416512070
    "casual"	"March    "	1478.0581675297537930
    "casual"	"June     "	1431.3341647820495765
    "casual"	"April    "	1420.2306915087095340
    "casual"	"July     "	1419.4303601820451079
    "casual"	"August   "	1316.2105999360555403
    "casual"	"September"	1228.3626722271897149
    "casual"	"February "	1198.6129773184036750
    "casual"	"October  "	1133.3973749828205682
    "casual"	"January  "	1059.8141325268078086
    "casual"	"November "	954.5869173162158031
    "member"	"June     "	857.1833242684929128
    "member"	"July     "	841.4651010513460025
    "casual"	"December "	824.5435186246418338
    "member"	"August   "	821.3487578883742573
    "member"	"May      "	817.7349569416313489
    "member"	"September"	796.1311309056861604
    "member"	"October  "	734.4280718211799194
    "member"	"March    "	730.5202830758246316
    "member"	"January  "	726.6446798666555942
    "member"	"April    "	703.4494378272387826
    "member"	"February "	699.7116617758939246
    "member"	"November "	682.6583164168790222
    "member"	"December "	653.8657006644393558 
*/

-- calculate the number of trips by rider_type and month seasonal trends
SELECT rider_type, month, COUNT(*) AS total_trips FROM trip_data_2022 GROUP BY rider_type, month ORDER BY total_trips DESC;
/*  
    "member"	"August   "	416911
    "member"	"July     "	407763
    "casual"	"July     "	396605
    "member"	"September"	395170
    "member"	"June     "	391623
    "casual"	"June     "	360816
    "casual"	"August   "	350304
    "member"	"May      "	347087
    "member"	"October  "	341125
    "casual"	"September"	289661
    "casual"	"May      "	274369
    "member"	"April    "	239695
    "member"	"November "	231530
    "casual"	"October  "	203732
    "member"	"March    "	190479
    "member"	"December "	133195
    "casual"	"April    "	123715
    "casual"	"November "	98145
    "member"	"February "	92010
    "casual"	"March    "	88056
    "member"	"January  "	84293
    "casual"	"December "	43625
    "casual"	"February "	20898
    "casual"	"January  "	18185
*/

-- calculate the number of trips by rider_type and weekday
SELECT rider_type, day_of_week, COUNT(*) AS total_trips FROM trip_data_2022 GROUP BY rider_type, day_of_week ORDER BY total_trips DESC;
/* 
    "member"	"Thursday"	520486
    "member"	"Wednesday"	512385
    "member"	"Tuesday"	507546
    "member"	"Monday"	463088
    "casual"	"Saturday"	462032
    "member"	"Friday"	456668
    "member"	"Saturday"	432668
    "casual"	"Sunday"	379765
    "member"	"Sunday"	378040
    "casual"	"Friday"	326896
    "casual"	"Thursday"	302288
    "casual"	"Monday"	271333
    "casual"	"Wednesday"	268150
    "casual"	"Tuesday"	257647
*/


-- Peak Hours: Analyze the distribution of ride start times for both groups to identify if there are specific hours during which one group prefers to ride more than the other.
SELECT rider_type, EXTRACT(HOUR FROM started_at) AS hour, COUNT(*) AS total_trips FROM trip_data_2022 GROUP BY rider_type, hour ORDER BY total_trips DESC;
/* 
    "member"	17	341910
    "member"	16	285179
    "member"	18	278337
    "member"	15	216492
    "casual"	17	215236
    "member"	19	201728
    "member"	8	200293
    "casual"	16	193292
    "casual"	18	192970
    "member"	12	183296
    "member"	13	181803
    "member"	14	180503
    "casual"	15	173997
    "member"	7	168988
    "member"	11	158753
    "casual"	14	156324
    "casual"	19	147734
    "casual"	13	146916
    "member"	20	141587
    "casual"	12	141037
    "member"	9	140857
    "member"	10	132622
    "casual"	11	118637
    "member"	21	111090
    "casual"	20	109157
    "casual"	21	93385
    "casual"	10	90972
    "member"	6	89193
    "member"	22	84893
    "casual"	22	84373
    "casual"	9	70604
    "casual"	8	68330
    "casual"	23	62906
    "member"	23	55626
    "casual"	7	50445
    "casual"	0	45184
    "member"	0	35193
    "member"	5	31678
    "casual"	1	29324
    "casual"	6	28838
    "member"	1	21656
    "casual"	2	18145
    "member"	2	12582
    "casual"	5	12144
    "casual"	3	10785
    "member"	4	8757
    "member"	3	7865
    "casual"	4	7376
*/