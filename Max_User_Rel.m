function max = Max_User_Rel(h, j, User_Rel_mat )

max = 0;
for i=1:h
    if(j~=i && User_Rel_mat(i,j)>max)
    max = User_Rel_mat(i,j);
    end
end

end

