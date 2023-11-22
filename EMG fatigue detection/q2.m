clear all
clc
load 'EMG1.mat'
load 'EMG2.mat'
load 'EMG3.mat'
load 'EMG4.mat'

%show the orginal EMG signals
Fs=2000
figure('Name','question 2.a')
subplot(3,3,1)
plot(0:1/Fs:(numel(data1)-1)/Fs,data1)
title('EMG1')
subplot(3,3,2)
xlabel('t')
plot(0:1/Fs:(numel(data2)-1)/Fs,data2)
title('EMG2')
xlabel('t')
subplot(3,3,3)
plot(0:1/Fs:(numel(data3)-1)/Fs,data3)
title('EMG3')
xlabel('t')

%now we filter 50Hz 
BSF = designfilt('bandstopiir','FilterOrder',2,'HalfPowerFrequency1',49,'HalfPowerFrequency2',51, 'DesignMethod','butter','SampleRate',Fs);
%fvtool(BSF,'Fs',Fs)
EMG1_filtered=filtfilt(BSF,data1)
EMG2_filtered=filtfilt(BSF,data2)
EMG3_filtered=filtfilt(BSF,data3)
EMG4_filtered=filtfilt(BSF,data4)

%show the filtered signals of EMG
subplot(3,3,4)
plot(0:1/Fs:(numel(data1)-1)/Fs,EMG1_filtered)
title('filtered EMG1')
subplot(3,3,5)
xlabel('t')
plot(0:1/Fs:(numel(data2)-1)/Fs,EMG2_filtered)
title('filtered EMG2')
xlabel('t')
subplot(3,3,6)
plot(0:1/Fs:(numel(data3)-1)/Fs,EMG3_filtered)
title('filtered EMG3')
xlabel('t')

%now we rectify the signals
abs_EEG1=sqrt(EMG1_filtered.^2)
abs_EEG2=sqrt(EMG2_filtered.^2)
abs_EEG3=sqrt(EMG3_filtered.^2)

%now we aplly moving average  *our window is 100ms that equel with 200 data
avr_EMG1=movmean(abs_EEG1,200)
avr_EMG2=movmean(abs_EEG2,200)
avr_EMG3=movmean(abs_EEG3,200)

%now we show RMS of EMG
subplot(3,3,7)
plot(0:1/Fs:(numel(data1)-1)/Fs,avr_EMG1)
title('RMS EMG1')
subplot(3,3,8)
xlabel('t')
plot(0:1/Fs:(numel(data2)-1)/Fs,avr_EMG2)
title('RMS EMG2')
xlabel('t')
subplot(3,3,9)
plot(0:1/Fs:(numel(data3)-1)/Fs,avr_EMG3)
title('RMS EMG3')
xlabel('t')

%**************************************************************************
%%
% question 2 part b answer:
figure ('Name','question2.b')
subplot(3,1,1)
plot(0:1/Fs:(numel(data4)-1)/Fs,data4)
title('EEG4')
xlabel('t')
subplot(3,1,2)
plot(0:1/Fs:(numel(data4)-1)/Fs,EMG4_filtered)
title('filtered EEG4')
xlabel('t')
m=1
for i=1:10000:60001
    
        window(m,1:1000)=EMG4_filtered(1,i:i+999)
    
    m=m+1
end
win_EMG4=zeros(1,numel(data4))
m=1
for i=1:10000:60001
    win_EMG4(1,i:i+999)=window(m,1:1000)
end
subplot(3,1,3)
plot(0:1/Fs:(numel(data4)-1)/Fs,win_EMG4)
title ('windowed EEG4')
xlabel('t')
figure()
for i=1:1:7
    subplot(7,1,i)
    plot(1:1000,window(i,1:1000))
    title(['window',num2str(i)])
    ylim([-1e-3 1e-3])
end
%%
% answer of question 2 part c&d
figure('Name','q2.c')
for i=1:1:7
    [pxx,f]=pspectrum(window(i,1:1000),Fs)
    fmed(1,i)=medfreq(pxx)
    subplot(7,1,i)
    plot(f,pow2db(pxx))
    title(['power spectrum of window',num2str(i)])
end
figure('Name','median frequency')
subplot(2,1,1)
plot(fmed)
title('median frequency')
xlabel('window number')
ylabel('medfreq')
%%
%question 2 part e
%times that is match with 0
for i=1:1:7
    zero_touch(i,1)=0
    for j=1:999
        if window(i,j)*window(i,j+1)<=0
            zero_touch(i,1)=zero_touch(i,1)+1
        end
    end
end
subplot(2,1,2)
plot(zero_touch)
title('number of zero touchs for each window')
xlabel('window number')
ylabel('zero touches')












