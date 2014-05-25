Samsung Galaxy S smartphone project codebook
========================================================

This is the code book for the "Getting and Cleaning Data Project"
-----------------------------------------

**The Data**

The data is collected from course web page and is originally from the [data source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This data is from the accelerometers from the Samsung Galaxy S smartphone and is meant for human activity recognition using the Samsung Galaxy S smartphone data set. Note that The code assumes that the data "UCI_HAR_Dataset" is in your working directory.


**The Code**

The Code for tidying the data can be found in "run_analysis.R". See below the steps for appropriate data transformations to create a tidy data set.

- Load the X train and test data and combine using *rbind* to create a row binded big X data set.

- Assign variable names to the X data set and clean the variable names by extracting only the variables corresponding to mean and standard deviation.

- Remove features like "_", "()", add periods in place of "-",  in addition to transforming the variables to lower case letters.

- Load the Y train and test data sets and comine them row-wise to create a big Y data set, and do the same processing for the subject data to create a big Subject data set.

- Merge the X data, Y data, Subject data and assign the appropriate column names to it.

- Load the descriptive activity names to name the activities in the data set by employing the loaded activity labels data and appropriately label the data set with descriptive activity names.

- Finally create an average of each variable for each activity and each subject to get the final tidy data set.

- The final tidy data is saved in a tab delimied text file "tidyData.txt"


A csv file for variable names is created to show the list of variables:

```{r createtable, results="asis", echo=FALSE}
source("run_analysis.R")
listOfVariables <- data.frame(names(tidiedData))
write.csv(listOfVariables,"listOfVariables.csv") 
variables<-read.csv("listOfVariables.csv")
variables
```

**Variable description**
The variables in this data (See below for the variable list) corresponds to the mean and standard deviation of a number of important human activity features wrt using smartphones. These are collected from a group of 30 people or subjects while they were peroforming six specific activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) using the Samsung Galaxy S smartphone. For example the "tbodyacc" corresponds to the the body accelaration. The mean and std of the body accelaeration is calcualted in the x y and z direction while the person is doing any of the six activities. This can tell something about the smartphone usage during intense activites. 


**The resultant varaible names are**

"1","Subject"

"2","activityName"

"3","tbodyacc.mean.x"

"4","tbodyacc.mean.y"

"5","tbodyacc.mean.z"

"6","tbodyacc.std.x"

"7","tbodyacc.std.y"

"8","tbodyacc.std.z"

"9","tgravityacc.mean.x"

"10","tgravityacc.mean.y"

"11","tgravityacc.mean.z"

"12","tgravityacc.std.x"

"13","tgravityacc.std.y"

"14","tgravityacc.std.z"

"15","tbodyaccjerk.mean.x"

"16","tbodyaccjerk.mean.y"

"17","tbodyaccjerk.mean.z"

"18","tbodyaccjerk.std.x"

"19","tbodyaccjerk.std.y"

"20","tbodyaccjerk.std.z"

"21","tbodygyro.mean.x"

"22","tbodygyro.mean.y"

"23","tbodygyro.mean.z"

"24","tbodygyro.std.x"

"25","tbodygyro.std.y"

"26","tbodygyro.std.z"

"27","tbodygyrojerk.mean.x"

"28","tbodygyrojerk.mean.y"

"29","tbodygyrojerk.mean.z"

"30","tbodygyrojerk.std.x"

"31","tbodygyrojerk.std.y"

"32","tbodygyrojerk.std.z"

"33","tbodyaccmag.mean"

"34","tbodyaccmag.std"

"35","tgravityaccmag.mean"

"36","tgravityaccmag.std"

"37","tbodyaccjerkmag.mean"

"38","tbodyaccjerkmag.std"

"39","tbodygyromag.mean"

"40","tbodygyromag.std"

"41","tbodygyrojerkmag.mean"

"42","tbodygyrojerkmag.std"

"43","fbodyacc.mean.x"

"44","fbodyacc.mean.y"

"45","fbodyacc.mean.z"

"46","fbodyacc.std.x"

"47","fbodyacc.std.y"

"48","fbodyacc.std.z"

"49","fbodyaccjerk.mean.x"

"50","fbodyaccjerk.mean.y"

"51","fbodyaccjerk.mean.z"

"52","fbodyaccjerk.std.x"

"53","fbodyaccjerk.std.y"

"54","fbodyaccjerk.std.z"

"55","fbodygyro.mean.x"

"56","fbodygyro.mean.y"

"57","fbodygyro.mean.z"

"58","fbodygyro.std.x"

"59","fbodygyro.std.y"

"60","fbodygyro.std.z"

"61","fbodyaccmag.mean"

"62","fbodyaccmag.std"

"63","fbodybodyaccjerkmag.mean"

"64","fbodybodyaccjerkmag.std"

"65","fbodybodygyromag.mean"

"66","fbodybodygyromag.std"

"67","fbodybodygyrojerkmag.mean"

"68","fbodybodygyrojerkmag.std"







