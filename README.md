# Dipole_auto-optimization
This MATLAB code serves to automate the finding of the optimal dipole antenna length for operation over a bandwidth of frequencies.
# Overview

Automating Dipole Antenna Optimization: Length
## Introduction
Manual antenna optimization is tedious and not simply applicable for modern systems. Thus the process is to optimized so as to occur seamlessly during transmissions and receptions without interruption or labor.  
A dipole antenna offers a simplistic view into the optimization process with a limited number of parameters which can be adjusted, these are the length and the width. The width is to be held relatively constant for this observation, varying only proportionately with the changes in the length.
## Aim
The purpose of this was to automate the optimization of a dipole antenna based on a single parameter: length.
Procedure
The experiment is done over a bandwidth of 200MHz, from 900MHz to 1100MHz. The lengths are varied from 0.3*lambda to 1.2*lambda. Lambda is dependent on the varying frequency in the bandwidth.
## Results
  ![image](https://github.com/user-attachments/assets/0dfb59a5-204d-44c0-a970-ecf73ec321e6)

The optimal length is indicated as 0.1367 meters at an impedance value of 81.06 ohms. 
From the target impedance of 50 ohms, this gives an impedance mismatch of 31.06 ohms
Obviously, there is a slight discrepancy between the plot value of optimized length and the generated value
The objective function in the code serves to take a particular range of lengths and the given range of bandwidth frequencies and test each length with all the frequencies before moving to the next, generating their individual impedances. The optimizer serves the purpose of finding the least value of impedance for the lengths across all the frequencies tested and its associated length and returning it as the optimal condition.
![image](https://github.com/user-attachments/assets/c5ee3511-74a7-46cc-b6bd-d6ce5dfdc53c)

## Discussion
The impedance mismatch shows the difference between the characteristic impedance of the transmission line or waveguide and the actual impedance of the antenna. It is rarely perfect but the lower its value the lower the backward reflection of signals causing standing waves and thus signal loss.
The plot reveals lengths with lower mismatches than the optimal generated. This can be attributed to the initial guess length being a bit far from the optimal and difference in the bounds for the plot and the optimizer function.
## Conclusion
This experiment demonstrates that if there is need for utilization of a dipole, the optimal length of operation must be considered and this can be obtained automatically over its Bandwidth of frequencies.



