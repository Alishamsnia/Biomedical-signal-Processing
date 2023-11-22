t4=load ('eeg2-t4.dat')
t3=load ('eeg2-t3.dat')
p4=load ('eeg2-p4.dat')
p3=load ('eeg2-p3.dat')
o2=load ('eeg2-o2.dat')
o1=load ('eeg2-o1.dat')
f4=load ('eeg2-f4.dat')
f3=load ('eeg2-f3.dat')
c4=load ('eeg2-c4.dat')
c3=load ('eeg2-c3.dat')
fs=100
t=0:0.01:2.29
figure('Name','channel name')
subplot(5,2,1)
plot(t,t4)
title('t4')
subplot(5,2,2)
plot(t,t3)
title('t3')
subplot(5,2,3)
plot(t,p4)
title('p4')
subplot(5,2,4)
plot(t,p3)
title('p3')
subplot(5,2,5)
plot(t,o2)
title('o2')
subplot(5,2,6)
plot(t,o1)
title('o1')
subplot(5,2,7)
plot(t,f4)
title('f4')
subplot(5,2,8)
plot(t,f3)
title('f3')
subplot(5,2,9)
plot(t,c4)
title('c4')
subplot(5,2,10)
plot(t,c3)
title('c3')
%in template matching graph (c3) at time=0.5 is 1 that shows that our
%caculation is correct
temp=c3(56:80,1)
t1=0:0.01:0.24
figure('Name','sample')     %this figure shows my sample 
subplot(1,2,1)
plot(t1,temp)
subplot(1,2,2)
spectrogram(c3,128,120,128,fs,'yaxis')
c1=zeros(230,1)
figure('Name','result of template matching')
for i=1:5:210               %my sweeping steps are so close so the graph is more crooked
    [c,lag]=xcorr(temp,t4(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,t4(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,1)
plot(t,c1)
title('channel t4 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,t3(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,t3(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,2)
plot(t,c1)
title('channel t3 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,p4(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,p4(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,3)
plot(t,c1)
title('channel p4 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,p3(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,p3(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,4)
plot(t,c1)
title('channel p3 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,o2(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,o2(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,5)
plot(t,c1)
title('channel o2 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,o1(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,o1(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,6)
plot(t,c1)
title('channel o1 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,f4(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,f4(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,7)
plot(t,c1)
title('channel f4 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,f3(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,f3(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,8)
plot(t,c1)
title('channel f3 template matching')  
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,c4(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,c4(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,9)
plot(t,c1)
title('channel c4 template matching')
c1=zeros(230,1)
for i=1:5:210
    [c,lag]=xcorr(temp,c3(i:i+24,1),'normalized')
    c1(i:i+4,1)=c1(i:i+4,1)+c(25:29,1)
    if  i==206
        [c,lag]=xcorr(temp,c3(206:230,1),'normalized')
        c1(211:230,1)=c(30:49,1)
    end
end
subplot(5,2,10)
plot(t,c1)
title('channel c3 template matching')
