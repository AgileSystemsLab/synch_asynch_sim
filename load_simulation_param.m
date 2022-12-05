function param = load_simulation_param(system, f_n)
% Load moth, robobee, or roboflapper system parameters
%   Detailed explanation goes here

r4_ratio = 0.62;
if strcmp(system, 'moth')
    ntests  = 10; % Typically 100 for paper figures
    synch_gain_range = linspace(0, 1, ntests);
    t_end       = 10;
    sampling_f = 10000;
    t = linspace(0, t_end, t_end * sampling_f); % Simulation frequency: 1 kHz
    r3_range = calculate_r3_range(ntests, f_n, r4_ratio);
    r3_spect = r3_range(7);

elseif strcmp(system,'robobee')
    ntests  = 10;
    synch_gain_range = linspace(0.1, 1, ntests);
    r3_range = logspace(1, 5, ntests);
    r3_spect = r3_range(3); % r3 slice for spectrogram
    t_end = 5;
    sampling_f = 10000;
    t = linspace(0, t_end, t_end * sampling_f); % Simulation frequency: 10 kHz
elseif strcmp(system,'flapper')
    ntests  = 10;
    synch_gain_range = linspace(0.1, 1, ntests);
    r3_range = logspace(.5, 2, ntests);
    r3_spect = r3_range(5); % r3 slice for spectrogram
    t_end = 60;
    sampling_f = 1000;
    t = linspace(0, t_end, t_end * sampling_f); % Simulation frequency: 10 kHz
    
end
keys = {'ntests', 'synch_gain_range', 'r3_range', 't_end', 'sampling_f', 't', 'r3_spect', 'r4_ratio'};
values = {ntests, synch_gain_range, r3_range, t_end, sampling_f, t, r3_spect, r4_ratio};

param = containers.Map(keys, values);
