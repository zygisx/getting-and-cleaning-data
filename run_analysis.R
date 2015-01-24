# 1. Merges the training and the test sets to create one data set.

x_training <- read.table("UCI HAR Dataset//train//X_train.txt")
x_test <- read.table("UCI HAR Dataset//test/X_test.txt")
x <- rbind(x_training, x_test)

y_training <- read.table("UCI HAR Dataset//train//y_train.txt")
y_test <- read.table("UCI HAR Dataset//test/y_test.txt")
y <- rbind(y_training, y_test)

subject_training <- read.table("UCI HAR Dataset//train//subject_train.txt")
subject_test <- read.table("UCI HAR Dataset//test/subject_test.txt")
subject <- rbind(subject_training, subject_test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset//features.txt")

# take only mean or std related columns
mean_std_features <- grep("*mean*|*std*", features[,2])
x <- x[, mean_std_features]


# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("UCI HAR Dataset//activity_labels.txt", col.names = c("activity_id", "activity"))
activities[,2] <- gsub("_", "", tolower(activities[,2]))

y[,1] = activities[y[,1], 2]



# 4. Appropriately labels the data set with descriptive variable names. 

# reset x column names to be more desciptive
col_names <- features[mean_std_features, 2]
col_names <- gsub("\\(\\)", "", tolower(col_names))
names(x) <- col_names

names(y) <- c("activity")
names(subject) <- "subject"

merged <- cbind(x, y, subject)
write.table(merged, "merged.txt")


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

averages <- aggregate(. ~ activity + subject , data=merged, FUN=mean)
write.table(averages, "averages.txt", row.name=FALSE)
