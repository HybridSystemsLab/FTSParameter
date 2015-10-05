function [value] = C(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Yuchun Li
%
% Project: Simulation of a hybrid system
%
% Name: C.m
%
% Description: Flow set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% parameter varepsilon 
varepsilon = 0.3;

% state
QQ   = x(8);

if det(QQ) <= varepsilon % flow condition
    value = 1; % report flow
else
    value = 0; % do not report flow
end
