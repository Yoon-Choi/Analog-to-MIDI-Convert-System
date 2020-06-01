div = 0;
positive = 0; %기울기가 (+)가 되는 처음 순간만 잡음


for i = 2 : size(s2_median,2)
    
    diff=s2_median(:,i)-s2_median(:,i-1);
    diff = diff>0;
    
    if sum(diff)>0;
        
        if positive == 0;
            if (i-2)>0
                div = [div,i-2];
                positive = 1;
            end
        end
        
    else                   %기울기가 음수이거나 일정한경우
        if positive == 1     %기울기가 양수였다가 바뀜
            
            positive = 0;
        end
        
    end
    
    
end



div1 = 0;
negative = 0; %기울기가 (-)가 되는 처음 순간 ON


for i = 2 : size(s2_median,2)
    
    diff=s2_median(:,i)-s2_median(:,i-1);
    diff = diff<0;
    if sum(diff)>0;      
        if negative == 0;
            negative = 1;
        end
        
    else                   %기울기가 음수이거나 일정한경우
        if negative == 1     %기울기가 양수였다가 바뀜          
             if (i-2)>0
                div1 = [div1,i-2];
                negative = 1;
            end
        end
        
    end
     
end
% 
% s7_median = zeros(size(s2_median));
% s8_median = s7_median;
% 
% for m= 2:size(size(s7_median,2))
% 
% s7_median(:,m) = s2_median(:,m)-s2_median(:,m-1);
% 
% end
% 
% for m= 2:size(size(s7_median,2))           %2차 미분
% 
% s8_median(:,m-1) = s7_median(:,m)-s7_median(:,m-1);
% 
% end
% 
% s7_median=(s7_median<0);
% s8_median=s8_median.*s7_median;
% s8_median = (s8_median>0);



div = [div,div1];
div=sort(div);
div=unique(div);
s4_median = zeros(size(s2_median));   %나눈창에대한 문턱처리 저장

for i = 1: length(div)-1

th2=max(max(s3_median(:,div(i)+1:div(i+1))))*TH2;  %각각의 창에 대한 문턱값.
s4_median(:,div(i)+1:div(i+1))=(s3_median(:,div(i)+1:div(i+1))>th2).*s3_median(:,div(i)+1:div(i+1));

end

th2=max(max(s3_median(:,div(end)+1:end)))*TH2;  %각각의 창에 대한 문턱값.
s4_median(:,div(end)+1:end) = (s3_median(:,div(end)+1:end)>th2).*s3_median(:,div(end)+1:end);