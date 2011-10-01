function [Gnormalized] = normalize_rows(G)
%   NORMALIZE_COLUMNS   Normalize every row of G
%       [GNORMALIZED] = NORMALIZE_ROWS(G)
% 
%   Created by Alexandre Gramfort on 2008-06-30.
%   Copyright (c) 2007 Alexandre Gramfort. All rights reserved.


me = 'NORMALIZE_ROWS';

norms = sqrt(sum(G.^2,2));
gidx = find(norms);
Gnormalized = zeros(size(G));
Gnormalized(gidx,:) = G(gidx,:) ./ repmat(norms(gidx),1,size(G,2));
% Gnormalized(isnan(Gnormalized)) = 0;

end %  function