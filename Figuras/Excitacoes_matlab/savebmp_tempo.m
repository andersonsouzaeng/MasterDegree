function savebmp_tempo(t,y,percentToPlot,name)


h = figure;
set(h,'color', [1 1 1]);
set(h,'position', [1001         490         292         199]);

fs = 1/(t(2) - t(1));

regiao_plot = [1:fix(t(end)*fs*percentToPlot)];
plot(t(regiao_plot)*1e3, y(regiao_plot),'k','LineWidth',1);
%plot(t*1e3, y,'k','LineWidth',1);
%axis off;
set(get(h,'CurrentAxes'), 'box', 'off');
xlabel('t (ms)');
ylabel('Amplitude');

print(h,'-dbitmap',['.\Tempo\' name '.bmp']);


end
