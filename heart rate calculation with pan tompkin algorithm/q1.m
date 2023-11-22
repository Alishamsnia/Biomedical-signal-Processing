clear all
clc
load 'ECG3.dat'
load 'ECG4.dat'
load 'ECG5.dat'
load 'ECG6.dat'
Fs=200
t=0:1/Fs:20-1/Fs

%calculation for ECG3
[QRS_ECG3]=pantom(ECG3,Fs)
figure('Name','ECG3')
subplot(2,1,1)
plot(t,ECG3)
title('ECG3')
subplot(2,1,2)
plot(t,QRS_ECG3)
title('QRS ECG3')
th1=max(QRS_ECG3(1000:4000,1))/3
%detecting R
[pks3,locs3]=findpeaks(QRS_ECG3,'MinPeakHeight',th1,'MinPeakDistance',6)
heart_beat_3=numel(pks3)
heart_rate_3=heart_beat_3*3
j=1
for i=1:1:numel(locs3)-1
    R_R3(j,1)=locs3(i+1,1)-locs3(i,1)
    j=j+1
end
R_R3=(R_R3./Fs)'
mean3=mean(R_R3)
standard_deviation_3=std(R_R3)
[QRS_width_mean3]=QRS_width(locs3,pks3,QRS_ECG3)

%calculation for ECG4
[QRS_ECG4]=pantom(ECG4,Fs)
figure('Name','ECG4')
subplot(2,1,1)
plot(t,ECG4)
title('ECG4')
subplot(2,1,2)
plot(t,QRS_ECG4)
title('QRS ECG4')
th2=max(QRS_ECG4(1000:4000))/3
%detecting R
[pks4,locs4]=findpeaks(QRS_ECG4,'MinPeakHeight',th2,'MinPeakDistance',6)
heart_beat_4=numel(pks4)
heart_rate_4=heart_beat_4*3
j=1
for i=1:1:numel(locs4)-1
    R_R4(j,1)=locs4(i+1,1)-locs4(i,1)
    j=j+1
end
R_R4=(R_R4./Fs)'
mean4=mean(R_R4)
standard_deviation_4=std(R_R4)
[QRS_width_mean4]=QRS_width(locs4,pks4,QRS_ECG4)

%calculation for ECG5
[QRS_ECG5]=pantom(ECG5,Fs)
figure('Name','ECG5')
subplot(2,1,1)
plot(t,ECG5)
title('ECG5')
subplot(2,1,2)
plot(t,QRS_ECG5)
title('QRS ECG5')
th3=max(QRS_ECG5(1000:4000))/9
%detecting R
[pks5,locs5]=findpeaks(QRS_ECG5,'MinPeakHeight',th3,'MinPeakDistance',33)
heart_beat_5=numel(pks5)
heart_rate_5=heart_beat_5*3
j=1
for i=1:1:numel(locs5)-1
    R_R5(j,1)=locs5(i+1,1)-locs5(i,1)
    j=j+1
end
R_R5=(R_R5./Fs)'
mean5=mean(R_R5)
standard_deviation_5=std(R_R5)
[QRS_width_mean5]=QRS_width(locs5,pks5,QRS_ECG5)

%calculation for ECG6
[QRS_ECG6]=pantom(ECG6,Fs)
figure('Name','ECG6')
subplot(2,1,1)
plot(t,ECG6)
title('ECG6')
subplot(2,1,2)
plot(t,QRS_ECG6)
title('QRS ECG6')
th4=max(QRS_ECG6(1000:4000))/3
%detecting R
[pks6,locs6]=findpeaks(QRS_ECG6,'MinPeakHeight',th4,'MinPeakDistance',33)
heart_beat_6=numel(pks6)
heart_rate_6=heart_beat_6*3
j=1
for i=1:1:numel(locs6)-1
    R_R6(j,1)=locs6(i+1,1)-locs6(i,1)
    j=j+1
end
R_R6=(R_R6./Fs)'
mean6=mean(R_R6)
standard_deviation_6=std(R_R6)
[QRS_width_mean6]=QRS_width(locs6,pks6,QRS_ECG6)

