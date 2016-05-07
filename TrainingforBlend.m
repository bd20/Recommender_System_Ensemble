clear
clc
%% Training parameters for final blending
% Author: Bochuan Du


%% inputs 
in_als = dlmread('ALS.txt');
in_pmf = dlmread('PMF.txt');
in_bmf = dlmread('BMF.txt');
in_iknn = dlmread('IKNN.txt');
in_uknn = dlmread('UKNN.txt');
in_rmf = dlmread('RMF.txt');
in_svdpp = dlmread('SVDpp.txt');
in_svd = dlmread('SVD.txt');
in_bpmf = dlmread('BPMF.txt');
in_gplsa = dlmread('GPLSA.txt');
in_rfrec = dlmread('RfRec.txt');
in_urp = dlmread('URP.txt');
in_pmf_1 = dlmread('PMF_1.txt');
in_uknn_1 = dlmread('UKNN_1.txt');
in_iknn_1 = dlmread('IKNN_1.txt');
in_bmf_1 = dlmread('BMF_1.txt');
in_ldcc = dlmread('LDCC.txt');
in_rmf_1 = dlmread('RMF_1.txt');
in_ldcc_1 = dlmread('LDCC_1.txt');
in_ldcc_2 = dlmread('LDCC_2.txt');
in_svdpp_1 = dlmread('SVDpp_1.txt');
in_rmb = dlmread('RBM.txt');

in_als = sortrows(in_als,[1,2]);
in_pmf = sortrows(in_pmf,[1,2]);
in_bmf = sortrows(in_bmf,[1,2]);
in_iknn = sortrows(in_iknn,[1,2]);
in_uknn = sortrows(in_uknn,[1,2]);
in_rmf = sortrows(in_rmf,[1,2]);
in_svdpp = sortrows(in_svdpp,[1,2]);
in_svd = sortrows(in_svd,[1,2]);
in_bpmf = sortrows(in_bpmf,[1,2]);
in_gplsa = sortrows(in_gplsa,[1,2]);
in_rfrec = sortrows(in_rfrec,[1,2]);
in_urp = sortrows(in_urp,[1,2]);
in_pmf_1 = sortrows(in_pmf_1,[1,2]);
in_uknn_1 = sortrows(in_uknn_1,[1,2]);
in_iknn_1 = sortrows(in_iknn_1,[1,2]);
in_bmf_1 = sortrows(in_bmf_1,[1,2]);
in_ldcc = sortrows(in_ldcc,[1,2]);
in_rmf_1 = sortrows(in_rmf_1,[1,2]);
in_ldcc_1 = sortrows(in_ldcc_1,[1,2]);
in_ldcc_2 = sortrows(in_ldcc_2,[1,2]);
in_svdpp_1 = sortrows(in_svdpp_1,[1,2]);
in_rmb = sortrows(in_rmb,[1,2]);

%Split to training and testing data.
y = dlmread('va_1_1_1.txt');
y = sortrows(y,[1,2]);
ordering = randperm(size(y,1));
y = y(ordering,:);
x1 = in_als(ordering,:);
x2 = in_pmf(ordering,:);
x3 = in_bmf(ordering,:);
x4 = in_iknn(ordering,:);
x5 = in_uknn(ordering,:);
x6 = in_rmf(ordering,:);
x7 = in_svdpp(ordering,:);
x8 = in_svd(ordering,:);
x9 = in_bpmf(ordering,:);
x10 = in_gplsa(ordering,:);
x11 = in_rfrec(ordering,:);
x12 = in_urp(ordering,:);
x13 = in_pmf_1(ordering,:);
x14 = in_uknn_1(ordering,:);
x15 = in_iknn_1(ordering,:);
x16 = in_bmf_1(ordering,:);
x17 = in_ldcc(ordering,:);
x18 = in_rmf_1(ordering,:);
x19 = in_ldcc_1(ordering,:);
x20 = in_ldcc_2(ordering,:);
x21 = in_svdpp_1(ordering,:);
x22 = in_rmb(ordering,:);

