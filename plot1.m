clear;
clf;

%gibbs triangle
plot([0 0.5 1 0],[0 0.866 0 0]);
hold on;

%guide-lines for the gibbs triangle
for i=0.1:0.1:0.9
  x=[i/2 i]
  y=[0.866*i 0]
  plot (x,y,'color', [0 0 0]+0.9)
endfor

for i=0.1:0.1:0.9
  x=[0.5+i/2 i]
  y=[0.866*(1-i) 0]
  plot (x,y,'color', [0 0 0]+0.9)
endfor

for i=0.1:0.1:0.9
  x=[i/2 0.5+(1-i)/2]
  y=[0.866*i 0.866*i]
  plot (x,y,'color', [0 0 0]+0.9)
endfor

%getting data from files
fp1=fopen('ternary2P_L.txt', 'r');
left=fscanf(fp1, "%f %f %f",[3, Inf]);
fp2=fopen('ternary2P_R.txt', 'r');
right=fscanf(fp2, "%f %f %f",[3, Inf]);
fclose(fp1);
fclose(fp2);

%plotting for alpha-beta
for i=1:8
  left_b(i)=left(2,i);
  left_c(i)=left(3,i);
  right_b(i)=right(2,i);
  right_c(i)=right(3,i);  
endfor

for i=1:8
  left_x(i)=(2*left_b(i)+left_c(i))/2;
  left_y(i)=0.866*left_c(i);
  right_x(i)=(2*right_b(i)+right_c(i))/2;
  right_y(i)=0.866*right_c(i);
endfor


plot(left_x, left_y);
plot(right_x, right_y);

for i=2:8
  plot([left_x(i) right_x(i)], [left_y(i) right_y(i)]) ;
endfor

%plotting for beta-gamma
for i=1:8
  left_b(i)=left(3,i);
  left_c(i)=left(1,i);
  right_b(i)=right(3,i);
  right_c(i)=right(1,i);  
endfor

for i=1:8
  left_x(i)=(2*left_b(i)+left_c(i))/2;
  left_y(i)=0.866*left_c(i);
  right_x(i)=(2*right_b(i)+right_c(i))/2;
  right_y(i)=0.866*right_c(i);
endfor


plot(left_x, left_y);
plot(right_x, right_y);

for i=2:8
  plot([left_x(i) right_x(i)], [left_y(i) right_y(i)]) ;
endfor

%plotting for gamma-alpha
for i=1:8
  left_b(i)=left(1,i);
  left_c(i)=left(2,i);
  right_b(i)=right(1,i);
  right_c(i)=right(2,i);  
endfor

for i=1:8
  left_x(i)=(2*left_b(i)+left_c(i))/2;
  left_y(i)=0.866*left_c(i);
  right_x(i)=(2*right_b(i)+right_c(i))/2;
  right_y(i)=0.866*right_c(i);
endfor


plot(left_x, left_y);
plot(right_x, right_y);

for i=2:8
  plot([left_x(i) right_x(i)], [left_y(i) right_y(i)]) ;
endfor


fp1=fopen('spinregion.txt', 'r');
spin=fscanf(fp1, "%f %f",[2, Inf]);

for i=1:786
  x(i)=(2*spin(1,i)+spin(2,i))/2;
  y(i)=0.866*spin(2,i);
endfor

plot(x,y,'.');