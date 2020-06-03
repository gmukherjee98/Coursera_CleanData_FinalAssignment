# Coursera_CleanData_FinalAssignment
This dosument does the following
I - brief description of the R script submitted for the assignment
II - an outline of the files that are the code book for the assignment

I: The script does the follows
1. Creates the combined data set in the following steps
a) Creates the unique column names from the features.txt file - these are the column names for the main data files X_train and X_test
b) Creates the columns names for the activity_labels.txt
c) Creates the combined train data set by merging the X_train, y_train and the subject_train files with alll the column names assigned 
d) creates the combined test data sets by merging the X_test, y_test and the subject_test files with all the column names assigned
e) Creates combined train and test data usuing the rbind function

2) Creates a function that for each observation subsets the columns that show either a mean or standard deviation

3) Instead of activity index uses the full activity name

4) creates the combined data from step 1 above using the full activity name

5) creates a new database that for each subject and for each of the activity, provides the mean for each variable using the dplyr library

II - Code book consists of the following
1. activity_labels.txt which has the long name for each activity
2. features_info.txt - which provides a description of the variables
3. features.txt - the list of all the variables

