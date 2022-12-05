function [sys_param,sim_param] = tune_force_gains(sys_param,sim_param)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[sys_param,sim_param, asynch_peak, synch_peak] = set_force_gains(sys_param,sim_param);

err = (asynch_peak - synch_peak)/asynch_peak;
iter_count = 0;
while abs(err) > 0.01 && iter_count < 20
    iter_count = iter_count + 1
    [sys_param,sim_param, asynch_peak, synch_peak] = set_force_gains(sys_param,sim_param);
    
    err = (synch_peak - asynch_peak)/synch_peak;
    err

end
end

