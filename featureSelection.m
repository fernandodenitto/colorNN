x=masterCopyFeatures';
t=deltaE';
opt=statset('display','iter');
[fs,history]=sequentialfs(@criterionNN,x,t,'cv','none','opt', opt,'nfeatures', 6);

function perf = criterionNN(x,t)
%create a network
hiddenLayerSize=5;
net=fitnet(hiddenLayerSize);
xx=x'; tt=t';
% train the network
[net,tr]=train(net,xx,tt);
% test the network
y=net(xx);
perf=perform(net,tt,y);
end