tr_stop_row = round(size(y,1)*0.9);
y_tr = y(1:tr_stop_row,:);
x1_tr = x1(1:tr_stop_row,:);
x2_tr = x2(1:tr_stop_row,:);
x3_tr = x3(1:tr_stop_row,:);
x4_tr = x4(1:tr_stop_row,:);
x5_tr = x5(1:tr_stop_row,:);
x6_tr = x6(1:tr_stop_row,:);
x7_tr = x7(1:tr_stop_row,:);
x8_tr = x8(1:tr_stop_row,:);
x9_tr = x9(1:tr_stop_row,:);
x10_tr = x10(1:tr_stop_row,:);
x11_tr = x11(1:tr_stop_row,:);
x12_tr = x12(1:tr_stop_row,:);
x13_tr = x13(1:tr_stop_row,:);
x14_tr = x14(1:tr_stop_row,:);
x15_tr = x15(1:tr_stop_row,:);
x16_tr = x16(1:tr_stop_row,:);
x17_tr = x17(1:tr_stop_row,:);
x18_tr = x18(1:tr_stop_row,:);
x19_tr = x19(1:tr_stop_row,:);
x20_tr = x20(1:tr_stop_row,:);
x21_tr = x21(1:tr_stop_row,:);
x22_tr = x22(1:tr_stop_row,:);

y_ts = y(tr_stop_row+1:size(y,1),:);
x1_ts = x1(tr_stop_row+1:size(y,1),:);
x2_ts = x2(tr_stop_row+1:size(y,1),:);
x3_ts = x3(tr_stop_row+1:size(y,1),:);
x4_ts = x4(tr_stop_row+1:size(y,1),:);
x5_ts = x5(tr_stop_row+1:size(y,1),:);
x6_ts = x6(tr_stop_row+1:size(y,1),:);
x7_ts = x7(tr_stop_row+1:size(y,1),:);
x8_ts = x8(tr_stop_row+1:size(y,1),:);
x9_ts = x9(tr_stop_row+1:size(y,1),:);
x10_ts = x10(tr_stop_row+1:size(y,1),:);
x11_ts = x11(tr_stop_row+1:size(y,1),:);
x12_ts = x12(tr_stop_row+1:size(y,1),:);
x13_ts = x13(tr_stop_row+1:size(y,1),:);
x14_ts = x14(tr_stop_row+1:size(y,1),:);
x15_ts = x15(tr_stop_row+1:size(y,1),:);
x16_ts = x16(tr_stop_row+1:size(y,1),:);
x17_ts = x17(tr_stop_row+1:size(y,1),:);
x18_ts = x18(tr_stop_row+1:size(y,1),:);
x19_ts = x19(tr_stop_row+1:size(y,1),:);
x20_ts = x20(tr_stop_row+1:size(y,1),:);
x21_ts = x21(tr_stop_row+1:size(y,1),:);
x22_ts = x22(tr_stop_row+1:size(y,1),:);

ytr_m = y_tr(:,3);
xtr_m(:,1) = x1_tr(:,3);
xtr_m(:,2) = x2_tr(:,3);
xtr_m(:,3) = x3_tr(:,4);
xtr_m(:,4) = x4_tr(:,4);
xtr_m(:,5) = x5_tr(:,4);
xtr_m(:,6) = x6_tr(:,4);
xtr_m(:,7) = x7_tr(:,4);
xtr_m(:,8) = x8_tr(:,3);
xtr_m(:,9) = x9_tr(:,4);
xtr_m(:,10) = x10_tr(:,4);
xtr_m(:,11) = x11_tr(:,4);
xtr_m(:,12) = x12_tr(:,4);
xtr_m(:,13) = x13_tr(:,3);
xtr_m(:,14) = x14_tr(:,4);
xtr_m(:,15) = x15_tr(:,4);
xtr_m(:,16) = x16_tr(:,4);
xtr_m(:,17) = x17_tr(:,4);
xtr_m(:,18) = x18_tr(:,4);
xtr_m(:,19) = x19_tr(:,4);
xtr_m(:,20) = x20_tr(:,4);
xtr_m(:,21) = x21_tr(:,4);
xtr_m(:,22) = x22_tr(:,3);

yts_m = y_ts(:,3);
xts_m(:,1) = x1_ts(:,3);
xts_m(:,2) = x2_ts(:,3);
xts_m(:,3) = x3_ts(:,4);
xts_m(:,4) = x4_ts(:,4);
xts_m(:,5) = x5_ts(:,4);
xts_m(:,6) = x6_ts(:,4);
xts_m(:,7) = x7_ts(:,4);
xts_m(:,8) = x8_ts(:,3);
xts_m(:,9) = x9_ts(:,4);
xts_m(:,10) = x10_ts(:,4);
xts_m(:,11) = x11_ts(:,4);
xts_m(:,12) = x12_ts(:,4);
xts_m(:,13) = x13_ts(:,3);
xts_m(:,14) = x14_ts(:,4);
xts_m(:,15) = x15_ts(:,4);
xts_m(:,16) = x16_ts(:,4);
xts_m(:,17) = x17_ts(:,4);
xts_m(:,18) = x18_ts(:,4);
xts_m(:,19) = x19_ts(:,4);
xts_m(:,20) = x20_ts(:,4);
xts_m(:,21) = x21_ts(:,4);
xts_m(:,22) = x22_ts(:,3);

