## PART 1: PROPOSE A TECHNICAL SOLUTION AND STATE YOUR ASSUMPTIONS

## Business problem: 

you are ingesting a large amount of data for unidirectional 'trips' of motor vehicles from one latitude/longitude to another in the USA. 
Each row of the data set comes from 'connected cars' which consist of GPS positioning per vehicle, refreshed every 5 minutes. 
Your clients want to understand the basic demography (age/gender) of the occupants of each vehicle that traverses a particular roadway every day.

## Your objective: 

Propose the basic data model, data architecture, ETL scripts (if any), and data sets necessary to infer person-level demography 
from the 'origin location' (i.e. the initial starting point) of each vehicle on each roadway. 

Identify the specific functional and technical assumptions you would make to infer demography and the data sets you would use. 
You may use any public or commercial data set available within the United States.

### Solution:

From the problem statement it seems like it falls under data science modelling domain but at the same time I will need more information to design the data pipelines that will help the data scientist to infer the result.   

We may need to extract some of the census data maintained by American Community Survey/census data https://data.census.gov/table

We may need some data like available at whitepages that has the listing of people living at the addresses. They do have an API.

We may also need some professional data like from google maps which list businesses with there latitude and longitude, this must be in the form of an api, where depending on when the trip is closed, we can detect the nearest business point. 

Also I  will need to ask question related to the device thats sending the data every 5 minutes. Is it able to capture any of the driver input like trip start and trip end, number of occupants?

The above info is avaliable when I look at the yellow taxi trip data or uber and lyft.


#### Data models:

schema: business(
bussiness_id,
business_name,
business_category,
business_street,
business_address,
business_city,
business_state,
business_phone
business_latitude,
business_longitude,
business_proximity
)

schema: device(
device_id,
device_owner,
device_status
)

schema: device_data(
device_id int,
create_date,
device_latitude,
device_longitude,
trip_start,
trip_end
origin,
destination
)

It makes more sense to divide the above table into device and device_location tables as we will not want to send the following data elements every 5 minutes.
trip_start,
trip_end
origin,
destination

It can be different api that can be triggered once the trip starts and when the trip ends.

