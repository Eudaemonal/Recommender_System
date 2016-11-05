

function RMS_Error = Generate_RMSE(h,w , Prediction_matrix, Test_matrix, Mask_Test_matrix)

Prediction_Error=0;
Prediction_Num=0;
for i= 1:h
for j=1:w
	if(Mask_Test_matrix(i,j))
	Prediction_Error=Prediction_Error+(Prediction_matrix(i,j)-Test_matrix(i,j))^2;
    Prediction_Num=Prediction_Num+1;
	end
end
end
RMS_Error=sqrt(Prediction_Error/Prediction_Num);


end