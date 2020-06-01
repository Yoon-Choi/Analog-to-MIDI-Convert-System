%% ������ ó��

N_low=length(re_low(3,:));%��ǥ��
M_low=zeros(N_low,6);

del=find(pitch_low>44); %�����ϱ����� ������ ����

M_low(:,1) =1;  %all in track 1
M_low(:,2) = 1; % �������� channel 2�� ���´�.
M_low(:,3) = pitch_low';  %note numper(pitch)
M_low(:,4) = 60;    %velocity(��ġ�� ����1-127), 80~120���� ������
M_low(:,5) = re_low(3,:)';
M_low(:,6) = re_low(4,:)';

M_low(del,:)=NaN;


clear del;

%% �߰��� ó��

N_median=length(re_median(3,:));%��ǥ��
M_median=zeros(N_median,6);

del=find(44>=pitch_median);      %�����ϱ����� ������
del=[del, find(pitch_median>65)]; %�����ϱ����� ������

M_median(:,1) =1;  %all in track 1
M_median(:,2) = 1; % �������� channel 2�� ���´�.
M_median(:,3) = pitch_median';  %note numper(pitch)
M_median(:,4) = 60;    %velocity(��ġ�� ����1-127), 80~120���� ������
M_median(:,5) = re_median(3,:)';
M_median(:,6) = re_median(4,:)';

M_median(del,:)=NaN;


clear del;


%% ������ ó��


N_high=length(re_high(3,:));%��ǥ��
M_high=zeros(N_high,6);

del=find(pitch_high<=65); %�����ϱ����� ������ ����

M_high(:,1) =1;  %all in track 1
M_high(:,2) = 1; % all in channel 1
M_high(:,3) = pitch_high';  %note numper(pitch)
M_high(:,4) =80;    %velocity(��ġ�� ����1-127), 80~120���� ������
M_high(:,5) = re_high(3,:)';
M_high(:,6) = re_high(4,:)';


M_high(del,:)=NaN;



%% �̵����� ����

M=[M_low;M_high;M_median];
%  M=[M_low;M_high];

midi_new=matrix2midi(M);
writemidi(midi_new,'test_1.mid');
% 
% midi_new=matrix2midi(M_low);
% writemidi(midi_new,'test_low.mid');
% 
% midi_new=matrix2midi(M_high);
% writemidi(midi_new,'test_high.mid');
