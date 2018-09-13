%% Initialize variables.
line=linspace(1,1000,1000);
U=[];
% Loop to automatize reading of file
for i=0:15
FF=int2str(i);
FF=strcat(FF,'.txt');
filename =FF;  % Set the directory to "C:\Users\HP PC\Desktop\cylinder project\HW\HW\Flexible Spliter\.." etc
delimiter = '\t';
startRow = 6;
formatSpec = '%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Allocate imported array to column variable names
Evolt = dataArray{:, 1};
Ecorrvolt = dataArray{:, 2};
Ums1 = dataArray{:, 3};
Anmomtrems1 = dataArray{:, 4};
TemperatureC = dataArray{:, 5};
dBSpectrum = dataArray{:, 6};
U(i+1)=mean(Ums1);
end

%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

%% SECTION FOR CREATING THE PLOT

J2=-15:15;
L= fliplr(U); % HORIZONTALLY FLIPPING THE PLOT
L=L(1:15);
new=[L U]; % FOR MIRRORING THE PLOT
%plot(new,J2,'b*');

% % Create figure
% figure1 = figure('Color',[1 1 1]);
% 
% % Create axes
% axes1 = axes('Parent',figure1,...
%     'Position',[0.13 0.11 0.237496339677892 0.815]);
% hold(axes1,'on');
% 
% 
% % Create plot
% plot(new/18,J2/8,'Marker','*','LineStyle','none','Color',[0 0 1]); % PLOT AFTER NON-DIMENTIONALIZING
% 
% % Create ylabel
% ylabel('z/D');
% 
% % Create xlabel
% xlabel(' mean U_r_m_s/U');
% 
% % Create title
% title('Mean velocity profile');