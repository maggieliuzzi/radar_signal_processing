% Doppler Velocity Calculation
% Calculate velocity (in m/s) of four targets with doppler frequency shifts 3, -4.5, 11 and -3 KHz respectively

c = 3*10^8;         %speed of light
frequency = 77e9;   %operating frequency of the radar in Hz


% TODO : Calculate the wavelength

wavelength = c / frequency;


% TODO : Define the doppler shifts in Hz using the information from above 

doppler_shifts = [3e3, -4.5e3, 11e3, -3e3];


% TODO : Calculate the velocity of the targets  fd = 2*vr/lambda

relative_velocities = doppler_shifts * wavelength / 2;


% TODO: Display results

disp(relative_velocities);