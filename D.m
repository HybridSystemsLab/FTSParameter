function [value] = D(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: D.m
%
% Description: Jump set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% params
varepsilon = 0.3;

% state
QQ = x(8);

if det(QQ) >= varepsilon; % jump condition
    value = 1; % report jump
else
    value = 0; % do not report jump
end