##load libaries that will be used with script development

library(dplyr)
library(plyr)

##Review files,download files to be used to build script, store in file in rprogramming folder
##Read files test, train, activity and features

x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
activity<- read.table("activity_labels.txt")
features<- read.table("features.txt")

## Review the properties of the files test and train

str(x_test)
str(y_test)
str(x_train)
str(y_train)

##Merge the training and test data to create one data set
## First combine the tables for train by rows

x_bind <- rbind(x_train, x_test)
y_bind <- rbind(y_train, y_test)

##next read the subject test and train files

datasubjecttest<-read.table("subject_test.txt")
datasubjecttrain<-read.table("subject_train.txt")

## combine the rows of the subject data for test and train

datasubject<- rbind(datasubjecttest, datasubjecttrain)

##Review the tables created so far

str(datasubject)
str(x_bind)
str(y_bind)

## Set names to the variables 

names(datasubject)<- c("subject")
names(y_bind)<- c("activity")
str(y_bind)

##Review the features table
str(features)

## Set names to variables

names(x_bind)<-features$V2
str(x_bind)

## Merge the columns of all three tables to create the combined data frame called dataset


datafirst<-cbind(datasubject, y_bind)
dataset <- cbind(datafirst, x_bind )
str(dataset)

##Extract only the measurements on the means and standard deviation for each measurement 

featuressubset<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

##subset dataset by selected names from the features table

selectNames<- c(as.character(featuressubset), "subject", "activity")
dataset<- subset(dataset, select=selectNames)
str(dataset)

##use descriptive activity names to name the activities in the data set

##Renamed the columns in the activity table

names(activity2)[names(activity2)=="V2.V2"]<-"activity"
colnames(activity2)
names(activity2)[names(activity2)=="V2.V1"]<-"V1"
colnames(activity2)

##Checked the classes of the columns in dataset$activity and activity$activity where
## the descriptive names are stored

class(activity2$activity)
class(dataset$activity)

## changed the data type in the dataset$activity column to a factor to match the factor type 
## in activity$activity

as.factor(dataset$activity)

## tried using a the plyr join feature to insert the descriptive names but couldn't get it to
## work. 
datasetjoin<-join(dataset, activity, by="activity", match=first)

##labeled the dataset with descriptive variable names

names(dataset)<-gsub("^t", "time", names(dataset))
names(dataset)<-gsub("^f", "fequency", names(dataset))
names(dataset)<-gsub("^ACC", "Accelerometer", names(dataset))
names(dataset)<-gsub("^Gyro", "Gyroscope", names(dataset))
names(dataset)<-gsub("^Mag", "Magnitude", names(dataset))
names(dataset)<-gsub("^BodyBody", "Body", names(dataset))

##checked to make sure the new names were displayed
names(dataset)

## Created a second, independent tidy data set and output it

dataset2<-aggregate(.~ subject + activity, dataset, mean)
dataset2<-dataset2[order(dataset2$subject, dataset2$activity),]
write.table(dataset2, file = "tidydata.txt", row.name =FALSE )

dataset2
