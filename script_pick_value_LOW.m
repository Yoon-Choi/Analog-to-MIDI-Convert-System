%% peak�� �������� ��ǥ���� ����. - ������



for i = 2 : size(s4_low,2)
    
    diff=s4_low(:,i)-s4_low(:,i-1);
    diff = (diff<0);  %������ ���� ���ʰ��� ���� ������ 1
    
    
    
    if sum(diff)>0;     %���Ⱑ (-)�� ���� �ִ�
        
%         if negative == 0;   %�ö󰡴ٰ� ó������ (-)
      
                temp= find(diff~=0); 
                temp_sub = zeros(length(temp)-1,1);
                    for j = 1:length(temp)-1
                        temp_sub(j) = temp(j+1)-temp(j);                   
                    end
                
                temp_sub=(temp_sub>error_index_low);
                nn=sum(temp_sub)+1;     %error range ���� �� �츣�갡 �ָ� ������������ �ٸ������� �ν�
                
                point = find(temp_sub==1);
                    if isempty(point)==0
                        
                        point=[point;length(temp)];
                        
                         ff_low = [ff_low,round(mean(temp(1:point(1))))];
            
                        for k = 1: length(point)-1
                        
                        ff_low = [ff_low,round(mean(temp(point(k)+1:point(k+1))))];
                        
                        end
                     
                    else
                         
                       ff_low = [ff_low,round(mean(temp))]; 
                       
                    end
                
                
                tt_low = [tt_low,ones(1,nn).*i-1];          
                
%                 negative = 1;


%         else    %���Ⱑ(-)�� ���� ������, �̹� peak�� ���� ->�ڿ� �ִ� ����(-)�� �� ��� ���� ����            
%         end
        
%     else                   %��� freq.���� ���Ⱑ ����̰ų� �����Ѱ��
%         if negative == 1   %���Ⱑ �������ٰ� �ٲ� 
%             negative = 0;
    end
        
end