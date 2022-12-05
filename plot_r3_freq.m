function plot_r3_freq(freq_array, r3_range)
k3 = 1; 
k4 = 1;
t_o = log( (k3*r3_range)/(k4*r3_range*r4_ratio) )./(r3_range-r3_range*r4_ratio); % Time to peak

yax = f_n.*t_o;

scatter(freq_array(:,1)*25, r3_range, 'b')
axis([0,100, 0, 1200])
xlabel('wbf (Hz)')
ylabel('r_3 (s^{-1})')
xticks([0, 25, 50, 75, 100])
yticks([0, 500, 1000])

exportgraphics(gcf,'figures/r3_freq.pdf','ContentType','vector')
