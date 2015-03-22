Code Book

The raw data analysis (run_analysis.R) was performed using data from the Human Activity Recognition 
Using Smartphones Data Set available from the UCI Machine Learning Repository.  The raw data was derived from
experiments carried out with a group of 30 volunters, between the ages of 19-48.  Six activities were performed (walking, 
walking_upstairs, walking_downstairs, sitting, standing and laying).  All of these activities involved the volunteer wearing a 
smartphone on the waist.  According to the authors of the experiment, using the embedded accelerometer  and gyroscope of the smartphone 
device, they were able to capture 3-axial linear acceleration and 3-axial angular volocity at a constant rate of 50Hz.  The volunteers were 
divided into two sets where 70% were selected for generating training data and 30% for test data.

The task related to run_analysis.R was to create a tidy dataset from the raw data of the experiment.  The steps to that process are as
as follows:

1. Identifying the relevant data files and downloading to a folder in the rprogramming data folder

The relevant raw data files for this project included:

X_test.txt
y_test.txt
subject_test
X_train.txt
y_train.txt
subject_train.txt
activity_labels.txt
features_info.txt

These files were downloaded from the http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
and read into RStudio using the read.table function in R.  Once loaded the properties of each table were observed to
understand the properties of the variables and identify matching elements.

2. Merging the training and test data tables to create one data set
 
Once the raw data for all the files above was read into Rstudio, a data set of the test and train files was created as follows;
	
	a. Rows from X_train and X_test were combined with rbind
	c. Rows from y_train and y-test were combined with rbind
The subject test and train files were read into R as tables and rows also combined using rbind
Names were assigned to from to the variables and the x, y and subject tables were combined to create on dataset

3. Extracting the means and standard deviation measurements

A subset of feature names from the features table by measurements of mean and standard deveiation was created. once 
executed, the data frame for the combined dataset was subset by selected names of the features table. This resulted in the addition
of the subject and activity variables being added to the dataset.

4. Descriptive Activity Names
  
In this step a new column is added to the the dataset containing the descriptive activity names stored in the V2 column of the
activity table.  Prior to achieving this step, the activity_labels file was read into RStudio.  

5. Label the dataset with descriptive variable names
 
The raw data variable names in the dataset were truncated and made it difficult for any read of the data table to understand what 
these variables represented in the experiment.  For example the letter "t" was used to designate time.  These variable
names were changed to reflect a more inteligible naming convention.  "t" for example was changed to time. 

6. Creation of a second, independent tidy data set 

in this final step an independent tidy data set was created with the average of each variable for each activity 
and each subject.  





 