function xdot = f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: f.m
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% global data 
AA  = [0 1;-1 0];

% constant parameter \gamma
ga  = 1;
% parameter K1
KK1 = 1;
% the parameter to be estimated
tt  = 2;   


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

xp    = [x1;x2];
gx    = [0;-x1];
KK    = KK1 + 1/4*gx*ga*gx';

% simulate without noise 
m     = 0;

% simulate with noise
% m     = [sin(10*time);cos(10*time)];

xpdot = AA*xp + gx*(tt^2-1) + m;

xodot = AA*xp + gx*th + KK*(xp - xo) + LL*ga*(LL'+gx')*(xp - xo);
thdot = ga*(LL'+gx')*(xp - xo);

LLdot = gx - KK*LL;
QQdot = LL'*LL;

etadot  =  - KK*eta;
gammadot=  LL'*(LL*th + xp - xo - eta);

timedot = 1;

        
xdot = [xpdot;...
        xodot;...
        thdot;...
        LLdot;...
        QQdot;...
        etadot;...
        gammadot;...
        timedot];      
end