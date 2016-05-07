%% Codes for the final blending
%Please run the train_for_Blend.m first
%Author: Bochuan Du

%% inputs and some initializations
in_als = dlmread('ALS_all.txt');
in_pmf = dlmread('PMF_all.txt');
in_bmf = dlmread('BMF_all.txt');
in_iknn = dlmread('IKNN_all.txt');
in_uknn = dlmread('UKNN_all.txt');
in_rmf = dlmread('RMF_all.txt');
in_svdpp = dlmread('SVDpp_all.txt');
in_svd = dlmread('SVD_all.txt');
in_bpmf = dlmread('BPMF_all.txt');
in_gplsa = dlmread('GPLSA_all.txt');
in_rfrec = dlmread('RfRec_all.txt');
in_urp = dlmread('URP_all.txt');
in_pmf_1 = dlmread('PMF_1_all.txt');
in_uknn_1 = dlmread('UKNN_1_all.txt');
in_iknn_1 = dlmread('IKNN_1_all.txt');
in_bmf_1 = dlmread('BMF_1_all.txt');
in_ldcc = dlmread('LDCC_all.txt');
in_rmf_1 = dlmread('RMF_1_all.txt');
in_ldcc_1 = dlmread('LDCC_1_all.txt');
in_ldcc_2 = dlmread('LDCC_2_all.txt');
in_svdpp_1 = dlmread('SVDpp_1_all.txt');
in_rmb = dlmread('RBM_all.txt');

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

tr_stop_row = size(in_als,1)*1;
x1_trA = in_als(1:tr_stop_row,:);
x2_trA = in_pmf(1:tr_stop_row,:);
x3_trA = in_bmf(1:tr_stop_row,:);
x4_trA = in_iknn(1:tr_stop_row,:);
x5_trA = in_uknn(1:tr_stop_row,:);
x6_trA = in_rmf(1:tr_stop_row,:);
x7_trA = in_svdpp(1:tr_stop_row,:);
x8_trA = in_svd(1:tr_stop_row,:);
x9_trA = in_bpmf(1:tr_stop_row,:);
x10_trA = in_gplsa(1:tr_stop_row,:);
x11_trA = in_rfrec(1:tr_stop_row,:);
x12_trA = in_urp(1:tr_stop_row,:);
x13_trA = in_pmf_1(1:tr_stop_row,:);
x14_trA = in_uknn_1(1:tr_stop_row,:);
x15_trA = in_iknn_1(1:tr_stop_row,:);
x16_trA = in_bmf_1(1:tr_stop_row,:);
x17_trA = in_ldcc(1:tr_stop_row,:);
x18_trA = in_rmf_1(1:tr_stop_row,:);
x19_trA = in_ldcc_1(1:tr_stop_row,:);
x20_trA = in_ldcc_2(1:tr_stop_row,:);
x21_trA = in_svdpp_1(1:tr_stop_row,:);
x22_trA = in_rmb(1:tr_stop_row,:);

xtr_mA(:,1) = x1_trA(:,3);
xtr_mA(:,2) = x2_trA(:,3);
xtr_mA(:,3) = x3_trA(:,4);
xtr_mA(:,4) = x4_trA(:,4);
xtr_mA(:,5) = x5_trA(:,4);
xtr_mA(:,6) = x6_trA(:,4);
xtr_mA(:,7) = x7_trA(:,4);
xtr_mA(:,8) = x8_trA(:,3);
xtr_mA(:,9) = x9_trA(:,4);
xtr_mA(:,10) = x10_trA(:,4);
xtr_mA(:,11) = x11_trA(:,4);
xtr_mA(:,12) = x12_trA(:,4);
xtr_mA(:,13) = x13_trA(:,3);
xtr_mA(:,14) = x14_trA(:,4);
xtr_mA(:,15) = x15_trA(:,4);
xtr_mA(:,16) = x16_trA(:,4);
xtr_mA(:,17) = x17_trA(:,4);
xtr_mA(:,18) = x18_trA(:,4);
xtr_mA(:,19) = x19_trA(:,4);
xtr_mA(:,20) = x20_trA(:,4);
xtr_mA(:,21) = x21_trA(:,4);
xtr_mA(:,22) = x22_trA(:,3);


%% LS Blend
Xls = [ones(size(xtr_mA,1),1) xtr_mA];
pred_res_ls = Xls*B_ls;
%dlmwrite('finalLSBlending.csv', pred_res_ls);

%% LSB Blend
blend_lsb_ts5 = predict(Ensemble5,xtr_mA);
%dlmwrite('finalLSBoosting.csv', blend_lsb_ts5);

%% Our tired Method: KNN adj
K = 24;
[IDX,D] = knnsearch(xtr_m, xts_m, 'K', K);

min_err_pred_tr = R_mat_min_tr.*xtr_m;
min_err_pred_tr = sum(min_err_pred_tr,2);

for i=1:size(xtr_m,2)
	err_ind_sp_tr_pn(:,i) = ytr_m - xtr_m(:,i);
end
R_tr_pos = err_ind_sp_tr_pn>0;
R_tr_pos = R_tr_pos.*R_mat_min_tr;
R_tr_pos = sum(R_tr_pos,2);

R_tr_neg = err_ind_sp_tr_pn<0;
R_tr_neg = R_tr_neg.*R_mat_min_tr;
R_tr_neg = sum(R_tr_neg,2);

adj = 0.45;
R_adj = (R_tr_pos-R_tr_neg)*adj;

pred_knn_m_adj = min_err_pred_tr(IDX)+R_adj(IDX);
pred_knn_adj = mean(pred_knn_m_adj,2);

%% Bagging Blend
blend_bag_ts = predict(Ensemble_B,xtr_mA);
%dlmwrite('finalBag.csv', blend_bag_ts);

%% final Blend
xts_comb = [ones(size(pred_res_ls,1),1) pred_res_ls blend_lsb_ts5 blend_bag_ts pred_knn_adj];
pred_res = xts_comb*B_blend_ls_final;

%% Clipping
R10 = pred_res > 10;
R1 = pred_res < 1;
pred_res(R10,1) = 10;
pred_res(R1,1) = 1;

%% Write out final prediction
dlmwrite('finalPred16.csv', pred_res);
