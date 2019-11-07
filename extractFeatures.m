function extractedFeatures=extractFeatures (interval)
        extractedFeatures=[];
        extractedFeatures = [extractedFeatures mean(interval)]; % mean
        extractedFeatures = [extractedFeatures var(interval)];  % variance
        extractedFeatures = [extractedFeatures median(interval)]; % median
        extractedFeatures = [extractedFeatures min(interval)]; %minimum
        extractedFeatures = [extractedFeatures max(interval)]; %maximum
        extractedFeatures = [extractedFeatures std(interval)]; % standard deviation
end