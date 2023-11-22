clear all
clc
load 'ex2data.mat'
fs=250
t=1/fs:1/fs:500
x=size(indf)
x=x(1,1)
y=ceil((0.2/(1/fs))-(0.015/(1/fs)))
for i=1:1:x                 %extracting data within window(15_)ms at stimulation
    m=indf(i,1)+4
    n=indf(i,1)+50
    dcf=mean(eeg(m:n,1))
    sampf(1:y,i)=eeg(m:n,1)-(dcf*ones(y,1))
end
j=1
for i=1:2:420
sampf_odd(1:47,j)=sampf(1:47,i)
j=j+1
end
j=1
for i=2:2:420
    sampf_even(1:47,j)=sampf(1:47,i)
    j=j+1
end
syncf=sampf'
syncf_odd=sampf_odd'
syncf_even=sampf_even'
Mf=mean(syncf)
Mf_odd=mean(syncf_odd)
Mf_even=mean(syncf_even)
Mf_sub=Mf_odd-Mf_even
tm=1:1:47
figure('Name','odd,even,subtract')
subplot(3,1,1)
plot(tm,Mf_odd)
title('odd')
subplot(3,1,2)
plot(tm,Mf_even)
title('even')
subplot(3,1,3)
plot(tm,Mf_sub)
title('subtraction')
%SNR for all sweeps
SNR(1,7)=var(Mf)/var(Mf_sub)
fprintf('signal to noise power is %f',SNR(1,7))
%SNR for sweeps(1-10)
j=1
for i=1:2:10
    syncf_odd_1(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=2:2:10
    syncf_even_1(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=1:1:10
    syncf_1(j,1:47)=syncf(i,1:47)
    j=j+1
end
Mf_even_1=mean(syncf_even_1)
Mf_odd_1=mean(syncf_odd_1)
Mf_1=mean(syncf_1)
Mf_sub_1=Mf_odd_1-Mf_even_1
SNR(1,1)=var(Mf_1)/var(Mf_sub_1)
%SNR for sweeps (1-50)
j=1
for i=1:2:50
    syncf_odd_2(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=2:2:50
    syncf_even_2(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=1:1:50
    syncf_2(j,1:47)=syncf(i,1:47)
    j=j+1
end
Mf_even_2=mean(syncf_even_2)
Mf_odd_2=mean(syncf_odd_2)
Mf_2=mean(syncf_2)
Mf_sub_2=Mf_odd_2-Mf_even_2
SNR(1,2)=var(Mf_2)/var(Mf_sub_2)
%SNR for sweeps (1-100)
j=1
for i=1:2:100
    syncf_odd_3(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=2:2:100
    syncf_even_3(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=1:1:100
    syncf_3(j,1:47)=syncf(i,1:47)
    j=j+1
end
Mf_even_3=mean(syncf_even_3)
Mf_odd_3=mean(syncf_odd_3)
Mf_3=mean(syncf_3)
Mf_sub_3=Mf_odd_3-Mf_even_3
SNR(1,3)=var(Mf_3)/var(Mf_sub_3)
%SNR for sweeps (1-200)
j=1
for i=1:2:200
    syncf_odd_4(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=2:2:200
    syncf_even_4(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=1:1:200
    syncf_4(j,1:47)=syncf(i,1:47)
    j=j+1
end
Mf_even_4=mean(syncf_even_4)
Mf_odd_4=mean(syncf_odd_4)
Mf_4=mean(syncf_4)
Mf_sub_4=Mf_odd_4-Mf_even_4
SNR(1,4)=var(Mf_4)/var(Mf_sub_4)
%SNR for sweeps (1_300)
j=1
for i=1:2:300
    syncf_odd_5(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=2:2:300
    syncf_even_5(j,1:47)=syncf(i,1:47)
    j=j+1
end
j=1
for i=1:1:300
    syncf_5(j,1:47)=syncf(i,1:47)
    j=j+1
end
Mf_even_5=mean(syncf_even_5)
Mf_odd_5=mean(syncf_odd_5)
Mf_5=mean(syncf_5)
Mf_sub_5=Mf_odd_5-Mf_even_5
SNR(1,5)=var(Mf_5)/var(Mf_sub_5)
%SNR for sweeps (1-400)
for i=1:1:200
    syncf_odd_6(i,1:47)=syncf_odd(i,1:47)
end
for i=1:1:200
    syncf_even_6(i,1:47)=syncf_even(i,1:47)
end
for i=1:1:400
    syncf_6(i,1:47)=syncf(i,1:47)
end
Mf_even_6=mean(syncf_even_6)
Mf_odd_6=mean(syncf_odd_6)
Mf_6=mean(syncf_6)
Mf_sub_6=Mf_odd_6-Mf_even_6
SNR(1,6)=var(Mf_6)/var(Mf_sub_6)
plot ([10,50,100,200,300,400,420],SNR)



