CleaningData
============

## Samsung Galaxy S Smartphone data is cleaned and summarized at the activity and subject level


### Data

Here I give the R code to process and produce a tidydata of summaries of the human activity measurements made using
Samsung Galaxy S Smartphone accelerometer. The original data is and the description of variables are given
at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

For this project the data was obtained from the 'Coursera : Getting and Cleaning Data' course site.
The link to download the data is:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
The link is mentioned in the R code, but commented out so that if you have it already there is no need to get it again. 

### The R Script

To run the script go to the directory in which the downloaded data is there and then run the command on R promt:
      source('run_analysis.R')

 The R script  'run_analysis.R' does the following. 

1. Merges the training and the test sets to create one data set. The data set comes as two parts: the trainig set and
   the test set. We first combine them and variable names obtained from the file 'features'.

2. Extracts only the measurements on the mean and standard deviation for each measurement. The original data contains    several measurements and various quantities calculated from those measurements. However we are interested only in
   the 'mean' and 'std' of the measurements for this project.  There is a variable with meanFreq in the name, and       that is not the mean of any of the other variables measured. It is a quantity in its own right and hence we are      not considering it. We are considering the mean and standard deviation of 33 different variables. More details on    the variables are given in the codebook.md file.


3. Uses descriptive activity names to name the activities in the data set. The original data was coded with numbers     for each human activity they considered. Instead of the numbers we used the activity name itself in the file so      that it is easier to understand.

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.    We included in the data file the number to specify the subjects who participated in the experiment as a variable.    From this processed data we wanted a summarised data containing only the averages of the variables considered, for    each activity and for each subject. Since there are 30 subjects and each participated in 6 activity measurements,    the summarised data contains 180 rows and 66 averages, one column to denote the subject and another one for the      activity and hence in total there are 68 columns in the processed final data.
