function [ User_Bias_mat, Item_Bias_mat ] = Generate_Bias_Matrix( h,w,Eval_mat, Eval_Mask_mat)
%GENERATE_BIAS_MATRIX Summary of this function goes here
%   Detailed explanation goes here

lambda1 = 0.8;
lambda2 = 0.8;
Eval_avg_val = Generate_Matrix_Average(h,w, Eval_mat, Eval_Mask_mat);

User_avg_mat = Generate_User_Average( h,w,Eval_mat, Eval_Mask_mat);
Item_avg_mat = Generate_Item_Average( h,w,Eval_mat, Eval_Mask_mat);

User_Bias_mat = User_avg_mat - Eval_avg_val;
Item_Bias_mat = Item_avg_mat - Eval_avg_val;


User_Bias_mat = User_Bias_mat * lambda1;
Item_Bias_mat = Item_Bias_mat * lambda2;

end

