
clear
opts.stylesheet = 'doc/agramfort.xsl';
opts.outputDir = 'doc';
opts.maxWidth = 600;
opts.catchError = false;
opts.evalCode = true;
% opts.evalCode = false;

% publish('lagextraction_demo',opts);
publish('lagextraction_tutorial',opts);
zip('../lagextraction_eeglab_plugin.zip','../lagextraction');
