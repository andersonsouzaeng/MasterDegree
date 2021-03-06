function savebmp_fft(y,fs,name)
tamanho = size(y);
isMatrix = tamanho(1);
if (isMatrix)
    h_fft = figure;
    set(h_fft,'color', [1 1 1]);
    set(h_fft,'position', [409   431   575   256]);
    [Y, f] = calc_fft(y,fs);
    Y_modulo = abs(Y(1:fix(length(Y)/2) + 1) );
    clear Y;
    %semilogx(f(1:length(f)-4+1), media_movel(Y_modulo,4),'k','LineWidth',1);
    %semilogx(f, Y_modulo,'k','LineWidth',1);
    plot(f, Y_modulo,'.-k','LineWidth',1);
    xlim([0 25e3]);
    grid;
    xlabel('Frequência (Hz)');
    ylabel('Magnitude');

    h_fft_dB = figure;
    set(h_fft_dB,'color', [1 1 1]);
    set(h_fft_dB,'position', [410    88   575   256]);
    semilogx(f, 20*log10(Y_modulo),'k','LineWidth',1);
    %plot(f, (Y_modulo),'k','LineWidth',1);
    grid;
    xlim([1e1 1e7]);
    xlabel('Frequência (Hz)');
    ylabel('Magnitude (dB)');

    print(h_fft,'-dbitmap',['.\DFT\' name '.bmp']);
    print(h_fft_dB,'-dbitmap',['.\DFTdB\' name '.bmp']);
else
    h_fft = figure;
    set(h_fft,'color', [1 1 1]);
    set(h_fft,'position', [409   431   575   256]);
    hold on;
    for index = 1:tamanho,
        [Y, f] = calc_fft(y(index,:),fs);
        Y_modulo = abs(Y(1:fix(length(Y)/2) + 1) );
        clear Y;
        %semilogx(f(1:length(f)-4+1), media_movel(Y_modulo,4),'k','LineWidth',1);
        %semilogx(f, Y_modulo,'k','LineWidth',1);
        
        plot(f, Y_modulo,'k','LineWidth',1);
        xlim([0 500e3]);
        grid;
        xlabel('Frequência (Hz)');
        ylabel('Magnitude');
    end
    hold off;
    
    h_fft_dB = figure;
    set(h_fft_dB,'color', [1 1 1]);
    set(h_fft_dB,'position', [410    88   575   256]);
    hold on;    
    for index = 1:tamanho,
        semilogx(f, 20*log10(Y_modulo),'k','LineWidth',1);
        %plot(f, (Y_modulo),'k','LineWidth',1);
        grid;
        %xlim([0 2e5]);
        xlabel('Frequência (Hz)');
        ylabel('Magnitude (dB)');
    end
    hold off;
    print(h_fft,'-dbitmap',['.\DFT\' name '.bmp']);
    print(h_fft_dB,'-dbitmap',['.\DFTdB\' name '.bmp']);
end

end
