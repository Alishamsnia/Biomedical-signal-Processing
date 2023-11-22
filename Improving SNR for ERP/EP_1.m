clear all
clc
load 'ex2data.mat'
fs=250
t=1/fs:1/fs:500
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
figure(1)
plot(tm,Mf)
title('ERP of regular stimulation')
for j=1:1:74
    k=indd(j,1)-12
    l=indd(j,1)+125
    dcd=mean(eeg(k:l),1)
    sampd(1:y,j)=eeg(k:l,1)-(dcd*ones(y,1))
end
syncd=sampd'
Md=mean(syncd)
figure(2)
plot(tm,Md)
title('ERP of irregular stimulation')

