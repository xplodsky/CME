clear;
global ki=3.2;

function y=func3(x)
  global ki;
  y = [log(1-x(1)-x(2)) - log(1-x(3)-x(4)) + ki* (x(1)*x(1) - x(3)*x(3) + x(2)*x(2) - x(4)*x(4) + x(1)*x(2) -x(3)*x(4));
       log(1-x(3)-x(4)) - log(1-x(5)-x(6)) + ki* (x(3)*x(3) - x(5)*x(5) + x(4)*x(4) - x(6)*x(6) + x(3)*x(4) -x(5)*x(6));
       log(1-x(1)-x(2)) - log(1-x(5)-x(6)) + ki* (x(1)*x(1) - x(5)*x(5) + x(2)*x(2) - x(6)*x(6) + x(1)*x(2) -x(5)*x(6));
       
       log(x(1)) - log(x(3)) + ki* (x(1)*x(1) - x(3)*x(3) + x(2)*x(2) -x(4)*x(4) + x(1)*x(2) -x(3)*x(4) + (1-x(2)-2*x(1)) - (1-x(4)-2*x(3)));
       log(x(3)) - log(x(5)) + ki* (x(3)*x(3) - x(5)*x(5) + x(4)*x(4) -x(6)*x(6) + x(3)*x(4) -x(5)*x(6) + (1-x(4)-2*x(3)) - (1-x(6)-2*x(5)));
       log(x(1)) - log(x(5)) + ki* (x(1)*x(1) - x(5)*x(5) + x(2)*x(2) -x(6)*x(6) + x(1)*x(2) -x(5)*x(6) + (1-x(2)-2*x(1)) - (1-x(6)-2*x(5)));
   
       log(x(2)) - log(x(4)) + ki* (x(1)*x(1) - x(3)*x(3) + x(2)*x(2) -x(4)*x(4) + x(1)*x(2) -x(3)*x(4) + (1-x(1)-2*x(2)) - (1-x(3)-2*x(4)));
       log(x(4)) - log(x(6)) + ki* (x(3)*x(3) - x(5)*x(5) + x(4)*x(4) -x(6)*x(6) + x(3)*x(4) -x(5)*x(6) + (1-x(3)-2*x(4)) - (1-x(5)-2*x(6)));
       log(x(2)) - log(x(6)) + ki* (x(1)*x(1) - x(5)*x(5) + x(2)*x(2) -x(6)*x(6) + x(1)*x(2) -x(5)*x(6) + (1-x(1)-2*x(2)) - (1-x(5)-2*x(6)))];
              
endfunction

x30= [0.1;0.1;0.8;0.1;0.1;0.8];

[x3,fval]=fsolve(@func3,x30);

fp=fopen('ternary3P.txt','w');
fprintf(fp, "%f %f %f\n", 1-x3(1)-x3(2),x3(1),x3(2));
fprintf(fp, "%f %f %f\n", 1-x3(3)-x3(4),x3(3),x3(4));
fprintf(fp, "%f %f %f\n", 1-x3(5)-x3(6),x3(5),x3(6));
fprintf(fp, "%f %f %f\n", 1-x3(1)-x3(2),x3(1),x3(2));
%plot ([0.1009725 0.5 0.89903 0.1009725],[0.058295 0.74941 0.058295 0.058295]) in form ([b1 b3 b2 b1],[c1 c3 c2 c1])
%the coordinates have been changed here to fit gibbs triangle

%x =
%   0.067315 b1
%   0.067315 c1
%   0.865371   b2
%   0.067315   c2
%   0.067315     b3
%   0.865371     c3