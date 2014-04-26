README and CODEBOOK 
=====================

This is the readme and the codebook that describes the initial_import.R script in this repository.

README
======================================================================================
1. Extract the Samsung data
2. Place the script in the root folder of the Samsung data
   1. The default directory would be ../UCI HAR Dataset
3. Use RStudio or R to run the script
   1. Source the R script: import_initial.R
   2. Install the R package "reshape2": intall.packages("reshape2")
   3. Run the script by calling import_initial() from the command line
4. The file tidydata.txt will be generated in the folder where the script is placed


CODEBOOK
======================================================================================
This section describes the columns expected in the tidy dataset output from the Samsung data.

Each row in the tidy dataset describes a Subject performing an Activity; the columns describe the mean (average) values of the original dataset for the mean and std values. As the instructions are to include only the mean and std values in the original dataset, hence only the columns with -mean() and -std() are included in this tidy dataset.

Subject - unique numeric ID to denote a single person
Activity_Id - unique numeric ID to denote the activity being carried out
Activity - corresponding description for the Activity_Id

tBodyAccMean-XYZ,tBodyAccStd-XYZ and tGravityAccMean-XYZ,tGravityAccStd-XYZ represent the values separated into body and gravity acceleration signals from the accelerometer and gyroscope 3-axial raw signals.

tBodyAccJerkMean-XYZ,tBodyAccJerkStd-XYZ and tBodyGyroJerkMean-XYZ,tBodyGyroJerkStd-XYZ represent the body linear acceleration and angular velocity.

The below columns represent the magnitude of the previous 3 dimensional signals calculated using the Euclidean norm. 
tBodyAccMagMean,tBodyAccMagStd 
tGravityAccMagMean,tGravityAccMagStd
tBodyAccJerkMagMean,tBodyAccJerkMagStd
tBodyGyroMagMean,tBodyGyroMagStd
tBodyGyroJerkMagMean,tBodyGyroJerkMagStd

The below columns represent the values after a Fast Fourier Transform (FFT) was applied to some of the previous signal values.
fBodyAccMean-XYZ,fBodyAccStd-XYZ
fBodyAccJerkMean-XYZ,fBodyAccJerkStd-XYZ
fBodyGyroMean-XYZ,fBodyGyroStd-XYZ
fBodyAccJerkMagMean,fBodyAccJerkMagStd
fBodyGyroMagMean,fBodyGyroMagStd
fBodyGyroJerkMagMean,fBodyGyroJerkMagStd
