% Virovitica University of Applied Sciences, 2021.
% Authors: Marko hajba, Luka Majcenic, Nikola Stjepanovic
%%%%% Example 1: 4x4 network %%%%%


% adjancency matrix
Q = [0 0 0 0; 1/2 0 1/2 0; 0 0 0 1; 0 0 1 0]'

n = size(Q, 1);
r = zeros(n, 1)+1/n;

% define parameters
epsilon = 1e-8;
a = 0.85;
e = ones(n, 1);
iter = 0;
R(1, :) = r';
do
    ++iter;
    r_start = r;
    r = a*Q*r + (1/n)*e - (1/n)*norm(a*Q*r, 1);
    R(iter+1, :) = r';
    rel_err(iter) = norm(abs(r_start-r), 2)/norm(r);
until(norm(abs(r_start-r), 2)/norm(r) < epsilon)

%% solution:
r
iter
rel_err;

% this is small example, so we can check the absolute value of the 
% largest eigenvalue obtained from r -  expected to be 1
Q2 = [1/4 1/4 1/4 1/4; 37/80 3/80 37/80 3/80; 
      3/80 3/80 3/80 71/80; 3/80 3/80 71/80 3/80];

lambda_1_approx = Q2'*r./r

%% visualize rank of the each webpage in the example
x_axis = 0:105;
graf = figure(1), plot(x_axis, R(:, 1), 'ro-', 'markersize', 5, x_axis, R(:, 2), 'bo-', 'markersize', 5, ...
        x_axis, R(:, 3), 'go-', 'markersize', 5, x_axis, R(:, 4), 'ko-', 'markersize', 5 )
set (gca, "fontsize", 30),
xlabel("Iteration", 'fontsize', 30),
ylabel("Rank of the webpage",'fontsize', 30),
ylim([0, 0.5]),
title("Rank of the webpages from Example 1 w.r.t. iterations", 'fontsize', 30),
legend("A", "B", "C", "D", 'location', 'east')
