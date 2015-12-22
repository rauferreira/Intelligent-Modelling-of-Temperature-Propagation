function  [InpPat, TarPat]=cria_dados()

% [InpPat, TarPat]=cria_dados(nome_fich)

%
% Esta função lê dados em formato texto e converte para Matrizes contendo padrões de entrada
% Preparado para os dados do sistema de exaustão de gás de Box-Jenkins
% 
% 

fid=fopen('dados\boxjen.dat','r');

if fid==-1
   disp('Ficheiro não existe');
   return;
end

conteudo=fscanf(fid,'%f'); % leitura do total de informação do ficheiro que contém valores de virgula flutuante

%%considerar que saída é 1ª coluna, segunda coluna é y(k-1) e que 9ª coluna é u(k-4)
n_dados=length(conteudo);
n_col=11;
n_lin=n_dados/n_col;  %%%11 - é o total de colunas

for i=1:n_lin,
   y(i)=conteudo(1+(i-1)*n_col);
   u_1(i)=conteudo(2+(i-1)*n_col);
   u_4(i)=conteudo(9+(i-1)*n_col);
end

TarPat=y';
InpPat=[u_1', u_4'];

%%%normalização das entradas
K=max(abs(InpPat));
InpPat(:,1)=InpPat(:,1)/K(1);
InpPat(:,2)=InpPat(:,2)/K(2);


fclose(fid);