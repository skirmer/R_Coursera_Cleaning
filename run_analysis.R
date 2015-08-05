# Get the libraries going
library("dplyr")
library("data.table")


# Load each file into workspace
test_subjects <- read.table("test/subject_test.txt", header=FALSE)
test_set<- read.table("test/X_test.txt", header=FALSE)
test_activity<- read.table("test/y_test.txt", header=FALSE)

train_subjects <- read.table("train/subject_train.txt", header=FALSE)
train_set<- read.table("train/X_train.txt", header=FALSE)
train_activity<- read.table("train/y_train.txt", header=FALSE)

act_labels <- read.table("activity_labels.txt", header=FALSE)
set_labels <- read.table("features.txt", header=FALSE)

#Apply labels to the data
labels <- set_labels[2]
names(test_set) <- labels$V2
names(train_set) <- labels$V2

names(train_subjects) <- "subjects"
names(test_subjects) <- "subjects"
names(train_activity) <- "activity"
names(test_activity) <- "activity"

#Merge the sets
train_all<-cbind(train_subjects,train_activity,train_set)
test_all<-cbind(test_subjects, test_activity, test_set)
full_set <- rbind(test_all, train_all, make.row.names = TRUE)

#get rid of unnecessary columns (keeping only mean and SD and grouping variables)
columnnames <- colnames(full_set)
short_col_names <- grep("mean|sd|Mean|SD|std|Std|STD|subjects|activity", columnnames, value=TRUE)
short_col_nums <- grep("mean|sd|Mean|SD|std|Std|STD|subjects|activity", columnnames, value=FALSE)
short_full_set <- tbl_df(full_set[short_col_nums])

# NEXT STEP - GROUP AND SUMMARIZE 
DT<- data.table(short_full_set)
full_set_means <- DT[, lapply(.SD,mean), by=.(subjects, activity)]

#Add activity names to codes
full_set_means$actname <- ''
full_set_means$actname <- ifelse(full_set_means$activity==1, "WALKING",
                                 ifelse(full_set_means$activity==2, "WALKING_UPSTAIRS",
                                          ifelse(full_set_means$activity==3, "WALKING_DOWNSTAIRS",
                                                 ifelse(full_set_means$activity==4, "SITTING",
                                                        ifelse(full_set_means$activity==5, "STANDING",
                                                               ifelse(full_set_means$activity==6, "LAYING", ""
                                                                      ))))))

short_full_set$actname <- ''

short_full_set$actname <- ifelse(short_full_set$activity==1, "WALKING",
                                 ifelse(short_full_set$activity==2, "WALKING_UPSTAIRS",
                                        ifelse(short_full_set$activity==3, "WALKING_DOWNSTAIRS",
                                               ifelse(short_full_set$activity==4, "SITTING",
                                                      ifelse(short_full_set$activity==5, "STANDING",
                                                             ifelse(short_full_set$activity==6, "LAYING", ""
                                                             ))))))



#Sort the files for tidiness
full_set_means_sorted <- arrange(full_set_means, subjects, activity)
full_set_sorted <- short_full_set[order(short_full_set$subjects, short_full_set$activity),]

#clean up the workspace
rm(act_labels)
rm(labels)
rm(set_labels)
rm(test_activity)
rm(test_set)
rm(test_subjects)
rm(train_activity)
rm(train_set)
rm(train_subjects)
rm(columnnames)
rm(short_col_names)
rm(train_all)
rm(test_all)
rm(DT)
rm(short_col_nums)

write.table(full_set_means_sorted, file="output.txt", row.name=FALSE)
