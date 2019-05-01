/* This project is designed to compare the similarities and differences between the local city temprature trends 
and the global temperature trends */

/*I am from Toronto, Canada and so we must verify if Toronto exists in the database */

SELECT *
FROM city_list
WHERE country LIKE 'Canada'

/* This code will provide us a table of listed cities in Canada, and fortunately Toronto is one of them */
/* Now that we know our city exists, we need to extract the data for global and local city; however there is a problem we
must solve first. According to the schema, we can see that the global_data and city_data have column name that is same: "avg_temp",
we need to change the column names in order to differentiate between the two. */

ALTER TABLE city_data
    RENAME COLUMN avg_temp TO city_avg_temp;
ALTER TABLE global_data
    RENAME COLUMN avg_temp TO global_avg_temp;

/* After refreshing the schema it was evident that the changes have took place, these new columns along with other data need to
be merged to further compare the variables.

Following code shows the selection of global and city average temperatures along with joining of tables via global_data year
and city_data year */

SELECT global_data.year, global_data.global_avg_temp, city_data.city_avg_temp
FROM global_data 

JOIN city_data        
ON global_data.year = city_data.year    
WHERE city LIKE 'Toronto';

/* Now we need to export the CSV files in order to further investigate the differences and trends using visualization tools */