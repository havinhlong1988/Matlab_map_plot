close all; clear all; clc;
% Displaying Topographic Data with matlab

% Loading the topographic data
load topo topo topomap1    % load data 
whos('topo','topomap1')     % display the data information

%% Create Contour Plot
x = 0:359;                                % longitude
y = -89:90;                               % latitude
%
    h = figure('Name','Contour plot','Numbertitle','off',...
        'Position',[1 1 1200 800],'visible','on');
contour(x,y,topo,[0 0],'k','LineWidth',1.5)

axis equal                                % set axis units to be the same size
box on                                    % display bounding box
%
ax = gca;                                 % get current axis               
ax.XLim = [0 360];                        % set x limits
ax.YLim = [-90 90];                       % set y limits
ax.XTick = [0 60 120 180 240 300 360];    % define x ticks
ax.YTick = [-90 -60 -30 0 30 60 90];      % define y ticks
%
ax.GridLineStyle = '-';
ax.GridColor = 'b';
ax.XGrid = 'on';
ax.YGrid = 'on';
%
ax.XLabel.String = 'Longitude (deg)';
ax.XLabel.FontSize = 12;
ax.XLabel.FontName = 'Times New Roman';
ax.XLabel.FontWeight = 'Bold';
ax.XLabel.Color = 'Blue';
%
ax.YLabel.String = 'Latitude (deg)';
ax.YLabel.FontSize = 12;
ax.YLabel.FontName = 'Times New Roman';
ax.YLabel.FontWeight = 'Bold';
ax.YLabel.Color = 'Blue';
%
ax.Title.String = 'Contour world map';
ax.Title.FontWeight = 'normal';
ax.Title.FontSize = 15;
%
print('-dtiff','-r500','00_contour_plot.tiff');
close(h)
%% View Data as Image
h1 = figure('Name','Image_plot','Numbertitle','off',...
    'Position',[1 1 1200 800],'visible','on');
image([0 360],[-90 90], flip(topo), 'CDataMapping', 'scaled'); hold on;
colormap(topomap1);

contour(x,y,flip(topo),[0 0],'k','LineWidth',1.5)

%
axis equal                                % set axis units to be the same size
%
ax = gca;                                 % get current axis               
ax.XLim = [0 360];                        % set x limits
ax.YLim = [-90 90];                       % set y limits
ax.XTick = [0 60 120 180 240 300 360];    % define x ticks
ax.YTick = [-90 -60 -30 0 30 60 90];      % define y ticks
%
ax.GridLineStyle = '-';
ax.GridColor = 'b';
ax.XGrid = 'on';
ax.YGrid = 'on';
%
ax.XLabel.String = 'Longitude (deg)';
ax.XLabel.FontSize = 12;
ax.XLabel.FontName = 'Times New Roman';
ax.XLabel.FontWeight = 'Bold';
ax.XLabel.Color = 'Blue';
%
ax.YLabel.String = 'Latitude (deg)';
ax.YLabel.FontSize = 12;
ax.YLabel.FontName = 'Times New Roman';
ax.YLabel.FontWeight = 'Bold';
ax.YLabel.Color = 'Blue';
%
ax.Title.String = ' Topo world map';
ax.Title.FontWeight = 'normal';
ax.Title.FontSize = 15;
%
print('-dtiff','-r500','00_contour_color_plot.tiff');
close(h1)
%% Use Texture Mapping
h2 = figure('Name','Image_plot','Numbertitle','off',...
    'Position',[1 1 800 800],'visible','on');
clf
[x,y,z] = sphere(100);          % create a sphere 
s = surface(x,y,z);            % plot spherical surface
hold on;
% contour3(x,y,z,topo,'k','LineWidth',1.5)
%
s.FaceColor = 'texturemap';    % use texture mapping
s.CData = topo;                % set color data to topographic data
s.EdgeColor = 'none';          % remove edges
s.FaceLighting = 'gouraud';    % preferred lighting for curved surfaces
s.SpecularStrength = 0.4;      % change the strength of the reflected light

light('Position',[-1 0 1])     % add a light

axis square off                % set axis to square and remove axis
view([0,0])                 % set the viewing angle
