function Norm_mat = Generate_Norm_Matrix(h,w,Eval_mat, Eval_Mask_mat, User_Bias_mat, Item_Bias_mat)

Norm_mat = zeros(h,w);
Eval_avg_val = Generate_Matrix_Average(h,w, Eval_mat, Eval_Mask_mat);

for i = 1:h
for j = 1:w
if(Eval_Mask_mat(i,j))
Norm_mat(i,j) = Eval_mat(i,j) - Eval_avg_val - User_Bias_mat(i,1) - Item_Bias_mat(1,j);
end
end

end