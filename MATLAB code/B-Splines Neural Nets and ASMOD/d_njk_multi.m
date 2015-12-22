function out=d_njk_multi(InpPat, Model, fun_ind, total_out)

%function out=d_njk_multi(InpPat, Model, fun_ind, total_out)
%
%This function determines the basis function derivative relative to the interior knots
%in respect to the interior knots described in knots_struct
%
%InpPat - input patterns
%TarPat - output patterns
%Model  - The model structure
%fun_ind- vector which contents indicate the basis function for which the derivative is to be taken
%total_out-active basis functions output
%


n_s_m=Model.n_s_m;
[n_pat, n_inp]=size(InpPat);

n_fun_total=0;
int_knots_total=0;
N_fun=0;
for i=1:n_s_m,
   n_fun_i=prod(Model.Sub_Model(i).n_fun);   
   order_i=Model.Sub_Model(i).order;
   n_var=length(Model.Sub_Model(i).var);
   fun_i=Model.Sub_Model(i).n_fun;
   int_knots_i=Model.Sub_Model(i).int_knots;
   pos_fun=find(fun_ind>=n_fun_total+1 & fun_ind<=n_fun_total+n_fun_i);
   
   if ~isempty(pos_fun),
      
      %gera combinações de funções de base deste submodelo
      ele=[];
      elements=[1:fun_i(n_var)]';    
      for v=n_var-1:-1:1,
         
         for k=1:(fun_i(v)),
            ele=[ele;[k*ones(size(elements,1),1), elements]];
         end
         elements=ele;
         ele=[];
      end
      comb=elements;
      
  
         
         for n=1:length(pos_fun), %trata das funções de base presentes neste submodelo
            int_knots_var=0;
            for var=1:n_var,
               
               if int_knots_i(var)>0, %terá de haver nó interior
                  out(N_fun+n).p=zeros(n_pat,int_knots_total+int_knots_var+int_knots_i(var));
                  
                  %calcula valor para a função de base desta variável
                  j=comb(fun_ind(pos_fun(n))-n_fun_total,var);
                  k=order_i(var);
                  Knots=Model.Sub_Model(i).Knots(var,:);
                  
                  
                  for p=1:n_pat, 
                     
                     x=InpPat(p,Model.Sub_Model(i).var(var));
                     N=njk_uni(Knots, j, k, x);
                     
                     
                     for int=j-order_i(var):j,
                        if int>0 & int<=int_knots_i(var) & N~=0,
                           %calcula valor da derivada da função de base         
                           D(int)=d_njk(Knots, int, j, order_i(var), x, int_knots_i(var));
                           %out(N_fun+n).p(p, int+int_knots_total+int_knots_var)=D(int)*total_out(p,fun_ind(pos_fun(n))-n_fun_total)/N;
                           out(N_fun+n).p(p, int+int_knots_total+int_knots_var)=D(int)*total_out(p,pos_fun(n))/N;

                        else
                           if N==0 & int>0 & int<=int_knots_i(var),
                              out(N_fun+n).p(p, int+int_knots_total+int_knots_var)=0;
                           end
                        end
                        
                        
                     end
                  end
                  
               end
               int_knots_var=int_knots_var+int_knots_i(var);
            end
         end
      N_fun=N_fun+n;
   end
   n_fun_total=n_fun_total+prod(n_fun_i);
   int_knots_total=int_knots_total+sum(int_knots_i);
end

   