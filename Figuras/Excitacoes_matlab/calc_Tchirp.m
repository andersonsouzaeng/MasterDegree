function Tchirp = calc_Tchirp(Fstart, Fend, chirp_order, L) 
    Tchirp = L*(chirp_order+1)/((chirp_order*Fstart) + Fend);
end