function Interv=cria_interv(r,k)
%
%   This function creates an empty interv matrix.
%
%   Inputs: r - internal knots vector
%           k - order vector
%
%   Outputs:Interv - empty Interval matrix of records with 2 fields:
%               number - number of points within the interval
%               pat - vector of the indexes of the points within the
%               interval
%

I.number=0;
I.pat=[];
Interv(1:prod(r+1))=I;
Interv=reshape(Interv,r+1);