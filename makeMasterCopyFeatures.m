%SCRIPT PER GENERARE LA MATRICE MASTER COPY DELLE CARATTERISTICHE


%Creo la matrice MasterCopy con le Features questa volta disposte per righe
%visto che la dovro' passare alla sequentialfs 

numFeatures=5;
numInterval=10;

masterCopyFeatures=zeros(numInterval*5*2,size(masterCopy,2));

for i=1:size(masterCopy,2)
   masterFeatures=reduceVectorByFeatures(masterCopy(1:421,i),numInterval);
   copyFeatures=reduceVectorByFeatures(masterCopy(422:842,i),numInterval);
   
   masterCopyFeatures(1:50,i)=masterFeatures';
   masterCopyFeatures(51:100,i)=copyFeatures';
   
end

%masterCopyFeatures=zscore(masterCopyFeatures); %normalizzo