function y = gera_chirp(t,Fstart, Fend, chirp_order, L) 

% Chirp 

  if ~exist('Fstart','var') Fstart = 1e3; end;
  if isempty(Fstart) Fstart = 1e3; end;
  if ~exist('Fend','var') Fend = 1e6; end;
  if isempty(Fend) Fend = 1e6; end;
  if ~exist('L','var') L = 500; end;
  if isempty(L) L = 500; end;

    Tchirp = L*(chirp_order+1)/((chirp_order*Fstart) + Fend);
    k = (Fend-Fstart)/Tchirp;
        
    y = zeros(1,length(t));
    %y = chirp((n/fs), Fstart, DURACAO, Fend, 'linear').*(degrau(n, fs, 0) - degrau(n, fs, DURACAO) );
    y = sin(2*pi*((Fstart*t) + ((k/2)*(t.^2)) ));
    
    
end