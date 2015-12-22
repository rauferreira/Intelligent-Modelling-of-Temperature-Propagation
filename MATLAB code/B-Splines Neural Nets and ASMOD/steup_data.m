function  [InpPat, TarPat]=cria_dados()

% [InpPat, TarPat]=cria_dados(nome_fich)

%
% Esta fun��o l� dados em formato texto e converte para Matrizes contendo padr�es de entrada
% Preparado para os dados do sistema de exaust�o de g�s de Box-Jenkins
% 
% 

fid=fopen('dados\boxjen.dat','r');

if fid==-1
   disp('Ficheiro n�o existe');
   return;
end

conteudo=fscanf(fid,'%f'); % leitura do total de informa��o do ficheiro que cont�m valores de virgula flutuante

%%considerar que sa�da � 1� coluna, segunda coluna � y(k-1) e que 9� coluna � u(k-4)
n_dados=length(conteudo);
n_col=11;
n_lin=n_dados/n_col;  %%%11 - � o total de colunas

for i=1:n_lin,
   y(i)=conteudo(1+(i-1)*n_col);
   u_1(i)=conteudo(2+(i-1)*n_col);
   u_4(i)=conteudo(9+(i-1)*n_col);
end

TarPat=y';
InpPat=[u_1', u_4'];

%%%normaliza��o das entradas
K=max(abs(InpPat));
InpPat(:,1)=InpPat(:,1)/K(1);
InpPat(:,2)=InpPat(:,2)/K(2);


fclose(fid);