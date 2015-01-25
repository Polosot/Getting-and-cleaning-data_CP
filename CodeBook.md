# CodeBook
## Introduction
This file describes the variables, the data, and any transformations or work that were performed to clean up the data.

## Reading the RAW data
### RAW data folder
The location of RAW-dataset is saved in `datadir` variable.

The folder contains the files with the refer data, both for the `test` and `train` data set (i.e. activities and variables maps), and two subfolders with identical structure. The subfolders are named `test` and `train`.

The programm reads the data into 2 steps:
* Reading activities and variables sets, creating a filter array for mean() and std() variables
* Creating universal function `readData(dataset)`, which reads the `test` or the `train` dataset and choose mean() and std() variables only. This function calls twice as parameters of `bind_cols()` function 

