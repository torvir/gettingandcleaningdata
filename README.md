# gettingandcleaningdata

The function of script ”run_analysis.R”

The data is fetched from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- Set the project working directory.

- Check if folder "data" exists, otherwise create it.

- Set the project working directory to subdirectory "data"

- Unzip file structure in folder "data"

- The test set is in file "UCI HAR Dataset/test/X_test.txt" with activity labels
  in "UCI HAR Dataset/test/y_test.txt", and subject information
  in "UCI HAR Dataset/test/subject_test.txt".
  
- The training set is in file "UCI HAR Dataset/train/X_train.txt" with activity labels
  in "UCI HAR Dataset/train/y_train.txt", and subject information
  in "UCI HAR Dataset/train/subject_train.txt"

- Read the test set and labels into variables.
  The test set doesn't include columns for activities or subjects.
  That information is retrieved from two other files

- Add activity labels as a new column to the test set

- Add subject information as a new column to the test set

- Read the training set and labels into variables
  The training set doesn't include columns for activities or subjects.
  That information is retrieved from two other files

- Add activity labels as a new column to the training set

- Add subject information as a new column to the training set

- Merge the test set and the training set into one long data set

- The data sets doesn't have descriptive column names yet.
  Read Column names from "data/UCI HAR Dataset/features.txt"
  There are duplicate column names, so include the row number from
  the file in the column label e.g. "130 tBodyGyro-max()-X"

- Add two column names for the two new columns "activity" and "subject"

- Set the column names on data set X_tot

- Extract the columns with names including "mean" and "std", as well as
  the "activity" and "subject" columns, into a new data set.
  Use dplyr for that.

- The activities are represented by a number until now.
  Read activity labels from "data/UCI HAR Dataset/activity_labels.txt".
  Then convert the "activity" column into factors. And set the factor levels
  according to the ones read from "activity_labels.txt"

- Now that all columns that had duplicate names is filtered out, we can remove
  the number in the beginning of the column names.
  Use sub() from dplyr to do that.
   
- Create a tidy data set with the average of each variable for each activity and each subject.
