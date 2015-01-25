# Getting and cleaning data Course Project

## Introduction
This repo contains the R-script for collecting and cleaning data from several text files
placed in `UCI HAR Dataset` subdirectory, and the output tidy dataset. The RAW dataset wasn't pushed on GitHub repo
because of its size. 

## RAW DataSet
The dataset contains a data from the set of experiments. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset files can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## R-script
The R-script `run_analysis.R` reads the data from the dataset files, choose the mean and the standard diviation variables,  merges the test and the train data and the descriptive activity names from the refer table, and creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

## Output
The output tidy dataset is saved into the `AvgData.txt` file.
