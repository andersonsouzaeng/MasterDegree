function vm=media_movel(v,k)
    %media_movel Calcula a media movel(vm), com k elementos, de um vector v
    % vm=media_movel(v,k))
    n=length(v);
    vm = zeros(length(v)-k+1);
    for i=1:n-k+1,
        vm(i)=mean(v(i:i+k-1));
    end
end