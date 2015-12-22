function out=njk_multi(Knots,n_Knots,ele,k,x)

%	out=njk_multi(Knots,n_Knots,ele,k,x)
%
%	This function computes the multivariate basis function of element ele, assuming
%	basis functions of order k,
%	for the value x, assuming that the distribution of the Knots is
%	given in the matrix Knot. The number of knots for each dimension is given in the vector
%	n_Knots
%
%	
dim=length(x);

for i=1:dim
   o(i)=njk_uni(Knots(i,1:n_Knots(i)),ele(i),k(i),x(i));
end

out=prod(o);
