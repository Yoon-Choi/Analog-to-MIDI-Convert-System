


%���� �����Ͱ��� round�� �Ҽ� ��°�ڸ����� ���� ������ ���ư�. 
[value,txt,raw]=xlsread('pitch_2.xlsx');
r=size(value,1); %���� data���� ���� �� 



%% ������ ó��

pitch_low=zeros(1,length(re_low(2,:)));

for i=1:1:length(re_low(2,:)) %���� data���� ���������� ������ 
    
    for j=1:1:r  %j�� value - ����ǥ�� ���� ���¿���    
        while (re_low(2,i)-value(j,3)>=0) &&((value(j,4)-re_low(2,i))>=0)
            pitch_low(1,i)=value(j,2);
         break;
        end
     
    end
end


%% �߰��� ó��

pitch_median=zeros(1,length(re_median(2,:)));

for i=1:1:length(re_median(2,:)) %���� data���� ���������� ������ 
    
    for j=1:1:r  %j�� value - ����ǥ�� ���� ���¿���    
        while (re_median(2,i)-value(j,3)>=0) &&((value(j,4)-re_median(2,i))>=0)
            pitch_median(1,i)=value(j,2);
         break;
        end
     
    end
end


%% ������ ó��


pitch_high=zeros(1,length(re_high(2,:)));

for i=1:1:length(re_high(2,:)) %���� data���� ���������� ������ 
    
    for j=1:1:r  %j�� value - ����ǥ�� ���� ���¿���    
        while (re_high(2,i)-value(j,3)>=0) &&((value(j,4)-re_high(2,i))>=0)
            pitch_high(1,i)=value(j,2);
         break;
        end
     
    end
end
