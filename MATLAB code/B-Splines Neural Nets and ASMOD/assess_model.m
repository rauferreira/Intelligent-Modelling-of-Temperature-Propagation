%function [cand_Criterion, cand_model]=avalia_modelo(InpPat,TarPat, cand_model, i,re,ct,vis,vts)
%Determina valor do critério para o candidato cand_model
%
%parâmetros de entrada:
%       InpPat    :Matriz de dados de entrada
%       TarPat    :Matriz de saída pretendida
%       Cand_model:Estrutura do Modelo candidato
%       i         :número de candidato
%		  re        :regularization factor
%		  ct        :criterion type
%
%parâmetros de saída:
%       cand_Criterion: Critério do candidato
%       cand_modelo   :Estrutura do Candidato
%
%Código escrito por Cristiano Cabrita - Agosto de 1999
%
%	Uses evaluate_model

function [cand_Criterion, cand_model]=avalia_modelo(InpPat,TarPat, cand_model, i,re,ct,vis,vts)

if nargin==6
   vis=[];
   vts=[];
end

[cand_Criterion,cand_MSE,cand_MRE,cand_MSEv,cand_MREv,cand_Comp,cand_model]=evaluate_model(InpPat,TarPat, cand_model,re,ct,vis,vts);

if nargin==6
	disp(['Candidate ', num2str(i),' number of sub_modules ', num2str(cand_model.n_s_m), ' Criterion ',...
      num2str(cand_Criterion),' MSE ', num2str(cand_MSE),' MSRE ', num2str(cand_MRE),' Comp ',num2str(cand_Comp)]);
else
   disp(['Candidate ', num2str(i),' number of sub_modules ', num2str(cand_model.n_s_m), ' Criterion ',...
         num2str(cand_Criterion),' MSE ', num2str(cand_MSE),' MSRE ', num2str(cand_MRE),' Comp ',num2str(cand_Comp),...
         ' MSEv ', num2str(cand_MSEv), ' MSREv ', num2str(cand_MREv)]);
end

%guarda valor de MSE e Complexidade na estrutura do modelo
cand_model.MSE=cand_MSE;
cand_model.MRE=cand_MRE;
cand_model.MSEv=cand_MSEv;
cand_model.MREv=cand_MREv;
cand_model.Comp=cand_Comp;

for j=1:cand_model.n_s_m
   disp(['	Sub-module ' num2str(j) ' :variables ' num2str(cand_model.Sub_Model(j).var)]);
end   

