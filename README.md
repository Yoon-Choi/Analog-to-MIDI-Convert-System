# Analog-to-MIDI-Convert-System : Capstone Design for Electronics Engineering(2017)

A system based on MATLAB that reduce errors in MIDI files by using improved algorithm than those provided by existing Audio to MIDI converters 
-	Eliminating unnecessary harmonics that makes the MIDI result errored 
-	Extracting necessary elements to create MIDI file after eliminating harmonics 

# Patent application
-	Patent application number 10-2018-0004947
-	Title of the Invention: MIDI file generation method with harmonic elimination and audio file conversion method 
-	date of the application: 15.01.2018



# Summary
The purpose of this project is to implement enhanced midi file result than the commercially utilizing MIDI converters.
The error rate was high because the existing Audio to MIDI converter included unnecessary harmonics as output.
We devised an algorithm to remove unnecessary harmonics through a creative method called ‘Dynamic window algorithm’ and improved the accuracy of MIDI file output so that expected to get more accurate MIDI file  than the existing Audio to MIDI converter



## Ⅰ. Introduction
Audio to MIDI converting’ is a method of converting a wav file composed of waveforms into a MIDI file through a series of matching between MIDI note numbers and frequency values. It is a technique that can be very useful in editing music or producing sheet music by removing unnecessary harmonics that are seen in MIDI signals – which were not heard in the existing audio signals. 
The fields of application such as [1] sheet music production and [2] game software production based on music files are endless. Audio to midi converting technology is a method that allows users to obtain natural and accurate midi files without any objection.
It is necessary to listen to and write a professional who has absolute pitch.

The audio processing system has been used continuously until now, and the audio to MIDI converting system is
As shown in Figure 1 , it consists of three steps.

![image](https://user-images.githubusercontent.com/65432377/130601219-50be71d5-6ad3-4986-bfee-e234733b17e1.png)

Figure 1: The process of converting audio file to MIDI file

1) Audio file read: Reads the wav file and saves the frequency values of notes and other values necessary to write MIDI files.
2) Frequency matching: Mapping the appropriate MIDI file note number according to the frequency value.
3) MIDI file write: Writes a MIDI file using the saved values.
Based on the above sequence, many audio to midi converting
system exists. It has the advantage of being able to extract midi files easily and simply by using the existing converting system, so it is widely used until now. However, the existing converters have a limitation in that they cannot obtain accurate data by recognizing even harmonics rather than the original sound as the original sound in the frequency matching process.

Harmonics, a problem in the existing converting system, are frequency components that exist to represent tone, not pitch. It has a frequency that is an integer multiple of the fundamental frequency used in the frequency matching process, and has a feature that it is smaller than the fundamental frequency in the frequency domain.



