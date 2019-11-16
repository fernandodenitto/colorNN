addpath(genpath('../'));


%SCRIPT PER GENERARE LA BONTA DELLE INTERPOLAZIONI
%Lo script interpola ogni singolo spettro di colore master con lo stesso
%suddivisi con lo stesso numero di intervalli e calcola per ognuno l'errore
%quadratico medio. Infine fa la media degli errori per capire l'ordine di
%grandezza in cui ci troviamo. Come risultato avremo una matrice che ci
%fornisce per ogni numero di intervalli scelto la media degli errori
%quadratici medi.

rangeIntervals=2:30; 
matrix=spectraReducted;
resultsMSE=zeros(rangeIntervals(end),size(matrix,2)+1);
averageMSE=zeros(length(rangeIntervals),2);

for j=1:length(rangeIntervals)
    
    %SCRIVO NELLA PRIMA COLONNA IL NUMERO DI INTERVALLI IN QUI DIVIDIAMO LO
    %SPETTRO PER INTERPOLARLO
    resultsMSE(j,1)=rangeIntervals(j);
    
    %OGNI RIGA I-ESIMA, DALLA SECONDA COLONNA CONTIENE IL VALORE MSE
    %OTTENUTO CONFRONTANDO LO SPETTRO ORIGINALE CON QUELLI INTERPOLATO DOPO
    %CHE HO DIVISO LO SPETTRO ORIGINALE IN I INTERVALLI E AVER CALCOLATO LA
    %MEDIA PER OGNI INTERVALLO
    
    for i=1:size(spectraReducted,2)
        resultsMSE(j,i+1)=interpMse(spectraReducted(:,i),wavelength,rangeIntervals(j),false); 
    end
    
    %PRODUCO LA MATRICE CON LA MEDIA DEGLI ERRORI MSE PER AVERE UN ORDINE
    %DI GRANDEZZA GENERALE DELL'ERRORE MEDIO CHE SI OTTIENE DIVIDENDO GLI
    %SPETTRI IN N INTERVALLI ED INTERPOLANDO (IN PRATICA FACCIO LE MEDIE
    %DEGLI MSE PER OGNI NUM DI INTERVALLO DIVERSO)
    
    averageMSE(j,1)=rangeIntervals(j);
    averageMSE(j,2)=mean(resultsMSE(j,2:length(resultsMSE)));
    
end







