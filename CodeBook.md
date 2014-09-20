Code Book

The dataset - tidydata.txt is derived from the "Human Activity Recognition Using Smartphones Data Set", 
available at, "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
The original dataset contains acceleration and velocity data, derived from the accelerometer and gyroscope data from a Samsung Galaxy smartphone. The observations are for 30 volunteers performing different activities.

The activities are as follows :
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The dataset contains observations on 561 variables. For more information :
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"

The tidydata.txt is a processed subset of the original data.

1) Each of the datasets, train and test, were read in and combined with activity data from activity.txt and subject data from data.txt.
2) Appropriate Headers from features.txt was given as names for the dataframe.
3) The data was subset to contain only information for variable mean(), std(), and meanFreq().
4) The functions to perform 1) to 3) are in readdata.R script.
5) Train and Test dataset X-train.txt and X_test.txt, were read in combined to gether to make one dataset with observations on 81 variables (features).
6) The final dataset was further processed to get mean of the data for each variable, for each activity, for every person. Total 180 observations (30 people with 6 activities each) were made on the 81 selected variables.
7) The function to process this data is in run_analysis.R
