div = 0;
positive = 0; %���Ⱑ (+)�� �Ǵ� ó�� ������ ����


for i = 2 : size(s2_low,2)
    
    diff=s2_low(:,i)-s2_low(:,i-1);
    diff = diff>0;
    
    if sum(diff)>0;
        
        if positive == 0;
            if (i-2)>0
                div = [div,i-2];
                positive = 1;
            end
        end
        
    else                   %���Ⱑ �����̰ų� �����Ѱ��
        if positive == 1     %���Ⱑ ������ٰ� �ٲ�
            
            positive = 0;
        end
        
    end
    
    
end



div1 = 0;
negative = 0; %���Ⱑ (-)�� �Ǵ� ó�� ���� ON


for i = 2 : size(s2_low,2)
    
    diff=s2_low(:,i)-s2_low(:,i-1);
    diff = diff<0;
    if sum(diff)>0;      
        if negative == 0;
            negative = 1;
        end
        
    else                   %���Ⱑ �����̰ų� �����Ѱ��
        if negative == 1     %���Ⱑ ������ٰ� �ٲ�          
             if (i-2)>0
                div1 = [div1,i-2];
                negative = 1;
            end
        end
        
    end
     
end
% 
% s7_low = zeros(size(s2_low));
% s8_low = s7_low;
% 
% for m= 2:size(size(s7_low,2))
% 
% s7_low(:,m) = s2_low(:,m)-s2_low(:,m-1);
% 
% end
% 
% for m= 2:size(size(s7_low,2))           %2�� �̺�
% 
% s8_low(:,m-1) = s7_low(:,m)-s7_low(:,m-1);
% 
% end
% 
% s7_low=(s7_low<0);
% s8_low=s8_low.*s7_low;
% s8_low = (s8_low>0);



div = [div,div1];
div=sort(div);
div=unique(div);
s4_low = zeros(size(s2_low));   %����â������ ����ó�� ����

for i = 1: length(div)-1

th2=max(max(s3_low(:,div(i)+1:div(i+1))))*TH2;  %������ â�� ���� ���ΰ�.
s4_low(:,div(i)+1:div(i+1))=(s3_low(:,div(i)+1:div(i+1))>th2).*s3_low(:,div(i)+1:div(i+1));

end

th2=max(max(s3_low(:,div(end)+1:end)))*TH2;  %������ â�� ���� ���ΰ�.
s4_low(:,div(end)+1:end) = (s3_low(:,div(end)+1:end)>th2).*s3_low(:,div(end)+1:end);