%% 낮은음 전용 STFT

R = 13000;               % R: window length   낮은 음은 R을 크게만들면 좋다.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_low,f_low,t_low] = spectrogram(mono,window,overlap,N,Fs,'yaxis');


%% 중간음 전용 STFT

R = 11000;               % R: window length   낮은 음은 R을 크게만들면 좋다.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_median,f_median,t_median] = spectrogram(mono,window,overlap,N,Fs,'yaxis');

%% 높은음 전용 STFT

R = 5500;               % R: window length   높은 음은 R을 작게 만들면 좋다.
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.3);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 90% of window length


    
[S_high,f_high,t_high] = spectrogram(mono,window,overlap,N,Fs,'yaxis');
