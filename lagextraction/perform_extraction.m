function [lags,use_ascend,E] = perform_extraction(points_ordered,options)

% PERFORM_EXTRACTION   Run lag extraction
%
%   Run lag extraction on a reordered raster plot (2D Image)
%
%   SYNTAX
%       [LAGS,USE_ASCEND,E] = PERFORM_EXTRACTION(POINTS_ORDERED,OPTIONS)
%


if nargin<3
    options.null = 0;
end

if ~isfield(options, 'xwin')
    options.xwin = 1;
end
xwin = options.xwin;

if nargin == 0
    rmfield(options,'null')
    options = options
    return
end

%%%%%%%% END OPTIONS %%%%%%%%%

if xwin>0
    data_smooth = movav(points_ordered',[],2*xwin,1)'; % smoothing for better robustness
else
    data_smooth = points_ordered;
end

if options.disp_log
    disp('---- Running lag extraction');
end

[lags,use_ascend,dc,sc,E] = gc_lags(points_ordered,options);

if options.disp_log
    disp('-- Lag extraction done !');
end

if 0
    figure
    imagesc(data_smooth)
    colorbar
    xlabel('Time (ms)')
    ylabel('Trial')
    title('Points Ordered and Smoothed')
end
