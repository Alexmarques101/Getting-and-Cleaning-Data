#################################### Getting and Cleaning Data Project ############################################

#downloading the data
wd <- setwd("C:/Users/Acer/Desktop/COURSERA/Data Science/Getting and Cleaning Data/week4")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
samsung <- download.file(url, destfile = "samsung_data.zip", mode = "wb")
unzip("samsung_data.zip")

#importing test and train into R
train <- read.table ("./UCI HAR Dataset/train/X_train.txt")
test <- read.table ("./UCI HAR Dataset/test/X_test.txt")
test_train <- rbind(test, train)

#importing test and train labels
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <-read.table("./UCI HAR Dataset/train/y_train.txt")
y<-rbind(y_test, y_train)

# importing subject data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject <- rbind(subject_test, subject_train)

#importing features 
features <- read.table ("./UCI HAR Dataset/features.txt")
col_names <- as.data.frame(t(features))[2,]
colnames(col_names)<-as.character(unlist(col_names[1,]))

#naming columns of test_train with features
colnames(test_train)<-colnames(col_names)

#using grep to find pattern in colnames
test_train <- test_train[,grep("mean|std", colnames(test_train))]

#import activity labels
act_labels <- read.table ("./UCI HAR Dataset/activity_labels.txt")
library(plyr)
sample <- plyr::join(y, act_labels, by = "V1")
dataset <- cbind(test_train, sample, subject)


#change colnames to become more intuite : descriptive activity names 
colnames(dataset)[81] <- "activity" 
colnames(dataset)[82] <- "subjects" 
dataset <- dataset[,-80]
colnames(dataset) <- gsub("tBodyAcc", "timebodyaccelaration", colnames(dataset))
colnames(dataset) <- gsub("tGravityAcc", "timegravityaccelaration", colnames(dataset))
colnames(dataset) <- gsub("tBodyAccJerk", "timebodyaccelarationjerk", colnames(dataset))
colnames(dataset) <- gsub("tBodyGyro", "timebodyaccelarationgyroscope", colnames(dataset))
colnames(dataset) <- gsub("tBodyGyroJerk", "timebodygyroscopejerk", colnames(dataset))
colnames(dataset) <- gsub("tBodyAccMag", "timebodyaccelarationmagnitude", colnames(dataset))
colnames(dataset) <- gsub("tBodyGyroMag", "timebodygyroscopemagnitude", colnames(dataset))
colnames(dataset) <- gsub("tBodyGyroJerkMag", "timebodygyroscopejerkmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyAcc", "frequencybodyaccelaration", colnames(dataset))
colnames(dataset) <- gsub("fBodyAccJerk", "frequencybodyaccelarationjerk", colnames(dataset))
colnames(dataset) <- gsub("fBodyGyro", "frequencybodygyroscope", colnames(dataset))
colnames(dataset) <- gsub("fBodyAccMag", "frequencybodyaccelarationmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyAccJerkMag", "frequencybodyaccelarationjerkmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyGyroMag", "frequencybodygyroscopemagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyGyroJerkMag", "frequencybodygyroscopejerkmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyBodyAccJerkMag", "frequencybodybodyaccelarationjerkmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyBodyGyroMag", "frequencybodybodyaccelarationmagnitude", colnames(dataset))
colnames(dataset) <- gsub("fBodyBodyGyroJerkMag", "frequencybodybodygyroscopejerkmagnitude", colnames(dataset))
colnames(dataset)<-tolower(colnames(dataset))

#average of each variable by activity and subject
library(dplyr)
library(magrittr)
tidy_dataset <- dataset %>% group_by(activity, subjects) %>%
                            summarise_each(funs(mean))

#create txt file to import into GitHub
tidy_dataset <- write.table(tidy_dataset, file= "tidy_dataset.txt", row.name=FALSE)
