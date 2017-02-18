##Programming Assignment For Week 4. GEtting and Cleaning Data.
## 
# Step 1: First read the activity labels
# Step 2: 

require("data.table")
require("reshape2")

#Read the table which contains activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Read the data column names.
dataColumns <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Now extract the mean and standard deviation names. To  do this
# check which values have mean or std in them
meanStandard <- grepl("mean|std" , dataColumns)

# Load the X and Y Test Data
xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(xTestData) = dataColumns

xTestData = xTestData[,meanStandard]

# Now load the activity labels
yTestData[,2] = activityLabels[yTestData[,1]]
names(yTestData) = c("Activity_ID", "Activity_Label")
names(subjectTestData) = "subject"

#Now Bind the DAta
testData <- cbind(as.data.table(subjectTestData), yTestData, xTestData)



# Load the X and Y Training Data
xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(xTrainData) = dataColumns

xTrainData = xTrainData[,meanStandard]

# Now load the activity labels
yTrainData[,2] = activityLabels[yTrainData[,1]]
names(yTrainData) = c("Activity_ID", "Activity_Label")
names(subjectTrainData) = "subject"

#Now Bind the DAta
trainData <- cbind(as.data.table(subjectTrainData), yTrainData, xTrainData)

#Merge the data sets
data = rbind(testData, trainData)


labels   = c("subject", "Activity_ID", "Activity_Label")
dataLabels = setdiff(colnames(data), labels)
newData      = melt(data, id = labels, measure.vars = dataLabels)

# Apply mean function to dataset by dcast function
tidyData   = dcast( newData, subject + Activity_Label ~ variable, mean)


# Apply reasonable names
names(tidyData) = c("Subject",
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
                    "BodyBodyGyroJerkMag-Mean Freq")



write.table(tidyData, file = "./tidy_data.txt", row.name="false")
