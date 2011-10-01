function weights = compute_weights(distances,sigma)
% compute the weights matrix from the distance matrix
% with a gaussian kernel


weights = exp(-distances.^2/sigma^2);
