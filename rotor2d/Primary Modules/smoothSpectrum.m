function smtSpec = smoothSpectrum(rawSpec,freq,df);

  dim = size(rawSpec,2)-1;
  
  %bin spectrum
  binSpec = [];
  [N,idx]=histc(rawSpec(:,1),freq);
  for fr = 1:max(idx),
    intens = sum(rawSpec(idx==fr,2:end),1);
    binSpec = [binSpec; [freq(fr), intens]];
  end
  
  %smooth spectrum
  smtSpec(:,1) = binSpec(:,1);
  smtSpec(:,2:dim+1) = zeros(size(binSpec,1),dim);
  for fr = 1:max(idx),
    smtSpec(:,2:end) += repmat(binSpec(fr,2:end),[max(idx),1,1]).*exp(-(repmat(binSpec(:,1),[1,dim])-repmat(binSpec(fr,1),[max(idx),dim])).^2/(2*(df.^2)));
  end
  
end