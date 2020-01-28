% Calculating range of four targets using their measured beat frequencies: 0, 1.1, 13, 24 MHz



% TODO : find the Bsweep of chirp for 1 m resolution

c = 3*10^8;                   % speed of light, m/s
delta_r = 1;                  % range resolution, m
Bsweep = c / 2 * delta_r;     % bandwidth


% TODO : calculate the chirp time based on the radars max range

max_range = 300;                 % given radars max range
Ts = 5.5 * (max_range * 2 / c);  % 5.5 of the trip time for maximum range  % 5 - 6 normally used for automotive radars


% TODO : define the frequency shifts 

beat_freqs = [0 1.1e6 13e6 24e6];
calculated_range = c * Ts * beat_freqs / (2 * Bsweep);


% Display the calculated range
disp(calculated_range);
