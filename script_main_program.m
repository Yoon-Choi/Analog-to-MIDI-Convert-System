clear all; close all; clc

%%

[music,Fs]=audioread('mail_median.wav');




len=length(music); %get the number of points
time=1:len;
time=time/Fs;



%% SET PARAMETERS for STFT

%      mono=music;
   mono = (music(:,1)+music(:,2))/2; % STFT �� ���� �¿� ��հ�

    script_set_parameters;
   
 
%% �׸����� ��Ÿ����
R1= 1;     
R2=4500;
f_low=f_low(R1:R2);
f_high=f_high(R1:R2);
TH1 = 0.57; %â�������
TH2 = 0.5; %â ������ ���ΰ�

% ������
    s2_low = abs(S_low(R1:R2,:)); %�ŵ��� �ִ�/�ּ� ���ļ�,â�������
    s3_low=s2_low;      %����    
    [X_low,Y_low] = meshgrid(t_low,f_low);    % Meshgrid ����   
    th1=max(max(s2_low))*TH1;  %â �������   
    s2_low(s2_low<th1)=0;
    
%�߰���
    s2_median = abs(S_median(R1:R2,:)); %�ŵ��� �ִ�/�ּ� ���ļ�,â�������
    s3_median=s2_median;      %����    
    [X_median,Y_median] = meshgrid(t_median,f_median);    % Meshgrid ����   
    th1=max(max(s2_median))*TH1;  %â �������   
    s2_median(s2_median<th1)=0;
    
    
    
% ������    
    s2_high = abs(S_high(R1:R2,:)); %�ŵ��� �ִ�/�ּ� ���ļ�,â�������
    s3_high=s2_high;      %����    
    [X_high,Y_high] = meshgrid(t_high,f_high);    % Meshgrid ����   
    th1=max(max(s2_high))*TH1;  %â �������   
    s2_high(s2_high<th1)=0;

    
   figure;
    w=contour(X_high,Y_high,s2_high);  % Contour �׷��� ǥ��
    colorbar;
    grid on;
    
%% â ������ - ������
script_dynamic_window_LOW;


%% �ð������� ���ϴ� spectrogram ����� - ������

script_time_standard_LOW;

%% â ������ - ������
script_dynamic_window_MEDIAN;


%% �ð������� ���ϴ� spectrogram ����� - ������

script_time_standard_MEDIAN;



%% â ������ - ������

script_dynamic_window_HIGH;

%% �ð������� ���ϴ� spectrogram ����� - ������

script_time_standard_HIGH;


%% contour���� (-)���⸦ �����Ѵ�.
s6_low=s4_low;
s6_median=s4_median;
s6_high=s4_high;

% num = round((size(s4,2)+1)/10); %�������ϴ� ���� �ּ� 2 / �ִ� (size(s4,2)+1)
num = 2;

%������ ó��
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
    
 s5_low = (s5_low>=0);  %������ ���� ���ʰ��� ���� ������ 0
 s4_low=s4_low.*s5_low;
 
%     figure;
% contour(X,Y,s4);  % Contour �׷��� ǥ��
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end


%�߰��� ó��
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
    
 s5_median = (s5_median>=0);  %������ ���� ���ʰ��� ���� ������ 0
 s4_median=s4_median.*s5_median;
 
%     figure;
% contour(X,Y,s4);  % Contour �׷��� ǥ��
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end



%������ ó��
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
    
 s5_high = (s5_high>=0);  %������ ���� ���ʰ��� ���� ������ 0
 s4_high=s4_high.*s5_high;
 
%     figure;
% contour(X,Y,s4);  % Contour �׷��� ǥ��
% %     contour(s4);
%     colorbar;
%     grid on;
%  
end


% 
% figure;
% contour(X,Y,s4);  % Contour �׷��� ǥ��
% % contour(s4);
%     colorbar;
%     grid on;
            


%% ���� contour���� ��ǥ���� ����(peak�� ��)


%������
diff = zeros(length(s4_low),1); %���������
tt_low = 0;
ff_low = 0;
% negative = 0; %���Ⱑ (-)�� �Ǵ� ó�� ������ ����


interval_low = f_low(2)-f_low(1);
error_range_low = 3; %[Hz]
error_index_low = round(2/interval_low);


    script_pick_value_LOW;    

 %index�� �ð��� ���ļ��� mapping
   re_low=zeros(4,length(ff_low)-1);
   re_low(1,:)=t_low(1,tt_low(2:end));
   re_low(2,:)=f_low(ff_low(2:end),1);

   
%�߰���
diff = zeros(length(s4_median),1); %���������
tt_median = 0;
ff_median = 0;
% negative = 0; %���Ⱑ (-)�� �Ǵ� ó�� ������ ����


interval_median = f_median(2)-f_median(1);
error_range_median = 3; %[Hz]
error_index_median = round(2/interval_median);


    script_pick_value_MEDIAN;    

 %index�� �ð��� ���ļ��� mapping
   re_median=zeros(4,length(ff_median)-1);
   re_median(1,:)=t_median(1,tt_median(2:end));
   re_median(2,:)=f_median(ff_median(2:end),1);
   
   
   


%������

diff = zeros(length(s4_high),1); %���������
tt_high = 0;
ff_high = 0;
% negative = 0; %���Ⱑ (-)�� �Ǵ� ó�� ������ ����


interval_high = f_high(2)-f_high(1);
error_range_high = 3; %[Hz]
error_index_high = round(2/interval_high);


 script_pick_value_HIGH;
 
 
 
  re_high=zeros(4,length(ff_high)-1);
  re_high(1,:)=t_high(1,tt_high(2:end));
  re_high(2,:)=f_high(ff_high(2:end),1);

  %re_high�� ���̰� �׻� re_median���� �� ũ��.
   
%% ��ǥ���� �̿��Ͽ� ���۽ð�, ������ �ð� ���ϱ�

%������ ó��
script_time_duration_LOW;

%�߰��� ó��
script_time_duration_MEDIAN;


%������ ó��

script_time_duration_HIGH;


%% ���ļ��� �ŵ� �ѹ��� ��Ī��
script_matching;


%% midifile�� ����
script_midi_make;


%% ���� midi file�� ����ϰ� piano roll�� �����

% script_midi_basic;