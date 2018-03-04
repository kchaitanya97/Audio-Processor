%get the audio file
[data,fs]=audioread('audio1.mp3');
%get time domain signal for 30 to 40 seconds
datasin = data(:);
mys=data(1:length(datasin)/2);
mys=mys';
y = mys(30*fs:40*fs);
%taking fourier transform
X=fft(y)/fs; %devided by fs to get the exact values of amplitude

%generating frequency axis
f=0:length(y)/2; %to eliminate redundant data
f=f/length(y); %to get normalised frequency
f=fs*f; %to get exact frequency

%ploting magnitude spectrum
Xf = X(1:length(f));
plot(f,abs(Xf));

%to run at normal speed
sound(y,fs);

%to run at 0.5x speed
%sound(y,0.5*fs);

%to run at 2x speed
%sound(y,2*fs);

%to run in reverse
%x = zeros(1,length(y));
%x(1)=1; %impulse
%k=xcorr(x,y);
%sound(k,fs);