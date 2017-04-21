######################  run_analysis.R   #################
#------------- Chaitra Narayan ------  21 April 2017 -----

#Note -- Since we are interested in only the mean and std columns (88) of 
# the 561 variables, I decided to subset the test and train datasets seperately
# before merging them.

#--------------Loading the training set data-------------------------   
features <- read.table("./project/UCI HAR Dataset/features.txt")
y_train <- read.table("./project/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./project/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./project/UCI HAR Dataset/train/X_train.txt")

#--------Introducing Activity labels in place of activity code-------
y_train[y_train==1] <- "Walking"
y_train[y_train==2] <- "Walking_upstairs"
y_train[y_train==3] <- "Walking_downstairs"
y_train[y_train==4] <- "Sitting"
y_train[y_train==5] <- "Standing"
y_train[y_train==6] <- "Laying"

#--------Combining the Subject and Activity columns-----------------
subjectNactivity <- cbind(subject_train,y_train)
colnames(subjectNactivity) <- c("Subject","Activity")

#------ Assigning descriptive column names to the measurements data
colnames(X_train) <- as.character(features$V2)

#--There are few duplicate column names (but NOT with 'mean' or 'std')
#-- For eg, @461 and @475 of features.txt. These duplicates lead to error
# in applying 'select' function. Therefore removed.
X_train_unique <- X_train[ , !duplicated(colnames(X_train))]

#---Subsetting only the  columns with either 'mean' or 'std'-------
X_train_mean <- select(X_train_unique,contains("mean"))
X_train_std <- select(X_train_unique,contains("std"))
#----Combining with Subject and Activity columns-------------------
trainMeanAndStdData <- cbind(subjectNactivity,X_train_mean,X_train_std)

#-----Repeating the above procedure for the test set data-------------
y_test <- read.table("./project/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./project/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./project/UCI HAR Dataset/test/X_test.txt")
y_test[y_test==1] <- "Walking"
y_test[y_test==2] <- "Walking_upstairs"
y_test[y_test==3] <- "Walking_downstairs"
y_test[y_test==4] <- "Sitting"
y_test[y_test==5] <- "Standing"
y_test[y_test==6] <- "Laying"
subjectNactivity_test <- cbind(subject_test,y_test)
colnames(subjectNactivity_test) <- c("Subject","Activity")
colnames(X_test) <- as.character(features$V2)
X_test_unique <- X_test[ , !duplicated(colnames(X_test))]
X_test_mean <- select(X_test_unique,contains("mean"))
X_test_std <- select(X_test_unique,contains("std"))
testMeanAndStdData <- cbind(subjectNactivity_test,X_test_mean,X_test_std)

#----Merging the test and train data sets with only mean and std cols
meanAndStd <- rbind(trainMeanAndStdData,testMeanAndStdData)

#----Grouping the data by Subject and Activity-----------------------
#---- This forms the first tidy data set required for completion of project
meanAndStdData <- group_by(meanAndStd,Subject,Activity)

#----Calculating the average of all the mean and std measurements -------
#----per subject per activity--------------------------------------------
meanAndStdAvg <- aggregate(by_sa[, 3:88], list(by_sa$Subject,by_sa$Activity), mean)
colnames(meanAndStdAvg)[1:2] <- c("Subject","Activity")

#----The second tidy data set with average values per subject per activity
meanAndStdAvgData <- arrange(meanAndStdAvg,Subject)

#---- Writing the output to .txt files
write.table(meanAndStdData,"meanAndStdData.txt")
write.table(meanAndStdAvgData,"meanAndStdAvgData.txt")

