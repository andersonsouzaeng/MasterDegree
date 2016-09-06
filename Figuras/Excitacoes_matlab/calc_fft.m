function [Y,f ] = calc_fft(y, fs)

%NFFT = 2^nextpow2(length(n));
NFFT = length(y);

f = fs/2*linspace(0,1,NFFT/2+1);
%f = (0:NFFT-1)*(fs/NFFT);  % Frequency range


%w = hanning( length(y) );

%y = (w').*y;

Y = 2.*fft(y, NFFT)./NFFT;

end