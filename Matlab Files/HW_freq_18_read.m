clc; clear all; close all;
%% ------------------------------------------------------------------------
%% READ FILES AT 18 M/S
%% ------------------------------------------------------------------------
row = 0;
U = [];
S = [];

for i=0:0.5:15    
    if mod(i,1)==0
    FF = int2str(i);
    FF = strcat(FF,'.txt');
    row = row + 1;
end
if mod(i,1)==0.5 && i < 10  %%REMOVE second boolean if all measurements 0.5
    FFt = num2str(i);
    FF = strrep(FFt,'.','-');
    FF = strcat(FF,'.txt');
    row = row + 1;
end
filename = FF;  
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
u = dataArray{1, 3};
U(:,row) = u(1:1000);
s = dataArray{1, 6};
S(:,row) = s(1:1000);

end

%Save in the command window the values of U and S like:

% U_158_b = U; S_158_b = S(1:500,:);
% save('U_S_158_base.mat','U_158_b','S_158_b')


