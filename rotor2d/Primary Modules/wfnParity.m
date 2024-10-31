function parity = wfnParity(wfnGrid,Nbasis,Ngrid)

wfnPhiTheta = reshape(wfnGrid,[Nbasis,Ngrid,Ngrid]);
wfnNoPBC=wfnPhiTheta(:,2:end,:);
wfnFlipTheta=flipdim(wfnNoPBC,2);
mid=ceil(size(wfnFlipTheta,3)/2);
wfnNoPBCexchange=cat(3,wfnFlipTheta(:,:,mid+1:end), wfnFlipTheta(:,:,1:mid));
s1=sum(sum(abs(wfnNoPBC-wfnNoPBCexchange),2),3); 
s2=sum(sum(abs(wfnNoPBC+wfnNoPBCexchange),2),3);
parity=(s1<s2)*2-1;
