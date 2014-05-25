library(reshape2)


## (1) The code below merges the training and test data set to create one data set
## First, load the required X_train and X_test data (assuming that we are in the directory containing "UCI_HAR_Dataset" :

## Load the train data 
xtrainData <- read.table("./UCI_HAR_Dataset/train/X_train.txt",header=FALSE)

##Load the test data 
xtestData <- read.table("./UCI_HAR_Dataset/test/X_test.txt",header=FALSE)

## Merge train and test data (row-wise-such that train data is at the top side and test data at the bottom), to get one big data set.   
xfullData<-rbind(xtrainData,xtestData)

#extract feature labels from feature.txt as character
featureLabels <- as.character(read.table("./UCI_HAR_Dataset/features.txt")[,2])
#converting the feature labels to more acceptable column title format
names(xfullData)<-c(featureLabels)



## (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
words<- c(".*mean\\(\\).*", ".*std\\(\\).*")
matches<-unique(grep(paste(words,collapse="|"),names(xfullData), value=TRUE))
xfullData<-xfullData[matches]

#cleaning the variable names
matches<-gsub("\\(\\)","",matches)
matches<-tolower(gsub("-",".", matches))
names(xfullData)<-matches

#Load Y_train and  Y_test data
ytrainData <- read.table("./UCI_HAR_Dataset/train/y_train.txt",header=FALSE)
ytestData <- read.table("./UCI_HAR_Dataset/test/y_test.txt",header=FALSE)
yfullData<-rbind(ytrainData,ytestData)

#Load Subject data 
stestData <- read.table("./UCI_HAR_Dataset/test/subject_test.txt",header=FALSE)
strainData <- read.table("./UCI_HAR_Dataset/train/subject_train.txt",header=FALSE)
subject <- rbind(stestData, strainData)

fullData<-data.frame(cbind(xfullData, yfullData, subject))
names(fullData)<-c(names(xfullData), "Activity", "Subject")


## (3) Uses descriptive activity names to name the activities in the data set.
activityNames <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
colnames(activityNames)<-c("id", "activityName")
fullData <- merge(fullData, activityNames, by.X="Activity", by.Y="id")


## (4) Appropriately labels the data set with descriptive activity names. 
moltenData <- melt(fullData,(id=c("activityName", "Subject")))
moltenData$Subject <- as.numeric(as.character(moltenData$Subject))

## (5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidiedData <- dcast(moltenData, Subject + activityName ~ variable, mean)[,-c(69:70)]

write.table(tidiedData, "./tidyData.txt", sep="\t")


