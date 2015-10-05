%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Yuchun Li
%
% Project: Frequency estimation of a sinusoid signal via hybrid technique
%
% Name: run.m
%
% Description: run script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all 

%%%%%%%% INITIALIZE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial conditions                                                  
%%% -----------------------
xp0     = [2 2]';       % plant's state 
xo0     = [1 1]';       % observer's state
tt0     = 4;            % parameter's estimate 
LL0     = [0.1 0.1]';   % auxiliary state L
QQ0     = 0;            % auxiliary state Q
eta0    = [0.1 0.2]';   % auxiliary state \eta
gamma0  = 0.1;          % auxiliary state \Gamma
time0   = 0;            % track of ordinary time 


y0 = [xp0;xo0;tt0;LL0;QQ0;eta0;gamma0;time0]; 

% simulation horizon
TSPAN = [0 10];
JSPAN = [0 200];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1e-1,'MaxStep',1e-2);

% simulate
[t y j] = hybridsolver(@f,@g,@C,@D,y0,TSPAN,JSPAN,rule);


% plot solution
figure 
set(gca,'FontSize',30)
plotflows(t,j,y(:,5))

