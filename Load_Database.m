

function [Eval_matrix, Mask_Eval_matrix, Test_matrix, Mask_Test_matrix] = Load_Database(h,w, Base_set_path, Test_set_path)


s1 = tdfread(Base_set_path);
s2 = tdfread(Test_set_path);

c1=struct2cell(s1);
c2=struct2cell(s2);



% Generate original matrix
Eval_matrix=zeros(h,w); 
Mask_Eval_matrix=zeros(h,w);

for i=1:length(s1.x1)
    Eval_matrix(c1{1}(i),c1{2}(i))=c1{3}(i);
    Mask_Eval_matrix(c1{1}(i),c1{2}(i))=c1{3}(i)/c1{3}(i);
end


% Generate test matrix
Test_matrix=zeros(h,w);
Mask_Test_matrix=zeros(h,w);

for i=1:length(s2.x1)
    Test_matrix(c2{1}(i),c2{2}(i))=c2{3}(i);
    Mask_Test_matrix(c2{1}(i),c2{2}(i))=c2{3}(i)/c2{3}(i);
end



end