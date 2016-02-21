# Predict the results of football matches of the Italian League.

All the "Serie A" football matches of the last 8 years are provided. Your goal is to predict the final result, having at your disposal the odds of various bookmakers.

The use of external sources is encouraged, with some recommendation. Of course, the actual results of these matches can be easily downloaded from the web. However, this competition it is intended to be for fun and learning and therefore the names of the teams are given.

The train and the test set was splitted non randomly. Your are asked to predict the last 2 years.

##Acknowledgements

This dataset was downloaded from http://www.football-data.co.uk/.


##File descriptions

* train.csv - the training set
* test.csv - the test set
* submission_example.csv - a sample submission file in the correct format

##Data fields

* ID = An anonymous ID unique to a given match
* Date = Date of the match
* FTR = Full Time Result (H=Home Win, D=Draw, A=Away Win). This is the target variable
* HomeTeam = Home Team
* AwayTeam = Away Team
* B365H = Bet365 home win odds
* B365D = Bet365 draw odds
* B365A = Bet365 away win odds
* BWH = Bet&Win home win odds
* BWD = Bet&Win draw odds
* BWA = Bet&Win away win odds
* IWH = Interwetten home win odds
* IWD = Interwetten draw odds
* IWA = Interwetten away win odds
* LBH = Ladbrokes home win odds
* LBD = Ladbrokes draw odds
* LBA = Ladbrokes away win odds
* VCH = VC Bet home win odds
* VCD = VC Bet draw odds
* VCA = VC Bet away win odds
* WHH = William Hill home win odds
* WHD = William Hill draw odds
* WHA = William Hill away win odds