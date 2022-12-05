function plot_force_mag(force_data)
synch_gain_range = force_data('synch_gain_range');
yax = force_data('yax');
force_array = force_data('force_array');

figure

surf(synch_gain_range,yax(1:end),force_array(:,:,1),'edgecolor', 'none')
axis square
axis([min(synch_gain_range) max(synch_gain_range) min(yax) max(yax)])
view(0,90)

xlabel('K_r')
ylabel('f_n t_o')
a = colorbar;
a.Label.String = 'peak force';
a.Label.FontSize = 14;
set(gca,'ColorScale','log')
%set(gca,'XScale','log')
set(gca,'YScale','log')
colormap(cool)
end

