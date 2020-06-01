for i = 2 : length(ff_high)
   j=0; 
   
   if (ff_high(i)-error_index_high>=1)&&(ff_high(i)+error_index_high<=size(s6_high,1))
    while sum(s7_high(ff_high(i)-error_index_high:ff_high(i)+error_index_high,tt_high(i)-j)~=zeros(error_index_high*2+1,1))~=0;
        if tt_high(i)-j>=2
        j=j+1;
        else
         break;
        end
    end
        re_high(3,i-1)=t_high(1,tt_high(i)-j);
    
   elseif (ff_high(i)-error_index_high<1)&&(ff_high(i)+error_index_high<=size(s6_high,1))
       
        while sum(s7_high(1:ff_high(i)+error_index_high,tt_high(i)-j)~=zeros(length(1:ff_high(i)+error_index_high),1))~=0;
            if tt_high(i)-j>=2
                j=j+1;
                
            else 
                break;
            end
        end
        re_high(3,i-1)=t_high(1,tt_high(i)-j);
       
       
   elseif (ff_high(i)-error_index_high>=1)&&(ff_high(i)+error_index_high>size(s6_high,1))
       
        while sum(s7_high(ff_high(i)-error_index_high:size(s6_high,1),tt_high(i)-j)~=zeros(length(ff_high(i)-error_index_high:size(s6_high,1)),1))~=0;
            if tt_high(i)-j>=2
                j=j+1;
                
            else
                break;
            end
        end
      re_high(3,i-1)=t_high(1,tt_high(i)-j);
           
   elseif (ff_high(i)-error_index_high<1)&&(ff_high(i)+error_index_high>size(s6_high,1))
       
         while sum(s7_high(1:size(s6_high,1),tt_high(i)-j)~=zeros(size(s6_high,1),1))~=0;
            if tt_high(i)-j>=2
               j=j+1;
               
            else
                break;
            end
          end
        re_high(3,i-1)=t_high(1,tt_high(i)-j);
    
           
   end
end

 
for  i = 2 : length(ff_high)
    j = 0;
    
   if (ff_high(i)-error_index_high>=1)&&(ff_high(i)+error_index_high<=size(s6_high,1))
    while sum(s7_high(ff_high(i)-error_index_high:ff_high(i)+error_index_high,tt_high(i)+j)~=zeros(error_index_high*2+1,1))~=0;
        if tt_high(i)+j<size(s6_high,2)
          j=j+1;
          
        else
            break;
        end
    end
   re_high(4,i-1)=t_high(1,tt_high(i)+j);
   
   elseif (ff_high(i)-error_index_high<1)&&(ff_high(i)+error_index_high<=size(s6_high,1))
    while sum(s7_high(1:ff_high(i)+error_index_high,tt_high(i)+j)~=zeros(error_index_high*2+1,1))~=0;
        if tt_high(i)+j<size(s6_high,2)
          j=j+1;
        else
            break;
        end
    end
   re_high(4,i-1)=t_high(1,tt_high(i)+j);
       
       
   elseif (ff_high(i)-error_index_high>=1)&&(ff_high(i)+error_index_high>size(s6_high,1))
    while sum(s7_high(ff_high(i)-error_index_high:size(s6_high,1),tt_high(i)+j)~=zeros(length(ff_high(i)-error_index_high:size(s6_high,1)),1))~=0;
        if tt_high(i)+j<size(s6_high,2)
          j=j+1;
        else
            break;
        end
    end
   re_high(4,i-1)=t_high(1,tt_high(i)+j);
       
   elseif (ff_high(i)-error_index_high<1)&&(ff_high(i)+error_index_high>size(s6_high,1))
    while sum(s7_high(1:size(s6_high,1),tt_high(i)+j)~=zeros(error_index_high*2+1,1))~=0;
        if tt_high(i)+j<size(s6_high,2)
          j=j+1;
        else
            break;
        end
    end
   re_high(4,i-1)=t_high(1,tt_high(i)+j);
   
       
   end
   
end 
