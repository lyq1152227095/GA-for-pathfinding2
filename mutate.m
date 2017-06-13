function  genoms = mutate( genoms,pm,M)
c = size(genoms(1,:));
count = 0;
   for i = 1:M
      % fprintf('i = %d,c=%d\n',i,c(2));
       for j=1:c(2)
            p = rand();
            if p<pm
                k = randi([1,8],1,1);
                genoms(i,j) = k;
                count= count+1;
            %    fprintf('count=%d\n',count);
            end
       end
   end 
end

