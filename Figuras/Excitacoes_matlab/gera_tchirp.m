function y = gera_tchirp(t,Fstart, Fend, chirp_order, L, alfa) 

% Chirp 

  if ~exist('Fstart','var'), Fstart = 1e3; end;
  if isempty(Fstart), Fstart = 1e3; end;
  if ~exist('Fend','var'), Fend = 1e6; end;
  if isempty(Fend), Fend = 1e6; end;
  if ~exist('L','var'), L = 500; end;
  if isempty(L), L = 500; end;
  if ~exist('chirp_order','var'), chirp_order = 500; end;
  if isempty(chirp_order), chirp_order = 500; end;
  if ~exist('alfa','var'), alfa = 30; end;
  if isempty(alfa), alfa = 30; end;

    Tchirp = L*(chirp_order+1)/((chirp_order*Fstart) + Fend);
    k = (Fend-Fstart)/Tchirp;
        
    alfa = alfa*pi/180;
    y = zeros(1,length(t));
    for index = 1:length(t)
        
        fase_atual = (2*pi*((Fstart*t(index)) + ((k/2)*(t(index)^2)) ));
        fase_atual = mod(fase_atual,2*pi);
        if ((fase_atual >= alfa) && (fase_atual <= (pi - alfa)))
            y(index) = 1;
        elseif ((fase_atual >= (pi + alfa)) && (fase_atual <= ((2*pi) - alfa)))
            y(index) = -1;    
        end
    end
    
    
end