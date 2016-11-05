function Item_Rel_mat = Generate_Item_Relation( h,w, Eval_mat )
% Generate item relationship
% item i and item j (Col i and Col j in E_matrix)
% k = 1 
%     |
%     |
%     |
%     v
%     h

Item_Rel_mat = zeros(w,w);
for i=1:w
for j=1:w
cor_match_item=0;
self_match_item_i=0;
self_match_item_j=0;
for k=1:h
	cor_match_item=cor_match_item+Eval_mat(k,i)*Eval_mat(k,j);
    self_match_item_i=self_match_item_i+Eval_mat(k,i)*Eval_mat(k,i);
    self_match_item_j=self_match_item_j+Eval_mat(k,j)*Eval_mat(k,j);
end
normalizer=sqrt(self_match_item_i)*sqrt(self_match_item_j);
if(normalizer~=0)
Item_Rel_mat(i,j)=cor_match_item/(sqrt(self_match_item_i)*sqrt(self_match_item_j));
else
Item_Rel_mat(i,j)=0;
end
sprintf('Ri(%4d,%4d) = %4d',i,j, Item_Rel_mat(i,j))
end
end

end

