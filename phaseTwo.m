function[bound, obasis, obfs, oval] = phaseTwo(A, b, c, sbasis, sbfs) 
% maximise c^T x 
% subject to Ax = b, x >= 0, b >=0
% 
% Input:
% An A mXn matrix with m<=n and rank(A) = m
% b column vector with m rows 
% c column vector with n rows
% sbasis a vector of size m of indices of column vectors for a feasible 
% basis for this problem from which to start the simplex method 
% sbfs a vector of size n which is the basic feasible solution
% corresponding to this basis 
%
%Output:
% bound = 0 if the problem is unbounded (there is no optimal solution) 
% bound = 1 if the problem is bounded (there is an optimal solution) 
% obasis = a vector of size m of indices of column vectors which gives an
% optimal feasible basis for the problem if the problem is bounded 
% obfs = a vector of size n which is the optimal basic feasible solution 
% corresponding to this optimal basis if the problem is bounded 
% % oval = the objective value of this optimal basic feasible solution 
%(if the problem is bounded)


end