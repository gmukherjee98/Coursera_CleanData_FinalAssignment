## 1. Merging the data set
##
## 1.1 Reading the meta data sets

## Create the vector to be used as column labels for the main databases

        features_dat <- read.table("./SamsungData/features.txt")

        features_label <- as.vector(make.unique(features_dat[, 2], sep = "_"))

## Create the vector for the activity labels

        activity_labels <- read.table("./SamsungData/activity_labels.txt")

        colnames(activity_labels) <- c("activityindex", "activitylabel")

## 1.2 Reading in the train data sets

        train_dat <- read.table("./SamsungData/train/X_train.txt")

        train_activity <- read.table("./SamsungData/train/y_train.txt")

        train_subject <- read.table("./SamsungData/train/subject_train.txt")

        colnames(train_dat) <- features_label

        colnames(train_activity) <- c("activityindex")

        colnames(train_subject) <- c("subjectindex")
        
        train_dat_activity_subject <- cbind(train_subject, train_activity, train_dat)


## 1.3 Reading in the test data sets
        
        test_dat <- read.table("./SamsungData/test/X_test.txt")
        
        test_activity <- read.table("./SamsungData/test/y_test.txt")
        
        test_subject <- read.table("./SamsungData/test/subject_test.txt")
        
        colnames(test_dat) <- features_label
        
        colnames(test_activity) <- c("activityindex")
        
        colnames(test_subject) <- c("subjectindex")
        
        test_dat_activity_subject <- cbind(test_subject, test_activity, test_dat)
        
## 1.4 Merging the train and test data - using rbind as the subject in the test are not present in train data set
        
        combined_train_test <- rbind(train_dat_activity_subject, test_dat_activity_subject)

## 2. Extract only the measurement for mean and standard deviatiion for each observation
        
        mean_std <- function(n) {
                
                numofobs <- nrow(combined_train_test)
                
                if(n %in% 1:numofobs) {
                        
                        combined_train_test[n, grepl("mean|std", names(combined_train_test))]
                }
        }
      
## 3 Use descriptive activity names to name the activities in the data set - merges the y_train and y_test files with
## the activity_labels file to create a data.frame with 2 columns that includes the names and the index of 
## the activity
        
        x_train <- merge(train_activity, activity_labels, by = "activityindex")
        
        x_test <- merge(test_activity, activity_labels, by = "activityindex")
        
## 4. Create a data set with the appropriate datalabels
        
        train_dat_activity_subject_labelname <- merge(train_dat_activity_subject, activity_labels, by = "activityindex")
        
        test_dat_activity_subject_labelname <- merge(test_dat_activity_subject, activity_labels, by = "activityindex")
        
        combined_train_test_activityname <- rbind(train_dat_activity_subject_labelname, test_dat_activity_subject_labelname)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
## each activity and each subject     
        
        combined_data_means <- combined_train_test_activityname%>% group_by(subjectindex, activitylabel, activityindex)%>% 
                                        summarise_each(funs(mean))
        
        
        
        
        