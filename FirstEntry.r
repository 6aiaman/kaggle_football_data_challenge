library(data.table)
set.seed(1)
test_URL <- "https://inclass.kaggle.com/c/football-data-challenge/data/c/football-data-challenge/download/test.csv"
train_URL <- "https://inclass.kaggle.com/c/football-data-challenge/data/c/football-data-challenge/download/train.csv"
example_URL <- "https://inclass.kaggle.com/c/football-data-challenge/data/c/football-data-challenge/download/submission_example.csv"

download.file(test_URL, destfile = "test.csv")
raw_data <- fread("test.csv")

##### Make FTR and Teams Numeric
raw_data[,FTR_NEW:=factor(FTR,levels =c("H","D","A"),labels = c(0,1,2) )]
raw_data[,Date:=as.Date(Date)]
team_names_vector <- as.vector(raw_data[,unique(HomeTeam)])
raw_data[,HomeTeam_id:=factor(HomeTeam,levels = team_names_vector,labels = c(1:27))]
raw_data[,AwayTeam_id:=factor(AwayTeam,levels =team_names_vector,labels = c(1:27))]


data_length <- floor(nrow(raw_data)*0.8)
sampled_data_1 <- as.data.frame(raw_data)[,-2]
training_data_id <- sample(seq_len(nrow(sampled_data_1)),data_length)
training_data <- sampled_data_1[training_data_id,]
testing_data <- sampled_data_1[- training_data_id,]

####remove NA from training data
complete_training_data <- training_data[complete.cases(training_data),][,-(1:5)]
complete_testing_data <- testing_data[complete.cases(testing_data),][,-(1:5)]



#determinants <- names(raw_data)
#to_be_predicted_variable <- determinants[24]
#predictor_variable <- determinants[c(-24,-1:-5)]
#linear_formula <- formula(to_be_predicted_variable~paste(predictor_variable,collapse = "+"))
                          
#fit <- glm(FTR_NEW ~ B365H+B365D+B365A+BWH+BWD+BWA+IWH+IWD+IWA+LBH+LBD+LBA+WHH+WHD+WHA+VCH+VCD+VCA+HomeTeam_id+AwayTeam_id,data = training_data,family = binomial(link='logit'))

####Fitting By KNN
complete_training_data_KNN <- training_data[complete.cases(training_data),][,-(1:5)]
complete_testing_data_KNN <- testing_data[complete.cases(testing_data),][,-(1:5)]
predicted_vector <- knn(complete_training_data_KNN,complete_testing_data_KNN,cl = complete_training_data_KNN[,"FTR_NEW"],3)
require(gmodels)
CrossTable(complete_testing_data_KNN[,"FTR_NEW"],predicted_vector,prop.chisq = FALSE)
