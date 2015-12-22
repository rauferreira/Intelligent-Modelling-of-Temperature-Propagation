function out=d_njk(Knots, ind, j, k, x, int_knots)

n_knots=int_knots+2*k;

if k==1 | ind<j-k | ind>j | ind>int_knots+k,
   out=0;
else
   
   if k==2,
      if ind==j-2,
         out=(x-Knots(j+k-1))/(Knots(j+k-1)-Knots(j+k-2))^2*njk_uni(Knots(2:n_knots-1), j-1, k-1,x);
      end
      if ind==j-1,
         out=(Knots(j+k-2)-x)/(Knots(j+k-1)-Knots(j+k-2))^2*njk_uni(Knots(2:n_knots-1), j-1, 1,x)+...
            (Knots(j+k)-x)/(Knots(j+k)-Knots(j+k-1))^2*njk_uni(Knots(2:n_knots-1), j, 1,x);
      end
      
      if ind==j,
         out=(x-Knots(j+k-1))/(Knots(j+k)-Knots(j+k-1))^2*njk_uni(Knots(2:n_knots-1), j, 1,x);
      end
   else
      
      if ind==j-k,
         out=(x-Knots(j+k-1))/(Knots(j+k-1)-Knots(j))^2*njk_uni(Knots(2:n_knots-1), j-1, k-1,x)+...
            (x-Knots(j))/(Knots(j+k-1)-Knots(j))*d_njk(Knots(2:n_knots-1), j-k, j-1, k-1, x, int_knots);
      end 
      if ind==j-k+1,
         out=(x-Knots(j))/(Knots(j+k-1)-Knots(j))*d_njk(Knots(2:n_knots-1), j-k+1, j-1, k-1,x, int_knots)+...
            (Knots(j+k)-x)/(Knots(j+k)-Knots(j+1))^2*njk_uni(Knots(2:n_knots-1), j, k-1, x)+...
            (Knots(j+k)-x)/(Knots(j+k)-Knots(j+1))*d_njk(Knots(2:n_knots-1), j-k+1, j, k-1,x, int_knots);
      end
      
      if ind==j-1,
         out=(Knots(j)-x)/(Knots(j+k-1)-Knots(j))^2*njk_uni(Knots(2:n_knots-1), j-1, k-1, x)+...
            (x-Knots(j))/(Knots(j+k-1)-Knots(j))*d_njk(Knots(2:n_knots-1), j-1, j-1, k-1,x, int_knots)+...
            (Knots(j+k)-x)/(Knots(j+k)-Knots(j+1))*d_njk(Knots(2:n_knots-1), j-1, j, k-1, x, int_knots);
         
      end
      
      if ind==j,
         out=(x-Knots(j+1))/(Knots(j+k)-Knots(j+1))^2*njk_uni(Knots(2:n_knots-1), j, k-1, x)+...
            (Knots(j+k)-x)/(Knots(j+k)-Knots(j+1))*d_njk(Knots(2:n_knots-1), j, j, k-1, x, int_knots);
      end
   end
end

   
   
   
   
