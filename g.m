function xplus = g(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: g.m
%
% Description: Jump map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% state
x1    = x(1); 
x2    = x(2); 
xo    = x(3:4);
th    = x(5);
LL    = x(6:7);
QQ    = x(8);
eta   = x(9:10);
gamma = x(11);
time  = x(12);


xp = [x1;x2];

% jump map
xpplus    = xp;
xoplus    = xp;
thplus    = inv(QQ)*gamma;
LLplus    = [0 0]';
QQplus    = 0;
etaplus   = [0 0]';
gammaplus = 0;
timeplus  = time;


xplus = [xpplus;...
         xoplus;...
         thplus;...
         LLplus;...
         QQplus;...
         etaplus;...
         gammaplus;...
         timeplus];   
end