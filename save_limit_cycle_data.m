function save_limit_cycle_data(lc_data)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

pos = lc_data('limit_pos');
vel = lc_data('limit_vel');
t = lc_data('limit_t');
r3 = lc_data('spectrogram_r3');
synch_gain_range = lc_data('synch_gain_range');
freqs = lc_data('freq_array');
lc_array = lc_data('lc_array');

save('data/limit_cycle/pos', 'pos')
save('data/limit_cycle/vel', 'vel')
save('data/limit_cycle/t', 't')
save('data/limit_cycle/r3', 'r3')
save('data/limit_cycle/synch_gain_range', 'synch_gain_range')
save('data/limit_cycle/freqs', 'freqs')

%save('data/limit_cycle/lc_array', 'lc_array', '-v7.3') #v7.3 may be
%required for very large files, but has some compatibility issues with Python that need
%to be explored. 
save('data/limit_cycle/lc_array', 'lc_array')

end

