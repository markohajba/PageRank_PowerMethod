%% Virovitica University of Applied Sciences
% Authors: Marko Hajba, Luka Majceni?, Nikola Stjepanovi?
% 2021

%% This script is used to calculate PageRank using Power Method
%% Inputs:  - modified adjancency matrix
%           - damping factor a, default 0.85
%           - tolerance eps

%% Outputs: - ranking vector r
%           - number of iteration needed to converge iter
%           - vector of relative errors rel(i)

function [r, iter, rel_err] = PageRankMP(Q, a = 0.85, eps = 1e-8)

n = size(Q, 1);
r = zeros(n, 1)+1/n;
e = ones(n, 1);
iter = 0;

do
    ++iter;
    r_start = r;
    r = a*Q'*r + (1/n)*e - (1/n)*norm(a*Q'*r, 1);
    rel(iter) = norm(abs(r_start-r), 2)/norm(r);
until(rel(iter) < eps)
