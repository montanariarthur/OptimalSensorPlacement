function C = greedypmuplac(A,q,cand)
% Output:       C   -   output matrix
% Inputs:       A   -   dynamical matrix of a linearized power grid
%                       (assuming effective-network model)
%               q   -   number of PMUs
%            cand   -   vector with a list of generator nodes that are.
%                       For example, if cand = [1 8 14 20], then generator
%                       nodes v_1, v_8, v_14 and v_20 are possible 
%                       positions for sensor placement.
%
% This is a slightly adjusted version of function "greedysensorplac.m" used
% to generate the results in Section 8 of (Montanari, 2019). Assuming that
% the dynamical matrix A is in the form of equation (39), then -- in this
% greedy search -- if a sensor node (PMU) is placed in generator node v_i,
% then we assume that both states \phi_i and \dot{\phi}_i are added as
% *independent* measures to output matrix C. The greedy search for an
% optimal set of sensor nodes, thus, is performed on the space of generator
% nodes rather than on the space of state nodes as in "greedysensorplac.m".
%
% For more details, see the following reference:
% 1. Montanari, A. N., & Aguirre, L. A. (2019).
%       Observability of Network Systems: A critical review of recent
%       results.
N = size(A,1)/2;            % number of generator nodes
n = 2*N;                    % number of state variables
C = zeros(2*q,n);           % number of output variables

% Greedy optimization
delta = zeros(1,length(cand));
for k = 1:2:2*q 
    % Adds the sensor unit that provides higher coeficient increment
    delta_aux = zeros(1,length(cand));
    for j = 1:length(cand)
        Caux = C;
        Caux(k,cand(j)) = 1;
        Caux(k+1,cand(j)+N) = 1;
        delta_aux(j) = coef_obsv(A,Caux);
    end
    [~, argmax] = max(delta_aux - delta);
    C(k,cand(argmax)) = 1;
    C(k+1,cand(argmax)+N) = 1;
    cand = cand(cand~=cand(argmax));
    delta = coef_obsv(A,C)*ones(1,length(cand));
end

end