%% �ð������� ���ϴ� spectrogram ����� - ������

s7_high=s3_high;  %�ð��� ���ϱ� ���� spectrogram    
TH3 = 0.35; %�ð��� ������ ���� ���ΰ�/���� ���� ���� �������̰� �������. 

for i = 1: length(div)-1
th3=max(max(s3_high(:,div(i)+1:div(i+1))))*TH3;  %������ â�� ���� ���ΰ�.
s7_high(:,div(i)+1:div(i+1))=(s3_high(:,div(i)+1:div(i+1))>th3).*s3_high(:,div(i)+1:div(i+1));
end

th3=max(max(s3_high(:,div(end)+1:end)))*TH3;  %������ â�� ���� ���ΰ�.
s7_high(:,div(end)+1:end) = (s3_high(:,div(end)+1:end)>th3).*s3_high(:,div(end)+1:end);
