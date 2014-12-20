#install.packages("plyr")
#library(plyr)
#install.packages("reshape2")
#library(reshape2)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
  download.file("url", "getdata-projectfiles-UCI HAR Dataset.zip")
  unzip("getdata-projectfiles-UCI HAR Dataset.zip", overwrite = TRUE)
}

# read the files
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Merging data sets
x <- rbind(train.x, test.x)
y <- rbind(train.y, test.y)
subject <- rbind(subject.train, subject.test)

# Adding column names
colnames(x) <- c(as.character(features[,2]))
colnames(y) <- c("Activity")
colnames(subject) <- c("Subject")

# Extract measurements on mean and standard deviation only
mean <- grep("mean()", colnames(x),fixed= TRUE)
sd <- grep("std()",colnames(x), fixed= TRUE)
meansd <- x[,c(mean,sd)]

# Creating a dataset with average of each variable by activity and subject
all <- cbind(meansd, y, subject)
colnames(activity.labels) <- c("V1","Activity_Name")
combine <- merge(all, activity.labels, by.x = "Activity", by.y = "V1")
average <- aggregate(.~ Subject + Activity_Name, data = combine, FUN = "mean")

# Exporting cleaned data
write.table(all, file = "MeanSd.txt", sep = ",",row.names= FALSE)
write.table(average, file = "Average.txt", sep = ",", row.names = FALSE)