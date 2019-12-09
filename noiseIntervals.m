% SCRIPT PER CAPIRE QUALE INTERVALLO DI RUMORE UTILIZZARE PER AVERE UNA
% PERCENTUALE PLAUSIBILE DI VALORE DELTA-E IN MAGGIORI DI 5

% L'IDEA E' QUELLA DI CERCARE UN INTERVALLO DI VALORI PER IL RUMORE CHE VADA
% DA UN FATTORE PARI A 1 (ASSENZA DI RUMORE) AD UN FATTORE X TALE PER CUI
% I VALORI RELATIVI ALLA DIFFERENZA DI MASTER COPY, IN COORDINATE LAB,
% MAGGIORE DI 5 (VALORE PER CUI I DUE COLORI SONO DIVERSI) SIA UNA
% PERCENTUALE BASSA. SI SUPPONE CHE IN PROCESSO INDUSTRIALE SIA MINORE
% DELL'1%.
% N.B. Una differenza in termini di coordinate LAB maggior di 5 significa
% che siamo di fronte a colori differenti

step=0.01; %passo 
numCopy=10; %numero di copie
numMasters=size(spectraReducted,2); %numero dei master


matrixSpectra=spectraReducted; %inizializzo in questo modo cosi' poi posso
...cambiare matrice di riferimento semplicemente cambiando assegnamento

%CREAZIONE DELLA MATRICE masterCopyExp

%inizializzo
masterCopyExp=zeros(size(matrixSpectra,1)*2,size(matrixSpectra,2));
%tramite un ciclo immetto gli spettri master

for i=1:numMasters
    for j=1:numCopy
        masterCopyExp(1:421,(j-1)*numMasters+i)=spectraReducted(:,i);
    end
end

% matrice che ha nella prima colonna il massimo rumore e nella secondala
% percentuale di valore di deltaLab tra masterCopyExp maggiori di 5
percentageAtSteps=zeros(size(1.10:step:1.20,2),6);
riga=1;

rng(18);


for boundNoise=1.10:step:1.20
     
    
    for i=1:size(matrixSpectra,2)

        spectrum=spectraReducted(1:421,i);
        
        for j=1:numCopy
            noise = random ('unif ' ,1 ,boundNoise);
            boundNoise;
            copy = spectrum * noise ;
            masterCopyExp(422:842,(size(matrixSpectra,2)*(j-1))+i)=copy;
            lab1=roo2lab(100*spectrum','D65/2',wavelength);
            lab2=roo2lab(100*masterCopyExp(422:842,(size(matrixSpectra,2)*(j-1))+i)','D65/2',wavelength);
            deltaE(1,(j-1)*size(matrixSpectra,2)+i)=de(lab1,lab2);
        end 
    end
    
    percentageAtSteps(riga,1)=boundNoise;
    percentageAtSteps(riga,2)=size(find(deltaE>0 & deltaE<1),2)/(size(masterCopyExp,2));
    percentageAtSteps(riga,3)=size(find(deltaE>=1 & deltaE<2),2)/(size(masterCopyExp,2));
    percentageAtSteps(riga,4)=size(find(deltaE>=2 & deltaE<3.5),2)/(size(masterCopyExp,2));
    percentageAtSteps(riga,5)=size(find(deltaE>=3.5 & deltaE<5),2)/(size(masterCopyExp,2));
    percentageAtSteps(riga,6)=size(find(deltaE>5),2)/(size(masterCopyExp,2));
    riga=riga+1;
   
end

clear i j riga step lab1 lab2 noise spectrum boundNoise copy matrixSpectra
