function periodo = calc_Tmlbs(NBITS, FREQUENCY_CLK) 
   periodo = ((2^NBITS) - 1)*(1/FREQUENCY_CLK);
end