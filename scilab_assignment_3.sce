function[C,D]=bestfit(A,B)
    x=(A'*A)\(A'*b);
    C=x(1,1);
    D=x(2,1);
endfunction

A = x_matrix("Enter matrix:",zeros(3,2));
B = x_matrix("Enter matrix:",zeros(3,1));
[C,D]=bestfit(A,B);
disp(B, 'B=');
disp(C, 'C=');
disp(D, 'D=');
disp('The-line of best fit -is b=C+Dt=');
printf('b=%f + %ft',C,D);

