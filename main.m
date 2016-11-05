
%
%==========================================================================
% Recommendation system
% 1. Measure close related voters, beta=0.07
% 2. Dynamic threshold
% 
% 
%
%        org       mod1      modi2
%        RMSE      RMSE      RMSE
% test1: 9688      9594      9550
% test2: 9590      9512      9450
% test3: 9530      9469      9419
% test4: 9508      9435      9377
% test5: 9529      9446      9399
%   avg: 9569      9491      9439
%


% 0. Initialize data
%==========================================================================
h=943;
w=1682;

Path_Base = 'ml-100k\u1.base';
Path_Test = 'ml-100k\u1.test';

[Eval_mat,Eval_Mask_mat,Test_mat,Test_Mask_mat]=Load_Database(h,w,Path_Base,Path_Test);

% 1. Normalization
%==========================================================================

Eval_avg_val = Generate_Matrix_Average(h,w, Eval_mat, Eval_Mask_mat);

[ User_Bias_mat, Item_Bias_mat ]= Generate_Bias_Matrix( h,w,Eval_mat, Eval_Mask_mat);

Norm_mat = Generate_Norm_Matrix(h,w,Eval_mat, Eval_Mask_mat, User_Bias_mat, Item_Bias_mat);



% Pred_mat = Generate_Pred_Matrix(h,w, Norm_mat, Eval_avg_val, User_Bias_mat, Item_Bias_mat);
% Generate_RMSE(h,w, Pred_mat, Test_mat, Test_Mask_mat);

% Error: 0.9688
%
% 2. Relationship
%==========================================================================

User_Rel_mat = Generate_User_Relation( h,w, Eval_mat);

% Error: 0.9491


%}
% 3. Trustworthiness
%==========================================================================

User_trust_mat = Generate_User_Trust( h,w,Eval_Mask_mat );



% 4. Maximum user relation
%==========================================================================
Max_User_Rel_mat=zeros(1,h);
for j=1:h
Max_User_Rel_mat(1,j) = Max_User_Rel(h, j, User_Rel_mat );
end
%
% 4. Iteration
%==========================================================================
Est_mat = Norm_mat;
Est_mat_prev = Est_mat;
RMS_Error = 0;
Iter_Error = 0;

RMSE_log=zeros(1,1024);
for iteration = 1:1024

for i=1:h
for j=1:w
    % Calculate value of each p
    if(Eval_Mask_mat(i,j)==0)
    Est_mat(i,j) = Generate_Est_Matrix(h,i,j, Est_mat_prev, User_Rel_mat, Max_User_Rel_mat);
    end
    % end calc p
end
sprintf('%4d - Voter: %4d, Eit: %4d RSME: %4d',iteration,i,Iter_Error,RMS_Error)
end
    
Pred_mat = Generate_Pred_Matrix(h,w, Est_mat, Eval_avg_val, User_Bias_mat, Item_Bias_mat);
RMS_Error = Generate_RMSE(h,w, Pred_mat, Test_mat, Test_Mask_mat);
RMSE_log(iteration) = RMS_Error;
    
Iter_Error=sum(sum(abs(Est_mat_prev-Est_mat)));
Est_mat_prev = Est_mat;
end




%}

