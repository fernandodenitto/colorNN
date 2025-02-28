addpath(genpath('optprop'));
addpath(genpath('plotFunctions'));
addpath(genpath('interpolation'));
load IS_dataset.mat

%IMPOSTO LA LUNGHEZZA D'ONDA DELLO SPETTRO CHE CI SARA' SEMPRE UTILE
%NELL'UTILIZZO DEL TOOLBOX OPTROP
wavelength=380:800;

%CREO DUE MATRICI DIFFERENTI PER LE COORDINATE LAB ED RGB
coordinatesLab=zeros(3,1269);
coordinatesRGB=zeros(3,1269);

%POPOLO LE MATRICI LAB ED RGB CREATE SOPRA CONVERTENDO GLI SPETTRI DOVE
%LA COLONNA I-ESIMA E' RELATIVA ALLO SPETTRO I-ESIMO
%N.B. NELLE FUNZIONI SI MOLTIPLICA LO SPETTRO PER 100 POICHE' E' %RSFD
%E SI EFFETTUANO LE TRASPOSTE POICHE' LE FUNZIONI DI CONVERSIONE OPERANO SU
%RIGHE E NON SU COLONNE

for i=1:1269 
    coordinatesLab(:,i)=roo2lab(100*spectra(:,i)','D65/2',wavelength)';
    coordinatesRGB(:,i)=roo2rgb(100*spectra(:,i)','srgb',wavelength)';
end

clear i coordinates;   

%SCRIPT PER RIDURRE LA DIMENSIONE DELLA MATRICE DI COLORI MASTER TOGLIENDO
%QUEI COLORI MOLTO SIMILI TRA LORO CIOE' CON UNA DIFFERENZA IN TERMINI DI
%COORDINATE LAB MINORE DI 11

%vettore con gli indici di colonna dei colori da eliminare perche' troppo
%simili tra loro
eliminati=[];  

for i=1:(size(coordinatesLab,2)-1)
    if (de(coordinatesLab(:,i)',coordinatesLab(:,i+1)')<11)
        eliminati=[eliminati i+1];
    end
end

%ASSEGNO LE MATRICI INIZIALI
spectraReducted=spectra;
coordinatesRGBReducted=coordinatesRGB;
coordinatesLabReducted=coordinatesLab;

%RIMUOVO LE COLONNE CHE RAPPRESENTANO COLORI TROPPO SIMILI TRA LORO
spectraReducted(:,eliminati)=[];
coordinatesRGBReducted(:,eliminati)=[];
coordinatesLabReducted(:,eliminati)=[];

clear i eliminati