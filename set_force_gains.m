function [sys_param,sim_param, asynch_peak, synch_peak] = set_force_gains(sys_param,sim_param)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


synch_param = containers.Map(sim_param.keys, sim_param.values);
temp = sim_param('r3_range');
synch_param('r3_range') = temp(1);

asynch_mag = run_one_simulation(sys_param, sim_param, 0);
synch_mag = run_one_simulation(sys_param, synch_param, 1);

asynch_peak = max(asynch_mag);
synch_peak = max(synch_mag);

err = (synch_peak - asynch_peak)/synch_peak;
sys_param('asynch_gain') = sys_param('asynch_gain') * (1+err/4);
end

