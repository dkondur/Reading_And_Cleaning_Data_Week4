# CodeBook

## Source Data
The description and source data for this project are at

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Initial Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body 
motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector 
of features was obtained by calculating variables from the time and frequency domain.

## Merged Dataset information
For this project only data which are mean and std deviation are extracted. The data for the 2 sets are merged (training and test) into 
one single data set. The labels are changed so that they are appropriate and easy to understand.


## Final file produced
A file named tidy_data.txt will be produced which has the following columns.
"Subject",
"Activity",
"BodyAcc-Mean-X",
"BodyAcc-Mean-Y",
"BodyAcc-Mean-Z",
"BodyAcc-Std-X",
"BodyAcc-Std-Y",
"BodyAcc-Std-Z",
"GravityAcc-Mean-X",
"GravityAcc-Mean-Y",
"GravityAcc-Mean-Z",
"GravityAcc-Std-X",
"GravityAcc-Std-Y",
"GravityAcc-Std-Z",
"BodyAccJerk-Mean-X",
"BodyAccJerk-Mean-Y",
"BodyAccJerk-Mean-Z",
"BodyAccJerk-Std-X",
"BodyAccJerk-Std-Y",
"BodyAccJerk-Std-Z",
"BodyGyro-Mean-X",
"BodyGyro-Mean-Y",
"BodyGyro-Mean-Z",
"BodyGyro-Std-X",
"BodyGyro-Std-Y",
"BodyGyro-Std-Z",
"BodyGyroJerk-Mean-X",
"BodyGyroJerk-Mean-Y",
"BodyGyroJerk-Mean-Z",
"BodyGyroJerk-Std-X",
"BodyGyroJerk-Std-Y",
"BodyGyroJerk-Std-Z",
"BodyAccMag-Mean",
"BodyAccMag-Std",
"GravityAccMag-Mean",
"GravityAccMag-Std",
"BodyAccJerkMag-Mean",
"BodyAccJerkMag-Std",
"BodyGyroMag-Mean",
"BodyGyroMag-Std",
"BodyGyroJerkMag-Mean",
"BodyGyroJerkMag-Std",
"BodyAcc-Mean-X",
"BodyAcc-Mean-Y",
"BodyAcc-Mean-Z",
"BodyAcc-Std-X",
"BodyAcc-Std-Y",
"BodyAcc-Std-Z",
"BodyAcc-Mean Freq-X",
"BodyAcc-Mean Freq-Y",
"BodyAcc-Mean Freq-Z",
"BodyAccJerk-Mean-X",
"BodyAccJerk-Mean-Y",
"BodyAccJerk-Mean-Z",
"BodyAccJerk-Std-X",
"BodyAccJerk-Std-Y",
"BodyAccJerk-Std-Z",
"BodyAccJerk-Mean Freq-X",
"BodyAccJerk-Mean Freq-Y",
"BodyAccJerk-Mean Freq-Z",
"BodyGyro-Mean-X",
"BodyGyro-Mean-Y",
"BodyGyro-Mean-Z",
"BodyGyro-Std-X",
"BodyGyro-Std-Y",
"BodyGyro-Std-Z",
"BodyGyro-Mean Freq-X",
"BodyGyro-Mean Freq-Y",
"BodyGyro-Mean Freq-Z",
"BodyAccMag-Mean",
"BodyAccMag-Std",
"BodyAccMag-Mean Freq",
"BodyBodyAccJerkMag-Mean",
"BodyBodyAccJerkMag-Std",
"BodyBodyAccJerkMag-Mean Freq",
"BodyBodyGyroMag-Mean",
"BodyBodyGyroMag-Std",
"BodyBodyGyroMag-Mean Freq",
"BodyBodyGyroJerkMag-Mean",
"BodyBodyGyroJerkMag-Std",
"BodyBodyGyroJerkMag-Mean Freq"

# Program file
The file run_analysis.R is used to transform and clean the data. The procedure to run the program is in readme.md. The steps take are
1. Get the column names to be extracted
2. extract the Train DAta
3. Extract the Test Data
4. Merge the data
5. Change column names to more accurate ones.
6. Write the file
