%   FUNZIONE PER TRACCIARE IL GRAFICO DI UNO SPETTRO E LE RELATIVE FEATURES
%   PER OGNI INTERVALLO

function plotFeatures(spectra,numIntervals,wavelength)

    %Traccia il grafico dello spettro originale
    plot(wavelength,spectra,'b-');
    hold on
    %Traccia il grafico dello spettro aggregato
    xSplit=xAxisAggregate(wavelength,numIntervals);

    
    %PRENDO LE 5 CARATTERISTICHE DELLO SPETTRO
    aggSpectra=reduceVectorByFeatures(spectra,numIntervals);
    
    %METTO LE CARATTERISTICHE IN RIGA CIOÉ LA PRIMA RIGA CONTIENE LA MEDIA
    %LA SECONDA LA MEDIANA E COSI VIA. CI SARANNO numIntervals COLONNE
    %PER OGNI RIGA CONTENENTI IL VALORE DELLA FEATURE CORRISPONDERE PER
    %OGNI INTERVALLO I-ESIMO NELLA RIGA I-ESIMA
    aggSpectra=reshape(aggSpectra,[5,numIntervals]);
    
    
    %A QUESTO PUNTO PER CREARE I VETTORI DELLE CARATTERISTICHE BASTA
    %ASSEGNARE LE RIGHE DEL VETTORE aggSpectra SEGUENDO L'ORDINE
    %SPECIFICATO NEL PROGETTO
    meanVector=aggSpectra(1,:);
    medianVector=aggSpectra(2,:);
    maxVector=aggSpectra(3,:);
    minVector=aggSpectra(4,:);
    varianceVector=aggSpectra(5,:);
   
    plot(xSplit,meanVector,'r *');
    plot(xSplit,medianVector,'g o');
    plot(xSplit,maxVector,'y x');
    plot(xSplit,minVector,'m s');
    plot(xSplit,varianceVector,'b x');
 
    %ylim([0 1])
    xlim ([wavelength(1) wavelength(end)])  
    legend('Original Spectra','Mean','Median','Max','Min','variance','Location','northeast')
    xlabel('wavelenght');
    ylabel('% reflection');
    
end