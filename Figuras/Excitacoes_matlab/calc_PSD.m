function [Sxx freq] = calc_PSD(x,fs)
    Rxx = xcorr(x,'biased');
    Sxx = abs(fftshift(2*fft(Rxx)/length(Rxx)));
    freq = -fs/2:fs/length(Rxx):fs/2-(fs/length(Rxx));
end

