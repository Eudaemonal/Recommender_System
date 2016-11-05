function Est_mat_val = Generate_Est_Matrix( h,i,j,Est_mat, User_Rel_mat, Max_User_Rel_mat)

% Adaptive beta value according to iteration


% Static Threshold Method
% 0.05      0.9653
% 0.06      0.9651
% 0.07      0.9649
% 0.08      0.9647
% 0.09      0.9645
% 0.10      0.9644
% 0.11      0.9640
% 0.12      0.9637
% 0.13      0.9635
% 0.14      0.9631
% 0.15      0.9628
% 0.16      0.9622
% 0.17      0.9617
% 0.18      0.9613
% 0.19      0.9608
% 0.20      0.9603
% 0.22      0.9596
% 0.23      0.9594
% 0.24      0.9598
% 0.25      0.9604
% 0.26      0.9607
% 0.27      0.9610
% 0.28      0.9615
% 0.29      0.9627
% 0.30      0.9630


beta=0.707;
% Dynamic Threshold Method
% 0.600     0.9577
% 0.707     0.9550
% 0.800     0.9566

% Weighed avg using Ru_matrix
sum_weighted_mark=0;
sum_relation=0;
for k=1:h
    if(k~=i && User_Rel_mat(i,k)>Max_User_Rel_mat(1,i)*beta)
    % Calculate Weighed
    weight=User_Rel_mat(i,k);
    
	sum_weighted_mark=sum_weighted_mark + Est_mat(k,j)*weight;
    sum_relation=sum_relation+abs(User_Rel_mat(i,k));
    end
end

if(sum_relation~=0)
Est_mat_val = sum_weighted_mark/sum_relation;
else
Est_mat_val = Est_mat(i,j);
end


end

