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
<li>An additional column (actname) is added to the file, using a crosswalk of activity name to activity code, so that the name of each activity in character form is available on the file. Finally, the "short_full_set" file is sorted, producing the final "full_set_sorted" file, which is ready for analysis.</li>
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
tBodyAcc-mean()-X                   
tBodyAcc-mean()-Y                    
tBodyAcc-mean()-Z                    
tBodyAcc-std()-X                    
tBodyAcc-std()-Y                     
tBodyAcc-std()-Z                     
tGravityAcc-mean()-X                
tGravityAcc-mean()-Y                 
tGravityAcc-mean()-Z                 
tGravityAcc-std()-X                 
tGravityAcc-std()-Y                  
tGravityAcc-std()-Z                  
tBodyAccJerk-mean()-X               
tBodyAccJerk-mean()-Y                
tBodyAccJerk-mean()-Z                
tBodyAccJerk-std()-X                
tBodyAccJerk-std()-Y                 
tBodyAccJerk-std()-Z                 
tBodyGyro-mean()-X                  
tBodyGyro-mean()-Y                   
tBodyGyro-mean()-Z                   
tBodyGyro-std()-X                   
tBodyGyro-std()-Y                    
tBodyGyro-std()-Z                    
tBodyGyroJerk-mean()-X              
tBodyGyroJerk-mean()-Y               
tBodyGyroJerk-mean()-Z               
tBodyGyroJerk-std()-X               
tBodyGyroJerk-std()-Y                
tBodyGyroJerk-std()-Z                
tBodyAccMag-mean()                  
tBodyAccMag-std()                    
tGravityAccMag-mean()                
tGravityAccMag-std()                
tBodyAccJerkMag-mean()               
tBodyAccJerkMag-std()                
tBodyGyroMag-mean()                 
tBodyGyroMag-std()                   
tBodyGyroJerkMag-mean()              
tBodyGyroJerkMag-std()              
fBodyAcc-mean()-X                    
fBodyAcc-mean()-Y                    
fBodyAcc-mean()-Z                   
fBodyAcc-std()-X                     
fBodyAcc-std()-Y                     
fBodyAcc-std()-Z                    
fBodyAcc-meanFreq()-X                
fBodyAcc-meanFreq()-Y                
fBodyAcc-meanFreq()-Z               
fBodyAccJerk-mean()-X                
fBodyAccJerk-mean()-Y                
fBodyAccJerk-mean()-Z               
fBodyAccJerk-std()-X                 
fBodyAccJerk-std()-Y                 
fBodyAccJerk-std()-Z                
fBodyAccJerk-meanFreq()-X            
fBodyAccJerk-meanFreq()-Y            
fBodyAccJerk-meanFreq()-Z           
fBodyGyro-mean()-X                   
fBodyGyro-mean()-Y                   
fBodyGyro-mean()-Z                  
fBodyGyro-std()-X                    
fBodyGyro-std()-Y                    
fBodyGyro-std()-Z                   
fBodyGyro-meanFreq()-X               
fBodyGyro-meanFreq()-Y               
fBodyGyro-meanFreq()-Z              
fBodyAccMag-mean()                   
fBodyAccMag-std()                    
fBodyAccMag-meanFreq()              
fBodyBodyAccJerkMag-mean()           
fBodyBodyAccJerkMag-std()            
fBodyBodyAccJerkMag-meanFreq()      
fBodyBodyGyroMag-mean()              
fBodyBodyGyroMag-std()               
fBodyBodyGyroMag-meanFreq()         
fBodyBodyGyroJerkMag-mean()          
fBodyBodyGyroJerkMag-std()           
fBodyBodyGyroJerkMag-meanFreq()     
angle(tBodyAccMean,gravity)          
angle(tBodyAccJerkMean),gravityMean) 
angle(tBodyGyroMean,gravityMean)    
angle(tBodyGyroJerkMean,gravityMean) 
angle(X,gravityMean)                 
angle(Y,gravityMean)                
angle(Z,gravityMean)                 
actname                             
