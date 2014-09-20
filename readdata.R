## Read files into R  and return appropriate dataframe ##

# Create a Vector of variable names, to be used as names for the
# train and test data frames.
# Read in the features file
feature.names <- function(file = './data/UCI HAR Dataset/features.txt'){
        features <- read.table(file, header = F,
                               sep = " ", colClasses = 'character')
        # Create features variable names as a vector
        features <- subset(features, select = V2, drop = T)
        features <- c('Subject', 'ActivityDescription', features)
}


# Create a vector for activity lables, this vector will be used
# to appropriately label the activity factors
activity.labels <- function(f = './data/UCI HAR Dataset/activity_labels.txt'){

        activity <- read.table(f , header = F, sep = " ",
                               colClasses = 'character')
        activity <- subset(activity, select = V2, drop = T)
}


# Selects columns based on column names
# Currently picks up just mean and SD data
# Can be made more general to accept a vector of column names
selectcolumns <- function(data){
        meandata <- data[, c('Subject', 'ActivityDescription',
                             colnames(data)[grep("mean", colnames(data))])]
        sddata <- data[, c(colnames(data)[grep("std", colnames(data))])]
        cbind(meandata, sddata)
}


# Read data for test or train depending upon the dataset
# example -- read.data('train') will return completely formatted data frame
# the training set.
# Puts descriptive variable names -- uses feaure.name function
# introduces columns for subject and activity in the dataframe
# converts the subject and activity columns to factors with appropriate labels
# Uses function selectcolumn to return only mean and sd data
read.data <- function(dataset){
        # Create file prefix and suffix
        f.pre <- paste('./data/UCI HAR Dataset/', dataset, '/', sep = '')
        f.suf <- paste(dataset, '.txt', sep = '')
        # Read in the training data, merge it with data from subject and
        # activity data files
        data <- read.table(paste(f.pre, 'X_', f.suf, sep = ''))
        subject <- read.table(paste(f.pre, 'subject_', f.suf, sep = ''))
        activitydata <- read.table(paste(f.pre, 'y_', f.suf, sep = ''))
        # Process activity data and subject to factors
        subject <- factor(x = subject$V1, levels = 1:30)
        # Get appropriate activity labels, uses function activity.labels()
        activity <- activity.labels()
        activitydata <- factor(x = activitydata$V1, levels = 1:6,
                               labels = activity)
        # Combine in one data frame and put appropriate names
        data <- data.frame(subject, activitydata, data)
        names(data) <- feature.names()
        # Selects mean(), std() and meanFreq() data from columns
        # uses function selectcolumns
        return(selectcolumns(data))
}



