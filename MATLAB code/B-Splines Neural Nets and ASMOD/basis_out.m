function out=basis_out(x,x_min,x_max,order,Knots,n_Knots,n_fun)


out=zeros(1,prod(n_fun));

jset=basis_num(x,x_min,x_max,order,Knots,n_Knots);

elements=gen_ele(jset,order,1,[]);

%Alteração: adicionou-se as 3 próximas linhas 
%evita que exploda para dados de entrada exteriores ao vector de nós existente

if all(elements==0)
   elements=[];
end

[m,n]=size(elements);

for j=1:m
   ind=index(elements(j,:),n_fun);
   out(1,ind)=njk_multi(Knots,n_Knots,elements(j,:),order,x);
end  
