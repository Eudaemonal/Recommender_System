function Item_avg_mat = Generate_Item_Average( h,w,Eval_mat, Eval_Mask_mat)

Eval_avg_val = Generate_Matrix_Average(h,w, Eval_mat, Eval_Mask_mat);
Item_avg_mat = zeros(1,w);

for j = 1:w
Sum = 0;
Num = 0;
for i = 1:h
    if(Eval_Mask_mat(i,j))
    Sum = Sum + Eval_mat(i,j);
    Num = Num + 1;
    end
end
if(Num>=2)
Item_avg_mat(1,j) = Sum/Num;
else
Item_avg_mat(1,j) = Eval_avg_val;
end

end



end

