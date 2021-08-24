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
Audio to MIDI converting’ is a method of converting a wav file composed of waveforms into a MIDI file through a series of matching between MIDI note numbers and frequency values. It is a technique that can be very useful in editing music or producing sheet music by removing unnecessary harmonics that are seen in MIDI signals – which were not heard in the existing audio signals. Therefore, the fields of application such as [1] sheet music production and [2] game software production based on music files are endless. Audio to midi converting technology is a method that allows users to obtain natural and accurate midi files without any objection.
It is necessary to listen to and write a professional who has absolute pitch.
Therefore, it can bring great benefits in terms of cost as well.
  The audio processing system has been used continuously until now, and the audio to MIDI converting system is
As shown in <Figure 1>, it consists of three steps.


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

<Figure 2> is the result of FFT of ‘3 Octabra’ with a fundamental frequency of 220Hz. Although it is one pitch, it has several frequency components.
The 220Hz component, which is the fundamental frequency, has the largest magnitude, and the remaining frequency components (Harmonics) are smaller than the 220Hz component, and it can be seen that the frequency is an integer multiple.
There are many pitches in a single song. Since the sound intensity is not constant, and the size of the harmonics and the fundamental frequency are also different, it is rather difficult to distinguish the harmonics from the fundamental frequency simply by the size in the song.
A separate Harmonics Removal Algorithm by the user
If the audio file is converted into a MIDI file without application, a proper MIDI file cannot be obtained, and non-professionals mistakenly recognize that harmonics are necessary notes. Our group devised a harmonics removal algorithm to improve these shortcomings, so that users can get accurate MIDI files.


