domain <- 'https://d396qusza40orc.cloudfront.net/'
file <- 'getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
# Complete file path
f <- paste(... = domain, file, sep = '')
# Download the file in directory data inside the working directory
download.file(f, './data/Dataset.zip', method = 'curl')
