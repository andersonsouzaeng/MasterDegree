function [y,periodo] = gera_mlbs(t,Fclk, Nbits, seed) 
% MLBS
    % Optimal choice of the 
    % clock frequency fc = 2.5/max,
    % with max the maximum frequency of interess
    %p.194 - System Identification - A frequency Domain Approach
    %
    % Examplo do algoritmo para 4 bits - pega o ultimo e o antipenúltimo bit
    %             ___     ___    ___    ___ 
    % Outbit  <-  |3|     |2|    |1|    |0|  
    %             ---     ---    ---    ---
    %              |              |     / \
    %              |             \ /     |
    %              ------------> xor -----
    %
    
    
    %duracao = ((2^NBITS) - 1)*1/FreqClk

    
    
    %F_INTERESSE = 1e3;
    %FREQUENCY_CLK = 2.5*F_INTERESSE;
    FREQUENCY_CLK = 1e3;
    NBITS = 7;
    periodo = ((2^NBITS) - 1)*(1/FREQUENCY_CLK);
    
    dT = t(2)-t(1);
    fs = 1/dT;

    %DURACAO = length(n)*(1/fs);
    % Broadband single cell impedance spectroscopy using maximum length sequences: theoretical
    % analysis and practical considerations
    %frequencia mínima = F_CLK/2^n <- Não está de acordo com as simulações
    %frequencia maxima = F_CLK/2
    
    
    y = zeros(1,length(t));
    
    a = seed;    
    outbit = bitand( bitshift(a,-(Nbits-1)) , 1); % maior bit
   
    
    countClk = 1;    
    for index=1:length(t),
        
        tclk = countClk*(1/Fclk);
        if (t(index) >= tclk)
            countClk = countClk + 1;
            
            bitN7  = bitand( bitshift(a,-(Nbits-1)) , 1); % (a >> 7) & 0x01        
            bitN6  = bitand( bitshift(a,-(Nbits-2)) , 1); % (a >> 6) & 0x01        
            bitN5  = bitand( bitshift(a,-(Nbits-3)) , 1); % (a >> 5) & 0x01        
            bitN4  = bitand( bitshift(a,-(Nbits-4)) , 1); % (a >> 4) & 0x01        
            bitN3  = bitand( bitshift(a,-(Nbits-5)) , 1); % (a >> 3) & 0x01        
            bitN2  = bitand( bitshift(a,-(Nbits-6)) , 1); % (a >> 2) & 0x01        
            bitN1  = bitand( bitshift(a,-(Nbits-7)) , 1); % (a >> 1) & 0x01        
            bitN0  = bitand( bitshift(a,-(Nbits-8)) , 1); % (a >> 0) & 0x01        
            newbit = bitxor( bitN5, bitN7 );
            
            a = bitshift(a, 1); %a = a << 1;
            
            a = bitor (a, newbit);        % a = a || newbit
            outbit = bitN7;                        
        end
        
        y(index) = outbit;
        
        %newbit = bitand( bitxor( a  ,  bitshift(a, -6) ) , 1);
        %a = bitand(  bitor(  bitshift(a, 1), newbit )  , 127);        
        
    end
    
    y = (1 - 2*y);
    %N = length(n); x = -ones(N,1); x(mod([1:N].^2,N)+1) = 1; x(1) = 1;
    %y = x;
    
    
    
    
end