%Mark down Errors for each model
err = repmat(ytr_m,1,size(xtr_m,2)) - xtr_m;
err_ind_tr = sqrt(mean(err.*err));
fprintf('The individual training model errors are');
err_ind_tr

err = repmat(yts_m,1,size(xts_m,2)) - xts_m;
err_ind_ts = sqrt(mean(err.*err));
fprintf('The individual testing model errors are');
err_ind_ts


for i=1:size(xtr_m,2)
	err_ind_sp_tr(:,i) = ytr_m - xtr_m(:,i);
end

err_ind_sp_tr = abs(err_ind_sp_tr);


for i=1:size(xts_m,2)
	err_ind_sp_ts(:,i) = yts_m - xts_m(:,i);
end

err_ind_sp_ts = abs(err_ind_sp_ts);

R_mat_min_tr=zeros(size(err_ind_sp_tr));
for i=1:size(err_ind_sp_tr,1)
	[M,I] = min(err_ind_sp_tr(i,:));
	R_mat_min_tr(i,I) = 1;
end

R_mat_min_ts=zeros(size(err_ind_sp_ts));
for i=1:size(err_ind_sp_ts,1)
	[M,I] = min(err_ind_sp_ts(i,:));
	R_mat_min_ts(i,I) = 1;
end

%Read Gender File
fid = fopen('gender.csv', 'r');
tline = fgetl(fid);
%  Split header
A(1,:) = regexp(tline, '\,', 'split');
%  Parse and read rest of file
ctr = 1;
while(~feof(fid))
if ischar(tline)    
      ctr = ctr + 1;
      tline = fgetl(fid);         
      A(ctr,:) = regexp(tline, '\,', 'split'); 
else
      break;     
end
end
fclose(fid);

%Parse the matrix
for i = 2:size(A,1)
	G(i-1,1) = i-1;
	if strcmp(A(i,2), 'F')
		G(i-1,2) = 10;
    elseif strcmp(A(i,2), 'M')
		G(i-1,2) = 20;
	else
		G(i-1,2) = 30;
	end
end

%Find genders for training
for i=1:size(x1_tr,1)
	gender_tr(i,1) = G(x1_tr(i,1)+1, 2);
end
for i=1:size(x1_ts,1)
	gender_ts(i,1) = G(x1_ts(i,1)+1, 2);
end

%Training matrix with gender
Xtr(:,1:2) = x1_tr(:,1:2);
Xtr(:, 3) = gender_tr;
Xtr(:,4:3+size(xtr_m,2)) = xtr_m;

%Training matrix with gender
Xts(:,1:2) = x1_ts(:,1:2);
Xts(:, 3) = gender_ts;
Xts(:,4:3+size(xts_m,2)) = xts_m;

