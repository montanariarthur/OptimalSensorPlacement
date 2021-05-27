function delta = coef_obsv(A,C)
% Output:   delta   -   coefficient of observability
% Inputs:       A   -   dynamical matrix
%               C   -   output matrix
%
% Returns the "coefficient of observability" of a pair (A,C).
% This code can be adjusted for different "coefficient of observability", 
% such as the definitions based on the observability Gramian.
%
% For more details, see the following reference:
% 1. Montanari, A. N., & Aguirre, L. A. (2019).
%       Observability of Network Systems: A critical review of recent
%       results.
O = obsv(A,C);                  % observability matrix
Oeig = abs(eig(O'*O));
delta = min(Oeig)/max(Oeig);    % coefficient of observability based on the
                                % conditioning of the observability matrix
end