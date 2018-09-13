%% ------------------------------------------------------------------------
%% PLOTS Velocity
%% ------------------------------------------------------------------------
clear all; close all; clc;

%% BASELINE
load(fullfile('US_mat_files','U_S_141_base.mat'))
load(fullfile('US_mat_files','U_S_150_base.mat'))
load(fullfile('US_mat_files','U_S_155_base.mat'))
load(fullfile('US_mat_files','U_S_158_base.mat'))
data_base = {U_141_b,U_150_b,U_155_b,U_158_b};
%% STRIP
load(fullfile('US_mat_files','U_S_150_st.mat'))
load(fullfile('US_mat_files','U_S_155_st.mat'))
load(fullfile('US_mat_files','U_S_158_st.mat'))
data_st = {U_150_st,U_155_st,U_158_st};
%% 1D SPLITER
load(fullfile('US_mat_files','U_S_150_1D.mat'))
load(fullfile('US_mat_files','U_S_155_1D.mat'))
load(fullfile('US_mat_files','U_S_158_1D.mat'))
data_1D = {U_150_1D,U_155_1D,U_158_1D};
%% 0.5D SPLITER
load(fullfile('US_mat_files','U_S_150_05D.mat'))
load(fullfile('US_mat_files','U_S_155_05D.mat'))
load(fullfile('US_mat_files','U_S_158_05D.mat'))
data_05D = {U_150_05D,U_155_05D,U_158_05D};
%% 3X0.5D SPLITERS
load(fullfile('US_mat_files','U_S_150_3_05D.mat'))
load(fullfile('US_mat_files','U_S_155_3_05D.mat'))
load(fullfile('US_mat_files','U_S_158_3_05D.mat'))
data_3_05D = {U_150_3_05D,U_155_3_05D,U_158_3_05D};
%% CYLINDER 2
load(fullfile('US_mat_files','U_S_141_cy2.mat'))
load(fullfile('US_mat_files','U_S_150_cy2.mat'))
data_cy2 = {U_141_cy2,U_150_cy2};
%% CYLINDER 1
load(fullfile('US_mat_files','U_S_155_cy1.mat'))
load(fullfile('US_mat_files','U_S_150_cy1.mat'))
data = {S_150_cy1,S_155_cy1};
%% Velocity plots
fig = figure('Position', get(0, 'Screensize')); %%Full screen

dataA = data_base;
% dataB = data_st;
% dataC = data_05D;
% dataD = data_3_05D;

h = [0.5 1.6 2.25 2.68];
c = ["Baseline";"Strip";"1D spliter";"0.5D spliter"; "3 splitters";"2nd cylinder"];
col = length(dataA);
w = 1;
for k = 1:col
    
    velA = dataA{k};
%     velB = dataB{k};
%     velC = dataC{k};
%     velD = dataD{k};
    
%     if size(velA) == size(velB)
%         if size(velB) == [1000 26]; %size 26
%             z1 = 0:0.5:9.5;
%             z2 = 10:1:15;
%             z3 = -15:1:-10;
%             z4 = -9.5:0.5:-0.5;
%             zA = [z3 z4 z1 z2]./8;
%             zB = zA; 
%         else  %size 31
%             zA = (-15:0.5:15)./8;
%             zB = zA; 
%         end
%     else
        if size(velA) == [1000 26];
            z1 = 0:0.5:9.5;
            z2 = 10:1:15;
            z3 = -15:1:-10;
            z4 = -9.5:0.5:-0.5;
            zA = [z3 z4 z1 z2]./8; 
        
        else zA = (-15:0.5:15)./8;  %size 31
        end
