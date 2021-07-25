

clear all;
clc;
syms n Z;
X1=1;
ans1=ztrans(X1,Z);
display(ans1)

X2=n;
ans2=ztrans(X2,Z);
display(ans2)

X3=(1+n);
ans3=ztrans(X3,Z);
display(ans3)

syms w;
X4=cos(w.*n);
ans4=ztrans(X4,Z);
display(ans4);

X5=sin(w.*n);
ans5=ztrans(X5,Z);
display(ans5);

syms a;
X6=(a^n).*cos(w.*n);
ans6=ztrans(X6,Z);
display(ans6);

X7=(a^n).*sin(w.*n);
ans7=ztrans(X7,Z);
display(ans7);

X8=n.*(a^n);
ans8=ztrans(X8,Z);
display(ans8);

X9=-n.*(a^n);
ans9=ztrans(X9,Z);
display(ans9);

X10=n.*((-1)^n);
ans10=ztrans(X10,Z);
display(ans10);

X11=(n^2);
ans11=ztrans(X11,Z);
display(ans11);






