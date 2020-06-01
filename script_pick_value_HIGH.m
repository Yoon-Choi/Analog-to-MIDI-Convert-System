%% peak를 기준으로 대표값을 고른다. - 낮은음




for i = 2 : size(s4_high,2)
    
    diff=s4_high(:,i)-s4_high(:,i-1);
    diff = (diff<0);  %오른쪽 값이 왼쪽값에 비해 작을때 1
    
    
    
    if sum(diff)>0;     %기울기가 (-)인 값이 있다
        
%         if negative == 0;   %올라가다가 처음으로 (-)
      
                temp= find(diff~=0); 
                temp_sub = zeros(length(temp)-1,1);
                    for j = 1:length(temp)-1
                        temp_sub(j) = temp(j+1)-temp(j);                   
                    end
                
                temp_sub=(temp_sub>error_index_high);
                nn=sum(temp_sub)+1;     %error range 보다 더 헤르쯔가 멀리 떨어져있을시 다른음으로 인식
                
                point = find(temp_sub==1);
                    if isempty(point)==0
                        
                        point=[point;length(temp)];
                        
                         ff_high = [ff_high,round(mean(temp(1:point(1))))];
            
                        for k = 1: length(point)-1
                        
                        ff_high = [ff_high,round(mean(temp(point(k)+1:point(k+1))))];
                        
                        end
                     
                    else
                         
                       ff_high = [ff_high,round(mean(temp))]; 
                       
                    end
                
                
                tt_high = [tt_high,ones(1,nn).*i-1];          
                
%                 negative = 1;


%         else    %기울기가(-)인 값이 있지만, 이미 peak를 잡음 ->뒤에 있는 기울기(-)인 값 모두 으로 만듬            
%         end
        
%     else                   %모든 freq.에서 기울기가 양수이거나 일정한경우
%         if negative == 1   %기울기가 음수였다가 바뀜 
%             negative = 0;
    end
        
end