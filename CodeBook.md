====================================================================
             Getting and Cleaning Data Course Project
                         CodeBook.md
====================================================================

This describes the procedure followed in run_analysis.R towards producing two
tidy data sets from the input data sets.

Step 1 - Downloaded the input data from the project web page :
https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project 

The .zip package of data was downloaded to ./coursera/dataspe3/project; 
unpacked and examined.

Step 2 - Loading the data into RStudio:
For eg: features <- read.table("./project/UCI HAR Dataset/features.txt")
        y_train <- read.table("./project/UCI HAR Dataset/train/y_train.txt")
        subject_train <- read.table("./project/UCI HAR Dataset/train/subject_train.txt")
        X_train <- read.table("./project/UCI HAR Dataset/train/X_train.txt")

Step 3 - Examination and Analysis :
Now we have the input files in a tabular form with its size and content clearly visible!
We see that 'X_train' has the exact number of variables that are mentioned in 'features' 
as measurements per observation. Further, the total number of observations (for all 
subjects and all activities) in 'X_train' matches with 'Subject_train' and 'y_train'.
'Subject_train' has subject sequence and 'y_train' has the activity sequence.
So, all the four files should be put together to form a single data set.

Step 4 - Piecing it together:
 -- Replacing the activity code in 'y_train' with activity labels.
 -- Combining the 'Subject_train' and 'y_train' to form a single 'subjectNactivity' table.
 -- Assigning descriptive column names to 'X_train' using 'features'

Step 5 - Making a subset of Mean and Average variables :
Note::: There are few duplicate variables (which are NOT 'mean' or 'std' variables)
#-- For eg, @461 and @475 of features.txt. These duplicates lead to error
# in applying 'select' function. Therefore removed.
 -- Select the mean and standard deviation variables and make a new subset of 'X_train'
 -- Combine it with 'subjectNactivity' to form 'trainMeanAndStdData'

Step 5 - Merge test and train data sets: 
 -- Repeat the steps 2 : 5, for the test data set to get 'testMeanAndStdData' 
 -- Merge the two to form 'meanAndStdData' containing mean and std values for all data.

Step 6 - Averaging over all canonical observations:
 -- Average the variables such that we get one value per variable per activity per subject.
    'meanAndStdAvgData'
 -- So now we have 180 observations (by 30 subjects performing 6 activities each)
    for 86 mean and standard deviation variables.

Step 7 - Write into .txt files
 -- 'meanAndStdData' and 'meanAndStdAvgData' are the two tidy data sets that match the 
    requirements of the project.
 -- they are written into 'meanAndStdData.txt' and 'meanAndStdAvgData.txt' files 

End
