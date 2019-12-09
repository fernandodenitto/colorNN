maxHiddenNeurons=5;
numRipetizioni=10;

masterCopyFeaturesSel=masterCopyFeatures([1 7 16 22],:);

% Nella tabella riepilogativa nella prima colonna ci saranno scritti il
% numero di neuroni con il quale facciamo il training della rete. Le altre
% colonne sono pari al TRIPLO del numero di ripetizioni N. Nelle prime N ci
% saranno per ogni ripetizione in coefficiente di regressione della i-esima
% iterazione. Nelle seconde N c'e'il MSE. Nelle terze N invece ci sarà il tempo di esecuzione del
% training che ovviamente dipende dalla macchina ma comunque è un buon
% indice per scegliere il numero di neuroni nascosti da usare. 
% Questi numeri saranno usati per poter disegnare un box plot ed una
% tabella riepilogativa con le medie dei valori trovati per decidere il
% numero di neuroni nascosti da adottare nella rete finale

tabellaRiepilogativa=zeros(maxHiddenNeurons,1+(numRipetizioni*3));

tabellaRiepilogativaPerc=zeros(maxHiddenNeurons,4);

for numHiddenNeurons=1:maxHiddenNeurons
    
    %Metto nella prima colonna della riga il numero di neuroni nascosti
    %che stiamo considerando per questo training
    tabellaRiepilogativa(numHiddenNeurons,1)=numHiddenNeurons;
    
    for j=1:numRipetizioni
    
        
    tic
    [regression,mse]=performNN(masterCopyFeaturesSel,deltaE,'trainlm',numHiddenNeurons);
    
    tabellaRiepilogativa(numHiddenNeurons,1+j)=regression;
    tabellaRiepilogativa(numHiddenNeurons,1+numRipetizioni+j)=mse;
    tabellaRiepilogativa(numHiddenNeurons,1+numRipetizioni*2+j)=toc;
    
    
    end
    
    tabellaRiepilogativaPerc(numHiddenNeurons,1)=numHiddenNeurons;
    tabellaRiepilogativaPerc(numHiddenNeurons,2)=mean(tabellaRiepilogativa(numHiddenNeurons,2:11));
    tabellaRiepilogativaPerc(numHiddenNeurons,3)=mean(tabellaRiepilogativa(numHiddenNeurons,12:21));
    tabellaRiepilogativaPerc(numHiddenNeurons,4)=mean(tabellaRiepilogativa(numHiddenNeurons,22:31));

end
