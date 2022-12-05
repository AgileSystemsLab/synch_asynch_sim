function [fVals Pfpeaks] = fourier_analysis(data, rate)
    % Returns real amplitude (not gain & phase)
    NFFT = length(data);                                                        %NFFT = number of datapoints


    %%% Make NFFT even
    if mod(NFFT,2) == 0
        NFFT;
    elseif mod(NFFT,2) == 1
        NFFT = NFFT + 1;
    end

    Pf = ((fft(data,NFFT)))./(NFFT);                                            % Normalized FFT. I think fft(f) = fft(f,NFFT) because length(f) = length(NFFT)
    fVals = (rate/2*linspace(0,1,NFFT/2+1))';                                   % DFT Sample points
    FP(:,1) = fVals;                                                            % Store sampling frequencies
    FP(:,2) = 2*abs(Pf(1:NFFT/2+1));                                            % Store double-sided Fourier transform
    FPC(:,1) = fVals;                                                           % Store sampling frequencies
    FPC(:,2) = 2*Pf(1:NFFT/2+1);                                                % Store single-sided Fourier transform

    Pfpeaks = abs(2*Pf(1:NFFT/2+1));

end
