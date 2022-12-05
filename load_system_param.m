function param = load_system_param(system)
% Load moth, robobee, or roboflapper system parameters
%   Detailed explanation goes here

if strcmp(system, 'moth')
    %Inertia = 6.81E-8; % [kg m2]
    K = 3760; % [N/m]
    Gamma = 3.69E-8; % [kg]
    %T = 1860; % [rad/m]
    C_viscous = 0;
    
    Inertia = 5.69E-8;
    T = 2230;
    
    unit_converter = 1000; % convert kg to g
    Inertia = Inertia * unit_converter;
    K = K * unit_converter;
    Gamma = Gamma * unit_converter;
    C_viscous = C_viscous * unit_converter;
    T = T; %* unit_converter;
    
    K = K/T^2;
    
    % Synchronous forcing
    %gain_constant = 1790/T;
    
    gain_constant = 2340/T;
    asynch_gain = 1/75000;
    synch_freq = 25;
    
elseif strcmp(system,'robobee')
    Inertia = 4.53E-11 + 1.02E-11; % kg m2 - includes added mass
    K = 197.7; % N/m
    Gamma = 5.68E-11;
    C_viscous  = 0;
    T = 3333; % rad/m

    unit_converter = 1000; % convert kg to g
    Inertia = Inertia * unit_converter;
    K = K * unit_converter;
    Gamma = Gamma * unit_converter;
    C_viscous = C_viscous * unit_converter;
    T = T; %* unit_converter;
    
    K = K/T^2;
    
    % Synchronous (sine) forcing
    w_n = sqrt(K/Inertia);
    f_n = w_n/(2*pi);
    synch_freq = f_n * 1; % [Hz]
    
    gain_constant = 20/T;
    asynch_gain = 1/160000 ;
    %synch_freq = 25;
    
elseif strcmp(system, 'flapper')
    Inertia = 0.0023; % [kg m2]
    K = 0.525; % Nm/rad
    Gamma = 0.00107; % [N m s2]
    C_viscous = 0;
    w_n = sqrt(K/Inertia);
    f_n = w_n/(2*pi);
    synch_freq = f_n * 1;
    gain_constant = 0.1;
    asynch_gain = 1/500;
    T = 1;
end

w_n = sqrt(K/Inertia);
f_n = w_n/(2*pi);

K_muscle = 0;
v_initial = 0;
x_initial = 0.1;

keys = {'I', 'K', 'Gamma', 'C_viscous', 'T', 'f_n', 'synch_freq', 'K_muscle', 'x_initial', 'v_initial', 'asynch_gain', 'gain_constant', 'f_n'};
values = {Inertia, K, Gamma, C_viscous, T, f_n, synch_freq, K_muscle, x_initial, v_initial, asynch_gain, gain_constant, f_n};

param = containers.Map(keys, values);
end

