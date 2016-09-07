clc; close all;


ajuste_do_grafico_WORD = [13 241   878   414]; 
ajuste_do_grafico_WORD =[469   248   618   343];

R1 = 47.6;
R2 = 990;

%Medidos com o Hioki configuração V - 1V
C( 1) = 103.45e-12;  %  103.42pF //  8.7M - 100pF
C( 2) = 216.69e-12;  %  216.69pF //   7 M - 220pF
C( 3) = 473.04e-12; % 473.04 pF // 6.9 M - 470pF
C( 4) = 1.02e-9;     %    1.02nF // 370 k - 1nF
C( 5) = 2.06e-9;     %    2.06nF // 180 k - 2.2nF
C( 6) = 4.593e-9;    %   4.593nF // 88.7k - 4.7nF
C( 7) = 9.18e-9;     %   9.18nF // 28.2k - 10 nF
C( 8) = 19.82e-9;    %   19.82nF // 19.4k - 22 nF
C( 9) = 48.75e-9;    %   48.75nF // 7.77k - 47 nF
C(10) = 93.33e-9;    %   93.33nF //   4 k - 100 nF
C(11) = 191.96e-9;   %  191.96nF // 840 ohm - 220 nF
C(12) = 434e-9;      %    434 nF // 533 ohm - 470 nF
C(13) = 833.9e-9;    %   833.9nF // 296 ohm - 1000 nF - measure at geometric media sqrt(1kHz * 1MHz)
C(14) = 2.30e-6;     %   1.34 uF // 5.6 ohm - 2200 nF - 2.30uF //194 k (31.62Hz)
C(15) = 4.33e-6;    %  2.418 uF //2.73 ohm - 4700 nF - 4.33uF // 104.5 k (31.62Hz)

f = 2:0.01:7;
f = 10.^f;

for index = 1: length(C),
    Z = R1 + 1./((1/R2) + (2*pi*1j*f*C(index)));  
    if (index == 8)
        loglog (f, abs(Z),'k', 'linewidth',  4);
    else
        loglog (f, abs(Z),'k', 'linewidth', 1);
    end
    hold on;    
end
%pos = [x y w h]
pos = [1e3 47  1e6-1e3 1047-47];
rectangle('Position',pos, 'lineStyle', '--');
hold off;
ylim ([30 2000]);
xlabel('frequência (Hz)');
ylabel('H(f) (\Omega)');
set(gcf, 'position', ajuste_do_grafico_WORD);

name = 'modulo_phantom';
set(gcf, 'PaperPositionMode', 'auto');
print (gcf, [name '.png'], '-dpng');
saveas(gcf, [name '.fig']);



figure ();
for index = 1: length(C),
    Z = R1 + 1./((1/R2) + (2*pi*1j*f*C(index)));    
    if (index == 8)
        semilogx (f, angle(Z)*180/pi,'k', 'linewidth', 4);
    else
        semilogx (f, angle(Z)*180/pi,'k', 'linewidth', 1);
    end
    hold on;    
end
pos = [1e3 -65.7  1e6-1e3 +65.7];
rectangle('Position',pos, 'lineStyle', '--');
xlabel('frequência (Hz)');
ylabel(' \theta(f) (º)');

set(gcf, 'position', ajuste_do_grafico_WORD);
name = 'fase';
set(gcf, 'PaperPositionMode', 'auto');
print (gcf, [name '.png'], '-dpng');
saveas(gcf, [name '.fig']);

