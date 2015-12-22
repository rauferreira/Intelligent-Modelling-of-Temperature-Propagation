function jset=basis_num(x,x_min,x_max,k,Knots,n_Knots);

%	jset=basis_num(x,x_min,x_max,k,Knots)
%
%	This function determines which basis functions are active
%	for the input x.
%	The minima of the input vector are stored at x_min;
%	the maxima are stored at x_max, and the order of the splines
% 	are stored at k. The knots for each dimension are stored at
%	matrix Knots, each row corresponding to one dimension
%
%	Output:
%
%	jset - a matrix where, by row, are indicated the active basis
%	functions, per dimension
%

m=length(x);
for i=1:m
   if (x(i)<x_min(i))|(x(i)>=x_max(i))
      jset(i,1)=0;
   else
      jmax=max(find(x(i)>=Knots(i,1:n_Knots(i))));
      jset(i,1:k(i))=jmax-k(i)+1:jmax;
   end   
end   