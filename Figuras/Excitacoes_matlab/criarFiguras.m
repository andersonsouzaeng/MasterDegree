clear;clc;close all;

fs = 500e3;

if (~isdir('Tempo')), mkdir('Tempo'); end,
if (~isdir('DFT')),   mkdir('DFT');   end,
if (~isdir('DFTdB')), mkdir('DFTdB'); end,
if (~isdir('PSD')), mkdir('PSD'); end,
if (~isdir('PSDdB')), mkdir('PSDdB'); end,

% imprime Chirp
    %Fstart =0;
    %Fend = 100e3;
    %chirp_order = 1;
    %L = 1000;
    %t_chirp = [0:1/fs: calc_Tchirp(Fstart, Fend, chirp_order, L) ];
    %y_chirp = gera_chirp(t_chirp,Fstart, Fend, chirp_order, L);
 
     %str = sprintf('_Fstart=%.0f_Fend=%.0f_L=%.0f_Duracao=%.2fms',Fstart,Fend,L,t_chirp(end)*1e3);
     %savebmp_tempo(t_chirp,y_chirp, 1,['chirp_' str]);
     %savebmp_fft(y_chirp, fs,['chirp_' str]);
     %savebmp_psd(y_chirp, fs,['chirp_' str]);

% imprime chirp binaria
     %t_bchirp = t_chirp;
     %y_bchirp = sign( y_chirp );
     %RUIDO -> y_bchirp = y_bchirp + wgn(1,length(t_bchirp), -20);
 
     %str = sprintf('_Fstart=%.0f_Fend=%.0f_L=%.0f_Duracao=%.2fms',Fstart,Fend,L,t_bchirp(end)*1e3);
     %savebmp_tempo(t_bchirp,y_bchirp, 1,['bchirp' str]);
     %savebmp_fft(y_bchirp, fs,['bchirp' str]);
     %savebmp_psd(y_bchirp, fs,['bchirp' str]);
     
     
% imprime chirp ternaria
%     alfa = 30;
%     
%     t_tchirp = t_chirp;
%     y_tchirp = gera_tchirp(t_tchirp,Fstart, Fend, chirp_order, L, 22.5);
%         
%     str = sprintf('_Fstart=%.0f_Fend=%.0f_L=%.0f_Duracao=%.2fms',Fstart,Fend,L,t_tchirp(end)*1e3);
    %savebmp_tempo(t_tchirp,y_tchirp, 1,['tchirp' str]);
    %savebmp_fft(y_tchirp, fs,['tchirp' str]);
    %savebmp_psd(y_tchirp, fs,['tchirp' str]);
    
% imprime MLBS
%     nbits = 7;
%     fclk = 100e3;
%     seed = 3;
%     
%     t_mlbs = [0:1/fs: 1*calc_Tmlbs(nbits, fclk)];
%     y_mlbs = gera_mlbs(t_mlbs,fclk,nbits, seed);
%     
%     str = sprintf('_Fclk=%.0f_nbits=%.0f_seed=%.0f_duracao=%.2fms',fclk,nbits,seed,t_mlbs(end)*1e3);
%     savebmp_tempo(t_mlbs,y_mlbs, 1,['mlbs__' str]);
%     savebmp_fft(y_mlbs, fs,['mlbs__' str]);
    
% % imprime Degrau
      t_degrau = [0:1/fs:10e-3];
      y_degrau = ones(1,length(t_degrau));
      %y_degrau(1: find(t_degrau == 0) - 1) = zeros(1, find(t_degrau == 0)-1);
      %y_degrau(end-(length(t_degrau)/2)+1:end) = 0;
      y_degrau(1:(length(t_degrau)/2)) = 0;
      
      str = sprintf('_Duracao=%.2fms',t_degrau(end)*1e3);
      savebmp_tempo(t_degrau,y_degrau, 1,['degrau' str]);
      savebmp_fft(y_degrau, fs,['degrau' str]);
      %savebmp_psd(y_degrau, fs,['degrau' str]);
% % imprime senoidal
%      ciclos = 10;
%      f = 10e3;
%      t_sin = [0:1/fs:(1/f)*ciclos-(1/fs) ];
%      y_sin = sin (2*pi*f*t_sin);     
% 
%      str = sprintf('_f=%.2Hz_Duracao=%.2 fms', f, t_sin(end)*1e3);
%      savebmp_tempo(t_sin,y_sin, 1,['sin' str]);
%      savebmp_fft(y_sin, fs,['sin' str]);
