# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* All the files having same columns number, which refer to the same entities are merged using `rbind()` function.
* After that, I extract the columns with the same mean and standard deviation, then give them the name of `features.txt`.
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* On the whole dataset, those columns with vague column names are corrected.
* The output file is called `Tidy.txt`, and uploaded to this repository.

# Variables

* `x_Train`, `y_Train`, `x_Test`, `y_Test`, `Subjecttrain` and `Subjecttest` contain the data from the downloaded files.
* `x_DataSet`, `y_DataSet` and `subjectDataSet` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_DataSet` dataset.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* Finally, `Final_CleanedData` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
