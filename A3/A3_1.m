clc;
clear all;
rc_A=input('Enter no. Row and Column value of Matrix A')
for i = 1:rc_A
  for j = 1:rc_A
    A(i,j) = input(sprintf('Enter value (%d, %d) of Matrix A >> ', i, j))
  end
end
rc_B=input('Enter no. Row and Column value of Matrix B')
for i = 1:rc_B
   for j = 1:rc_B
     B(i,j) = input(sprintf('Enter value (%d, %d) of Matrix B >> ', i, j))
   end
end
display(A)
display(B)
convolution2D=conv2(A,B)
%display(convolution2D)