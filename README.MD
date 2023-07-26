# Google Data Analytics Capstone Project: Cyclistic using Excel, SQL, and Tableau.

## Introduction

For The Google Data Analytics Capstone Project, I will be working with Cyclistic, a fictional bike-share company in Chicago. I will be acting as a junior data analyst working in the marketing analytics team. The director of marketing, Lily Moreno, believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my project goal is to understand how annual members and casual riders use Cyclistic bikes differently. From these insights, I will design a marketing strategy that converts casual riders into annual members.
using excel to clean the data and then import the data to pgadmin and use sql to analyze the data and then use tableau to create the dashboard and story.

## About the Company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their

## Ask

### Business Task

Analyze Cyclistic's 2022 trip data to understand how casual riders and annual members use bikes differently. why casual riders would buy a membership, and how digital media could affect their marketing tactics.
Insights gained from this analysis will help the marketing team develop their strategies for the campaign.

## Prepare

The first step in my prepare process is to download all of the data that I will need for my analysis. We will be using the Cyclistic trip data for 2022, from january to december,
which needs to be downloaded in 12 separate .csv files for each month of the year and stored in a dedicated folder. The data has been made available by Motivate International Inc. under this license. The data is also available on this link.
https://divvy-tripdata.s3.amazonaws.com/index.html

## Process

### Data Cleaning

**Excel**

To ensure the data is clean and ready for analysis, the following data cleaning steps were performed on each .csv file in Excel:

1. **Remove Duplicates:** Checked for and removed any duplicate rows.

2. **Remove Invalid ride_id:** Filtered out rows where the `ride_id` is less than 16 characters long, as these are likely to be invalid or incomplete entries and then sort at form A-Z and check it.

3. **Calculate Ride Length:** Created a new column labeled `ride_length` by calculating the duration of each ride. This was done by subtracting the `started_at` timestamp from the `ended_at` timestamp, representing the duration of the ride in hours, minutes.
4. **Time Format Adjustment:** Changed the time format in the `ride_length` column to `37:30:55` to make it more readable, displaying hours, minutes, and seconds.

5. **Create Day of the Week:** Utilized the `=weekday()` function to extract the numerical representation of the day of the week (1-7, where 1 represents Sunday and 7 represents Saturday) and then applied the custom format `dddd` to display the day of the week in full text format (e.g., Sunday, Monday, etc.).

6. **Filter Out Short and Long Rides for Casual Riding:** Fileter any ride_length and remove negative values.
7. **check for rideable types and remove any other types:** Filter out any rideable types that are not classic_bike, docked_bike, electric_bike.
8. check for rider_type and remove any other types:\*\* Filter out any rider_type that are not casual, member.

By completing these data cleaning steps, we have prepared the Cyclistic trip data for 2022 for further analysis, ensuring accuracy and consistency in the dataset.

## Analyze:

we import all the 12 csv file to pgadmin and then we use sql to analyze the data.
for sql code please refer to the sql file in the repository click [here](https://github.com/SafiAhmadzai/Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)

## Share

For visualization, we have used Tableau to create an interactive dashboard and compelling story. Click [here](https://public.tableau.com/app/profile/safiullah.ahmadzai/viz/CyclisticDashboard_16903724263310/Cyclisticdashboard) to explore the current version of the dashboard and story. We are continuously working on enhancing the dashboard with more insights and data, so stay tuned for future updates.

## Act

The analysis of Cyclistic bike-sharing data reveals valuable insights into rider behavior and preferences, providing actionable conclusions for enhancing the overall user experience and optimizing marketing strategies.

## Differences between Annual Members and Casual Riders

1. Casual riders tend to take longer rides on average (approximately 22 mins), using bikes for leisure and exploration.
2. Annual members prefer shorter, more frequent rides (approximately 13 mins), likely for practical purposes like daily commuting or short trips.
3. Annual members make more trips overall (3.3M) compared to casual riders (2.3M).

## Seasonal Trends

-   Both groups show peak activity in summer (July & August).
-   Trip numbers decline in colder months (fall & winter).

## Weekly Usage Patterns

-   Weekdays observe higher trip numbers for both groups, indicating commuting.
-   Saturdays are popular for casual riders, while members use bikes consistently on weekdays.

## Peak Hours

-   Late afternoon (around 5:00 PM) is preferred by both groups.
-   Early morning (4:00 AM - 6:00 AM) sees fewer rides.

## Conclusions and Recommendations

### Membership Promotion

-   Targeted promotions showcasing annual membership benefits, cost savings, and convenience can entice casual riders to become annual members.
-   Exclusive features, like priority access, can further incentivize casual riders to upgrade their memberships.

### Seasonal Campaigns

-   Seasonal marketing campaigns, focusing on leisurely rides during summer and practical usage during colder months, can appeal to distinct rider preferences.

### Weekday Strategies

-   Optimize bike availability and station placement during peak weekdays to accommodate the commuting needs of both annual members and casual riders.
-   Offer special promotions or events on Saturdays to attract more casual riders during weekends.

### Enhancing User Experience

-   Ensure bike availability and maintenance during peak hours, especially in the late afternoon, to improve user satisfaction.
-   Implement incentives during off-peak hours to encourage bike usage and balance demand throughout the day.
