# CodeBook
## Introduction
This file describes the variables, the data, and any transformations or work that were performed to clean up the data.

## Reading the RAW data
The location of RAW-dataset is saved in `datadir` variable.

The folder contains the files with the refer data, both for the `test` and `train` data set (i.e. activities and variables maps), and two subfolders with identical structure. The subfolders are named `test` and `train`.

The programm reads the data into 2 steps:
* Reading activities and variables sets, creating a filter array for mean() and std() variables
* Creating universal function `readData(dataset)`, which reads the `test` or the `train` dataset and choose mean() and std() variables only. This function calls twice as parameters of `bind_cols()` function. This function creates merged dataset and saves it into the TidyData variable.

## Transformations of data
The dataset merges with the `activity` table. Unnecessary fields are rejected by `select` function.

## Creating the output dataset
The data set is grouped by `group_by()` function and the averege values of variables are calculated by `summarise_each()` function for each group (combination of activity and subject).
This new dataset is written to the output text file `AvgData.txt` by `write.table()` function.

