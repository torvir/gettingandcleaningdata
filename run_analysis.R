#Here are the data for the project:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
#You should create one R script called run_analysis.R that does the following. 
#
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#
#From the data set in step 4, creates a second, independent tidy data set with the average of
#each variable for each activity and each subject.

# Set Project directory
setwd("/Users/tosj/Coursera-GettingAndCleaningData/CourseProject")

# Check if folder "data" exists, otherwise create it.
if (!file.exists("data")) {
    dir.create("data")
}

# Unzip file structure in folder "data"
setwd("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip")

# Use files in folder "UCI HAR Dataset"

# The test set is in file "UCI HAR Dataset/test/X_test.txt" with activity labels in "y_test.txt",
# and subject information in "subject_test.txt"
# The training set is in file "UCI HAR Dataset/train/X_train.txt" with activity labels in "y_train.txt",
# and subject information in "subject_train.txt"


# Read the test set and labels
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Add y_test (activity) as column to X_test
X_test_act <- cbind(X_test, y_test)
# Add subject_test as column to X_test
X_test_act_subj <- cbind(X_test_act, subject_test)

# Read the training set and labels
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Add y_train as column to X_train
X_train_act <- cbind(X_train, y_train)
# Add subject_train as column to X_train
X_train_act_subj <- cbind(X_train_act, subject_train)

# Merge the two data sets
X_tot <- rbind(X_test_act_subj, X_train_act_subj)

# Read Column names from "UCI HAR Dataset/features.txt"
col_names <- read.table("UCI HAR Dataset/features.txt", sep="@", stringsAsFactors=FALSE)
v_col_names <- col_names[,1]

# Add column labels from v_col_names include the new columns "activity" and "subject"
v_col_names_act_subj <- c( v_col_names, "activity", "subject")
names(X_tot) <- v_col_names_act_subj


# Only use columns with names including "mean" and "std" as well as the "activity" and "subject" columns.
library(dplyr)
X_extracted <- select(X_tot, matches("mean\\(\\)|std\\(\\)|^activity$|^subject$"))

# Use Activity names from "activity_labels.txt"
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
X_extracted$activity <- as.factor(X_extracted$activity)
levels(X_extracted$activity) <- activity_labels[,2]

# Fix the column labels by removing the numbers
names(X_extracted) <- sub("\\d+ (.+)", "\\1", names(X_extracted) )

# Create a tidy data set with the average of each variable for each activity and each subject.
tidy_set <- X_extracted %>% group_by(subject,activity) %>% summarise_each(funs(mean))
