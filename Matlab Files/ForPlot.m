%% SECTION FOR CREATING THE PLOT

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.237496339677892 0.815]);
hold(axes1,'on');


% Create plot
plot(new/18,J2/8,'Marker','*','LineStyle','none'); % PLOT AFTER NON-DIMENTIONALIZING

% Create ylabel
ylabel('z/D');

% Create xlabel
xlabel(' mean U/U');

% Create title
title('Mean velocity profile');