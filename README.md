# Optimal sensor placement for system observability
Greedy algorithm for optimal sensor placement in dynamical networks based on the system observability. The goal is to find a set of output variables (measurements) such that some given coefficient of observability is maximized. 

Details can be found in:
- Arthur N. Montanari, Luis A. Aguirre (**2020**). Observability of Network Systems: A Critical Review of Recent Results. *Journal of Control, Automation and Electrical Systems*, 31(6), 1348–1374. https://doi.org/10.1007/s40313-020-00633-5 .

Please, refer to this paper for further details. The codes syntax were adjusted to be better aligned with the paper notation. The contents of this repository were firstly reported at https://doi.org/10.13140/RG.2.2.22524.28803/1. 


# Usage

The following codes are direct implementations of the minimum sensor placement algorithm applied in Section 8.1.

- `coef_obsv.m`	: Computes the coefficient of observability of a pair (A,C).

- `greedysensorplac.m` : Optimal sensor placement based on a greedy algorithm and the coefficient of observability computed in `coef_obsv.m`.

- `greedypmuplac.m` : Adjusted version of `greedysensorplac.m` for the PMU placement application example (Section 8.1) in the context of power grids.


# License

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

The full text of the GNU General Public License can be found in the file "LICENSE.txt".
