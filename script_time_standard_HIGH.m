%% 시간기준을 정하는 spectrogram 만들기 - 높은음

s7_high=s3_high;  %시간을 정하기 위한 spectrogram    
TH3 = 0.35; %시간을 나누기 위한 문턱값/작을 수록 음의 유지길이가 길어진다. 

for i = 1: length(div)-1
th3=max(max(s3_high(:,div(i)+1:div(i+1))))*TH3;  %각각의 창에 대한 문턱값.
s7_high(:,div(i)+1:div(i+1))=(s3_high(:,div(i)+1:div(i+1))>th3).*s3_high(:,div(i)+1:div(i+1));
end

th3=max(max(s3_high(:,div(end)+1:end)))*TH3;  %각각의 창에 대한 문턱값.
s7_high(:,div(end)+1:end) = (s3_high(:,div(end)+1:end)>th3).*s3_high(:,div(end)+1:end);
