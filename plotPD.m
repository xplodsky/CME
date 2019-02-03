clear;
global ki=3.2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Binary  Calculation 
function y=func(x)
  global ki;
  y= [  (ki*x(1)*x(1) + log(1-x(1))) - (3.2*x(2)*x(2) + log(1-x(2)));
        (ki*(1-x(1))*(1-x(1)) + log(x(1))) - (3.2*(1-x(2))*(1-x(2)) + log(x(2)))];
endfunction

x0=[0.1;0.9];
[x,fval]=fsolve(@func,x0);


fp=fopen("binary.dat", "w");
fprintf(fp, "%f\t%f\t%f\n", 1-x(1),x(1),0);
fprintf(fp, "%f\t%f\t%f\n", 1-x(2),x(2),0);
fclose(fp);
%making mat1 for plotting purpose
mat1(1,1)=x(1);
mat1(1,2)=0;
mat1(2,1)=x(2);
mat1(2,2)=0;

%Result
%x = 0.054678  0.945322
%fval = -0.000000057177  0.000000057177


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Ternary Two Phase Calculation
global c=[0.01;0.01];

function y=func2(b)
  global c;
  global ki;
  y = [log(1-b(1)-c(1)) - log(1-b(2)-c(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) - c(2)*c(2) + b(1)*c(1) -b(2)*c(2));
       log(b(1)) - log(b(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) -c(2)*c(2) + b(1)*c(1) -b(2)*c(2) + (1-c(1)-2*b(1)) - (1-c(2)-2*b(2)));
       log(c(1)) - log(c(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) -c(2)*c(2) + b(1)*c(1) -b(2)*c(2) + (1-b(1)-2*c(1)) - (1-b(2)-2*c(2)))];
endfunction

b0=[0.055;0.845];

%loop and increment in c is such that 6 tie lines are generated
for i=1:6
  [b,fval]=fsolve(@func2,b0);
   mat2(i,1)=b(1);
   mat2(i,2)=c(1);
   mat2(i,3)=b(2);
   mat2(i,4)=c(2);
   b0=b0+[0.001;-0.001];
   c=c+[0.01;0.01];
endfor

%changing co-ordinates to fit in gibbs triangle
for i=1:6
  mat2(i,1)=(2*mat2(i,1)+mat2(i,2))/2;
  mat2(i,2)=0.866*mat2(i,2);
  mat2(i,3)=(2*mat2(i,3)+mat2(i,4))/2;
  mat2(i,4)=0.866*mat2(i,4);
endfor


%Results in form (b1,c1,b1,c2)
%mat2 =
%   0.0613628   0.0086600   0.9386372   0.0086600
%   0.0681093   0.0173200   0.9318907   0.0173200
%   0.0749209   0.0259800   0.9250791   0.0259800
%   0.0818009   0.0346400   0.9181992   0.0346400
%   0.0887529   0.0433000   0.9112471   0.0433000
%   0.0957808   0.0519600   0.9042192   0.0519600


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Ternary Three Phase Calculation
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


  mat3(1,1)=(2*x3(1)+x3(2))/2;
  mat3(1,2)=0.866*x3(2);
  mat3(2,1)=(2*x3(3)+x3(4))/2;
  mat3(2,2)=0.866*x3(4);
  mat3(3,1)=(2*x3(5)+x3(6))/2;
  mat3(3,2)=0.866*x3(6);
  mat3(4,1)=(2*x3(1)+x3(2))/2;
  mat3(4,2)=0.866*x3(2);

%plot ([0.1009725 0.5 0.89903 0.1009725],[0.058295 0.74941 0.058295 0.058295]) in form ([b1 b3 b2 b1],[c1 c3 c2 c1])
%the coordinates have been changed here to fit gibbs triangle

%x =
%   0.067315 b1
%   0.067315 c1
%   0.865371   b2
%   0.067315   c2
%   0.067315     b3
%   0.865371     c3


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Plotting phase diagram 
clf;

%gibbs triangle
plot([0 0.5 1 0],[0 0.866 0 0]);
hold on;

%three phase region
%plot ([0.1009725 0.5 0.89903 0.1009725],[0.058295 0.74941 0.058295 0.058295]);
plot(mat3(:,1),mat3(:,2));

%two phase region

%connecting the tie line points with each other
plot (mat2(:,1),mat2(:,2));
plot (mat2(:,3),mat2(:,4));

%connecting the upper tie line point with three phase point
plot ([mat2(6,1) mat3(1,1)],[mat2(6,2) mat3(1,2)]);
plot ([mat2(6,3) mat3(2,1)],[mat2(6,4) mat3(2,2)]);

%connecting the lower tie line point with binary line 
plot ([mat2(1,1) mat1(1,1)],[mat2(1,2) mat1(1,2)]);
plot ([mat2(1,3) mat1(2,1)],[mat2(1,4) mat1(2,2)]);

%making of tie lines
for i=1:6
  plot([mat2(i,1) mat2(i,3)],[mat2(i,2) mat2(i,4)]);
endfor








for i=1:6
   mat2(i,1)=c(1);
   mat2(i,2)=b(1);
   mat2(i,3)=c(2);
   mat2(i,4)=b(2);
endfor
%changing co-ordinates to fit in gibbs triangle
for i=1:6
  mat2(i,2)=(2*mat2(i,2)+mat2(i,1))/2;
  mat2(i,1)=0.866*mat2(i,1);
  mat2(i,4)=(2*mat2(i,4)+mat2(i,3))/2;
  mat2(i,3)=0.866*mat2(i,3);
endfor

mat1(1,1)=x(1)/2;
mat1(1,2)=0.866*x(1);
mat1(2,1)=x(2)/2;
mat1(2,2)=0.866*x(2);

%connecting the tie line points with each other
plot (mat2(:,1),mat2(:,2));
plot (mat2(:,3),mat2(:,4));

%connecting the upper tie line point with three phase point
plot ([mat2(6,1) mat3(3,1)],[mat2(6,2) mat3(3,2)]);
plot ([mat2(6,3) mat3(1,1)],[mat2(6,4) mat3(1,2)]);

%connecting the lower tie line point with binary line 
plot ([mat2(1,1) mat1(1,1)],[mat2(1,2) mat1(1,2)]);
plot ([mat2(1,3) mat1(2,1)],[mat2(1,4) mat1(2,2)]);

%making of tie lines
for i=1:6
  plot([mat2(i,1) mat2(i,3)],[mat2(i,2) mat2(i,4)]);
endfor