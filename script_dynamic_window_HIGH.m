div = 0;
positive = 0; %���Ⱑ (+)�� �Ǵ� ó�� ������ ����


for i = 2 : size(s2_high,2)
    
    diff=s2_high(:,i)-s2_high(:,i-1);
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


for i = 2 : size(s2_high,2)
    
    diff=s2_high(:,i)-s2_high(:,i-1);
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

div = [div,div1];
div=sort(div);
div=unique(div);
s4_high = zeros(size(s2_high));   %����â������ ����ó�� ����

for i = 1: length(div)-1

th2=max(max(s3_high(:,div(i)+1:div(i+1))))*TH2;  %������ â�� ���� ���ΰ�.
s4_high(:,div(i)+1:div(i+1))=(s3_high(:,div(i)+1:div(i+1))>th2).*s3_high(:,div(i)+1:div(i+1));

end

th2=max(max(s3_high(:,div(end)+1:end)))*TH2;  %������ â�� ���� ���ΰ�.
s4_high(:,div(end)+1:end) = (s3_high(:,div(end)+1:end)>th2).*s3_high(:,div(end)+1:end);