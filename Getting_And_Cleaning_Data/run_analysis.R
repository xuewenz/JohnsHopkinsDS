library(dplyr)
library(reshape2)
#Loading all the datas
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Giving proper naming instead of Vs
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

#Merge Train/Test/Combined
TrainM <- cbind(y_train, subject_train, x_train)
TestM <- cbind(y_test, subject_test, x_test)
AllM <- rbind(TrainM,TestM)

#Taking Only the desired Columns
AllNames <- colnames(AllM)
DesiredNamesIndex <- (grepl("activityId" , AllNames) | 
                 grepl("subjectId" , AllNames) | 
                 grepl("mean.." , AllNames) | 
                 grepl("std.." , AllNames) )

DesiredData <- AllM[ , DesiredNamesIndex == TRUE]

#Map Activity Names to Activity ID
DesiredDataWithActivityNames <- merge(DesiredData, activity_labels,
                                      by.x = "activityId",
                                      by.y = "V1",
                                      all =TRUE)
names(DesiredDataWithActivityNames)[82] <- "Activity"

#Making the 2nd Tidy Set which calculate the average of each variable,
#for each acitivity and each subject
SecTidySet <- aggregate(.~subjectId + activityId, DesiredData, mean)
SecTidySet <- merge(SecTidySet, activity_labels,
                                      by.x = "activityId",
                                      by.y = "V1",
                                      all =TRUE)
SecTidySet <- arrange(SecTidySet, subjectId, activityId)
names(SecTidySet)[82] <- "Activity"
write.table(SecTidySet, "SecTidySet.txt", row.name=FALSE)
