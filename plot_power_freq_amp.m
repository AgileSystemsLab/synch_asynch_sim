function plot_power_freq_amp(conv_array,freq_array, est_amp_array, psd_array, synch_gain_range, r3_range, f_n, r4_ratio)

psd_array
figure('Renderer', 'painters', 'Position', [10 10 900 600])
k3 = 1; 
k4 = 1;

t_o = log( (k3*r3_range)/(k4*r3_range*r4_ratio) )./(r3_range-r3_range*r4_ratio); % Time to peak

yax = f_n.*t_o;


figure(1)
colormap(cool)

subplot(1,3,2)
surf(synch_gain_range,yax(1:end),conv_array(:,:),'edgecolor', 'none')
axis square
axis([min(synch_gain_range) max(synch_gain_range) min(yax) max(yax)])
view(0,90)
xlabel('K_r')
ylabel('t_o/T_n')
a = colorbar;
a.Label.String = 'power (au)';
a.Label.FontSize = 14;
%set(gca,'ColorScale','log')
set(gca,'YScale','log')


subplot(1,3,1)
surf(synch_gain_range(1:end),yax(1:end),freq_array(1:end,1:end), 'edgecolor', 'none')
axis square
axis([min(synch_gain_range) max(synch_gain_range) min(yax) max(yax)])
view(0,90)
xlabel('K_r')
ylabel('t_o/T_n')
a = colorbar;
a.Label.String = 'f/f_s_y_n_c_h';
a.Label.FontSize = 14;
set(gca,'YScale','log')
%{
subplot(1,3,3)
surf(synch_gain_range,yax,est_amp_array(:,:), 'edgecolor', 'none')
axis square
axis([min(synch_gain_range) max(synch_gain_range) min(yax) max(yax)])
view(0,90)
%title('Oscillation Amplitude (rad)')
xlabel('K_r')
ylabel('f_n t_o')
a = colorbar;
a.Label.String = 'amplitude (rad)';
a.Label.FontSize = 8;
%set(gca,'ColorScale','log')
%set(gca,'XScale','log')
set(gca,'YScale','log')
%}


subplot(1,3,3)
surf(synch_gain_range,yax(1:end),psd_array(:,:),'edgecolor', 'none')
axis square
axis([min(synch_gain_range) max(synch_gain_range) min(yax) max(yax)])
view(0,90)
xlabel('K_r')
ylabel('t_o/T_n')
a = colorbar;
a.Label.String = 'energy ratio';
a.Label.FontSize = 14;
%set(gca,'ColorScale','log')
set(gca,'YScale','log')




set(gcf, 'RendererMode', 'manual');
set(gcf, 'Renderer','painters');
%{
set(gcf, 'PaperUnits', 'inches');
x_width=11 ;y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
saveas(gca,'fig1.pdf')
%}

exportgraphics(gcf,'figures/osc_measurements.pdf','ContentType','vector')

end

