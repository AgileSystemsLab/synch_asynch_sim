function kernels = create_kernels_for_plotting(sim_param)

r3_range = sim_param('r3_range');
t = sim_param('t');

k3 = 1;
k4 = 1;
r4_ratio = 0.1;
kernels = [];
for i = 1:length(r3_range)
    r3 = r3_range(i);
    r4 = r3*r4_ratio;
    temp = create_kernel(t, r3, r4, k3, k4);
    kernels{i} = temp;

end
end

