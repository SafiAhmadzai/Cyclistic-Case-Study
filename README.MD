# Google Data Analytics Capstone Project: Cyclistic

## Introduction

Demonstrated in this case study are the skills that I have learned in the Google Data Analytics Professional Certificate Course. I will use these skills to complete the tasks of a data analyst working for the fictional bike-share company Cyclistic. Following the data analysis process of Ask, Prepare, Process, Analyze, Share, and Act. I will be able to answer the question of how casual riders and annual members use Cyclistic bikes differently.

## Scenario

The Cyclistic Director of Marketing, Lily Moreno, believes the company's future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## About the Company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their

## Ask

### Business Task

Analyze Cyclistic's 2022 trip data to understand how casual riders and annual members use bikes differently. why casual riders would buy a membership, and how digital media could affect their marketing tactics.
Insights gained from this analysis will help the marketing team develop their strategies for the campaign.

### Stakeholders

-   Lily Moreno: Director of Marketing. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.
-   Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
-   Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

## Prepare

The first step in my prepare process is to download all of the data that I will need for my analysis. We will be using the Cyclistic trip data for 2022, from january to december,
which needs to be downloaded in 12 separate .csv files for each month of the year and stored in a dedicated folder. The data has been made available by Motivate International Inc. under this license. The data is also available on this link.
https://divvy-tripdata.s3.amazonaws.com/index.html

## Process

### Data Cleaning

**Excel**

To ensure the data is clean and ready for analysis, the following data cleaning steps were performed on each .csv file in Excel:

1. **Remove Duplicates:** Checked for and removed any duplicate rows to avoid counting the same ride multiple times.

2. **Remove Invalid ride_id:** Filtered out rows where the `ride_id` is less than 16 characters long, as these are likely to be invalid or incomplete entries.

3. **Trim Spaces:** Used the `trim()` function to remove any leading or trailing spaces in the data, ensuring consistent formatting.

4. **Create Day of the Week:** Utilized the `weekday()` function to extract the numerical representation of the day of the week (1-7, where 1 represents Sunday and 7 represents Saturday) and then applied the custom format `dddd` to display the day of the week in full text format (e.g., Sunday, Monday, etc.).

5. **Calculate Ride Length:** Created a new column labeled `ride_length` by calculating the duration of each ride. This was done by subtracting the `started_at` timestamp from the `ended_at` timestamp, representing the duration of the ride in hours, minutes, and seconds.

6. **Time Format Adjustment:** Changed the time format in the `ride_length` column to `37:30:55` to make it more readable, displaying hours, minutes, and seconds.

7. **Filter Out Short and Long Rides for Casual Riding:** Since casual rides should not be less than 1 minute or longer than 24 hours, filtered out any rides in the `ride_length` column that were less than 1 minute or exceeded 24 hours for casual riders.

By completing these data cleaning steps, we have prepared the Cyclistic trip data for 2022 for further analysis, ensuring accuracy and consistency in the dataset.

## Analyze

...

## Share

...

## Act

...
