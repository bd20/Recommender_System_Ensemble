clear
clc

%% Shuffle the data
%build our training set and testing set
%save as our_training, our_testing
ratings=csvread('ratings.csv',1,0);
ordering = randperm(size(ratings,1));
rand_ratings = ratings(ordering,:);
train_stop_row = round(size(ratings,1)*0.9);
our_training = rand_ratings(1:train_stop_row,:);
train_stop_row = train_stop_row+1;
our_testing = rand_ratings(train_stop_row:size(ratings,1),:);

our_training_1 = our_training;
our_training_1(:,1:3) = our_training(:,1:3)-ones(size(our_training,1),3);

our_testing_1 = our_testing;
our_testing_1(:,1:3) = our_testing(:,1:3)-ones(size(our_testing,1),3);

csvwrite('ratings9_1.csv',our_training_1);
csvwrite('ratings1_1.csv',our_testing_1);