clear all
clc
load 'ex2data.mat'
fs=250
t=1/fs:1/fs:500
bp_fir=designfilt('bandpassfir','FilterOrder',200,'CutoffFrequency1',1,'CutoffFrequency2',20,'SampleRate',250)
fvtool(bp_fir)
bp_iir=designfilt('bandpassiir','FilterOrder',40,'HalfPowerFrequency1',1,'HalfPowerFrequency2',20,'SampleRate',250)
fvtool(bp_iir)       %this part is show magnitude and phase and poles&zero
fft_eeg=fft(eeg)
fir_filter=filtfilt(bp_fir,eeg)    %we use filtfilt for zero phase shift / eeg FIR filtering
fir_filter_fft=fft(fir_filter)     %FIR filtered signal fft
iir_filter=filtfilt(bp_iir,eeg)    %eeg IIR filtering 
iir_filter_fft=fft(iir_filter)     %IIR filtered signal fft 
figure(1)
subplot(6,1,1)
plot(t,eeg)
title ('initial signal')
subplot(6,1,2)
plot(abs(fft_eeg))
title('initial signal fft')
xlabel('f(Hz)')
subplot(6,1,3)
plot(t,fir_filter)
title('FIR-filtered signal')
subplot(6,1,4)
plot(abs(fir_filter_fft))
title('FIR-filtered signal fft')
xlabel('f(Hz)')
subplot(6,1,5)
plot (t,iir_filter)
title('IIR-filtered signal')
subplot(6,1,6)
plot(abs(iir_filter_fft))
title('IIR-filtered signal fft')
xlabel('f(Hz)')
%**** we choose FIR filter for filtering signal

%***** synchronic mean for ERP detection
eeg=fir_filter
 y=ceil((0.5/(1/fs))+(0.05/(1/fs)))
for i=1:1:420                 %extracting data within window(-50_500)ms at stimulation
    m=indf(i,1)-12
    n=indf(i,1)+125
    dcf=mean(eeg(m:n,1))
    sampf(1:y,i)=eeg(m:n,1)-(dcf*ones(y,1))
end
syncf=sampf'
Mf=mean(syncf)
tm=1:1:138
figure(2)
subplot(2,1,1)
plot(tm,Mf)
title('ERP for regular stimulation')
for j=1:1:74
    k=indd(j,1)-12
    l=indd(j,1)+125
    dcd=mean(eeg(k:l),1)
    sampd(1:y,j)=eeg(k:l,1)-(dcd*ones(y,1))
end
syncd=sampd'
Md=mean(syncd)
subplot(2,1,2)
plot(tm,Md)
title('ERP for irregular stimulation')

%**** SNR of regular stimulation for all sweeps
y1=ceil((0.2/(1/fs))-(0.015/(1/fs)))
for i=1:1:420                 %extracting data within window(15_20)ms at stimulation
    m1=indf(i,1)+4
    n1=indf(i,1)+50
    dcf1=mean(eeg(m:n,1))
    sampf1(1:y1,i)=eeg(m1:n1,1)-(dcf1*ones(y1,1))
end
j=1
for i=1:2:420
sampf_odd1(1:47,j)=sampf1(1:47,i)
j=j+1
end
j=1
for i=2:2:420
    sampf_even1(1:47,j)=sampf1(1:47,i)
    j=j+1
end
syncf1=sampf1'
syncf_odd1=sampf_odd1'
syncf_even1=sampf_even1'
Mf1=mean(syncf1)
Mf_odd1=mean(syncf_odd1)
Mf_even1=mean(syncf_even1)
Mf_sub1=Mf_odd1-Mf_even1
SNR=var(Mf1)/var(Mf_sub1)
fprintf('signal to noise power is %f',SNR)













