clear;
ki=3.2;

fp=fopen("spinregion.txt","w");

for a=0.25:0.0001:0.60
  for b=0.001:0.001:1-a-0.001
    
    c=1-b-a;
    jac=(-2*ki + 1/b + 1/a)*(-2*ki + 1/c + 1/a) - (-ki + 1/a)*(-ki + 1/a);
    if (jac<0.001 && jac>-0.001)
      fprintf(fp,"%f %f \t",b,c);      
    endif
    
  endfor
endfor

fclose(fp);


