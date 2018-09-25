function [X_norm, mu, sigma] = featureNormalize(X)
    features = X(:,1:size(X,2));
    mu  = mean(features);
    sigma   = std(features);

    X_norm = (features .- mu)./sigma;
end
