%% Raul Ferreira 04/03/2015
% raufer92@gmail.com
% Universidade do Algarve
% Modelling temperature propagation using BSNN

%% Univariate B-spline evaluation

%% Input
%         Knot : Vector with the knots distributed along the input axis
%         j : jth univariate basis function
%         k : order of the basis function
%
%% Output:
%         out : output of the jth univariate basis function evaluation

%%
function out = bjk_univariate(Knot,j,k,x)

m=length(Knot);
% if first order basis function, output {0 or 1} depending on the interval
% the input lies on
if k==1 
   if (j<1)||(j>(m-1))
      out=0;
   else   
      if (x>=Knot(j))&&(x<Knot(j+1))
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