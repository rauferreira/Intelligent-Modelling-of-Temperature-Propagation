function out=njk_uni(Knot,j,k,x)

%	out=njk_uni(Knot,j,k,x)
%
%	This function computes the jth univariate basis function of order k,
%	for the value x, assuming that the distribution of the Knots is
%	given in the row vector Knot
%
m=length(Knot);
if k==1
   if (j<1)|(j>(m-1))
      out=0;
   else   
      if (x>=Knot(j))&(x<Knot(j+1))
         out=1;
      else
         out=0;
      end
   end   
else
   if j==1
      out=(Knot(j+k)-x)/(Knot(j+k)-Knot(j+1))*njk_uni(Knot(2:m-1),j,k-1,x);
   else
      if (j+k)>m
         out=(x-Knot(j))/(Knot(j+k-1)-Knot(j))*njk_uni(Knot(2:m-1),j-1,k-1,x);
      else   
         out=(x-Knot(j))/(Knot(j+k-1)-Knot(j))*njk_uni(Knot(2:m-1),j-1,k-1,x)+(Knot(j+k)-x)/(Knot(j+k)-Knot(j+1))*njk_uni(Knot(2:m-1),j,k-1,x);
      end   
   end
end   