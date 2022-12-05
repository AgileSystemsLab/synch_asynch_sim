function [f_kernel] = create_kernel(t, r3, r4, k3, k4)
% Create a dSA kernel given rates (r3, r4) and gains (k3, k4)

    f_sa = k3*(1 - exp(-r3*t))  + k4*(exp(-r4*t) - 1);

    f_temp = - (f_sa - (k3 - k4));
    f_temp = f_temp - f_temp(1);
    f_temp = f_temp/max(abs(f_sa));

    idx_peak = find(abs(f_sa) == max(abs(f_sa)));
    idx_end = find(f_temp(idx_peak:end) > - 0.01) + idx_peak;
    f_kernel = f_sa(1:idx_end);
    
    % Normalize area under the curve to 1
    auc = trapz(t(1:length(f_kernel)), f_kernel);
    f_kernel = f_kernel/auc;
end