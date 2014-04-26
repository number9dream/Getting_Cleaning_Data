#####################################################################
## This script should be placed in the root folder containing the 
## test and train data folders.
## This script will require the installation of the reshape2 package
## Please install by running install.packages("reshape2") if required.
#####################################################################
import_initial <- function() {
  
  ## read in the test and training labels
  y_train <- read.table("./train/y_train.txt")
  y_test <- read.table("./test/y_test.txt")
  
  ## read in the activity labels
  activity_labels <- read.table("./activity_labels.txt")
  
  ## read in the test and training subject labels
  subject_train <- read.table("./train/subject_train.txt")
  subject_test <- read.table("./test/subject_test.txt")
  
  ## read in the training dataset
  training_dat <- read.table("./train/X_train.txt")
  
  ## read in the test dataset
  test_dat <- read.table("./test/X_test.txt")
  
  ## read in the features labels - column headers for the test and training data
  features_dat <- read.table("./features.txt")
  
  ## merge y test and training activity labels
  y_train_labels <- merge(y_train,activity_labels,by="V1")
  y_test_labels <- merge(y_test,activity_labels,by="V1")
  
  ## merge the test and training data and the respective labels together
  training_dat <- cbind(subject_train,y_train_labels,training_dat)
  test_dat <- cbind(subject_test,y_test_labels,test_dat)
  
  ## then merge the test and training data together
  all_dat <- rbind(training_dat,test_dat)
  
  ## set the column headers for combined data
  colnames(all_dat) <- c("Subject","Activity_Id","Activity",as.vector(features_dat[,2]))
  
  ## find the column headers containing std and mean
  colVector <- c(grep("mean()", colnames(all_dat), fixed=TRUE),grep("std()", colnames(all_dat), fixed=TRUE))
  colVector <- sort(colVector)
  
  ## extract the columns with std and mean in their column headers
  all_dat <- all_dat[,c(1,2,3,colVector)]
  
  ## melt the data
  require(reshape2)
  melt_data <- melt(all_dat, id=c("Subject","Activity_Id","Activity"))
  
  ## cast the data back
  tidy_data <- dcast(melt_data, formula = Subject + Activity_Id + Activity ~ variable, mean)
  
  ## tidy up the column names
  colNameVector <- colnames(tidy_data)
  colNameVector <- gsub("-mean()","Mean",colNameVector,fixed=TRUE)
  colNameVector <- gsub("-std()","Std",colNameVector,fixed=TRUE)
  colNameVector <- gsub("BodyBody","Body",colNameVector,fixed=TRUE)
  
  ## add the tidy column names
  colnames(tidy_data) <- colNameVector
  
  ## write the output into a file
  write.table(tidy_data, file="./tidydata.txt", sep="\t", row.names=FALSE)
}
