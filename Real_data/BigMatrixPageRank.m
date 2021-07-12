%% Virovitica University of Applied Sciences
% Authors: Marko Hajba, Luka Majceni?, Nikola Stjepanovi?
% 2021

format none

function [r,iter,rel_err] = PageRankMP(Q, a=0.85, epsilon=1e-8)

n = size(Q, 1);
r = zeros(n, 1)+1/n;
e = ones(n, 1);
iter = 0;

do
    ++iter;
    r_start = r;
    r = a*Q*r + (1/n)*e - (1/n)*norm(a*Q*r, 1);
    rel_err(iter) = norm(abs(r_start-r), 2)/norm(r);
until(rel_err(iter) < epsilon)

endfunction

%% load data
load('web-Google.mat');   
Q = Problem.A';     # transpose adjancency matrix
s = size(Q, 1);
n = s;
n1 = zeros(s,1);    # auxilliary vector
[ii,jj] = find(Q);  # store the indices of non-zero elements

%% Modification of the adjancency matrix
disp('Constructing modified adjancency matrix:')
tic()
for i = 1:s
    n1(i)=sum(Q(:,i));
end
for k = 1:length(ii)
    Q(ii(k), jj(k)) = Q(ii(k), jj(k)) / n1(jj(k));
end
disp('Time:')
toc()

%% use function PageRankMP() to calculate PageRank
tic()
[r, iter, rel_err] = PageRankMP(Q, a = 0.85, epsilon = 1e-15);
disp('Time - PageRank iterations:')
toc()         

## sort the indices according to the ranks and show top 10
disp("Top 10 pages and their corresponding indices")
disp("rank         index")
[r_sorted, indices] = sort(r, 'descend');
[r_sorted(1:10), indices(1:10)]
