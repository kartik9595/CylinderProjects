%% ------------------------------------------------------------------------
%% PLOTS
%% ------------------------------------------------------------------------
clear all; close all; clc;

%% BASELINE
load(fullfile('US_mat_files','U_S_141_base.mat'))
load(fullfile('US_mat_files','U_S_150_base.mat'))
load(fullfile('US_mat_files','U_S_155_base.mat'))
load(fullfile('US_mat_files','U_S_158_base.mat'))
data = {S_141_b,S_150_b,S_155_b,S_158_b};
% %% STRIP
% load(fullfile('US_mat_files','U_S_150_st.mat'))
% load(fullfile('US_mat_files','U_S_155_st.mat'))
% load(fullfile('US_mat_files','U_S_158_st.mat'))
% data = {S_150_st,S_155_st,S_158_st};
%% 1D SPLITER
load(fullfile('US_mat_files','U_S_150_1D.mat'))
load(fullfile('US_mat_files','U_S_155_1D.mat'))
load(fullfile('US_mat_files','U_S_158_1D.mat'))
data = {S_150_1D,S_155_1D,S_158_1D};
%% 0.5D SPLITER
load(fullfile('US_mat_files','U_S_150_05D.mat'))
load(fullfile('US_mat_files','U_S_155_05D.mat'))
load(fullfile('US_mat_files','U_S_158_05D.mat'))
data = {S_150_05D,S_155_05D,S_158_05D};
% %% 3X0.5D SPLITERS
% load(fullfile('US_mat_files','U_S_150_3_05D.mat'))
% load(fullfile('US_mat_files','U_S_155_3_05D.mat'))
% load(fullfile('US_mat_files','U_S_158_3_05D.mat'))
% data = {S_150_3_05D,S_155_3_05D,S_158_3_05D};
% %% CYLINDER 2
% load(fullfile('US_mat_files','U_S_141_cy2.mat'))
% load(fullfile('US_mat_files','U_S_150_cy2.mat'))
% data = {S_141_cy2,S_150_cy2};
% %% CYLINDER 1
% load(fullfile('US_mat_files','U_S_155_cy1.mat'))
% load(fullfile('US_mat_files','U_S_150_cy1.mat'))
% data = {S_150_cy1,S_155_cy1};
%% Frequency peaks
f = 0; j = 0;

for k = 1:length(data)
    S = data{k};
    c = size(S);
    for i=1:c(2)
        [peakU(i,k) locU(i,k)] = findpeaks(S(:,i),'NPeaks',1,'SortStr','descend');
    end
    freq_mean_test = mean(locU(:,k));
    
    %Elimination of the 1st peaks not same region as others
    for i=1:c(2)
        if (locU(i,k)+15) > freq_mean_test && (locU(i,k)-15) < freq_mean_test
            f = f + locU(i,k);
            j = j + 1;
        end
    end
    freq_mean(k) = f/j;
    j = 0; f = 0; 
end

freq_mean_3_05D = freq_mean; %%%%CHANGE NAME FOR SAVING%%%%%%
save(fullfile('US_mat_files','peaks','peaks_3_05D.mat'),'freq_mean_3_05D') %%%%CHANGE NAME FOR SAVING%%%%%%

%% PSD Individual plots 
freq = 1:1:500;

%%Each in one figure
% c = size(S_150_b);
% for i=1:c(2)
% figure;
% plot(freq,S_150_b(:,i));
% xlabel('Frequency (Hz)')
% ylabel('PSD')
% end

%%All in a figure
% fig = figure; %% Normal size
fig = figure('Position', get(0, 'Screensize')); %%Full screen 
% subplot(2,2,1)
% plot(freq,S_141_b);  %%%%CHANGE NAME FOR SAVING%%%%%%
% xlabel('Frequency (Hz)')
% ylabel('PSD')
% title('0.5D') %At 141cm
% ylim([-70 20])
subplot(2,2,2)
plot(freq,S_150_05D);  %%%%CHANGE NAME FOR SAVING%%%%%%
xlabel('Frequency (Hz)')
ylabel('PSD')
title('1.6D') %At 150cm
ylim([-70 20])
subplot(2,2,3)
plot(freq,S_155_05D);  %%%%CHANGE NAME FOR SAVING%%%%%%
xlabel('Frequency (Hz)')
ylabel('PSD')
title('2.25D') %At 155cm
ylim([-70 20])
subplot(2,2,4)
plot(freq,S_158_05D);  %%%%CHANGE NAME FOR SAVING%%%%%%
xlabel('Frequency (Hz)')
ylabel('PSD')
title('2.7D') %At 158.5cm
ylim([-70 20])

saveas(fig,fullfile('Figures','PSD_05D'),'jpg')  %%%%CHANGE NAME FOR SAVING%%%%%%

%% PSD two configurations 
close all; clear i c;
%Define specifically which point 
%Horizontal: 141cm = 0.5D, 150cm = 1.6D, 155cm = 2.25D, 158.5cm = 2.7D
%Vertical: size 31 = 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5...,13,13.5,14,14.5,15
%Vertical: size 26 = 0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5...10,11,12,13,14,15
%Vertical: size 16 = 0,1,2,3,4,...,13,14,15
freq = 1:1:500;
load(fullfile('US_mat_files','peaks','peaks_base.mat'));
load(fullfile('US_mat_files','peaks','peaks_3_05D.mat'));

%For different sizes eliminates values of larger one 
j = 0;
S_150_b_re = zeros(500,16);
S_150_b_re (:,11:16) = S_150_b(:,21:26);
for k = 1:2:20
    j = j+1;
    S_150_b(:,k) = S_150_b(:,j);
end

% c = size(S_158_3_05D);
% for i=1:c(2)
% figure;
% plot(freq,S_158_b(:,i))
% hold on
% plot(freq,S_158_3_05D(:,i))
% xlabel('Frequency (Hz)')
% ylabel('PSD')
% title('0.5D') %At 141cm
% legend('baseline','spliters')
% xlim([0 400])
% hold off
% end

%%One Plot
fig = figure;
plot(freq,S_150_b(:,13))
hold on
plot(freq,S_150_3_05D(:,13))
xlabel('Frequency (Hz)')
ylabel('PSD')
title('0.75D') %At 6cm
xlim([10 200])

x = linspace(freq_mean_3_05D(1),freq_mean_3_05D(1),1000);
y = linspace(-25,20,1000);
plot(x,y,':k')

x1 = linspace(freq_mean_base(2),freq_mean_base(2),100);
y1 = linspace(-25,20,100);
plot(x1,y1,'--k')
legend('baseline','3 spliters','f = 39.54Hz','f = 46.18Hz')

hold off


%%Two subplots 
% fig = figure;
% subplot(2,1,1)
% plot(freq,S_141_b(:,10))
% hold on
% plot(freq,S_141_cy2(:,10))
% xlabel('Frequency (Hz)')
% ylabel('PSD')
% title('0.6D') %At 4.5cm
% legend('baseline','cylinder')
% hold off
% subplot(2,1,2)
% plot(freq,S_141_b(:,16))
% hold on
% plot(freq,S_141_cy2(:,16))
% xlabel('Frequency (Hz)')
% ylabel('PSD')
% title('1D') %At 141cm
% legend('baseline','cylinder')
% hold off
% 
% saveas(fig,fullfile('Figures','PSD_b_cy2'),'jpg')

%%3_05D index 6 