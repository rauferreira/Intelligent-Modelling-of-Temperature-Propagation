function PointBasFun=cria_pointbasfun(InpPat,r,k)
%
%   This function creates an empty PointBasFun matrix.
%
%   Inputs: InpPat - Input Patterns matrix
%           r - internal knots vector
%           k - order vector
%
%   Outputs:PointBasFun - Pointer to the basis function, indexed by the
%           number of samples, plus 1, within the current basis function. It has 2
%           fields:
%               nunber - the number of basis functions that has the index
%               number of samples
%               list - the list of basis functions (linearly indexed)
%               pat - the list of patterns
%           Initially, all basis functions have zero data
%

[m,n]=size(InpPat);
I.number=0;
I.pat=[];
PointBasFun(1).number=prod(r+k);
PointBasFun(1).list=[1:prod(r+k)];
PointBasFun(1).pat=[];