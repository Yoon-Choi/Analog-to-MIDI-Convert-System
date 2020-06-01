


%들어온 데이터값들 round로 소수 둘째자리까지 먼저 만들어야 돌아감. 
[value,txt,raw]=xlsread('pitch_2.xlsx');
r=size(value,1); %엑셀 data들의 열의 수 



%% 낮은음 처리

pitch_low=zeros(1,length(re_low(2,:)));

for i=1:1:length(re_low(2,:)) %들어온 data들을 순차적으로 가져옴 
    
    for j=1:1:r  %j는 value - 엑셀표의 열을 도는역할    
        while (re_low(2,i)-value(j,3)>=0) &&((value(j,4)-re_low(2,i))>=0)
            pitch_low(1,i)=value(j,2);
         break;
        end
     
    end
end


%% 중간음 처리

pitch_median=zeros(1,length(re_median(2,:)));

for i=1:1:length(re_median(2,:)) %들어온 data들을 순차적으로 가져옴 
    
    for j=1:1:r  %j는 value - 엑셀표의 열을 도는역할    
        while (re_median(2,i)-value(j,3)>=0) &&((value(j,4)-re_median(2,i))>=0)
            pitch_median(1,i)=value(j,2);
         break;
        end
     
    end
end


%% 높은음 처리


pitch_high=zeros(1,length(re_high(2,:)));

for i=1:1:length(re_high(2,:)) %들어온 data들을 순차적으로 가져옴 
    
    for j=1:1:r  %j는 value - 엑셀표의 열을 도는역할    
        while (re_high(2,i)-value(j,3)>=0) &&((value(j,4)-re_high(2,i))>=0)
            pitch_high(1,i)=value(j,2);
         break;
        end
     
    end
end
