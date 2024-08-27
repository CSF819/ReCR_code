clc;clear;
addpath(genpath('.\algo'));%添加路径
addpath(genpath('.\dataset'))
all_data = cell(100, 1);
basePath='\SIM_pair_Data\SIM-G'; % simulated data path
%basePath='\pairs\';
count=[];
indXY=[];
% 遍历文件编号，从 pair001 到 pair0108
for i = 1:100
    filename = fullfile(basePath, sprintf('pair0%03d.txt', i));
    data = readmatrix(filename);
    all_data{i} = data;
end
for i = 1:length(all_data)
    % 检查子单元格是否是一个矩阵，并且其列数为2
    if size(all_data{i}, 2) ~= 2
           count(end+1)=i;
    end
end
for i = 1:length(all_data)
    [indXY(i),~]=EL_directionByELMean(all_data{i,1}(:,1),all_data{i,1}(:,2));
end
indXY;
accuracy=sum(indXY)/100 





