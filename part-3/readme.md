## PART 3: DEMONSTRATE YOUR PYTHON COMPETENCY

### Given a very large CSV file (tens of gigabytes in size), write a python program to split the large CSV file into smaller ones.

#### Solution:

There are 2 available options. Either do splitting by the size of the smaller file required or by number of lines in all the smaller files.

Attached split.py file is splitting the file on number of lines also called chunck size.

I have included a small patient.csv with 600K records and calling the split.py on that file generate 5 files with 100K rows per file.

Also included a faker data generator file to generate more data.


#### Other Solutions:

The above solution can be run on an EC2, but is bad for scaling and will cause lot of data transfer cost between the storage and the EC2.

To scale we can use lambda function to split a bigger file, and if its able to process the splitting in 15 minutes or less then its a viable solution as thats the limit for lambda function to run.

Also we can use transient EMR cluster with pyspark on it.

Both the above can be triggerd using s3 event trigger.

We can also use Airflow kpod operator by building a container and passing s3 bucket locations for both the source and the destination files.










