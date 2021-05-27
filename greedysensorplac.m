function C = greedysensorplac(A,q,cand)
% Output:       C   -   output matrix
% Inputs:       A   -   dynamical matrix
%               q   -   number of outputs/sensor nodes
%            cand   -   vector with a list of states that are candidates 
%                       for placement. For example, if cand = [1 8 14 20], 
%                       then states x_1, x_8, x_14 and x_20 are possible 
%                       positions for sensor placement.
%
% Finds the optimal set of sensors that maximizes some "coefficient of
% observability". This is a greedy algorithm that has a guaranteed
% performance if the "coefficient of observability" is a submodular
% function, as shown in (Summers, 2016). For more details, see the
% references below.
%
% 1. Summers, T. H., Cortesi, F. L., & Lygeros, J. (2016).
%       On Submodularity and Controllability in Complex Dynamical Networks. 
%       IEEE Transactions on Control of Network Systems, 3(1), 91–101.
% 2. Montanari, A. N., & Aguirre, L. A. (2019).
%       Observability of Network Systems: A critical review of recent
%       results.
n = size(A,1);
C = zeros(q,n);

% Greedy optimization
delta = zeros(1,length(cand));
for k = 1:1:q  
    % Adds the sensor unit that provides higher coeficient increment
    delta_aux = zeros(1,length(cand));
    for j = 1:length(cand)
        Caux = C;
        Caux(k,cand(j)) = 1;
        delta_aux(j) = coef_obsv(A,Caux);
    end
    [~, argmax] = max(delta_aux - delta);
    C(k,cand(argmax)) = 1;
    cand = cand(cand~=cand(argmax));
    delta = coef_obsv(A,C)*ones(1,length(cand));
end
end