%% Least Square Blending
xtr_m_ls = [ones(size(xtr_m,1),1) xtr_m];
B_ls = inv(xtr_m_ls'*xtr_m_ls)*xtr_m_ls'*ytr_m;
blend_ls_tr = xtr_m_ls*B_ls;
err_ls_tr = xtr_m_ls*B_ls-ytr_m;
fprintf('LS training error');
sqrt(mean(err_ls_tr.*err_ls_tr))

xts_m_ls = [ones(size(xts_m,1),1) xts_m];
blend_ls_ts = xts_m_ls*B_ls;
err_ls_ts = xts_m_ls*B_ls-yts_m;
fprintf('LS testing error');
sqrt(mean(err_ls_ts.*err_ls_ts))


%% Our Tried Blending Method 1 - TreeBagger to find the min col
% Train All
for i=1:size(R_mat_min_tr,2)
	R = R_mat_min_tr(:,i)==1;
	Ytr = R;

	R = R_mat_min_ts(:,i)==1;
	Yts = R;

	tree = TreeBagger(9,Xtr,Ytr);

	tmp_label = predict(tree,Xts);
	tmp_label = cell2mat(tmp_label);
	tmp_label = str2num(tmp_label);
	label(1:size(Yts,1),i) = tmp_label;
end

for i=1:size(R_mat_min_tr,2)
	err_class(i) = sum(label(:,i)==R_mat_min_ts(:,i))/size(label(:,i),1);
end


% Extract the row with 1 only
fil_1_line = sum(label,2)==1;
label_1 = label;
for i=1:size(fil_1_line,1)
	if fil_1_line(i) == 0
		label_1(i,:) = zeros(1,size(label,2));	
	end
end
new_pred = label_1.*xts_m;
new_pred = sum(new_pred,2);

for j=1:size(label,2)
	new_pred_1 = new_pred;
	for i=1:size(new_pred,1)
		if(new_pred_1(i)==0)
			new_pred_1(i) = xts_m(i,j);
		end
	end
	err_p = new_pred_1 - yts_m;
	rmse_oneplusmin(j) = sqrt(mean(err_p.*err_p));
end

% Obtain our Class Min result
j=2;
new_pred_1 = new_pred;
for i=1:size(new_pred,1)
	if(new_pred_1(i)==0)
		new_pred_1(i) = xts_m(i,j);
	end
end
pred_classMin = new_pred_1;
    
%% Our Tried Blending Method 2 - KNN with adjustment
K = 24;
[IDX,D] = knnsearch(xtr_m, xts_m, 'K', K);

for i=1:size(xtr_m,2)
	err_ind_sp_tr_pn(:,i) = ytr_m - xtr_m(:,i);
end
R_tr_pos = err_ind_sp_tr_pn>0;
R_tr_pos = R_tr_pos.*R_mat_min_tr;
R_tr_pos = sum(R_tr_pos,2);

R_tr_neg = err_ind_sp_tr_pn<0;
R_tr_neg = R_tr_neg.*R_mat_min_tr;
R_tr_neg = sum(R_tr_neg,2);

min_err_pred_tr = R_mat_min_tr.*xtr_m;
min_err_pred_tr = sum(min_err_pred_tr,2);


i=45
	adj = 0.01*i;
	R_adj = (R_tr_pos-R_tr_neg)*adj;
	pred_knn_m_adj = min_err_pred_tr(IDX)+R_adj(IDX);
	pred_knn_adj = mean(pred_knn_m_adj,2);



%% LSBoosting ensemble regression
Ensemble5 = fitensemble(xtr_m,ytr_m,'LSBoost', 500, 'Tree');%500
blend_lsb_tr5 = predict(Ensemble5,xtr_m);
err = blend_lsb_tr5-ytr_m;
fprintf('LSB training error');
sqrt(mean(err.*err))

blend_lsb_ts5 = predict(Ensemble5,xts_m);
err = blend_lsb_ts5-yts_m;
fprintf('LSB testing error');
sqrt(mean(err.*err))

%% Bagging ensemble regression
t = templateEnsemble('Bag',100,'tree');
Ensemble = fitensemble(xtr_m,ytr_m,'Bag',100,'Tree','type','regression');%500
blend_bag_tr = predict(Ensemble,xtr_m);
err = blend_bag_tr-ytr_m;
fprintf('LSB training error');
sqrt(mean(err.*err))

blend_bag_ts = predict(Ensemble,xts_m);
err = blend_bag_ts-yts_m;
fprintf('LSB testing error');
sqrt(mean(err.*err))


%% Final LS Blending
row1 = round(size(blend_ls_ts,1)*0.8);
sz = size(blend_ls_ts,1);

xts_comb = [ones(size(blend_ls_ts(1:row1,:),1),1) blend_ls_ts(1:row1,:) blend_lsb_ts5(1:row1,:) blend_bag_ts(1:row1,:) pred_knn_adj(1:row1,:) ];
B_blend_ls_final = inv(xts_comb'*xts_comb)*xts_comb'*yts_m(1:row1,:);
pred_blend_ts = xts_comb*B_blend_ls_final;
err_ls_ts = pred_blend_ts - yts_m(1:row1,:);
fprintf('Blend testing error');
sqrt(mean(err_ls_ts.*err_ls_ts))

xts_comb = [ones(size(blend_ls_ts(row1:sz,:),1),1) blend_ls_ts(row1:sz,:) blend_lsb_ts5(row1:sz,:) blend_bag_ts(row1:sz,:) pred_knn_adj(row1:sz,:) ];
pred_blend_ts = xts_comb*B_blend_ls_final;
err_ls_ts = pred_blend_ts - yts_m(row1:sz,:);
fprintf('Blend testing error');
sqrt(mean(err_ls_ts.*err_ls_ts))