fprintf('Heart rate ECG3 in 20 second=%d\n',heart_beat_3)
fprintf('Heart rate ECG3 in 60 second=%d\n',heart_rate_3)
fprintf('Heart rate ECG4 in 20 second=%d\n',heart_beat_4)
fprintf('Heart rate ECG4 in 60 second=%d\n',heart_rate_4)
fprintf('Heart rate ECG5 in 20 second=%d\n',heart_beat_5)
fprintf('Heart rate ECG5 in 60 second=%d\n',heart_rate_5)
fprintf('Heart rate ECG6 in 20 second=%d\n',heart_beat_6)
fprintf('Heart rate ECG6 in 60 second=%d\n',heart_rate_6)

fprintf('R to R mean at ECG3=%f\n',mean3)
fprintf('R to R standard deviation at ECG3=%f\n',standard_deviation_3)
fprintf('R to R mean at ECG4=%f\n',mean4)
fprintf('R to R standard deviation at ECG4=%f\n',standard_deviation_4)
fprintf('R to R mean at ECG5=%f\n',mean5)
fprintf('R to R standard deviation at ECG5=%f\n',standard_deviation_5)
fprintf('R to R mean at ECG6=%f\n',mean6)
fprintf('R to R standard deviation at ECG6=%f\n',standard_deviation_6)

fprintf('ECG3 QRS Width is= %f\n',QRS_width_mean3)
fprintf('ECG4 QRS Width is= %f\n',QRS_width_mean4)
fprintf('ECG5 QRS Width is= %f\n',QRS_width_mean5)
fprintf('ECG6 QRS Width is= %f\n',QRS_width_mean6)

%This is a function
function [ecg_in] = pantom(ecg, Fs)
    % Pan-Tompkins algorithm
   
    % Low-pass Filter
    B_lp_1 = [1 zeros(1,5) -2 zeros(1,5) 1]/32;
    A_lp_1 = [1 -2 1];
    ecg_lp = filter(B_lp_1,A_lp_1,ecg);
    ecg_lp = ecg_lp/max(ecg_lp);

    %Highpass filter
    B_hp_1 = -[1 zeros(1,15) -32 zeros(1,15) -1];
    A_hp_1 = [1 1];
    ecg_hp = filter(B_hp_1,A_hp_1,ecg_lp);
    ecg_hp = ecg_hp/max(ecg_hp);

    %Derivative filter
    B_df_1 = [1 2 0 -2 -1]*Fs/8;
    A_df_1 = [1];
    ecg_df = filter(B_df_1,A_df_1,ecg_hp);
    ecg_df  = ecg_df/max(ecg_df);

    %Squaring
    ecg_sq = ecg_df .^2;

    %Integrating 
    B_in_1 = [1 zeros(1,7) -1]/8;
    A_in_1 = [1 -1];
    ecg_in = filter(B_in_1,A_in_1,ecg_sq);
end

% estimating QRS width for each channels
function [QRS_width_mean]=QRS_width(locs,pks,QRS_ECG)
k=1
L=1
e=1
y=1
for i=1:1:numel(pks)
    %recognising S by moving data by data to right of R
    %and mesuring differ of R with data and deciding which is S
    for j=locs(i,1):1:locs(i,1)+16
        S(k,1)=pks(i,1)-QRS_ECG(j,1)
        k=k+1
    end
    k=1
    max_s=max(S)
    for m=1:1:numel(S)
        if S(m,1)==max_s
            t_s(L,1)=locs(i,1)+m-1
        end
    end
    L=L+1
    %recognising S by moving data by data to left of R
    %and mesuring differ of R with data and deciding which is Q
    for f=locs(i,1)-16:1:locs(i,1)
        Q(e,1)=pks(i,1)-QRS_ECG(f,1)
        e=e+1
    end
    e=1
    max_q=max(Q)
    for n=1:1:numel(Q)
        if Q(n,1)==max_q
            t_q(y,1)=locs(i,1)-n+1
        end
    end
    y=y+1
end
QRS_width_mean=mean((t_s-t_q)./200)
end