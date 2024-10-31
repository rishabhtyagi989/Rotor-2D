function statistics = specConcen(engLevels,rotWfnPar,molName,Temp,P)
 
  statistics = [];

  for T = 0.01:0.01:Temp,
    engDiffs = real(engLevels-engLevels(1))+0.00000001;
    if (molName == 'H2'),
      Zpara = sum(1*exp(-engDiffs(rotWfnPar==1)/T)); %even J
      Zorto = sum(3*exp(-engDiffs(rotWfnPar==-1)/T)); %odd J
      Epara = sum(1*exp(-engDiffs(rotWfnPar==1)/T).*engDiffs(rotWfnPar==1))./Zpara; %even J
      Eorto = sum(3*exp(-engDiffs(rotWfnPar==-1)/T).*engDiffs(rotWfnPar==-1))./Zorto; %odd J
    end
    if (molName == 'D2'),
      Zpara = sum(6*exp(-engDiffs(rotWfnPar==-1)/T)); %odd J
      Zorto = sum(3*exp(-engDiffs(rotWfnPar==1)/T)); %even J
      Epara = sum(6*exp(-engDiffs(rotWfnPar==-1)/T).*engDiffs(rotWfnPar==-1))./Zpara; %odd J
      Eorto = sum(3*exp(-engDiffs(rotWfnPar==1)/T).*engDiffs(rotWfnPar==1))./Zorto; %even J
    end
    Ztotal = Zpara+Zorto;
    Etotal = (Epara*Zpara+Eorto*Zorto)/Ztotal;
    statistics = [statistics; [P, T, Zpara, Zorto, Ztotal, Epara, Eorto, Etotal]];
  end
 
end