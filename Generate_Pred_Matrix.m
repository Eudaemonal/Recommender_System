function Pred_mat = Generate_Pred_Matrix( h,w, Est_mat, Eval_avg_val, User_Bias_mat, Item_Bias_mat )

Pred_mat=zeros(h,w);
for i= 1:h
for j=1:w
Pred_mat(i,j)=Est_mat(i,j)+Eval_avg_val+User_Bias_mat(i,1)+Item_Bias_mat(1,j);
end
end

end

