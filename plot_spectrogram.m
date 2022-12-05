function  plot_spectrogram(spect_data)
figure
synch_gain_range = spect_data('synch_gain_range');
freq = spect_data('freq');
spect_peaks = spect_data('spect_peaks');

n_freqs = 400;


surf(synch_gain_range,freq(1:n_freqs),spect_peaks(1:n_freqs,:))
ax = gca;
ax.XAxis.FontSize = 14;
ax.YAxis.FontSize = 14;
ax.Title.FontSize = 14;
axis square
shading interp
colormap(cool)
axis([min(synch_gain_range), max(synch_gain_range), freq(1), freq(n_freqs)])
view(0,90)
xlabel('K_r')
ylabel('freq (Hz)')
a = colorbar;
a.Label.String = 'oscillation amplitude';
a.FontSize = 14;
%set(gca,'ColorScale','log')


set(gcf, 'RendererMode', 'manual');
set(gcf, 'Renderer','painters');
exportgraphics(gcf,append('figures/spectrogram.pdf'),'ContentType','vector')
end

