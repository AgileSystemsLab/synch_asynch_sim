function r3_range = calculate_r3_range(ntests, f_n, r4_ratio)
% Assumes k3 = k4 = 1
T_n = 1/f_n; % [s] - resonance period
t_o = logspace(-2, 0, ntests) * T_n;

r3_range = log(1/r4_ratio)./((1-r4_ratio)*t_o); 

end

