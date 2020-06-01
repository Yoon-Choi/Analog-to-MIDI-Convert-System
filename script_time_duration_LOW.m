for i = 2 : length(ff_low)
   j=0; 
   
   if (ff_low(i)-error_index_low>=1)&&(ff_low(i)+error_index_low<=size(s6_low,1))
    while sum(s7_low(ff_low(i)-error_index_low:ff_low(i)+error_index_low,tt_low(i)-j)~=zeros(error_index_low*2+1,1))~=0;
        if tt_low(i)-j>=2
        j=j+1;
        else
         break;
        end
    end
        re_low(3,i-1)=t_low(1,tt_low(i)-j);
    
   elseif (ff_low(i)-error_index_low<1)&&(ff_low(i)+error_index_low<=size(s6_low,1))
       
        while sum(s7_low(1:ff_low(i)+error_index_low,tt_low(i)-j)~=zeros(length(1:ff_low(i)+error_index_low),1))~=0;
            if tt_low(i)-j>=2
                j=j+1;
                
            else 
                break;
            end
        end
        re_low(3,i-1)=t_low(1,tt_low(i)-j);
       
       
   elseif (ff_low(i)-error_index_low>=1)&&(ff_low(i)+error_index_low>size(s6_low,1))
       
        while sum(s7_low(ff_low(i)-error_index_low:size(s6_low,1),tt_low(i)-j)~=zeros(length(ff_low(i)-error_index_low:size(s6_low),1)))~=0;
            if tt_low(i)-j>=2
                j=j+1;
                
            else
                break;
            end
        end
      re_low(3,i-1)=t_low(1,tt_low(i)-j);
           
   elseif (ff_low(i)-error_index_low<1)&&(ff_low(i)+error_index_low>size(s6_low,1))
       
         while sum(s7_low(1:size(s6_low,1),tt_low(i)-j)~=zeros(size(s6_low,1),1))~=0;
            if tt_low(i)-j>=2
               j=j+1;
               
            else
                break;
            end
          end
        re_low(3,i-1)=t_low(1,tt_low(i)-j);
    
           
   end
end

 
for  i = 2 : length(ff_low)
    j = 0;
    
   if (ff_low(i)-error_index_low>=1)&&(ff_low(i)+error_index_low<=size(s6_low,1))
    while sum(s7_low(ff_low(i)-error_index_low:ff_low(i)+error_index_low,tt_low(i)+j)~=zeros(error_index_low*2+1,1))~=0;
        if tt_low(i)+j<size(s6_low,2)
          j=j+1;
          
        else
            break;
        end
    end
   re_low(4,i-1)=t_low(1,tt_low(i)+j);
   
   elseif (ff_low(i)-error_index_low<1)&&(ff_low(i)+error_index_low<=size(s6_low,1))
    while sum(s7_low(1:ff_low(i)+error_index_low,tt_low(i)+j)~=zeros(ff_low(i)+error_index_low,1))~=0;
        if tt_low(i)+j<size(s6_low,2)
          j=j+1;
        else
            break;
        end
    end
   re_low(4,i-1)=t_low(1,tt_low(i)+j);
       
       
   elseif (ff_low(i)-error_index_low>=1)&&(ff_low(i)+error_index_low>size(s6_low,1))
    while sum(s7_low(ff_low(i)-error_index_low:size(s6_low,1),tt_low(i)+j)~=zeros(length(ff_low(i)-error_index_low:size(s6_low,1)),1))~=0;
        if tt_low(i)+j<size(s6_low,2)
          j=j+1;
        else
            break;
        end
    end
   re_low(4,i-1)=t_low(1,tt_low(i)+j);
       
   elseif (ff_low(i)-error_index_low<1)&&(ff_low(i)+error_index_low>size(s6_low,1))
    while sum(s7_low(1:size(s6_low,1),tt_low(i)+j)~=zeros(size(s6_low,1),1))~=0;
        if tt_low(i)+j<size(s6_low,2)
          j=j+1;
        else
            break;
        end
    end
   re_low(4,i-1)=t_low(1,tt_low(i)+j);
   
       
   end
   
end 