%         if size(velB) == [1000 16]; %size 16
%             zB = (-15:1:15)./8; 
%         elseif size(velB) == [1000 26];
%             z1 = 0:0.5:9.5;
%             z2 = 10:1:15;
%             z3 = -15:1:-10;
%             z4 = -9.5:0.5:-0.5;
%             zB = [z3 z4 z1 z2]./8; 
%         else  zB = (-15:0.5:15)./8; %size 31
%         end
%         if size(velC) == [1000 16]; %size 16
%             zC = (-15:1:15)./8; 
%         elseif size(velC) == [1000 26];
%             z1 = 0:0.5:9.5;
%             z2 = 10:1:15;
%             z3 = -15:1:-10;
%             z4 = -9.5:0.5:-0.5;
%             zC = [z3 z4 z1 z2]./8; 
%         else  zC = (-15:0.5:15)./8; %size 31
%         end
%         if size(velD) == [1000 16]; %size 16
%             zD = (-15:1:15)./8; 
%         elseif size(velD) == [1000 26];
%             z1 = 0:0.5:9.5;
%             z2 = 10:1:15;
%             z3 = -15:1:-10;
%             z4 = -9.5:0.5:-0.5;
%             zD = [z3 z4 z1 z2]./8; 
%         else  zD = (-15:0.5:15)./8; %size 31
%         end
        
 %end
    
    U_mean_up = mean(velA);
    U_mean_down = fliplr(U_mean_up);
    U_mean_velA = [U_mean_down U_mean_up(2:end)]./18;

%     U_mean_up = mean(velB);
%     U_mean_down = fliplr(U_mean_up);
%     U_mean_velB = [U_mean_down U_mean_up(2:end)]./18;
%     
%     U_mean_up = mean(velC);
%     U_mean_down = fliplr(U_mean_up);
%     U_mean_velC = [U_mean_down U_mean_up(2:end)]./18;
%     
%     U_mean_up = mean(velD);
%     U_mean_down = fliplr(U_mean_up);
%     U_mean_velD = [U_mean_down U_mean_up(2:end)]./18;
    
    U_fluct = velA - mean(velA);
    U_rms_up = rms(U_fluct);
    U_rms_down = fliplr(U_rms_up);
    U_rms_velA = [U_rms_down U_rms_up(2:end)]./18;

%     U_fluct = velB - mean(velB);
%     U_rms_up = rms(U_fluct);
%     U_rms_down = fliplr(U_rms_up);
%     U_rms_velB = [U_rms_down U_rms_up(2:end)]./18;
%     
%     U_fluct = velC - mean(velC);
%     U_rms_up = rms(U_fluct);
%     U_rms_down = fliplr(U_rms_up);
%     U_rms_velC = [U_rms_down U_rms_up(2:end)]./18;
%     
%     U_fluct = velD - mean(velD);
%     U_rms_up = rms(U_fluct);
%     U_rms_down = fliplr(U_rms_up);
%     U_rms_velD = [U_rms_down U_rms_up(2:end)]./18;
  
% axes1 = axes('Parent',fig,...
%     'Position',[0.13 0.11 0.237496339677892 0.815]);
% hold(axes1,'on');
%saveas(fig,fullfile('Figures','U_mean_b_cy2'),'jpg')


subplot(1,col*2,w)
plot(U_mean_velA,zA,'-','LineWidth',1.5)
hold on
% plot(U_mean_velB,zB,'-^','LineWidth',1.2)
% plot(U_mean_velC,zC,'-o','LineWidth',1.2)
% plot(U_mean_velD,zD,'-s','LineWidth',1.2)
xlabel('U/U_0')
ylabel('z/D')
title(['x/D = ',num2str(h(k))],'FontSize',12)
xlim([0 1.5])

if k==1
    legend([c(1,:),c(2,:),c(4,:),c(5,:)],'Location','northwest')
end

subplot(1,col*2,w+1)
plot(U_rms_velA,zA,'-','LineWidth',1.5)
hold on
% plot(U_rms_velB,zB,'-^','LineWidth',1.2)
% plot(U_rms_velC,zC,'-o','LineWidth',1.2)
% plot(U_rms_velD,zD,'-s','LineWidth',1.2)
xlabel(' U^{\prime}_{rms} / U_0')
ylabel('z/D')
title(['x/D = ',num2str(h(k))],'FontSize',12)


w = w +2;

end
%%
saveas(fig,fullfile('Figures','U_mean_fluct_b_st'),'jpg')