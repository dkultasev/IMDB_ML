clear ; close all; clc
graphics_toolkit('fltk');

try
    data = load('data.txt');
    rating = data(:,1);
    features = data(:,2:end);
    
    durationNormalized = featureNormalize(features(:,1));
    features(:,1) = durationNormalized;

    features
    
    












    pause
catch ME
  ME
  pause
end    