function [father,mather]= selectparent(genoms,fitness)
    %排序选择，选出最大的两个父母，选出要变异的父母
    [ma,a]=max(fitness(:,2));
    tempfit = fitness;
    tempfit(a,:)=[0,0,0];
    [ma2,b]=max(tempfit(:,2));
    %fprintf('a=%d,b=%d\n',a,b);
    father = genoms(a,:);
    mather = genoms(b,:);
end