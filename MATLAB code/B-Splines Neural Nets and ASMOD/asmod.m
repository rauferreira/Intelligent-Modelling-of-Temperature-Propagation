function [y, w, Opt_Model,Tempo_total,res, total_n_cand]=Asmod(InpPat,TarPat, option, Ini_Model,re,ct,vis,vts)

%[y, out,w,Model,Opt_Criterion,Opt_MSE,Opt_Comp, Tempo_total]=Asmod(InpPat,TarPat, option)
%
% Parâmetros de entrada
% InpPat    - Matriz com dados de entrada
% TarPat    - Matriz com os dados de saída pretendidos
% option    - vector que aceita 1 ou 0 para activar os passos de refinamento e pruning:
%           1º posição: Adiciona (reduz ordem de) um novo submodelo unidimensional 
%           2º posição: Substitui (divide) as estruturas de modelos pelo seu produto 
%           3º posição: Introduz (retira) um novo nó no vector de nós
% Ini_Model - vector que indica a ordem das b-splines das varias entradas
% re        - (optional) regularization factor
% ct		   - Criterion type: 's'-MSE; 'r'-MRE
% vis		   - (optional) Validation Input Set
% vts		   - (optional) Validation Target Set
%   
% Parâmetros de saída:
% y               - Saída da rede neuronal
% w               - matriz de pesos da rede neuronal
% Opt_Model       - Array que contem os modelos escolhidos em cada iteração
% Tempo_total     - Contagem do tempo de processamento em segundos
% res					- 'e' - early stopping, 'n' - normal
% total_n_cand    - Numero de candidatos testados

%Alterações efectuadas por Cristiano Cabrita - Agosto 1999

order =  ones(1,size(InpPat,2))*3;
res='n';


diary on;
  
%Definição dos dados a usar para o treino...

disp('A processar....');
  
%Determine the criterion for the current model
tic
[Criterion,MSE,MRE,MSEv,MREv,Comp,Opt_Model(1)]=evaluate_model(InpPat,TarPat,Ini_Model,re,ct,vis,vts);
Opt_Model(1).MSE=MSE;
Opt_Model(1).MRE=MRE;
Opt_Model(1).MSEv=MSEv;
Opt_Model(1).MREv=MREv;
Opt_Model(1).Comp=Comp;
Opt_Model(1).crit=Criterion;

if nargin==6
	disp(['Initial ',' Criterion ',num2str(Criterion),' MSE ', num2str(MSE),' MSRE ', num2str(MRE),' Comp ',num2str(Comp)]);
else
   disp(['Initial ',' Criterion ',num2str(Criterion),' MSE ', num2str(MSE),' MSRE ', num2str(MRE),' Comp ',num2str(Comp),' MSEv ', num2str(MSEv), ' MSREv ', num2str(MREv)]);
end   

disp([]);
iter=2;
n_c=0;
term_criterion=0;
T1=0;
total_n_cand=0;
Tempo_total=0;
nbm=0;


while ~term_criterion
   
   tic
   disp(['Iteration ',num2str(iter)]);
   disp(['-----------------------------------------------------------------------------------------------------']);
   
   %generate candidate models
   %-------------------------------------------------------------------------%
   [n_cand_ref, best_model, best_Criterion]=ref_step(Opt_Model(iter-1),InpPat, TarPat, order, option,re,ct,vis,vts);
   n_cand=n_cand_ref.n_cand;
   
 	% Compute termination criterion
	if iter~=2
   	term_criterion=Opt_Model(iter-1).crit<=best_Criterion;
   end   
   

   %-------------------------------------------------------------------------%
   % Compute Pruning Step
   if (term_criterion) | (mod(iter,5)==0)
      [n_cand_pru, Best_model, Best_Criterion]=pru_step(Opt_Model(iter-1),InpPat, TarPat, option,re,ct,vis,vts);
      n_c=n_cand_pru.n_cand;
      
      if n_c~=0
      	% Determine the best candidate model between refinement and pruning;
      	if Best_Criterion<best_Criterion,
         	best_model=Best_model;
         	best_Criterion=Best_Criterion;
         	term_criterion=Opt_Model(iter-1).crit<=best_Criterion;
         end
      end   
      
      clear Best_model;
   end
         
        
   total_n_cand=total_n_cand+n_cand+n_c;
   
   if ~isempty(best_model)
      Opt_Model(iter)=best_model;   
   else
      Opt_Model(iter)=Opt_Model(iter-1);
      nbm=1;
   end   
   
   %elimina as matrizes out do Opt_Model;
   if iter>=3,
      Opt_Model(iter-2).Sub_Model(1:length(Opt_Model(iter-2).n_s_m)).out=[];
   end
   
 	if ~isempty(best_model)
      disp([]);
      if nargin==6
   		disp(['Criterion ' num2str(best_model.crit) ' MSE ' num2str(best_model.MSE) ' MSRE ' num2str(best_model.MRE) ...
               ' Comp ' num2str(best_model.Comp)]);
      else
         disp(['Criterion ' num2str(best_model.crit) ' MSE ' num2str(best_model.MSE) ' MSRE ' num2str(best_model.MRE) ...
               ' Comp ' num2str(best_model.Comp) ' MSEv ' num2str(best_model.MSEv) ' MSREv ' num2str(best_model.MREv)]);
      end
      Crit(iter)=best_model.crit;
      hold on;
      plot(Crit);
      pause(0.001);
      
   end  
   
   %early-stopping
   if iter>5 & ~term_criterion
      %MSE
      if ct=='s'
         if Opt_Model(iter).MSEv>Opt_Model(iter-1).MSEv           
            if Opt_Model(iter-1).MSEv>Opt_Model(iter-2).MSEv
               if Opt_Model(iter-2).MSEv>Opt_Model(iter-3).MSEv
                  if Opt_Model(iter-3).MSEv>Opt_Model(iter-4).MSEv
                     term_criterion=1;
                     res='e';
                  end
               end
            end
         end
      else
         %MRE
         if Opt_Model(iter).MREv>Opt_Model(iter-1).MREv           
            if Opt_Model(iter-1).MREv>Opt_Model(iter-2).MREv
               if Opt_Model(iter-2).MREv>Opt_Model(iter-3).MREv
                  if Opt_Model(iter-3).MREv>Opt_Model(iter-4).MREv
                     term_criterion=1;
                     res='e';
                  end
               end
            end
         end

      end 
   end
   
   iter=iter+1;
   
   clear best_model;
   
   T1=toc;
   
   Tempo_total=Tempo_total+T1;
   save temp
   
end   

tic
if nbm
   Model=Opt_Model(iter-2);
else
   Model=Opt_Model(iter-1);
end   
[Criterion,MSE,MRE,MSEv,MREv,Comp,Model,y,out,w]=evaluate_model(InpPat,TarPat,Model,re,ct,vis,vts);


disp(['-----------------------------------------------------------------------------------------------------']);

disp(['Total number of candidates ' num2str(total_n_cand)]);

diary off;
T1=toc;

Tempo_total=Tempo_total/60;

