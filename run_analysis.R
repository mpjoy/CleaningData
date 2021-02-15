# run_analysis.R 

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## Download the file: 
#  download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="UCI HAR Dataset.zip")
## Unzip the file [if file is already there, set the directory containing the zipped file as the working directoy]
unzip( "UCI HAR Dataset.zip")
## Set the working directory [if already unzipped directory is available set that as the working directory]
setwd("UCI HAR Dataset")

# Load 'train' and 'test' data

train = read.table('./train/X_train.txt')
test = read.table('./test/X_test.txt')

# List of features measured
features <- read.table('features.txt')

# Combine the data
total=rbind(train,test)

# Create name variables to assign to the columns
# The orignal names are not compatible with R naming conventions
name1 <- make.names(features[,2],unique=T)
# Assign column names
names(total) <- name1

# Select 'mean' and 'std' variables
indices<-grep("mean\\(\\)|std\\(\\)",features[,2])

# Create the data frame by subsetting with selected variables
### to save memory the original total is replaced with the subset
total=total[,indices]

# Number of the subject for each row of train and test data
sbtrain = read.table('./train/subject_train.txt')
sbtest = read.table('./test/subject_test.txt')
# Combine them
sbtot <- rbind(sbtrain,sbtest)
names(sbtot) = 'subject'

# Activity code for each row for train and test data
trainy = read.table('./train/Y_train.txt')
testy = read.table('./test/Y_test.txt')
# Combine them
totact=rbind(trainy,testy)
# Activity code and corresponding labels
actlab = read.table('./activity_labels.txt')

# Replace the acitivity code with labels
totact=sapply(totact[,1],function(x) x=actlab[which(actlab==x),2])

# Include the Subject and Activity information in the data frame
total = cbind(sbtot,activity=totact,total)


# load 'plyr' package to subsetting and then summarizing the data
library(plyr)

# the final 'tidydata' containing the average for each subject over each activity
# of every measurement
tidydata=ddply(total[,(1:length(indices))+2], .(total$subject,total$activity),function(x) colMeans(x))
names(tidydata) = names(total)
# Since there were 30 subjects and 6 activities there are 180 rows in the 'tidydata'.

write.table(tidydata, 'tidydata.txt',row.names=F,sep='\t');
       
