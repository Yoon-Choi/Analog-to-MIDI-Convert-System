function index = SelectingSort( num,index )
%Selectig sort by matlab
%   자세한 설명 위치

 for ii = num : -1 : 1
    currentMax = index(1,1);
    currentMaxIndex = 1;  
        for jj = 1: ii
       
            if (currentMax<index(1,jj))
                currentMax = index(1,jj);
                currentMaxIndex = jj;
            end
       
         end
   
   if currentMaxIndex ~= ii
    temp = index(:,currentMaxIndex);
    
    index(:,currentMaxIndex)=index(:,ii);
    index(:,ii)= temp;
   end
end

end


