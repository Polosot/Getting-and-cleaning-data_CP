library(tidyr)
library(dplyr)

# The data root directory
datadir <- "UCI HAR Dataset"

# Reading the categorycal data (actual both for test and train sets)
activities <- read.table(paste(datadir, "activity_labels.txt", sep = "/"), col.names = c("act_id", "activity"))
features <- read.table(paste(datadir, "features.txt", sep = "/"), col.names=c("f_id", "feature"))
# Filter array for the mean() and std() variables
features_filter <- grepl("mean[(]|std[(]", features$feature)

# Function readData reads the data from the test or train dataset
readData <- function(dataset)
{
	# Reading the data
	y <- read.table(paste(datadir, dataset, paste("y_", dataset,".txt", sep =""), sep = "/"), col.names = "act_id")
	x <- read.table(paste(datadir, dataset, paste("X_", dataset,".txt", sep =""), sep = "/"))
	subject <- read.table(paste(datadir, dataset, paste("subject_", dataset,".txt", sep =""), sep = "/"), col.names = "subject")
	
	# Subsetting mean() and std() columns
	x <- x[, features_filter]
	colnames(x) <- features$feature[features_filter] #Setting names of variables (already unique)  

	# Adding subject and activity data
	bind_cols(y, subject, x)
}

# Merging the test and the train data
TidyData <- bind_rows(readData("test"), readData("train"))
# Replacing the activity id's by the activity names and grouping
TidyData <- select(merge(x=activities, y=TidyData, by.x="act_id", by.y="act_id", all=TRUE), -act_id) %>% group_by(activity, subject)

# Getting another data set with the average of each variable for each activity and each subject
AvgData <- summarise_each(TidyData, funs(mean))

# Writting the data to a csv-file
write.table(AvgData, file = "AvgData.txt", row.name=FALSE)