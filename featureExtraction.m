%Features che si vogliono estrarre
numFeaturesToExtract=4;

%Matrice che viene riempita con le features estratte per ogni iterazione
%dove la riga i-esima contiene le features estratte nell'iterazione i-esima
%(ricordare però che nella matrice MasterCopy queste features rappresentano
%le righe in quanto le colonne sono gli spettri di colori
featuresExtractedMatrix=[];

numMaxIterations=8; %Settare a piacimento per esperimenti

for i=1:8

x=masterCopyFeatures';
t=deltaE';
opt=statset('display','iter');
[fs,history]=sequentialfs(@criterionNN,x,t,'cv','none','opt', opt,'nfeatures', numFeaturesToExtract);

featuresExtractedMatrix=[featuresExtractedMatrix; find(fs>0)]

end

%vettore che rappresenta le 4 features più estratte calcolate per righe
featuresExtracted=mode(featuresExtractedMatrix,1);

clear numMaxIterations x t opt fs history featuresExtractedMatrix

function perf = criterionNN(x,t)
%create a network
hiddenLayerSize=3;
net=fitnet(hiddenLayerSize);
xx=x'; tt=t';
% train the network
[net,tr]=train(net,xx,tt);
% test the network
y=net(xx);
perf=perform(net,tt,y);
end

