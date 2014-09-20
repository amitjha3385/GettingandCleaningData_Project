## Main analysis file. Uses file readdata.R as well.

# Function to get mean values for all columns, per person, per activity
get.tidydata <- function (data){
        varnames <- names(data)
        # Create dummy data frame
        tidydata <- data.frame()
        # Loop over all subjects
        for (i in 1:30) {
                # Create subsets to help in lapply function, Subset by Subject
                tempdata <- subset(maindata, Subject == as.character(i))
                cols <- ncol(tempdata)
                # Split the data as per Activity
                tempdata <- split(tempdata, tempdata$ActivityDescription)
                # Apply colMeans function to numeric columns
                tempdata <- lapply(tempdata,
                                   function (x) {
                                           colMeans(x[, 3:cols])})
                # Reclaim the list back to data frame
                # However all columns get converted to factors
                tempdata <- t(as.data.frame(tempdata))
                for (n in 1:ncol(tempdata)){
                        tempdata[, n] <- as.numeric(as.character(tempdata[, n]))
                }
                # Add Subject and Activity description
                ActivityDescription <- row.names(tempdata)
                Subject <- rep(as.character(i), 6)
                tempdata <- data.frame(Subject, ActivityDescription, tempdata)
                tidydata <- rbind(tidydata, tempdata)
        }
        names(tidydata) <- varnames
        return(tidydata)
}


# Source the readdata.R file.
# File contains function - read.data() to read in format and return dataframes
# The dataframes have appropriate labels and and variable names
# It also filters the columns for mean and sd data
source('readdata.R')
# Get train and test datas and combine them into maindata
maindata <- rbind(read.data('train'), read.data('test'))
# Get tidy data using get.tidydata() function
tidydata <- get.tidydata(maindata)
# Write the tidydata
write.table(x = tidydata, file = './data/UCI HAR Dataset/tidydata.txt',
            sep = ',', row.names = F)
rm(maindata, tidydata)

