%   Funzione per tracciare il grafico di uno spettro e il grafico dello
%   spettro con caratteristiche aggregate

function plotFeatures(spectra,numIntervals,wavelength)

    %Traccia il grafico dello spettro originale
    plot(wavelength,spectra,'b-');
    hold on
    %Traccia il grafico dello spettro aggregato
    xSplit=xAxisAggregate(wavelength,numIntervals);

    %estraggo le caratteristiche dello spettro ricordando che il risultato
    %della funzione restituisce una matrice che ha un numero di colonne
    %pari al numero di intervalli e come righe le rispettive features nello
    %stesso ordine di come sono state implementate
    aggSpectra=reduceVectorByFeatures(spectra,numIntervals);

    intervalLength=round(length(wavelength)/numIntervals);
    
    meanVector=aggSpectra(1,:);
    medianVector=aggSpectra(2,:);
    maxVector=aggSpectra(3,:);
    minVector=aggSpectra(4,:);
    varianceVector=aggSpectra(5,:);
    stdVector=aggSpectra(5,:);
   
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