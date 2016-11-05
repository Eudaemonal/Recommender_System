function User_trust_mat = Generate_User_Trust( h,w,Eval_Mask_mat )

lambda = 0.001;
User_trust_mat=zeros(h,1);
Sum=0;
for i=1:h
for j=1:w
    User_trust_mat(i,1)=User_trust_mat(i,1)+Eval_Mask_mat(i,j);
end
    Sum=Sum+User_trust_mat(i,1);
end
User_trust_mat=User_trust_mat/(Sum/h);

User_trust_mat = 1 + (User_trust_mat)* lambda;

end

