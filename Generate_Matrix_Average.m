

function Avg = Generate_Matrix_Average( h,w, Matrix, Matrix_Mask )
Sum=0;
Num=0;
for i= 1:h
for j= 1:w
	if(Matrix_Mask(i,j))
	Sum=Sum+Matrix(i,j);
    Num=Num+1;
	end
end
end
Avg = Sum/Num;
end

