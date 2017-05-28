#This book describes the variables, the data, and any transformations or work done to clean the data


Introduction

The aim of this project is to demonstrate my ability to collect, work with, and clean a data set. The purpose is to prepare a tidy data that can be used for later analysis. 

As it was said on the README.md file, the data was downloaded from this website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You cand find and download the zip file from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called run_analysis.R that I created does the following steps.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps of the project

1. After downloading the dataset, I imported the train and test files (x_test.txt and x_train.txt) which contained the information for the train and test sets)
2. I merged them with rbind command.
3. Imported y_test.txt and y_train.txt files and merged them
