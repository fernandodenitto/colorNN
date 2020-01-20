function indexes = notInFuzzy(fuzzyInputs) 
%Questa funzione trova gli indici che scatenano una regola fuzzy
    indexes = [];
    for i = 1 : size(fuzzyInputs,1)
        % If the input does NOT corresponds to a fuzzy rule, take the index  
        if  not((fuzzyInputs(i,1) < 11) || ...
            (fuzzyInputs(i,1) > 11 && fuzzyInputs(i,2) > 50 && (fuzzyInputs(i,3) < 130 && fuzzyInputs(i,3) > 50)  && fuzzyInputs(i,4) > 1.5) || ...
            (fuzzyInputs(i,1) > 11 && fuzzyInputs(i,2) > 50 && (fuzzyInputs(i,3) < 325 && fuzzyInputs(i,3) > 225) && fuzzyInputs(i,4) > 0 && fuzzyInputs(i,4) < 4) || ...
            (fuzzyInputs(i,1) > 11 && fuzzyInputs(i,2) > 50 && (fuzzyInputs(i,3) < 360 && fuzzyInputs(i,3) > 285) && fuzzyInputs(i,4) > 0 && fuzzyInputs(i,4) < 4) || ...
            (fuzzyInputs(i,1) > 11 && fuzzyInputs(i,2) < 50 && fuzzyInputs(i,4) > 0 && fuzzyInputs(i,4) < 4))
            indexes = [indexes; i];
        end
    end
end
