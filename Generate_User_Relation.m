function User_Rel_mat = Generate_User_Relation( h,w, Eval_mat)
% Generate voter relationship
% Voter i and voter j (Row i and Row j in E_matrix)
% k = 1 ------------> w
User_Rel_mat = zeros(h,h);
for i=1:h
for j=1:h
cor_match_voter=0;
self_match_voter_i=0;
self_match_voter_j=0;
for k=1:w
	cor_match_voter=cor_match_voter+Eval_mat(i,k)*Eval_mat(j,k);
    self_match_voter_i=self_match_voter_i+Eval_mat(i,k)*Eval_mat(i,k);
    self_match_voter_j=self_match_voter_j+Eval_mat(j,k)*Eval_mat(j,k);
end
normalizer = (sqrt(self_match_voter_i)*sqrt(self_match_voter_j));
if(normalizer~=0)
User_Rel_mat(i,j)=cor_match_voter/normalizer;
else
User_Rel_mat(i,j)=0;
end
sprintf('Ru(%4d,%4d) = %4d',i,j, User_Rel_mat(i,j))
end
end


end

