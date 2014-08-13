*********************************************************************
The "TidyData" Repo contains the course project solutions for 
the "Getting and Cleaning Data" Course.
*********************************************************************

This Repo contains 4 files:
1. "TidyDataAverages.txt" - a text file containing the tidy average data set
2. "run_analysis.R" - the R code for generating the tidy average data set
3. "CodeBook.md" - the code book for the tidy average data set
4. "README.md" - the explanation of how run_analysis.R code works

*********************************************************************

Explanation of "run_analysis.R"

Summary: Using data extracted from the course project dataset, 
this R code generates the average value of each variable 
containing mean or standard deviation measurements for each 
subject and activity, and write the data to "TidyDataAverages.txt"

This is done by the following steps:

1.Read data files "X_test.txt", "X_train.txt", "y_test.txt",
  "y_train.txt", "subject_test.txt", "subject_train.txt",
  "features.txt", "activity_labels.txt" and 
  store them as variables "xtest", "xtrain", "ytest", "ytrain",
  "subjecttest", "subjecttrain", "feature", "actlab", respectively.

2.Merge training and test data sets by combining "xtest", "xtrain",
  "ytest", "ytrain", "subjecttest", "subjecttrain" into one data set
  and stored as "data1"
  
3.Rename columns 1 and 2 of "data1" to "subject" and "activity"" and 
  the rest of the colunm names using names in "feature" to make them
  descriptive

4.Extract measurements with "mean" or "std" (standard
  deviation) in the column name from "data1" and stored as "data2"

5.Substitute activity numbers with activity names from "actlab"
  to make it more descriptive and stored as "data3" 
  
6.Tidy the column/variable names by removing "()", replacing
  "-" with "." to make all the names R legal and stored as "data4"
  
7.Calculate the average of each variable for each activity and 
  each subject and stored as an independent tidy data set "data5"
  NOTE: Values in new data "data5" are the averages of the varaibles
  described by the column names.
  
8.Write the new tidy average data "data5" to text file 
  "TidyDataAverages.txt"

*********************************************************************
