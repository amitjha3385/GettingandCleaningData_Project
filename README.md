GettingandCleaningData_Project
==============================

R Scripts for Getting and Cleaning Data Project


The repo contains three R-Scripts

1) downloaddata.R -> 

This script can be used to download the zipped file into a directory called data (if present,) inside the current working directory. 

2) readdata.R -> 

The main function in this script is read.data, this function can be used to read in the data for train or test sets.
Puts descriptive variable names -- uses feaure.name function. Introduces columns for subject and activity in the dataframe. Converts the subject and activity columns to factors with appropriate labels. Uses function selectcolumn to return only mean and sd data.

3) run_analysis.R -> 

Uses readdata.R to get the data for both train and test sets. Creates a tidydata dataframe after further processing the data using function get.tidydata to get mean of the data for each variable, for each activity, for every person. Total 180 observations (30 people with 6 activities each) were made on the 81 selected variables.
