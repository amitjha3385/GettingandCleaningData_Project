GettingandCleaningData_Project
==============================

R Scripts for Getting and Cleaning Data Project

The repo contains three R-Scripts
1) downloaddata.R -> Used to download the data
2) readdata.R -> This script contains functions to read in the data.
The main function is read.data(dataset) - > It formats and subsets the data
as per the project conditions and returns a data frame.
3) run_analysis.R -> uses readdata.R to get the data for both train and test
sets. Creates a tidydata dataframe as per project conditions
Outputs a tidydata.txt file which has columns seprated by ','
