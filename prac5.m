%%dipole length whose Z  is closest to 50 across a BW
fc = 1e9;%unused, lambda varies with freq being processed
BW = linspace(0.9e9, 1.1e9, 100);% 100MHz
Lval = linspace(0.3, 0.7, 100);
%lambda = physconst('LightSpeed')/fc;


%creating arrays
% sum = zeros(size(Lval));
Zin = zeros(size(Lval));
% min_imp_value = zeros(size(Lval));

%First initial length guessed
L0 = 0.45*lambda;


% Objective function
Imp_obj_fnctn = @(L)mean(arrayfun(@(f)abs(impedance(dipole('Length', L, 'Width', L*0.02), f)), BW));
%@L and @f mean insertion of a variable L and freq value respectively
%funtion finds the mean avg impedance for one length at BW range of freqs
%then moves to the next L value and repeats


%Optimizer
[L_opt, min_imp_value] = fminsearch(Imp_obj_fnctn, L0);

%Output
optDipole = dipole('Length', L_opt, 'Width', 0.02*L_opt);
fprintf('Length: %.4f m\nImpedance Value: %.2f Ohms \n', L_opt, min_imp_value);
 

for  k = 1:length(BW)
    
%     lambda = physconst('LightSpeed')/BW(k);
%     L0 = 0.45*lambda;
%     
%     % Wrong function
%     Imp_obj_fnctn = mean(arrayfun(@(f)abs(impedance(dipole('Length', L(k), 'Width', L(k)*0.02),f)), BW)); %@(L) takes the varying inputs of L
%     %fprintf('BW :%.4f\n', BW(k))
%     
%     [L_opt, min_imp_value(k)] = fminsearch(Imp_obj_fnctn, L0);
%     optDipole = dipole('Length', L_opt, 'Width', 0.02*L_opt);
%     sum(k) =  L_opt;
%     
    d = dipole('Length', Lval(k)*lambda, 'Width', 0.02*Lval(k));
    Zin(k) = impedance(d, fc);

end
% fprintf('Impedances: %.4f, ', min_imp_value)
% fprintf('\n');
% fprintf('Lengths: %.4f, ', sum)
% fprintf('\n');

% Optimizer
[L_opt, min_imp_value] = fminsearch(Imp_obj_fnctn, L0);

optDipole = dipole('Length', L_opt, 'Width', 0.02*L_opt);

fprintf('Length: %.4f m \nImpedance Value: %.2f Ohms \n', L_opt, min_imp_value);

%Target Impedance
Z0 = 50;

%Plots
figure (2), plot(Lval*lambda, abs(Zin)-Z0), grid on;
xlabel('Length'), ylabel('Mismatch (Ohms)')
title('Mismatch vs Length')

figure (1), plot(Lval*lambda, abs(Zin)), grid on;
xlabel('Length'), ylabel('Impedance (Ohms)')
title('Impedance vs Length')
