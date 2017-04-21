==========================================================
           Getting and Cleaning Data Course Project
                       README.md
==========================================================

Aim : To tidy the given data and to provide all the necessary information
to understand and reproduce the tidy data set, independently

Data :   Human Activity Recognition Using Smartphones Dataset [*]

Background :

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

--------------------------------------------------
Input files :

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
----------------------------------------------------

Output files :

- README.md : a Readme file to give an overview.

- run_analysis.R : The R script used to obtain two sets of tidy data as required for the project.

- meanAndStdData.txt : gives one value per observation per variable

- meanAndStdAvgData.txt : gives average of each variable for each activity and each subject.

- CodeBook.md : describes variables, the data, work performed to clean up the data.
----------------------------------------------------


 References :

 [*]  1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

 # Acknowledgements:  

https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

-----------------------------------------------------

