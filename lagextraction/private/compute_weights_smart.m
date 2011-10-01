function weights = get_weights_smart(distances,ratio)
% compute the weights matrix using the self tuning of Zelnik-Manor and Perona
% Bibtex :
% @article {LihiZelnikManorPPerona,
% author = {Lihi Zelnik-Manor and P. Perona},
% title = {Self-Tuning Spectral Clustering},
% journal = {Eighteenth Annual Conference on Neural Information Processing Systems, (NIPS)},
% year = {2004},
% }


[N,M] = size(distances);
sigmas = zeros(1,N);
K = max(1,floor(ratio*N));

for i=1:N
    row_sorted = sort(distances(:,i));
    sigmas(i) = row_sorted(K);
end

sigma_mat = repmat(sigmas,N,1).*repmat(sigmas',1,N);

weights = exp(-distances.^2 ./ sigma_mat);
