%SCRIPT PER RIDURRE LA DIMENSIONE DELLA MATRICE DI COLORI MASTER TOGLIENDO
%QUEI COLORI MOLTO SIMILI TRA LORO CIOE' CON UNA DIFFERENZA IN TERMINI DI
%COORDINATE LAB MINORE DI 9

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

clear i 
