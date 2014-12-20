# Getting and Cleaning Data Course Project
==================================

This is a repository for the course project of Getting and Cleaning Data. It includes a readme file (README.md), a script (run_analysis.R) to clean the data, and a codebook (Codebook.md) to describe the variables.

## Data
Data used in this project can be downloaded from the following links:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Save it to your R working directory then extract it. The script will download and extract the zip file if necessary.

For descriptions of each variable, you may refer to the Codebook.md

## Packages
This project relies on reshape2 and plyr libraries. The script will install and load them automatically.

## Script
The run_analysis.R script will download and process the required data to create two new tidy data sets. It does the following:

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. A txt file named "MeanSd.txt" will be created for this part.

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. A txt file named "Average.txt" will be created for this part.