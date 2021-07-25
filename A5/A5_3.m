

clear all;
clc;
syms n Z;
X1=(1+(3*Z^(-1)) )./(1-(3*Z^(-1)) +(2*Z^(-2)) );
ans1=iztrans(X1,n);
display(ans1)

X2=(1+(2*Z^(-1)) )./(1+(1*Z^(-2)) );
ans2=iztrans(X2,n);
display(ans2)


X3=1./( (1 - Z^(-1) )^2 * (1 - (2*Z^(-1)) ) );
ans3=iztrans(X3,n);
display(ans3)
