%get the audio file
[data,fs]=audioread('audio1.mp3');
%get time domain signal for 30 to 40 seconds
datasin = data(:);
mys=data(1:length(datasin)/2);
y = mys(30*fs:40*fs);

%taking fourier transform
X=fft(y)/fs; %devided by fs to get the exact values of amplitude
x=zeros(1,length(X)+1);
x(1:length(X))=X;
X=x;

%generating frequency axis
f=0:(length(y)/2);
f=f/length(y);
f=fs*f;

%making filter to dimnish the audio range
Xfil=ones(1,length(f));
Xfil(f>300)=0;
Xfilk=fliplr(Xfil);
Xfil = [Xfil,Xfilk];
xfinal=X.*Xfil;
s=ifft(xfinal);


%ploting the filtered spectrum
Xf = xfinal(1:length(f));
plot(f,abs(Xf));

%playing the filtered sound
sound(real(s)*fs,fs);