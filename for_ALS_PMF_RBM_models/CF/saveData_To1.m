

our_training9 = csvread('ratings9u_0_s.csv',0,0);
our_testing1 = csvread('ratings1_0_s.csv',0,0);

our_training9(:,1:2) = our_training9(:,1:2) + ones(size(our_training9,1),2);
our_testing1(:,1:2) = our_testing1(:,1:2) + ones(size(our_testing1,1),2);

csvwrite('ratings9u_1_s.csv',our_training9);
csvwrite('ratings1_1_s.csv',our_testing1);