clear ; close all; clc
graphics_toolkit('fltk');

try

    data = load('data.txt');
    test_data = load('test.txt');
    
    rating = data(:,1);
    test_rating = test_data(:,1);
    features = data(:,2:end);
    test_features = test_data(:,2:end);
    
    from_k = 15;
    K = 25;
    
    durationNormalized = featureNormalize(features(:,1));
    yearCodeNormalized = featureNormalize(features(:,2));
    features(:,1) = durationNormalized;
    features(:,2) = yearCodeNormalized;

    test_durationNormalized = featureNormalize(test_features(:,1));
    test_yearCodeNormalized = featureNormalize(test_features(:,2));
    test_features(:,1) = test_durationNormalized;
    test_features(:,2) = test_yearCodeNormalized;

    loops = rows(test_features);
    is_first = 1;

    for k = from_k:K
      for i = 1:loops
        cinemaRating = test_rating(i);
        cinema = test_features(i);

        euclidian = sqrt(sum((features.-cinema).^2, 2));

        euclidianRatings = [rating euclidian];

        sortedDistancesWithRatings = sortrows(euclidianRatings, 2);

        calculatedRating = mean(sortedDistancesWithRatings(1:k+1,1));
      
        if i == 1
          Answer = [cinemaRating calculatedRating];
        else
          Answer = [Answer; [cinemaRating calculatedRating]];
        endif
      # [cinemaRating calculatedRating]
      end
      Y = Answer(:,1);
      Y_predicted = Answer(:,2);

      o = sqrt(sum((Y-Y_predicted).^2)/rows(Y));

      if (is_first==1)
          standard_error = o;
          is_first = 0;
      else
          standard_error = [standard_error; o];
      endif  
      k  
    end

    

    save first_try.mat standard_error
    "FINISH"
    pause
catch ME
  ME
  pause
end    

