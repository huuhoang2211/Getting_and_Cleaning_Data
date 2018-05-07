##Loading dataset into R
setwd("C:/Users/Huu_Hoang/Desktop/UCI HAR Dataset")
library(plyr)
library(data.table)

subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
x_Train = read.table('./train/x_train.txt',header=FALSE)
y_Train = read.table('./train/y_train.txt',header=FALSE)

subjectTest = read.table('./test/subject_test.txt',header=FALSE)
x_Test = read.table('./test/x_test.txt',header=FALSE)
y_Test = read.table('./test/y_test.txt',header=FALSE)

features<-read.table("./features.txt")
activity<-read.table("./activity_labels.txt")

##merges train and test data in one dataset
x_DataSet <- rbind(x_Train, x_Test)
y_DataSet <- rbind(y_Train, y_Test)
subjectDataSet <- rbind(subjectTrain, subjectTest)
dim(x_DataSet)

##Extracting the measurements on the mean and standard deviation for each measurement.
index<-grep("mean\\(\\)|std\\(\\)", features[,2]) ##getting features that contain mean() and std() in their name
length(index) 

x_DataSet<-x_DataSet[,index] ## getting only variables with mean,stdev
dim(x_DataSet) 

##Use descriptive activity names to name the activities in the data set.
y_DataSet[,1]<-activity[y_DataSet[,1],2]
head(y_DataSet) 

##Appropriately labels the data set with descriptive variable names.

names<-features[index,2] 

names(x_DataSet)<-names 
names(subjectDataSet)<-"SubjectID"
names(y_DataSet)<-"Activity"

Final_CleanedData<-cbind(subjectDataSet,y_DataSet, x_DataSet)
head(Final_CleanedData[,c(1:4)]) 

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Final_CleanedData<-data.table(Final_CleanedData)
TidyData <- Final_CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity'] ## features average by Subject and by activity
dim(TidyData)

write.table(Final_CleanedData, file = "Tidy.txt", row.names = FALSE)
head(Final_CleanedData[order(SubjectID)][,c(1:4), with = FALSE],12) 
