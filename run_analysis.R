## R code for Getting and Cleaning Data course project

## Read data files
xtest <- read.table("X_test.txt")
xtrain <- read.table("X_train.txt")
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")
subjecttest <- read.table("subject_test.txt")
subjecttrain <- read.table("subject_train.txt")
feature <- read.table("features.txt")
actlab <- read.table("activity_labels.txt")

## 1. Merge training and test data into one data set
##    and stored as (data1)
datatest <- cbind(subjecttest, ytest, xtest) 
datatrain <- cbind(subjecttrain, ytrain, xtrain) 
data1 <- rbind(datatest, datatrain)
## rename columns
colnames(data1) <- c("subject", "activity", t(feature)[2,])

## 2. Extracts only mean and standard deviation for each measurement
##    and stored as (data2)
data2 <- data1[ ,grep("subject|activity|mean|std", names(data1))]

## 3. Uses descriptive activity names to name the activities 
##    and stored as (data3)
data3 <- data2
data3$activity <- as.character(data3$activity)
actlab$V1 <- as.character(actlab$V1)
actlab$V2 <- as.character(actlab$V2)
for (i in 1:6) {
        data3$activity <- gsub(actlab[i,1], actlab[i,2], data3$activity)
}

## 4. Label the data set with descriptive variable names
##    and stored as (data4)
## Lable variable names using features.txt - already done in step 1
## To tidy up the variables names:
## - remove the "()" after mean or std
## - replace "-" with "."
data4 <- data3
colnames(data4) <- gsub("\\()", "", names(data4))
colnames(data4) <- gsub("-", ".", names(data4))

## 5. Creates a second tidy data set with the average of 
##    each variable for each activity and each subject
##    and stored as (data5)
## Note: values in data5 are the averages of the variables (column names)
data5 <- aggregate(data4[ ,3:81],
                   by=list(subject=data4$subject,activity=data4$activity),
                   mean)

## Write data5 (tidy average data) to text file "TidyDataAverages.txt"
write.table(data5, file = "TidyDataAverages.txt", row.names = FALSE)