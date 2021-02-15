close all; clear all; clc;

%% Plot in Geographic Coordinates
% 
% h = figure('Name','Cross_map','Numbertitle','off',...
%     'Position',[1 1 1200 800],'visible','on');
% %
% latSeattle = 47.62;
% lonSeattle = -122.33;
% latAnchorage = 61.20;
% lonAnchorage = -149.9;
% %
% geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage],'g-o','LineWidth',2)
% geolimits([45 62],[-149 -123])
% %% Geographic Bubble Chart
% tsunamis = readtable('tsunamis.xlsx');
% tsunamis.Cause = categorical(tsunamis.Cause);
% %
% h1 = figure('Name','Tsunami','Numbertitle','off',...
%     'Position',[1 1 1200 800],'visible','on');
% %
% gb = geobubble(tsunamis,'Latitude','Longitude', ...
%         'SizeVariable','MaxHeight','ColorVariable','Cause');
% geolimits([10 65],[-180 -80])
% title 'Tsunamis in North America';
% %
% gb.SizeLegendTitle = 'Maximum Height';

%% Geographic Scatter Plot
opts = detectImportOptions('00_sta.txt');
opt1 = detectImportOptions('fault_lv1.txt');
st = readtable('00_sta.txt',opts);
f = readtable('fault_lv1.txt',opt1);
% Separate the station by network code
for i=1:length(st.Var1)
    if st.Var1{i}(1:2) =='CB'; ibin(i)=1;
    elseif st.Var1{i}(1:2) =='LA'; ibin(i)=2;
    elseif st.Var1{i}(1:2) =='MM'; ibin(i)=3;    
    elseif st.Var1{i}(1:2) =='IC'; ibin(i)=4;
    elseif st.Var1{i}(1:2) =='IU'; ibin(i)=5;
    elseif st.Var1{i}(1:2) =='VN'; ibin(i)=6;
    elseif st.Var1{i}(1:2) =='TM'; ibin(i)=7;
    elseif st.Var1{i}(1:2) =='TW'; ibin(i)=8;
    elseif st.Var1{i}(1:2) =='YA'; ibin(i)=9;
    else ibin(i)=10;
    end
end
%
h2 = figure('Name','Tsunami','Numbertitle','off','Position',[1 1 1200 800],'visible','on');
% %
ax = geoscatter(st.Var2',st.Var3',60,'^','filled');hold on
fx = geoplot(f.Var2,f.x_,'r-','LineWidth',1.2);
%
geoplot(st.Var2',st.Var3','k^');
s1 = geoplot(st.Var2(ibin==1),st.Var3(ibin==1),'k^','MarkerFaceColor','k');
s2 = geoplot(st.Var2(ibin==2),st.Var3(ibin==2),'k^','MarkerFaceColor','g');
s3 = geoplot(st.Var2(ibin==3),st.Var3(ibin==3),'k^','MarkerFaceColor','y');
s4 = geoplot(st.Var2(ibin==4),st.Var3(ibin==4),'k^','MarkerFaceColor','r');
s5 = geoplot(st.Var2(ibin==5),st.Var3(ibin==5),'k^','MarkerFaceColor',[1 0.4 0.6]);
s6 = geoplot(st.Var2(ibin==6),st.Var3(ibin==6),'k^','MarkerFaceColor','b');
s7 = geoplot(st.Var2(ibin==7),st.Var3(ibin==7),'k^','MarkerFaceColor','c');
s8 = geoplot(st.Var2(ibin==8),st.Var3(ibin==8),'k^','MarkerFaceColor','m');
s9 = geoplot(st.Var2(ibin==9),st.Var3(ibin==9),'k^','MarkerFaceColor','w');
s10 = geoplot(st.Var2(ibin==10),st.Var3(ibin==10),'k^','MarkerFaceColor','grey');
% geobasemap colorterrain
geobasemap landcover
geolimits([18 26],[100 110])
% -------------------- Legend the plot ------------------------------------
lgd = legend([s1 s2 s3 s4 s5 s6 s7 s8 s9 s10],...
    {'CB','LA','MM','IC','IU','VN','TM','TW','YA','Other'},...
    'location','northeast');
title(lgd,'Network code');
lgd.NumColumns = 2;
lgd.FontSize = 10;
lgd.FontName = 'Times New Roman';
% ----------------------- Main plot title ---------------------------------
tit = title('Example of Northern Vietnam seismic monitoring coverage');
tit.FontSize = 18;
tit.FontWeight = 'Bold';
tit.Color = 'Blue';
tit.FontName = 'Times New Roman';
% 
%ax = gca;   
%
% ax.XLabel.String = 'Longitude (deg)';
% ax.XLabel.FontSize = 12;
% ax.XLabel.FontName = 'Times New Roman';
% ax.XLabel.FontWeight = 'Bold';
% ax.XLabel.Color = 'Blue';
% %
% ax.YLabel.String = 'Latitude (deg)';
% ax.YLabel.FontSize = 12;
% ax.YLabel.FontName = 'Times New Roman';
% ax.YLabel.FontWeight = 'Bold';
% ax.YLabel.Color = 'Blue';
%
print('-dtiff','-r500','00_stations_plot.tiff');
close(h2);