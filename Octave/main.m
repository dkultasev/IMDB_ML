clear ; close all; clc
graphics_toolkit('fltk');

try
    data = load('data.txt');
    rating = data(:,1);
    features = data(:,2:end);
    k = 15;
    
    
    durationNormalized = featureNormalize(features(:,1));
    yearCodeNormalized = featureNormalize(features(:,2));
    features(:,1) = durationNormalized;
    features(:,2) = yearCodeNormalized;

    cinemaIndex = int8(rand(1)*rows(features)/2);
    cinemaRating = rating(cinemaIndex);
    cinema = features(cinemaIndex,:);

    euclidian = sqrt(sum((features.-cinema).^2, 2));

    euclidianRatings = [rating euclidian];

    #skipping first row as it always be the same film as it was taken from the same subset

    sortedDistancesWithRatings = sortrows(euclidianRatings, 2);
    
    cinemaRating
    calculatedRating = mean(sortedDistancesWithRatings(2:k+1,1))
    
    

    

    #euclidian = vecnorm(features, duplicatedSingleFeature)

    
    
    
    #randomIndexes = randperm(rows(features));
    #randomK = features(randomIndexes(1:K),:);

    "FINISH"
    pause
catch ME
  ME
  pause
end    