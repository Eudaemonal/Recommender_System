function User_avg_mat = Generate_User_Average( h,w,Eval_mat, Eval_Mask_mat)

Eval_avg_val = Generate_Matrix_Average(h,w, Eval_mat, Eval_Mask_mat);
User_avg_mat = zeros(h,1);
for i = 1:h
Sum = 0;
Num = 0;
for j = 1:w
    if(Eval_Mask_mat(i,j))
    Sum = Sum + Eval_mat(i,j);
    Num = Num + 1;
    end
end
if(Num>=2)
User_avg_mat(i,1) = Sum/Num;
else
User_avg_mat(i,1) = Eval_avg_val;
end
end

end

