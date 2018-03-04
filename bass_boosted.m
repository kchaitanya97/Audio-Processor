%get the audio file
[data,fs]=audioread('audio1.mp3');
%get time domain signal for 30 to 40 seconds
datasin = data(:);
mys=data(1:length(datasin)/2);
y = mys(30*fs:40*fs);
Y = fft(y)/fs;

%making a low pass filter
x = zeros(1,length(y));
x(1:300) = 1;
%convolve it with original sound
final = conv(y,x);
final = final(1:length(final)/2+1);
X = fft(final)/(fs*110);

%plot the magnitude spectrum of signals
f=0:length(y)/2;
f=f/length(y);
f=fs*f;
subplot(1,2,1)
Xf = X(1:length(f));
plot(f,abs(Xf));
title('bass boosted');
subplot(1,2,2)
Yf = Y(1:length(f));
plot(f,abs(Yf));
title('normal');

%sound
sound(final/110,fs);