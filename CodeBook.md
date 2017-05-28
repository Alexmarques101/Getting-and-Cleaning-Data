# This book describes the variables, the data, and any transformations or work done to clean the data


# Introduction

1. The aim of this project is to demonstrate my ability to collect, work with, and clean a data set. The purpose is to prepare a tidy data that can be used for later analysis. 

2. As it was said on the README.md file, the data was downloaded from this website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

3. You cand find and download the zip file from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# The Data

1. Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


# Steps of the project

1. After downloading the data set, I imported the train and test files (x_test.txt and x_train.txt) which contained the information for the train and test sets)
2. I merged them with rbind command to create test_train.
3. Imported y_test.txt and y_train.txt files and merged them as well. Named it y.
4. The subject files were also imported and merged together. Named it subject.
5. Imported features (activities) file to get the name of the variables. Assigned theses variables to the test_train data set.
6. From test_train dataset omitted all the variables that did not contained information about the mean or standard deviation.
7. Imported activity labels and merged them with y data set. Called it sample.
8. Merged together test_train, sample and subject data sets. Created a unique data set called dataset.
9. Labeled all the variables with descriptive variable names. By doing this, all of the variables become more intuitive.
10. Finally, created a tidy data set called tidy_dataset with the average of each variable for each feature (activity) and each subject.
