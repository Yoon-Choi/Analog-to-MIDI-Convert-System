for i = 2 : length(ff_median)
   j=0; 
   
   if (ff_median(i)-error_index_median>=1)&&(ff_median(i)+error_index_median<=size(s6_median,1))
    while sum(s7_median(ff_median(i)-error_index_median:ff_median(i)+error_index_median,tt_median(i)-j)~=zeros(error_index_median*2+1,1))~=0;
        if tt_median(i)-j>=2
        j=j+1;
        else
         break;
        end
    end
        re_median(3,i-1)=t_median(1,tt_median(i)-j);
    
   elseif (ff_median(i)-error_index_median<1)&&(ff_median(i)+error_index_median<=size(s6_median,1))
       
        while sum(s7_median(1:ff_median(i)+error_index_median,tt_median(i)-j)~=zeros(length(1:ff_median(i)+error_index_median),1))~=0;
            if tt_median(i)-j>=2
                j=j+1;
                
            else 
                break;
            end
        end
        re_median(3,i-1)=t_median(1,tt_median(i)-j);
       
       
   elseif (ff_median(i)-error_index_median>=1)&&(ff_median(i)+error_index_median>size(s6_median,1))
       
        while sum(s7_median(ff_median(i)-error_index_median:size(s6_median,1),tt_median(i)-j)~=zeros(length(ff_median(i)-error_index_median:size(s6_median),1)))~=0;
            if tt_median(i)-j>=2
                j=j+1;
                
            else
                break;
            end
        end
      re_median(3,i-1)=t_median(1,tt_median(i)-j);
           
   elseif (ff_median(i)-error_index_median<1)&&(ff_median(i)+error_index_median>size(s6_median,1))
       
         while sum(s7_median(1:size(s6_median,1),tt_median(i)-j)~=zeros(size(s6_median,1),1))~=0;
            if tt_median(i)-j>=2
               j=j+1;
               
            else
                break;
            end
          end
        re_median(3,i-1)=t_median(1,tt_median(i)-j);
    
           
   end
end

 
for  i = 2 : length(ff_median)
    j = 0;
    
   if (ff_median(i)-error_index_median>=1)&&(ff_median(i)+error_index_median<=size(s6_median,1))
    while sum(s7_median(ff_median(i)-error_index_median:ff_median(i)+error_index_median,tt_median(i)+j)~=zeros(error_index_median*2+1,1))~=0;
        if tt_median(i)+j<size(s6_median,2)
          j=j+1;
          
        else
            break;
        end
    end
   re_median(4,i-1)=t_median(1,tt_median(i)+j);
   
   elseif (ff_median(i)-error_index_median<1)&&(ff_median(i)+error_index_median<=size(s6_median,1))
    while sum(s7_median(1:ff_median(i)+error_index_median,tt_median(i)+j)~=zeros(ff_median(i)+error_index_median,1))~=0;
        if tt_median(i)+j<size(s6_median,2)
          j=j+1;
        else
            break;
        end
    end
   re_median(4,i-1)=t_median(1,tt_median(i)+j);
       
       
   elseif (ff_median(i)-error_index_median>=1)&&(ff_median(i)+error_index_median>size(s6_median,1))
    while sum(s7_median(ff_median(i)-error_index_median:size(s6_median,1),tt_median(i)+j)~=zeros(length(ff_median(i)-error_index_median:size(s6_median,1)),1))~=0;
        if tt_median(i)+j<size(s6_median,2)
          j=j+1;
        else
            break;
        end
    end
   re_median(4,i-1)=t_median(1,tt_median(i)+j);
       
   elseif (ff_median(i)-error_index_median<1)&&(ff_median(i)+error_index_median>size(s6_median,1))
    while sum(s7_median(1:size(s6_median,1),tt_median(i)+j)~=zeros(size(s6_median,1),1))~=0;
        if tt_median(i)+j<size(s6_median,2)
          j=j+1;
        else
            break;
        end
    end
   re_median(4,i-1)=t_median(1,tt_median(i)+j);
   
       
   end
   
end 
