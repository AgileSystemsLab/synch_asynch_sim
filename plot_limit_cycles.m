function plot_limit_cycles(lc_data, idx)
% Idx determines the r3 slice to plot
pos = lc_data('limit_pos');
vel = lc_data('limit_vel');
t = lc_data('limit_t');
r3 = lc_data('spectrogram_r3');
synch_gain_range = lc_data('synch_gain_range');
freqs = lc_data('freq_array');

lc_array = lc_data('lc_array');

pos = squeeze(lc_array(idx, :, 1, :));
vel = squeeze(lc_array(idx, :, 2, :));

[n_cycles, temp] = size(pos);

count = 1;
figure
for i = 1:length(synch_gain_range)
    subplot(1,n_cycles,count)

    k = synch_gain_range(i);
    plot(pos(i,:), vel(i,:))
    
    count = count + 1;
end
end

