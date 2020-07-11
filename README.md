# Logistic Regression Model for Prediction of Coronary Disease
A regression model is designed for prediction of coronary disease. This model evaluates the effect of sex, age, and cholesterol on the probability of
coronary disease. This dataset is from the Duke University Cardiovascular Disease Databank and consists of 2258 patients and 6 variables. The patients were referred to Duke University Medical Center for chest pain. The variables included in the dataset "acath2.csv" are the following:

- sex: sex of the patient (0=male, 1=female)
- age: age of the patient
- cad.dur: duration of symptoms of coronary artery dsisea
- cholest: cholesterol (in mg)
- sigdz: significant coronary disease by cardiac catheterization (defined as >= 75% diameter narrowing in at least one important coronary artery: 1=yes, 0=no)
- tvdlm: severe coronary disease (defined as three vessel or left main disease by cardiac catheterization: 1=yes, 0=no)

First, the path directory is set.  
```sh
# Working directory which contains the data file (please change accordingly)  
dir = "F:/RProjects/LRM"
setwd(dir)
```

