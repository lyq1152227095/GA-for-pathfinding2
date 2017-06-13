function genoms = cross( father,mather,M,pc)
    [m,n]=(size(father));
    for i=1:(M/2)
        child1 = zeros(1,n);
        child2 = zeros(1,n);
        p = rand();
        if p<pc
            j = randi([1,n],1,1);
            child1(1:j) = father(1:j);
            child2(1:j) = mather(1:j);
            child2(j+1:n) = father(j+1:n);
            child1(j+1:n) = mather(j+1:n);
        else
            child1 = father;
            child2 = mather;
        end
        genoms(i,:) =child1;
        genoms(i+M/2,:)=child2;
    end
end

