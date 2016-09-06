function savebmp_PSD(y,fs,name)

h_Syy = figure;
set(h_Syy,'color', [1 1 1]);
set(h_Syy,'position', [409   431   575   256]);
[Syy, f] = calc_psd(y,fs);

%semilogx(f(1:length(f)-4+1), media_movel(Y_modulo,4),'k','LineWidth',1);
%semilogx(f, Y_modulo,'k','LineWidth',1);
plot(f, Syy,'k','LineWidth',1);
xlim([0 500e3]);
grid;
xlabel('f (Hz)');
ylabel('Densidade Espectral de Potência');

h_Syy_dB = figure;
set(h_Syy_dB,'color', [1 1 1]);
set(h_Syy_dB,'position', [410    88   575   256]);
semilogx(f, 20*log10(Syy),'k','LineWidth',1);
%plot(f, (Y_modulo),'k','LineWidth',1);
grid;
%xlim([0 2e5]);
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB)');

print(h_Syy,'-dbitmap',['.\PSD\' name '.bmp']);
print(h_Syy_dB,'-dbitmap',['.\PSDdB\' name '.bmp']);

end
