close all;
clear all;
addpath('lib');
global method
global MAX_FRAMES
global T1
global alpha
global T3
global R
global sigma
global T4
MAX_FRAMES  = 100;
T1 = .01;
alpha = 0.5;
T3 = .03;
R = 5;
sigma = 0.2;
T4 = 0.4;

%[movRGB, f_rate] = read_video('../video/lab2016_1.mp4');
%save('movRGB.mat','movRGB', 'f_rate');
load('movRGB.mat');
methods = {'Fixed Threshold','Background modeling','Probabilistic Approach'};
instant = 25;
%for i=1:3
    %method = i;
    method = 3;
    s = strcat('Method: ',methods(method));
    if method ==1
        s = strcat(s,';T1=',num2str(T1));
    else
        if method == 2
            s = strcat(s,';alpha=',num2str(alpha),';T3=',num2str(T3));
        else
            s = strcat(s,';R=',num2str(R),';sigma=',num2str(sigma),';T4=',num2str(T4));
        end
    end
    disp(char(s));
    
    motion = motion_detection(movRGB);
    results(:,:,method) = motion(:,:,instant);

    %figure;
    %imshow(results(:,:,i));
    %title(s);
    %implay(mov/255, f_rate);
%end
implay(motion, f_rate);
figure(4);
imshow(movRGB(:,:,:,instant)/255);
