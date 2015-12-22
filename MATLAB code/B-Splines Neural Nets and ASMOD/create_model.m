function [Model,c]=cria_modelo(InpPat, x_min, x_max)

%[Model,c]=cria_modelo(InpPat, x_min, x_max)
%
% Funcão que cria modelo inicial segundo indicações do utilizador.
% As especificações são lidas do ficheiro Modelo.dat

% Parâmetros de entrada:
% InpPat    - matriz de entradas
% x_min     - minimal input value
% x_max     - maximum input value
%
% Parâmetros de saída:
% Model     - Modelo criado
% c         - indicates whether Ini_Model has been set
%
%Código escrito por Cristiano Cabrita - Agosto 1999

clc;
disp('Specify the Shape of your Initial Model');
opcao=input('Press C to Continue or A to return ','s');

c=1;
Model=[];
W=1;
if (opcao=='c' | opcao=='C')
   
   if isempty(x_min) | isempty(x_max),
      x_min=min(InpPat);
      x_max=max(InpPat)+10*eps*ones(1,size(InpPat,2)); % soma eps para que se considere o intervalo aberto
   end
   
   
   % Faz a leitura dos valores para a construção da estrutura do modelo inicial a partir de um ficheiro
   [n_s_m, var, int_knots, order]=le_fich
   
   for i=1:n_s_m,
      
      %criação das estruturas do submodelo i
      
      %obtenção dos comprimentos "reais"
      comp_var=length(find(var(i,:)~=0));

      for j=1:comp_var,
         S_M_xmin(1,j)=x_min(var(i,j));
         S_M_xmax(1,j)=x_max(var(i,j));
         
         [knots,n_Knots(1,j),n_fun(1,j),w,a_w]=create_B_spline(S_M_xmin(1,j),S_M_xmax(1,j),int_knots(i,j),order(i,j));
         Knots(j,1:n_Knots(1,j))=knots;
         W=zeros(length(W)*length(w),1);
      end
      A_W=ones(length(W),1);
      
      %DEFINIÇÃO DA ESTRUTURA DO SUBMODELO i
      Sub_Model(i)=struct('Knots',Knots,'n_Knots',n_Knots,'n_fun',n_fun,'w',...           
      W,'a_w',A_W,'x_min',S_M_xmin,'x_max',S_M_xmax,'order',order(i,1:comp_var),'int_knots',int_knots(i,1:comp_var),'var',var(i,1:comp_var));
      
      %reinicializar variáveis
      Knots=[];
      n_Knots=[];
      n_fun=[];
      W=1;
      A_W=[];
      S_M_xmax=[];
      S_M_xmin=[];
   end
   Model.Sub_Model=Sub_Model;
   Model.crit=0;
   Model.Comp=0;
   Model.MSE=0;
   Model.MRE=0;
   Model.MSEv=0;
   Model.MREv=0;
   Model.n_s_m=n_s_m;
   c=0;

end
