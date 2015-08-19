---
title: "CodeBook"
author: "Stephanie Kirmer"
date: "Wednesday, August 05, 2015"
output: html_document
---
<h1>Introduction</h1>
The files produced by this program (run_analysis.R) describe the results of a study of physical activity where data was collected using wearable technology. The original data was collected and packaged under the name "Human Activity Recognition Using Smartphones Dataset, Version 1.0" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto at the Smartlab - Non Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova. They can be contacted at activityrecognition@smartlab.ws.

This program assembles the varied data files in the original package, subsets to only include the variables regarding mean and standard deviation of values, and produces a neat file for analytic use. This file is "full_set_sorted" and is arranged in ascending order by study subject and activity. Second, the program assembles a summary file averaging the means and standard deviations shown in the first file, grouped by study subject and activity. This file is "full_set_means_sorted" and is also arranged in ascending order by study subject and activity. 

<h1>Data Cleaning Steps in Program:</h1>
<h2>Part 1:</h2>
<ol>
<li>Load the following files into workspace as data frames: subject_test.txt, X_test.txt, y_test.txt,subject_train.txt, X_train.txt, y_train.txt, activity_labels.txt, features.txt</li>
<li>Apply labels found in features.txt (variable names) to the x_test.txt and x_train.txt files (the data collected on the subjects), and name the columns in subject_train, subject_test, y_train, and y_test so that they are identifiable as the subject id numbers and the activity type numbers.</li>
<li>Combine the "train" and "test" files to create two tables, each with subject number, activity number, and then the columns of collected data arranged in an orderly fashion. The result of this action is two data frames, test_all and train_all.</li> 
<li>Further combine the two new data frames into a single master file, called full_set. This data frame contains all the study subjects, all activities done, and all data points collected on the activity performance.</li>
<li>Because this program is designed to only examine standard deviation and mean variables, at this point the full_set data file is subsetted to keep only the columns of subjects, activity, and columns containing std (standard deviation) or mean in the titles. This brings the total column number down from 563 to 88. The resulting file is "short_full_set".</li> 
<li>An additional column (actname) is added to the file, using a crosswalk of activity name to activity code, so that the name of each activity in character form is available on the file. Finally, the "short_full_set" file is sorted, producing the final "full_set_sorted" file, which is ready for analysis. The activity number is retained in addition to the activity title for ease of analysis, as having a numeric code for activities could be useful for modeling.</li>
</ol>

<h2>Part 2:</h2> 
<ol><li>The second element of this program is producing a tidy summary of the data organized in part 1. First, "short_full_set" is grouped by subject and by activity number.</li>
<li>The grouped file is summarized, to give the mean for each column grouped by subject and activity. This brings the total number of rows (observations) in the file down from 10,299 to 180. (30 subjects * 6 activities=180). The resulting file is called "full_set_means".</li>
<li>An additional column (actname) is added to the file, using a crosswalk of activity name to activity code, so that the name of each activity in character form is available on the file. Finally, the "full_set_means" file is sorted, producing the final "full_set_means_sorted" file, which is ready for analysis.</li>
</ol>

<h1>Final Variable List</h1>

Note that in the "full_set_sorted" file, the values shown for each variable are the original values given by the study originators. In the "full_set_means_sorted" file, the values show for each variable are the MEAN of the original values given by the study originators, grouped by study subject and activity.

 subjects
 activity
 tbody_acceleration_mean-x
 tbody_acceleration_mean-y
 tbody_acceleration_mean-z
 tbody_acceleration_stdev-x
 tbody_acceleration_stdev-y
 tbody_acceleration_stdev-z
 tgravity_acceleration_mean-x
 tgravity_acceleration_mean-y
 tgravity_acceleration_mean-z
 tgravity_acceleration_stdev-x
 tgravity_acceleration_stdev-y
 tgravity_acceleration_stdev-z
 tbody_acceleration_jerk_mean-x
 tbody_acceleration_jerk_mean-y
 tbody_acceleration_jerk_mean-z
 tbody_acceleration_jerk_stdev-x
 tbody_acceleration_jerk_stdev-y
 tbody_acceleration_jerk_stdev-z
 tbody_angular_velocity_mean-x
 tbody_angular_velocity_mean-y
 tbody_angular_velocity_mean-z
 tbody_angular_velocity_stdev-x
 tbody_angular_velocity_stdev-y
 tbody_angular_velocity_stdev-z
 tbody_angular_velocity_jerk_mean-x
 tbody_angular_velocity_jerk_mean-y
 tbody_angular_velocity_jerk_mean-z
 tbody_angular_velocity_jerk_stdev-x
 tbody_angular_velocity_jerk_stdev-y
 tbody_angular_velocity_jerk_stdev-z
 tbody_acceleration_magnitude_mean
 tbody_acceleration_magnitude_stdev
 tgravity_acceleration_magnitude_mean
 tgravity_acceleration_magnitude_stdev
 tbody_acceleration_jerk_magnitude_mean
 tbody_acceleration_jerk_magnitude_stdev
 tbody_angular_velocity_magnitude_mean
 tbody_angular_velocity_magnitude_stdev
 tbody_angular_velocity_jerk_magnitude_mean
 tbody_angular_velocity_jerk_magnitude_stdev
 fbody_acceleration_mean-x
 fbody_acceleration_mean-y
 fbody_acceleration_mean-z
 fbody_acceleration_stdev-x
 fbody_acceleration_stdev-y
 fbody_acceleration_stdev-z
 fbody_acceleration_mean_freq-x
 fbody_acceleration_mean_freq-y
 fbody_acceleration_mean_freq-z
 fbody_acceleration_jerk_mean-x
 fbody_acceleration_jerk_mean-y
 fbody_acceleration_jerk_mean-z
 fbody_acceleration_jerk_stdev-x
 fbody_acceleration_jerk_stdev-y
 fbody_acceleration_jerk_stdev-z
 fbody_acceleration_jerk_mean_freq-x
 fbody_acceleration_jerk_mean_freq-y
 fbody_acceleration_jerk_mean_freq-z
 fbody_angular_velocity_mean-x
 fbody_angular_velocity_mean-y
 fbody_angular_velocity_mean-z
 fbody_angular_velocity_stdev-x
 fbody_angular_velocity_stdev-y
 fbody_angular_velocity_stdev-z
 fbody_angular_velocity_mean_freq-x
 fbody_angular_velocity_mean_freq-y
 fbody_angular_velocity_mean_freq-z
 fbody_acceleration_magnitude_mean
 fbody_acceleration_magnitude_stdev
 fbody_acceleration_magnitude_mean_freq
 fbody_body_acceleration_jerk_magnitude_mean
 fbody_body_acceleration_jerk_magnitude_stdev
 fbody_body_acceleration_jerk_magnitude_mean_freq
 fbody_body_angular_velocity_magnitude_mean
 fbody_body_angular_velocity_magnitude_stdev
 fbody_body_angular_velocity_magnitude_mean_freq
 fbody_body_angular_velocity_jerk_magnitude_mean
 fbody_body_angular_velocity_jerk_magnitude_stdev
 fbody_body_angular_velocity_jerk_magnitude_mean_freq
 angle(tbody_acceleration_mean,gravity)
 angle(tbody_acceleration_jerk_mean),gravity_mean)
 angle(tbody_angular_velocity_mean,gravity_mean)
 angle(tbody_angular_velocity_jerk_mean,gravity_mean)
 angle(x,gravity_mean)
 angle(y,gravity_mean)
 angle(z,gravity_mean)
 actname
