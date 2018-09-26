clear ; close all; clc
graphics_toolkit('fltk');

try
    data = load('data.txt');
    rating = data(:,1);
    features = data(:,2:end);
    
    durationNormalized = featureNormalize(features(:,1));
    features(:,1) = durationNormalized;

    K = 54;

    randomIndexes = randperm(rows(features));
    randomK = features(randomIndexes(1:K),:);


    pause
catch ME
  ME
  pause
end    