![image](https://user-images.githubusercontent.com/65432377/130601560-7e454111-71ea-4223-9a94-e71299daffe4.png)

Figure 2: FFT plot of A3 (220Hz)

Figure 2 is the result of FFT of ‘3 Octabra’ with a fundamental frequency of 220Hz. Although it is one pitch, it has several frequency components.

The 220Hz component, which is the fundamental frequency, has the largest magnitude, and the remaining frequency components (Harmonics) are smaller than the 220Hz component, and it can be seen that the frequency is an integer multiple.

There are many pitches in a single song. Since the sound intensity is not constant, and the size of the harmonics and the fundamental frequency are also different, it is rather difficult to distinguish the harmonics from the fundamental frequency simply by the size in the song.

If a user uses a system that converts an existing audio file into a MIDI file without applying a separate harmonics removal algorithm, it is impossible to obtain a proper MIDI file result, and the general public who does not have a musical background can play even harmonics It is mistakenly recognized as the necessary notes for

We devise a harmonics removal algorithm that improves upon these shortcomings to help users obtain accurate MIDI files.


## II. Methods
### 1. Implementation Environment
  1.1. Audio signal processing with MATLAB
 Get audio file data with MATLAB. Since it is necessary to analyze the frequency change over time of the audio signal,
STFT (short time fourier transform) processing. STFT is a frequently used function in the MATLAB interface to represent a frequency that changes with time.


![image](https://user-images.githubusercontent.com/65432377/130620659-b26b1e5c-bdb7-45ba-ab9d-81362255a648.png)
Figure 3: STFT performance principle

As shown in Figure 3, a small window is applied to the entire signal and FFT is performed several times while moving the window according to time. As a result of STFT, the frequency change with time of the signal can be seen. At this time, since time resolution and frequency are trade-off relationships, it is important to properly adjust parameters to obtain optimal STFT results.
<Figure 4> is a plot showing the STFT result in the form of a contour line using the contour function. One blue dot represents one pitch
It is a plot expressed in the shape of a contour line. One blue dot represents one pitch


![image](https://user-images.githubusercontent.com/65432377/130620717-2d397092-d963-47c9-b1ed-a97aec3fec52.png)
Figure 4: STFT result plot



  1.2. Saving Frequency & MIDI note numer information using Excel
  
![image](https://user-images.githubusercontent.com/65432377/130620740-875856a5-1831-4a22-ad20-a3d19e2b7744.png)
Figure 5: Frequecy – MIDI note number matching information

Figure 5 shows the relationship between Frequency and MIDI note number. Frequency – Creates a DATA table in Excel where MIDI note numbers are matched with each other. Compare the STFT result value with the DATA table to find out the appropriate MIDI note number value. The resulting value is used as a component of the MIDI file.


### 2. creating MIDI file

 2.1. MIDI file components
In order to make an audio file into a MIDI file, it is necessary to get the appropriate data from the audio file and to be output in MIDI format based on it.
The library provided by MATLAB was used and the configuration is as follows.

(number of Notes) It consists of a matrix of X 8 dimensions. The number of notes here means "the number of sounds recognized as one pitch in the audio signal".
 If the audio signal is a piano song, it means the number of pressed keys. Each note has 8 pieces of information.
At this time, 1) to 6) actually involved in the MIDI file, and it is okay to omit 7) and 8).

1) Track number: The index of the track containing the corresponding note.
2) Channel number: Index of the channel containing the corresponding note.
3) Note number: the electronic piano key number corresponding to the pitch
4) Velocity: Velocity(Intensity) of the corresponding note
5) Start time: The time at which the corresponding note is pressed
6) End time: The time the note ends

At this time, 1) and 2) are unified into one and the pitch is the same.
It was put in the track and channel, and 4) Velocity was uniformly processed to simplify the MIDI file result.



  2.2. Remove Harmonics – Dynamic window
We first tried to remove harmonics by applying a batch threshold condition without window segmentation.
However, this method has errors in removing the harmonics of large notes and recognizing the fundamental frequencies of small notes.
Approximate harmonics could be removed, but it was judged that the method of removing harmonics by applying a lumped threshold was not appropriate because all of the fundamental frequencies for small sounds were deleted.

Therefore, to solve this problem, a dynamic window algorithm was devised.
This is a method of dividing several windows and applying different thresholds to each window in order to distinguish harmonics in big notes and fundamental frequency in small notes

Fundamental frequencies and harmonics of large notes occur at the same time, and they can be distinguished by their amplitude.
However, when the fundamental frequency of a small note is the same as the harmonics of a large note, the fundamental frequency of a small note is recognized as unnecessary harmonics and is deleted to solve the problem.

By separating the large harmonics and small fundamental frequency regions, we tried to process the signals of each region independently.
When implementing this, it is assumed that the harmonics of large notes and the fundamental frequency of small notes exist at different times. We create windows that are flexibly divided according to time, and process them independently to make a difference between large notes and small notes. did not affect each other's signal processing.

