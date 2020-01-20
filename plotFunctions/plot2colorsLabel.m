%  QUESTA FUNZIONE STAMPA DUE COLORI sRGB (color1,color2)
%  I DUE COLORI DEVONO ESSERE FORNITI COME TRIPLE RGB IN COLONNA

function plot2colorsLabel(color1,color2,label)

Map = [color1;color2];
squareMap=zeros(2,2);
squareMap(:,2)=1;
figure('Name','Differences in Colors','NumberTitle','off');
colormap(Map);
imagesc(squareMap);
set(gca,'xticklabel',{[]});
set(gca,'yticklabel',{[]}); 

xlabel(label);

end