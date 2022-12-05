function peak_opt_param = run_one_simulation(sys_param, sim_param, K_r)
% Run simulation for specific K_r and r3 for synch-asynch gain tuning

% Unpack system parameters
Inertia = sys_param('I');
K = sys_param('K');
Gamma = sys_param('Gamma');
C_viscous  = sys_param('C_viscous');
T = sys_param('T');
f_n = sys_param('f_n');
synch_freq = sys_param('synch_freq');
v_initial = sys_param('v_initial');
x_initial = sys_param('x_initial');
K_muscle = sys_param('K_muscle');
asynch_gain = sys_param('asynch_gain');
gain_constant = sys_param('gain_constant');

% Unpack simulation parameters
ntests = sim_param('ntests');
r3_range = sim_param('r3_range');
sampling_f = sim_param('sampling_f');
synch_gain_range = sim_param('synch_gain_range');
t = sim_param('t');
t_end = sim_param('t_end');
r4_ratio = sim_param('r4_ratio');


opt_param = [];

for i = 1:length(r3_range)
    
    % Sweep through parameters to generate forcing functions
    synch_gain = K_r * gain_constant;
    temp_kernel = create_kernel(t,r3_range(i), r3_range(i)* r4_ratio, 1, 1);
    SA_kernel = asynch_gain * gain_constant * (1 - K_r) * temp_kernel;
    
    % Run simulation and extract variables
    simIn = Simulink.SimulationInput('asynchronous_model');
    simIn = simIn.setVariable('Gamma', Gamma);
    simIn = simIn.setVariable('Inertia', Inertia);
    simIn = simIn.setVariable('C_viscous', C_viscous);
    simIn = simIn.setVariable('K', K);
    simIn = simIn.setVariable('K_muscle', K_muscle);
    simIn = simIn.setVariable('SA_kernel', SA_kernel);
    simIn = simIn.setVariable('synch_gain', synch_gain);
    simIn = simIn.setVariable('synch_w', synch_freq*2*pi);
    simIn = simIn.setVariable('x_initial', x_initial);
    simIn = simIn.setVariable('v_initial', v_initial);
    simIn = simIn.setModelParameter('StartTime', '0', 'StopTime', num2str(t_end));
    simIn = simIn.setModelParameter('FixedStep', num2str(1/sampling_f));
    
    %simout = sim('asynchronous_model', 'StartTime', '0', 'StopTime', num2str(t_end));
    simout = sim(simIn);
    dat = simout.simout.Data;
    
    position        = dat(:,4);
    velocity        = dat(:,3);
    upstroke        = dat(:,2);
    downstroke      = dat(:,1);
    net_force       = upstroke + downstroke;
    
    upstroke_passive    = dat(:,5);
    upstroke_asynch     = dat(:,6);
    downstroke_passive 	= dat(:,7);
    downstroke_asynch   = dat(:,8);
    
    upstroke_synch      = dat(:,9);
    downstroke_synch    = dat(:,10);
    plot(position)
    power = calculate_power(velocity, net_force, position, t);

    %spring_force        = dat(:,11);
    %aero_force          = dat(:,12);
    %visc_force          = dat(:,13);
    
    % Extract properties of dominant oscillation frequency
    [freq, peaks] = fourier_analysis(position - mean(position), sampling_f);
    peak_idx = find(peaks == max(peaks));
    osc_freq = freq(peak_idx)/synch_freq;
    osc_amp = peaks(peak_idx);
    
    half_idx = length(position)/2;
    opt_param = [opt_param, osc_amp]; %THIS IS THE OPTIMIZED PARAMETR! position, osc amp, power. Not peak force
end
peak_opt_param = max(opt_param);
end