![image](https://user-images.githubusercontent.com/65432377/130627283-4d28adff-7e86-44e0-b17d-40908961718a.png)
Figure 7: Application of Dynamic Window

Figure 7 simply shows the principle of the dynamic window. When blue is fundamental frequency and green is harmonics, blue tones generated at the same time always have a higher level (amplitude) than green tones. Harmonics of large notes in the second window cannot affect the fundamental frequency in the third window with a similar level, and are processed only in each window (separated by a red line).
Fundamental frequencies survive, and higher levels of harmonics are eliminated due to higher levels of fundamental frequencies.

![image](https://user-images.githubusercontent.com/65432377/130627306-45ed2d84-3530-4663-bcfd-3a4a2f584235.png)
Figure 8 shows the process of determining windows of various sizes.

1) First, apply a small threshold value (vertical line with slope = 0) to the entire audio signal to remove harmonics that could potentially interfere with signal processing

2) Divide the window based on the moment when threshold (vertical line with zero slope) -> (+) changes.
3) Divide the window once more based on the moment when the slope changes to (-) -> threshold (vertical line with zero slope)

4) For the divided windows, each threshold is designated and processed independently (harmonics removal)
 


In the case of Figure 8, since it is divided twice by the red line and twice by the yellow line, it has a total of 5 windows.

This algorithm helps to accurately classify the fundamental frequency by effectively removing the harmonics of the audio signal.
In particular, it is possible to accurately detect the fundamental frequency even when several sounds with similar loudness occur at the same time.

However, when sounds of different loudness occur at the same time, there is a limitation that these two cannot be divided according to time.
Even if Threshold is applied to the window, it is because a small sound is deleted because it is a signal of the same time.
In addition, if an audio file with a piano damper (sound effect) is used in the algorithm, the window cannot be properly divided due to the joint sound generated by the damper, and there is a limit to obtaining an accurate output value.

  2.3. Obtaining a representative value through the peak value 
