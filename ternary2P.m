clear;
clear global;
global ki=3.2;
global c=[0.01;0.01];

function y=func2(b)
  global c;
  global ki;
  y = [log(1-b(1)-c(1)) - log(1-b(2)-c(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) - c(2)*c(2) + b(1)*c(1) -b(2)*c(2));
       log(b(1)) - log(b(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) -c(2)*c(2) + b(1)*c(1) -b(2)*c(2) + (1-c(1)-2*b(1)) - (1-c(2)-2*b(2)));
       log(c(1)) - log(c(2)) + ki* (b(1)*b(1) - b(2)*b(2) + c(1)*c(1) -c(2)*c(2) + b(1)*c(1) -b(2)*c(2) + (1-b(1)-2*c(1)) - (1-b(2)-2*c(2)))];
endfunction

b0=[0.055;0.845];
fp1=fopen('ternary2P_L.txt','w');
fp2=fopen('ternary2P_R.txt','w');

%loop and increment in c is such that 6 tie lines are generated
for i=1:6
  [b,fval]=fsolve(@func2,b0);
   mat2(i,1)=b(1);
   mat2(i,2)=c(1);
   mat2(i,3)=b(2);
   mat2(i,4)=c(2);
   fprintf(fp1,"%f %f %f\n", 1-b(1)-c(1), b(1), c(1));
   fprintf(fp2,"%f %f %f\n", 1-b(2)-c(2), b(2), c(2));

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

  fclose(fp1);
  fclose(fp2);



%Results in form (b1,c1,b1,c2)
%mat2 =
%   0.0613628   0.0086600   0.9386372   0.0086600
%   0.0681093   0.0173200   0.9318907   0.0173200
%   0.0749209   0.0259800   0.9250791   0.0259800
%   0.0818009   0.0346400   0.9181992   0.0346400
%   0.0887529   0.0433000   0.9112471   0.0433000
%   0.0957808   0.0519600   0.9042192   0.0519600