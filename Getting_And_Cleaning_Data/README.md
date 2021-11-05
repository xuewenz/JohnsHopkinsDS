# Getting and Cleaning Data Course Project
This project is about retrieving datas and tidy them up for future data analysis usage
The R script: run_analysis.R, does the following:
1. Load all the data into R
2. Give proper naming for the columns for the x,y and subject (test/train)
3. Merge all three together
4. Filter out the undesired variables
5. Map activityid to the actual activity
6. Generating the 2nd tidy set with mean for each variable for each activity and subject
7. Arrange them according to subject Id(first) and acitivty Id(second) in ascending order
8. Write out the txt file for 2nd tidy set
