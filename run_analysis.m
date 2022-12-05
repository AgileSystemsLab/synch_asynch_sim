clear
system = 'moth'; % moth flapper or robobee
tic % Typically ~0.5-1s per moth simulation

sys_param = load_system_param(system);

sim_param = load_simulation_param(system, sys_param('f_n'));

sys_param('asynch_gain')
[sys_param,sim_param] = tune_force_gains(sys_param,sim_param);
sys_param('asynch_gain')


[force_array, conv_array, freq_array, est_amp_array, spect_data, force_data, ofp_data, lc_data, psd_array] = run_simulation(sys_param, sim_param);

close all
plot_power_freq_amp(conv_array, freq_array, est_amp_array, psd_array, sim_param('synch_gain_range'), sim_param('r3_range'), sys_param('f_n'), sim_param('r4_ratio'))
plot_spectrogram(spect_data);
plot_force_mag(force_data);
plot_kernels(sim_param);
for i = 1:10
    plot_limit_cycles(lc_data, i);
end
%plot_r3_freq(freq_array, sim_param('r3_range'), sim_param('r4_ratio'))

save_ofp_data(ofp_data, sim_param('r3_range'));
save_limit_cycle_data(lc_data)
toc