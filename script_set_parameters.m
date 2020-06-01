%% ������ ���� STFT

R = 13000;               % R: window length   ���� ���� R�� ũ�Ը���� ����.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_low,f_low,t_low] = spectrogram(mono,window,overlap,N,Fs,'yaxis');


%% �߰��� ���� STFT

R = 11000;               % R: window length   ���� ���� R�� ũ�Ը���� ����.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_median,f_median,t_median] = spectrogram(mono,window,overlap,N,Fs,'yaxis');

%% ������ ���� STFT

R = 5500;               % R: window length   ���� ���� R�� �۰� ����� ����.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_high,f_high,t_high] = spectrogram(mono,window,overlap,N,Fs,'yaxis');
