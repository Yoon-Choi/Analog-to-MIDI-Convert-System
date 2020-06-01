clear all; close all; clc

%%

[music,Fs]=audioread('mail_median.wav');




len=length(music); %get the number of points
time=1:len;
time=time/Fs;



%% SET PARAMETERS for STFT

%      mono=music;
   mono = (music(:,1)+music(:,2))/2; % STFT 를 위한 좌우 평균값

    script_set_parameters;
   
 
%% 그림으로 나타내기
R1= 1;     
R2=4500;
f_low=f_low(R1:R2);
f_high=f_high(R1:R2);
TH1 = 0.57; %창나누기용
TH2 = 0.5; %창 나눈후 문턱값

% 낮은음
    s2_low = abs(S_low(R1:R2,:)); %신디의 최대/최소 주파수,창나누기용
    s3_low=s2_low;      %원본    
    [X_low,Y_low] = meshgrid(t_low,f_low);    % Meshgrid 생성   
    th1=max(max(s2_low))*TH1;  %창 나누기용   
    s2_low(s2_low<th1)=0;
    
%중간음
    s2_median = abs(S_median(R1:R2,:)); %신디의 최대/최소 주파수,창나누기용
    s3_median=s2_median;      %원본    
    [X_median,Y_median] = meshgrid(t_median,f_median);    % Meshgrid 생성   
    th1=max(max(s2_median))*TH1;  %창 나누기용   
    s2_median(s2_median<th1)=0;
    
    
    
% 높은음    
    s2_high = abs(S_high(R1:R2,:)); %신디의 최대/최소 주파수,창나누기용
    s3_high=s2_high;      %원본    
    [X_high,Y_high] = meshgrid(t_high,f_high);    % Meshgrid 생성   
    th1=max(max(s2_high))*TH1;  %창 나누기용   
    s2_high(s2_high<th1)=0;

    
   figure;
    w=contour(X_high,Y_high,s2_high);  % Contour 그래프 표시
    colorbar;
    grid on;
    
%% 창 나누기 - 낮은음
script_dynamic_window_LOW;


%% 시간기준을 정하는 spectrogram 만들기 - 낮은음

script_time_standard_LOW;

%% 창 나누기 - 낮은음
script_dynamic_window_MEDIAN;


%% 시간기준을 정하는 spectrogram 만들기 - 낮은음

script_time_standard_MEDIAN;



%% 창 나누기 - 높은음

script_dynamic_window_HIGH;

%% 시간기준을 정하는 spectrogram 만들기 - 높은음

script_time_standard_HIGH;


%% contour에서 (-)기울기를 정리한다.
s6_low=s4_low;
s6_median=s4_median;
s6_high=s4_high;

% num = round((size(s4,2)+1)/10); %기울기계산하는 길이 최소 2 / 최대 (size(s4,2)+1)
num = 2;

%낮은음 처리
for i = 2 : num
 s5_low=zeros(size(s4_low));
 
   if i~=2
    for m = 2 :i-1
    s5_low(:,m)=s6_low(:,m)-s6_low(:,m-1);
    end
   end
   
    for j = i : size(s6_low,2)
   
    
        s5_low(:,j)=s6_low(:,j)-s6_low(:,j-(i-1));

    end
    
 s5_low = (s5_low>=0);  %오른쪽 값이 왼쪽값에 비해 작을때 0
 s4_low=s4_low.*s5_low;
 
%     figure;
% contour(X,Y,s4);  % Contour 그래프 표시
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end


%중간음 처리
for i = 2 : num
 s5_median=zeros(size(s4_median));
 
   if i~=2
    for m = 2 :i-1
    s5_median(:,m)=s6_median(:,m)-s6_median(:,m-1);
    end
   end
   
    for j = i : size(s6_median,2)
   
    
        s5_median(:,j)=s6_median(:,j)-s6_median(:,j-(i-1));

    end
    
 s5_median = (s5_median>=0);  %오른쪽 값이 왼쪽값에 비해 작을때 0
 s4_median=s4_median.*s5_median;
 
%     figure;
% contour(X,Y,s4);  % Contour 그래프 표시
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end



%높은음 처리
for i = 2 : num
 s5_high=zeros(size(s4_high));
 
   if i~=2
    for m = 2 :i-1
    s5_high(:,m)=s6_high(:,m)-s6_high(:,m-1);
    end
   end
   
    for j = i : size(s6_high,2)
   
    
        s5_high(:,j)=s6_high(:,j)-s6_high(:,j-(i-1));

    end
    
 s5_high = (s5_high>=0);  %오른쪽 값이 왼쪽값에 비해 작을때 0
 s4_high=s4_high.*s5_high;
 
%     figure;
% contour(X,Y,s4);  % Contour 그래프 표시
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end


% 
% figure;
% contour(X,Y,s4);  % Contour 그래프 표시
% % contour(s4);
%     colorbar;
%     grid on;
            


%% 깎은 contour에서 대표값을 고른다(peak로 고름)


%낮은음
diff = zeros(length(s4_low),1); %증가율계산
tt_low = 0;
ff_low = 0;
% negative = 0; %기울기가 (-)가 되는 처음 순간만 잡음


interval_low = f_low(2)-f_low(1);
error_range_low = 3; %[Hz]
error_index_low = round(2/interval_low);


    script_pick_value_LOW;    

 %index를 시간과 주파수에 mapping
   re_low=zeros(4,length(ff_low)-1);
   re_low(1,:)=t_low(1,tt_low(2:end));
   re_low(2,:)=f_low(ff_low(2:end),1);

   
%중간음
diff = zeros(length(s4_median),1); %증가율계산
tt_median = 0;
ff_median = 0;
% negative = 0; %기울기가 (-)가 되는 처음 순간만 잡음


interval_median = f_median(2)-f_median(1);
error_range_median = 3; %[Hz]
error_index_median = round(2/interval_median);


    script_pick_value_MEDIAN;    

 %index를 시간과 주파수에 mapping
   re_median=zeros(4,length(ff_median)-1);
   re_median(1,:)=t_median(1,tt_median(2:end));
   re_median(2,:)=f_median(ff_median(2:end),1);
   
   
   


%높은음

diff = zeros(length(s4_high),1); %증가율계산
tt_high = 0;
ff_high = 0;
% negative = 0; %기울기가 (-)가 되는 처음 순간만 잡음


interval_high = f_high(2)-f_high(1);
error_range_high = 3; %[Hz]
error_index_high = round(2/interval_high);


 script_pick_value_HIGH;
 
 
 
  re_high=zeros(4,length(ff_high)-1);
  re_high(1,:)=t_high(1,tt_high(2:end));
  re_high(2,:)=f_high(ff_high(2:end),1);

  %re_high의 길이가 항상 re_median보다 더 크다.
   
%% 대표값을 이용하여 시작시간, 끝나는 시간 구하기

%낮은음 처리
script_time_duration_LOW;

%중간음 처리
script_time_duration_MEDIAN;


%높은음 처리

script_time_duration_HIGH;


%% 주파수와 신디 넘버를 매칭함
script_matching;


%% midifile을 만듬
script_midi_make;


%% 만든 midi file을 재생하고 piano roll을 출력함

% script_midi_basic;