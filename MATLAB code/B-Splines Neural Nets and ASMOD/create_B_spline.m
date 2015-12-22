function [Knots,n_Knots,n_fun,w,a_w]=create_B_spline(x_min,x_max,int_knots,order);

%	[Knots,n_Knots,n_fun]=create_B_spline(x_min,x_max,int_knots,order)
%
%	This function creates a B-Spline neural network assuming
%	that the minimum value of the input vector is stored in row vector
%	x_min, the maximum value of the input vector is stored in row vector x_max,
% 	the order of the splines is stored in vector order, and the number
%	of internal knots is stored in vector int_knots
%
%	Output parameters:
%
%	Knots - matrix where the knots in ecah input dimension are stored 
%	by row
%
%	n_Knots - row_vector indicating the number of Knots (interior+exterior) per dimension
%
%	n_fun - number of basis functions for each dimension
%	
%	w - null vector of weights

ndim=length(x_min);
x_max=x_max;
for i=1:ndim
   delta_x=x_max(i)-x_min(i);
   delta=delta_x/(int_knots(i)+1);
   n_Knots(i)=int_knots(i)+2*order(i);
   Knots(i,1:n_Knots(i))=[x_min(i)-(order(i)-1)*delta:delta:x_min(i)-delta ...
      x_min(i):delta:x_max(i) x_max(i)+delta:delta:x_max(i)+(order(i)-1)*delta];
   n_fun(i)=int_knots(i)+order(i);
end   

w=zeros(prod(n_fun),1);
a_w=ones(size(w));