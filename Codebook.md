---
title: "CodeBook"
output: html_document
---

## Coursera, Data Cleaning and Getting Data, Project Code Book

The script run_analysis.R reads in the processed experiment data and performs steps to transform it into a tidy dataset, and finally into a tidy summary. Lines of the code in run_analysis.R are commented on, plesee see the comments for more detail. In brief, the following operations were performed on the dataset: 

    Test and training datasets are read in and merged into a single data frame.
    The feature names are then mapped onto column names of the data frame.
    Columns containing mean or standard deviation of measurements are retained and other columns are excluded from the dataframe.
    The activity identifiers are replaced with the activity labels.
    Unnecessary characters,(), are removed from the column names. 
    The data is then grouped by subject and activity, and the mean calculated for every measurement column.
    the summary dataset is written to a file run_analysis_summary_outcome.txt.

The columns included in the output file are listed below:

* Subject - id of the experiment participant

* Activity - name of the activity the measurements correspond to, like LAYING or WALKING

All of the following fields represent mean values of recorded data points for the given subject and activity. 

* tBodyAccMag.std

* tBodyAccMag.min

* tGravityAccMag.std

* tGravityAccMag.min  

* tBodyAccJerkMag.std   

* tBodyAccJerkMag.min

* tBodyGyroMag.std  

* tBodyGyroMag.min 

* tBodyGyroJerkMag.std  

* tBodyGyroJerkMag.min  

* fBodyAccMag.std

* fBodyAccMag.min

* fBodyBodyAccJerkMag.std

* fBodyBodyAccJerkMag.min

* fBodyBodyGyroMag.std

* fBodyBodyGyroMag.min 

* fBodyBodyGyroJerkMag.std

* fBodyBodyGyroJerkMag.min

Detailed information on the experiment and the data can be found in the README.txt file included in the experiment data [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)or find more information on the [dataset homepage](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

