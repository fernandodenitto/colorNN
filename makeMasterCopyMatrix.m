% makeMasterCopyMatrix e' uno script per creare la matrice dei master e
% delle copie distorte. E' possibile chiamarlo cambiando i valori delle
% varibili globali definite all'inizio e bisogna chiamarlo una volta
% caricato il dataset altrimenti non trova le variabili

numCopy=10;
masterMatrix=spectraReducted;
numSamples=size(masterMatrix,2);


%INIZIALIZZO LA MATRICE masteCopy A ZERO: ESSA CONTERRA' NELLE PRIME 421
%RIGHE LO SPETTRO MASTER E NELLE SECONDE 421 LO SPETTRO COPY
masterCopy=zeros(size(masterMatrix,1)*2,numSamples*numCopy);

%RIEMPIO LE PRIME 421 RIGHE CON GLI SPETTRI MASTER IN PARTICOLARE:
%A SECONDA DEL NUMERO DI COPIE (numCopy) DECISO CI SARANNO SI AVRA' UNA
%MATRICE CHE SARA' numCopy VOLTE LA DIMENSIONE DI QUELLA ORIGINALE IN
%TERMINI DI COLONNE. IL NUMERO DI RIGHE RIMANE IL DOPPIO COME SPIEGATO
%NELLO STATEMENT PRECEDENTE

for i=1:numSamples
    for j=1:numCopy
        masterCopy(1:421,(j-1)*numSamples+i)=masterMatrix(:,i);
    end
end

%INIZIALIZZO IL VETTORE CHE CONTIENE PER OGNI COLONNA LA DIFFERENZA IN
%COORDINATE LAB TRA IL MASTER E LA COPIA CHE VERRANNO CREATE NEL CICLO
%SUCCESSIVO
deltaE=zeros(1,size(masterMatrix,2)*numCopy);

%SETTO IL SEED PER LA FUNZIONE RANDOM CHE SARÁ IL FATTORE MOLTIPLICATIVO
%DELLO SPETTRO MASTER PER OTTENERE LO SPETTRO COPY
rng(11);


%PER OGNI SPETTRO MASTER CREO LA COPIA E LA IMMETTRO IN COLONNA CON LO
%SPETTRO MASTER CORRISPONDENTE, DOPO CALCOLO LE LORO COORDINATE Lab E
%IMMETTO LA DIFFERENZA DELTA-E NEL VETTORE CREATO PRECEDENTEMENTE DOVE OGNI
%COLONNA I-ESIMA CONTIENE LA DIFFERENZA LAB DELLO SPETTRO MASTER E COPY
%I-ESIMI DELLA MATRICE MASTER-COPY

for i=1:size(masterMatrix,2)
    
    spectrum=masterMatrix(1:421,i);
    
    for j=1:numCopy
        noise = random ('unif ' ,1 ,1.14);
        copy = spectrum * noise ;
        masterCopy(422:842,(size(masterMatrix,2)*(j-1))+i)=copy;
        lab1=roo2lab(100*spectrum','D65/2',wavelength);
        lab2=roo2lab(100*masterCopy(422:842,(size(masterMatrix,2)*(j-1))+i)','D65/2',wavelength);
        deltaE(1,(j-1)*size(masterMatrix,2)+i)=de(lab1,lab2);
    end 
end

%CON LO STESSO INCOLONNAMENTO DELLA MATRICE MASTER COPY CREO LE MATRICI CHE
%CONTENGONO PER OGNI COLONNA LE COORDINATE LAB E RGB DEI MASTER E DEI COPY
%INCOLONNATI ALLO STESSO MODO DELLA MATRICE MASTERCOPY ORIGINALE (IN QUESTO
%MODO POSSO CALCOLARE LE DIFFERENZE IN MODO PIÙ VELOCE

masterCopyRGB=zeros(6,size(masterCopy,2));
masterCopyLab=zeros(6,size(masterCopy,2));
   
for i=1:size(masterCopy,2)   
    masterCopyRGB(1:3,i)=roo2rgb(100*masterCopy(1:421,i)','srgb',wavelength)';
    masterCopyRGB(4:6,i)=roo2rgb(100*masterCopy(422:842,i)','srgb',wavelength)';
    masterCopyLab(1:3,i)=roo2lab(100*masterCopy(1:421,i)','D65/2',wavelength)';
    masterCopyLab(4:6,i)=roo2lab(100*masterCopy(422:842,i)','D65/2',wavelength)';
end

clear i j lab1 lab2 noise spectrum
