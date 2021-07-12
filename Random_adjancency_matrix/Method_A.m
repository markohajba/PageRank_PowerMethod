%% Virovitica University of Applied Sciences
% Authors: Marko Hajba, Luka Majceni?, Nikola Stjepanovi?
% 2021

%% this script can be easily transformed into function
%% second part is optional as a verification

s = 100;            % matrix dimension  s x s
A = zeros(s, s);    % initialize matrix A with zeroes
tic ()
%% construction of modified adjancency matrix
for i = 1:s
  random = randi(s);
  for j = 1:random
    while true
      index = randi(s);
      if A(i, index) == 0
        A(i, index) = 1/random;
        break;        
      endif
    endwhile    
  endfor
endfor
disp('Modified adjancency matrix time:')
toc()

%% verification if A is row-stohastic
for i = 1:s
  sum = 0;
  for j = 1:s
    sum = sum + A(i,j);
  endfor 
  if abs(sum -1) > 1e-12
    printf ("\n Matrix is not  row stohastic")
  endif
endfor


