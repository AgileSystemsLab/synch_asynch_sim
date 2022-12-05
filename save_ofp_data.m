function save_ofp_data(ofp_data, r3_range)

osc_amp = ofp_data('est_amp_array');
freq = ofp_data('freq_array');
power = ofp_data('conv_array');
psd = ofp_data('psd_array');
synch_gain_range = ofp_data('synch_gain_range');
yax = ofp_data('yax');
save('data/ofp_data', 'ofp_data');

save('data/osc_amp', 'osc_amp')
save('data/freq', 'freq');
save('data/power', 'power');
save('data/synch_gain_range', 'synch_gain_range')
save('data/yax', 'yax')
save('data/psd', 'psd')
save('data/r3_range', 'r3_range')
end

