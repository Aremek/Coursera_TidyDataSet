#Read data related to the testing set 
x_test<-read.csv("x_test.txt", sep="",header=FALSE)
y_test<-read.csv("y_test.txt", sep="",header=FALSE)
subject_test<-read.csv("subject_test.txt", sep="",header=FALSE)
#Combine all the data related to the testing set into one table
test<-data.frame(subject_test, y_test, x_test)
#Read data related to the training set
x_train<-read.csv("x_train.txt", sep="",header=FALSE)
y_train<-read.csv("y_train.txt", sep="",header=FALSE)
subject_train<-read.csv("subject_train.txt", sep="",header=FALSE)
#Combine all the data related to the training set into one table
train<-data.frame(subject_train, y_train, x_train)
#Combine both testing and trainng datasets 
all<-rbind(test, train)
#Read feature names from file and map them onto the names of relevant columns
x_labels<-read.csv("features.txt", sep="",header=FALSE)
columnNam <- as.vector(x_labels[, 2])
colnames(all)<-c("Subject", "V1", columnNam)
#Remove all columns not related to neither mean nor standard deviation of a given measurement
all1<-all[,grepl("min|std", colnames(all))]
#Remove columns related to XYZ components of a given measurement
all2<-all1[,!grepl("-X|-Y|-Z", colnames(all1))]
#Put Subject and Activity columns back in as they got removed in the previous 2 steps
all3<-all[,1:2]
all<-cbind(all3, all2)
#Read activity names from file and map them onto relevant rows
activity<-read.csv("activity_labels.txt", sep="",header=FALSE)
colnames(activity)<-c("V1","Activity")
all<-merge(activity, all, by.x="V1", by.y="V1", all = TRUE)
#Remove a no longer needed column
all$V1<-NULL
#reorder columns 1 and 2
all<-all[,c(names(all)[2], names(all)[1], names(all)[3:20])]
#Further tidy column names 
colnames(all)<-gsub("\\()","",colnames(all))

#Using functions from dplr package, prepare a new data frame containing 
#the average of each variable for each activity and each subject
library(dplyr)
all.summary<-as.data.frame(all %>% group_by(Subject, Activity) %>% summarize_each(funs(mean=mean)))
#Write the summary table to file
write.table(all.summary, file = "run_analysis_summary_outcome.txt")
