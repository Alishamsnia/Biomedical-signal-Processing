%explanation of important code was written as green comments
p4=load ('eeg1-p4.dat')
p3=load ('eeg1-p3.dat')
o2=load ('eeg1-o2.dat')
o1=load ('eeg1-o1.dat')
f4=load ('eeg1-f4.dat')
f3=load ('eeg1-f3.dat')
c4=load ('eeg1-c4.dat')
c3=load ('eeg1-c3.dat')
fs=100
t=0:0.01:7.49
figure('Name','channel name')
subplot(8,1,1)
plot(t,p4)
title('p4')
subplot(8,1,2)
plot(t,p3)
title('p3')
subplot(8,1,3)
plot(t,o2)
title('o2')
subplot(8,1,4)
plot(t,o1)
title('o1')
subplot(8,1,5)
plot(t,f4)
title('f4')
subplot(8,1,6)
plot(t,f3)
title('f3')
subplot(8,1,7)
plot(t,c4)
title('c4')
subplot(8,1,8)
plot(t,c3)
title('c3')
temp=p4(500:564,1)          %the sample window I'v choose for alpha wave
h=spectrum.welch            %this shows that the template choosed ,has the most frequency in range(8,13)
sx=psd(h,temp,'fs',fs)      %so the template likly is alpha wave
figure('Name','proof of sample correctness')
plot(sx)
c1=zeros(750,1)
for i=1:25:700
    [c,lag]=xcorr(temp,p4(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,p4(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
figure ('Name','result of template matching')
subplot(8,1,1)
plot(t,c1)
title('channel p4 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,p3(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,p3(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,2)
plot(t,c1)
title('channel p3 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,o2(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,o2(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,3)
plot(t,c1)
title('channel o2 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,o1(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,o1(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,4)
plot(t,c1)
title('channel o2 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,f4(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,f4(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,5)
plot(t,c1)
title('channel f4 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,f3(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,f3(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,6)
plot(t,c1)
title('channel f3 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,c4(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,c4(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,7)
plot(t,c1)
title('channel c4 template matching')
for i=1:25:700
    [c,lag]=xcorr(temp,c3(i:i+64,1),'normalized')
    c1(i:i+24,1)=c1(i:i+24,1)+c(65:89,1)
    if i==676
       [c,lag]=xcorr(temp,c3(686:750,1),'normalized')
       c1(701:750,1)=c(80:129,1)
    end
end
subplot(8,1,8)
plot(t,c1)
title('channel c3 template matching')















