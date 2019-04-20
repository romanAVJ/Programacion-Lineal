function [A,b,c] = pivote(A, b, c)
%Funcion pivote del libro vanderbrei
%   Dantzing rule

iter = 0;
eps = -10^-3;

while max(c) > eps
    % pick largest coefficient
    [cj, col] = max(c); %cj <-- Largest coef, col <-- index of cj
    Acol = A(:,col); %all the column of A 
    %OBS: by default, MATLAB selects the one with lowest index in case of
    %tie

    % select leaving variable
    

    if sum(Acol < -eps) == 0 %counts how many var imposes a restriction
        opt = -1; % unbounded
        disp("The LP is unbounded");
    else 
        %Not UNBOUNDED
        nums = b.*(Acol < -eps); %Multiplica por 1 la entrada bi si es cierta la condicion
        dens = -Acol.*(Acol < -eps);
        [t, row] = min(nums./dens); %Selects the var which imposes strongest constrain
        %t <-- the strongest constrain
        %row <-- index of the strongest constrain

        %%AQUI PUEDE ENTRAR Blands Rule

        Arow = A(row,:);  %Select the row
        
        %I believe is blands rule
        a = A(row,col); % Pivot element (the var who´s going out)
        A = A - Acol*Arow/a;
        A(row,:) = -Arow/a; %new tableu for A
%         A(:,col) = Acol/a; % ARRUINA EL TABLEU
%         A(row,col) = 1/a; %ARRUINA EL TABLEU
        brow = b(row);
        b = b - brow*Acol/a;
        b(row) = -brow/a;
        ccol = c(col);
        c = c - ccol*Arow/a;
        c(col) = ccol/a;

        iter = iter+1;
    end


end


