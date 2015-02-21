# gettingandcleaningdata

The variables in script ”run_analysis.R”

**X_test**                  The data set read from ”data/UCI HAR Dataset/test/X_test.txt”

**X_test_act**              X_test with ”activity” column added from ”data/UCI HAR Dataset/test/X_test.txt”

**X_test_act_subj**         X_test_act with ”subject” column added from ”data/UCI HAR Dataset/test/subject_test.txt”

**X_train**                 The data set read from ”data/UCI HAR Dataset/train/X_train.txt”

**X_train_act**             X_train with ”activity” column added from ”data/UCI HAR Dataset/train/X_train.txt”

**X_train_act_subj**        X_train_act with ”subject” column added from ”data/UCI HAR Dataset/train/subject_train.txt”

**X_tot**                   X_test and X_train merged together

**col_names**               Column labels read from ”data/UCI HAR Dataset/features.txt”. The row number from the file is
                        combined with the label because there are duplicate labels in the file.

**v_col_names**             col_names with columns ”activity” and ”subject” added at the end. This is used to name X_tot.

**X_extracted**             Columns with names including ”mean” or ”std”, (and the new columns ”activity and ”subject”),
                        filtered from X_tot.

**activity_labels**         The names of the activities (which are represented by numbers until now) read
                        from ”data/UCI HAR Dataset/activity_labels.txt”

**tidy_set**                X_extracted grouped by subject and by activity. Where each row is the mean calculations for
                        all variables of the subject-activity sub group.
