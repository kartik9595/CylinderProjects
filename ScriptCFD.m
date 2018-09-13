% READING THE FILE

filename = 'Baseline_155.csv'; %Set path to directory
delimiter = ',';
startRow = 2;
formatSpec = '%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
X = dataArray{:, 1}/18;
Y = dataArray{:, 2};
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% CREATE FIGURE

figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(X,Y,'Marker','o','LineWidth',1);
ylim(axes1,[-0.15 0.15]);
box(axes1,'on');
title('Mean Profile');
xlabel({'U_m_e_a_n/U',''});
ylabel('z');