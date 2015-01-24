### CodeBook

##### This documents describes variables, data and transformations performed in `run_analysis.R` script to clean up the data.


Source of the original data: `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

Data set information: `http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones`

The `run_analysis.R` script performs the following actions to clean up the data:

 **1. Merges the training and the test sets to create one data set**
  
  - reads data from `UCI HAR Dataset/train/X_train.txt` and `UCI HAR Dataset/test/X_test.txt` files and merges them into data frame `x`
  - reads data from `UCI HAR Dataset/train/y_train.txt` and `UCI HAR Dataset/test/y_train.txt` files and merges them into data frame `y`
  - reads data from `UCI HAR Dataset/train/subject_train.txt` and `UCI HAR Dataset/test/subject_train.txt` and merges them into data frame `subject`
 
**2. Extracts only the measurements on the mean and standard deviation for each measurement.**
  
  - reads data from `UCI HAR Dataset/features.txt` into data frame `features`
  - from `features` takes only those values that has *mean* or *std* in its name and store in vector `mean_std_features`
  - filter data frame `x` columns, after this step data frame `x` contains only columns mentioned in `mean_std_features` vector
  
**3. Uses descriptive activity names to name the activities in the data set**
  
  - reads data from `UCI HAR Dataset/activity_labels.txt` file into data frame `activieties` and assigns column names `activity_id` and `actiivity` for first and second column respectively.
  - renames all activieties to more descriptive names:
    - walking
    - walkingupstairs
    - walkingdownstairs
    - sitting
    - standing
    - laying
  - merges `y` data frame with activities. Now `y` data set contains descriptove activity names instead of unreadable activity ids.

**4. Appropriately labels the data set with descriptive variable names.**
  - data frame `y` labeled with variable names like: `tbodyacc-mean-x` `tbodyacc-mean-y` `tbodyacc-mean-z` `tbodyacc-std-x` `tbodyacc-std-y` `tbodyacc-std-z` and so on. Total ir has 
    ### TODO remove meanfreq add count columns
  - data frame `y` single variable names `activity`
  - data frame `subject` single variable names `subject`
  - all previously mentioned data frames `x`, `y` and 'subject' merged to single data frame called `merged`
  - this data frame saved to text file `merged.txt`
  
**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

