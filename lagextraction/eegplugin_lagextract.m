function eegplugin_extractlag( fig, try_strings, catch_strings)


uimenu( findobj(fig, 'tag', 'tools') , 'label', 'Extract lags', 'callback', ... 
           [try_strings.no_check '[EEG LASTCOM]= pop_extractlag(EEG);' catch_strings.store_and_hist '[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);' ]);
