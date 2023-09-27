seed = 1344;
rng(seed,'twister');
clc;
clear;
close all;

% no. of trials for monte carlo simulation
N = 1000;
sigma =1;
% mu/sigma values for d values
ms = [0.5, 1, 2];
% different thresholds in logspace
thresholds = logspace(-5,5,50);
% Initialize ROC curve arrays
% simulation
Pd = zeros(length(ms), length(thresholds));
Pf = zeros(length(ms), length(thresholds));
% theoretical
tPf = zeros(length(ms), length(thresholds));
tPd = zeros(length(ms), length(thresholds));
% Loop over deflection ratios
for i = 1:length(ms)
   m = ms(i); % Current mu/sigma value
  
   % Generate N noise samples
   n = normrnd(0, sigma, N, 1);
  
   % Calculate r values for H0 and H1
   r_H0 = n;
   r_H1 = m + n;   %shift the mean for H1 
  
   % Loop over thresholds
   for j = 1:length(thresholds)
       threshold = thresholds(j);
       Pd(i, j) = mean(r_H1 > threshold);
       Pf(i, j) = mean(r_H0 > threshold);
       tPf(i, j)=1-normcdf(threshold,0,sigma);
       tPd(i, j)=1-normcdf(threshold,m,sigma);
   end
end

% Plot ROC curves
figure;
hold on;
for i = 1:length(ms)
   plot(Pf(i, :), Pd(i, :),'--','LineWidth',2);
   plot(tPf(i, :), tPd(i, :),'LineWidth',2);
end
xlabel('Pf');
ylabel('Pd');
legend('Theoretical ROC1,d=0.5','Simulation ROC1,d=0.5','Theoretical ROC2,d=1','Simulation ROC2,d=1','Theoretical ROC3,d=2','Simulation ROC3,d=2');
