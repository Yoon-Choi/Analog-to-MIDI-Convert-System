
midi = readmidi('testout.mid');
 
 % synthesize with FM-synthesis.
% (y = audio samples.  Fs = sample rate.  Here, uses default 44.1k.)
[y,Fs] = midi2audio(midi);    

%% listen in matlab:
% soundsc(y, Fs);  % FM-synth

% There are two other very basic synth methods included:
y = midi2audio(midi, Fs, 'sine');
soundsc(y,Fs);
% 
% y = midi2audio(midi, Fs, 'saw');
% soundsc(y,Fs);

% save to file:
% (normalize so as not clipped in writing to wav)
% y = .95.*y./max(abs(y));
% audiowrite(y,Fs,'out.wav');

info=midiInfo(midi);

Notes = midiInfo(midi,0);
% compute piano-roll:
[PR,t,nn] = piano_roll(Notes);

%% display piano-roll:
figure;
imagesc(t,nn,PR);
axis xy;
xlabel('time (sec)');
ylabel('note number');

%% also, can do piano-roll showing velocity:
[PR,t,nn] = piano_roll(Notes,1);

figure;
imagesc(t,nn,PR);
axis xy;
xlabel('time (sec)');
ylabel('note number');