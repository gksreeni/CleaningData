README file for the "Getting and Cleaning Data Project"
==========================================

This directory contains the following files:

*run_analysis.R
*CodeBook.md
*tidyData.txt



The script file, "run_analysis.R", includes the R codes to tidy the Samsung Galaxy S smartphone data set provided in the "UCIHAR Dataset".

The file "run_analysis.R" contains scripts to load the provided data, merges the data set to create one large data set,
extracts the measurements on the mean and standard deviation for each measurement, uses the provided descriptive activity names to name the activities, labels the data set these descriptive activity names and finally, creates a tidy data set with the average of each variable for each activity and each subject.


We merged the  train and test X data (row-wise-such that train data is at the top side and test data at the bottom), to get one big X data set. The initial merged X data set has a data dimension of 10299 by 563. By extracting only the mean() and std() values, we automaticcaly reduced the X data dimension to 10299 by 66. Note that we also cleaned the variable names to appropriate variable format by removing "_" to "." and by changing the alphabets of the variable names to lower cases. We also removed any instances of "()" from the variable names.

The final appropriately labelled X data set is merged with the big Y data set, the row binded Y train and test sets, and with the big Subject data set, which is the row binded train and test Subject data set. The final merged data frame with repective column names is used to for the next step of tidying.


We used the descriptive activity names to name the activities in the data set by employing the loaded activity labels data and appropriately labeled the data set with descriptive activity names. A final independent tidy data set with dimension 180 by 68 is created with the average of each variable for each activity and each subject. This tidy data set is written to a tab delimited text file "tidyData.txt".

All the  names describing the variables, the data, and other important details that is performed in this project to clean up the data is written down in a file called "CodeBook.md". See "CodeBook.md" for any further details.



