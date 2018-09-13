clc; clear all; close all;
%% ------------------------------------------------------------------------
%% BASELINE Different speed cases
%% ------------------------------------------------------------------------

%Read data
% HW_table = readtable('270.txt','Delimiter',' ','HeaderLines',6,...
%     'ReadVariableNames',false, 'Format', '%f%f%f%f%f%f');
% 
% U = table2array(HW_table(:,3)); %speed in m/s
% S = table2array(HW_table(1:500,6)); %spectrum in dB
% 
% dt = 0.001; %s
% df = 1; %Hz
% freq_sam = 1000; %Hz

%%Take frequency peak (plot optional)
% f = 1:df:(freq_sam/2);
% [peakU locU] = findpeaks(S,'NPeaks',1,'SortStr','descend');
% figure;
% plot(f,S)
% title('PSD')
% xlabel('Frequency (Hz)')
% ylabel('Spectrum (dB)')

%%Save of the peak values in folder
% locU_q_270 = locU;
% save('peak_q_270.mat','locU_q_270'); 

%% Load different peaks

load peak_q_74.mat 
load peak_q_97.mat
load peak_q_122.mat
load peak_q_159.mat
load peak_q_193.mat
load peak_q_237.mat
load peak_q_272.mat

% load peak_q_51.mat
% load peak_q_74.mat 
% load peak_q_95.mat
% load peak_q_124.mat
% load peak_q_160.mat
% load peak_q_196.mat
% load peak_q_233.mat
% load peak_q_270.mat

peaks = [locU_q_74; locU_q_97;locU_q_122;locU_q_159;locU_q_193;...
    locU_q_237;locU_q_272]';
% peaks = [locU_q_51; locU_q_74; locU_q_95;locU_q_124;locU_q_160;locU_q_196;...
%     locU_q_233;locU_q_270]';

%% Plot Speed vs Frequency
q_pitot = [74 97 122 159 193 237 272]; %vertical position 0.7
% q_pitot = [51 74 95 124 160 196 233 270]; %middle position

q_veine = 1.2105*q_pitot;
speed = sqrt(q_veine*2/1.2);

plot(speed,peaks)
xlabel('Velocity (m/s)')
ylabel('Frequency (Hz)')

%% Strouhal number
D = 0.08; %diameter cylinder m

St = (D./speed).*peaks;
St_mean = mean(St);


