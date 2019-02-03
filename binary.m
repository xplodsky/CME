global ki=3.2;

function y=func(x)
  global ki;
  y= [  (ki*x(1)*x(1) + log(1-x(1))) - (3.2*x(2)*x(2) + log(1-x(2)));
        (ki*(1-x(1))*(1-x(1)) + log(x(1))) - (3.2*(1-x(2))*(1-x(2)) + log(x(2)))];
endfunction

x0=[0.1;0.9];

[x,fval]=fsolve(@func,x0)

%making mat1 for plotting purpose
mat1(1,1)=x(1);
mat1(1,2)=0;
mat1(2,1)=x(2);
mat1(2,2)=0;

%Result
%x = 0.054678  0.945322
%fval = -0.000000057177  0.000000057177

fp=fopen('binary.txt', 'w');
fprintf(fp, "%f %f \n", x);
%fprintf(fp, "%f\t%f\t%f\n", 1-x(2),x(2),0);
fclose(fp);