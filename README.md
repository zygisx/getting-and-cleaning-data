### Course project for Getting and Cleaning Data course


Original data source `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

Data files are already ir repository.

Following steps should be done in order to run run_analysis.R script:

  - This git repository should be cloned somewhere in local machine
  - In R `setwd(PATH_TO_THIS_GIT_REPO)` command should be executed
  - Then `source("run_analysis.R")`
  - Script takes data takes input data files from `UCI HAR Dataset` folder, performs analysis and outputs 2 data files.
    - `merged.txt` - merged data set with appropriate variable names
    - `averages.txt` - data set with the average of each variable for each activity and each subject
