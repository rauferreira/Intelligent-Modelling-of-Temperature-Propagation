%% Raul Ferreira 04/03/2015
% raufer92@gmail.com
% Universidade do Algarve
% Modelling temperature propagation using BSNN

%% Create Splines

function out = construct_splines(sub_models)

for ii=1:length(sub_models)
    variate = length(sub_models(ii).var);
    % Get knot sequences
    for jj=1:variate
        n_knot{jj} = sub_models(ii).n_Knots(jj);
        knot{jj} = sub_models(ii).Knots(jj,(1:n_knot{jj}));
        order{jj} = sub_models(ii).order(1,jj);
        coeffs_size(jj) = length(knot{jj}) - order{jj};
    end
    if variate == 1
        knot_uni = sub_models(ii).Knots(1,:);
    end
    
    % Get coefficients
    W = sub_models(ii).w; W = W';

    if variate == 2
        W = setup_multivariate_coeficients(W, coeffs_size);
    elseif variate == 3
        W = setup_multivariate_coeficients_trivariate(W, coeffs_size);
    end
    
    if variate == 1
        spline(ii) = spmak(knot_uni, W);
    elseif variate == 2
        coeffs = [1 coeffs_size(1) coeffs_size(2)];
        spline(ii) = spmak(knot, W, coeffs);
    else
        coeffs = [1 coeffs_size(1) coeffs_size(2) coeffs_size(3)];
        spline(ii) = spmak(knot, W, coeffs);
    end
end

out = spline;
