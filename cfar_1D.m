% Implement 1D CA-CFAR using lagging cells on the given noise and target scenario.

% Close and delete all currently open figures
close all;

% Data_points
Ns = 1000;

% Generate random noise
s=abs(randn(Ns,1));

%Targets location. Assigning bin 100, 200, 300 and 700 as targets with the amplitudes of 8, 9, 4, 11.
s([100, 200, 300, 700])=[8 9 4 11];

%plot the output
plot(s);

% TODO: Apply CFAR to detect the targets by filtering the noise.
% Define a CFAR window and pick optimal number of Training and Guard Cells
T = 12;
G = 4;

% Offset : Adding room above noise threshold for desired SNR
% Since we're working with linear values, we multiply the offset by the
% threashold value
offset=5;  % TOTRY: 5

% Vector to hold threshold values 
threshold_cfar = [];

% Vector to hold final signal after thresholding
signal_cfar = [];

% Applying 1D-CFAR
% 2. Slide window across the signal length
% iterate through the signal vector ensuring right spacing from the end
for i = 1:(Ns-(G+T+1))  % leave room for last T, G and CUT

    % 2. - 5. Determine the noise threshold by measuring it within the training cells
    % for every steps, add up noise from all training cells
    noise_level = sum(s(i:i+T-1));
    
    % Calculate threshold by averaging summed noise and multiplying with
    % the offset
    threshold = (noise_level/T)*offset; % avg noise level in each training cell * offset
    threshold_cfar = [threshold_cfar, {threshold}];
    
    % 6. Measuring the signal within the CUT
    % Pick CUT (T+G cells away from the first training cell and measure
    % signal level
    signal = s(i+T+G);

    % 8. Filter the signal above the threshold
    % if signal level at CUT is below the threshold, assign it a 0 value
    if (signal < threshold)
        signal = 0;
    end
    signal_cfar = [signal_cfar, {signal}];
end

% Plotting threshold, noise signal and thresholded signal

% plot the filtered signal
plot(cell2mat(signal_cfar), 'g--');

% plot original sig, threshold and filtered signal within the same figure.
figure, plot(s);
hold on, plot(cell2mat(circshift(threshold_cfar, G)), 'r--', 'LineWidth', 2);
hold on, plot(cell2mat(circshift(signal_cfar, (T+G))), 'g--', 'LineWidth', 4);
legend('Signal', 'CFAR Threshold', 'Detection');