with the extracted data Ideally, if all harmonics are removed, the remaining data are all fundamental frequencies. The frequency and time duration of the sound are needed to know the correct pitch and time.
![image](https://user-images.githubusercontent.com/65432377/130628292-e0a30398-ef2a-4e3a-a06d-b626fa6e6c7d.png)

Figure 9: Contour plot with harmonics removed

Figure 9 is an image of the result of removing harmonics using the dynamic window algorithm. To our ears, it is perceived as one pitch for each mass of contour lines. However, looking at the actual data value, one contour chunk consists of numerous data.

In order to write a MIDI file, only one frequency, start time, and end time are required for each pitch, so one frequency should be set for each contour chunk. In addition, the center time of the contour should be determined and the start time and end time should be estimated based on this. Our group considered the point with the highest level as a representative value, and saved the frequency and time of that point together.


![image](https://user-images.githubusercontent.com/65432377/130628543-131dd97f-5f2e-46f1-a22a-139bd3687739.png)
Figure 10: Getting the time when the level is peak

 Figure 10 is the process of obtaining the time with the peak value. Since there is no (-) value in level, the moment when the slope becomes 0 ->(-) or (+) -> (-) becomes the peak point. If all levels of points with (-) slope are set to 0, the number of points with (-) slope is reduced to one per each contour mass. After that, all points with (-) slope are considered peak points and the time and frequency of the point are saved.
 
 
![image](https://user-images.githubusercontent.com/65432377/130628609-1456dbb2-2cb4-4771-9597-a555ec0a9938.png)
Figure 11 is a random display of the high level point (yellow or yellowish green) among the contour masses in Figure 9.
The stored representative values are like this, per one contour chunk.
Ideally, when you have only one representative value.

In order to process as one pitch, if several frequencies per one contour are different by less than 2Hz, which is the error range,
Stores the average value of frequencies. The time of the stored frequency becomes the representative Time value.

At this time, the reason why the error range was set to 2 Hz is because
This is because there is a 4Hz difference between '2 octaves' and '2 octaves', which are the lowest and have the smallest frequency difference (the higher the pitch, the wider the interval between frequencies).
Up to 2Hz, the correct pitch can be recognized even if there is a frequency error, so the error range is set to 2Hz. If the frequency differs by more than 2Hz, it is treated as a different pitch.
The smaller the error range, the more delicate the low notes can be captured, but if the error range is too small, the same pitch is treated as a different note in the high pitch, which results in an inaccurate MIDI file


  2.4. Getting time duration
The start time and end time should be estimated using a representative value representing a lump of contour.

![image](https://user-images.githubusercontent.com/65432377/130634339-a4acfce1-9ca3-48d8-9978-a38dc3ab90b2.png)
Figure 12: Time duration calculation

Figure 12 simply shows the process of calculating sms Time duration. Make a window for scanning with a size (± error range) at the center of the representative frequency. Scan until the value in the window for scanning forwards and backwards around the representative time comes out to 0. The instantaneous time when all values in the window become 0
Estimate Start time/End time and store it together with a representative value.


  2.5. Frequency matching using Excel Change the representative
 
frequency saved in C) to MIDI note number using the data table where the frequency – MIDI note number of Excel is matched with each other.

![image](https://user-images.githubusercontent.com/65432377/130634586-650d5071-44ac-4d66-a85a-bb76be939f76.png)
Figure 13: Frequency – MIDI note number matching table


  2.6. Creating a MIDI file using Audio2midi 
Create an array in which the stored data is inserted according to the MIDI file format, and create a MIDI file using MATLAB's matrix2midi and writemidi functions.




### 3. Improvements

  3.1. harmonics elimination

![image](https://user-images.githubusercontent.com/65432377/130639440-90744816-494c-43a1-a0d0-22cba431d38c.png)
Figure 14: Existing Audio2MIDI converter and newly designed Audio2MIDI (below)
  
The existing Audio to MIDI converting system created a MIDI file of the result including all harmonics. Our group's Audio to MIDI converting system divides the time axis into Dynamically sized windows to remove harmonics. In each window, only windows of a similar level exist. In a window where only small level notes exist, a small threshold value is applied to preserve small fundamental frequencies and only smaller harmonics. In a window where only high-level notes exist, a high Threshold value is applied to remove large harmonics and only the fundamental frequency is saved. 

  3.2. STFT parameter adjustment
  ![image](https://user-images.githubusercontent.com/65432377/130639477-3d99f463-1dbd-4ab5-b2c4-b9a3f40b7f62.png)
Figure 15: MIDI in which STFT parameters are applied collectively (above) and STFT parameters are processed differently according to frequency file video (below)

STFT must be performed to represent the audio file in time to frequency. In STFT, time resolution and frequency resolution vary depending on the parameter value. Since these two are trade-off, it is important to find an optimized parameter.
If the window length among STFT input parameters is increased, the time resolution decreases and the frequency resolution increases. Since the frequency difference between notes is small, it is possible to accurately detect low notes when the frequency resolution is high. Instead, some of the high notes are lost as the time resolution is reduced.

Conversely, if the window length is reduced, the frequency resolution decreases and the time resolution increases. In the case of high notes, time resolution is more important than frequency resolution because the frequency between notes is large. With high time resolution, high sound is not lost. Instead, if the window length is too low, the frequency resolution is lowered, so it is impossible to know the exact low sound.

However, one song contains both low and high notes. In order to optimize the results, different STFT parameters were applied according to the frequency.


### 4. Challenging
  4.1. Eliminated signal
In the case of a song with a piano damper, it was not possible to properly divide the window because the energy of the previous note continues as a liaison is formed. The resulting MIDI file also had many errors.

  4.2. STFT parameter change according to frequency
When the STFT input parameter is set differently according to the frequency, a low note has a high frequency resolution / low time resolution, and a high note has a low frequency resolution / high time resolution. Due to the difference in time resolution, the synchro of the low and high notes is subtly different. If the purpose of listening to music is like an audio file, it sounds a bit annoying. However, if a MIDI file is used for music analysis and notation, there is no problem because the time difference between pitches is very small.

  4.3. MIDI Components - Velocity(Intensity of notes)
when using our devised algorithm, the result is a MIDI file consisted of notes of constant Velocity.
but there is a difference between input Audio format file in terms of the intensity of the notes changes in time



## Ⅲ. conclusion
 As mentioned in the introduction, the currently used Audio to MIDI converting system has many limitations in removing harmonics accurately. However, if you create a MIDI file after removing the harmonics through the dynamic window algorithm, you can get a midi file of accurate information and get a MIDI result without errors.

This project is expected to generate a lot of demand in places that require accurate MIDI files, such as composing or editing music. 
Also, based on MIDI files with accurate information, it could be utilized to creating songs in rhythm games or through various electronic instruments










