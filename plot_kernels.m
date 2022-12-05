function plot_kernels(sim_param)

figure
t = sim_param('t');
sampling_f = sim_param('sampling_f');
kernels = create_kernels_for_plotting(sim_param);
for i = 1:length(kernels)
    t = linspace(0, length(kernels{i})/sampling_f, length(kernels{i}));
    %semilogx(t, kernels{i}/max(kernels{i}), 'Color', 'r')
    loglog(t, kernels{i}, 'Color', 'r', 'Linewidth', 2)

    hold on
end

xlabel('time (s)')
ylabel('g$*$x', 'Interpreter', 'latex')
ax = gca;

ax.XAxis.FontSize = 14;
ax.YAxis.FontSize = 14;
ax.Title.FontSize = 14;
set(gca,'box','off') 
set(gcf, 'RendererMode', 'manual');
set(gcf, 'Renderer','painters');
exportgraphics(gcf,append('figures/kernels.pdf'),'ContentType','vector')
end

