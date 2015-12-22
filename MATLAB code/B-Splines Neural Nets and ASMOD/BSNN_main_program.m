%% Raul Ferreira 04/03/2015
% raufer92@gmail.com
% Universidade do Algarve
% Modelling temperature propagation using BSNN

%% MAIN PROGRAM

type='SPMI';
training = {'3_05','3_15','3_18'}; validation = {'3_10'}; test = {};
add_noise = 0; experiment = 1; lag = 2;
% ASMOD Parameters 
option = [1 1 1 ]; re = 0; ct = 's';

%% Main
%% Setup data
data_setup(type, experiment, add_noise, lag, training, validation, test);

%% ASMOD algorithm
%Load initial model for the ASMOD
load ASMOD_initial_model.mat

%HEATING
load data_training_model_h.mat
[Opt_Model, res]=Asmod(InpPat,TarPat, option, Ini_Model,re,ct,vis,vts);
[error mapPerformance_h] = evaluate_model(Opt_Model, 1, res);
disp(max(error));

%COOLING
load data_training_model_c.mat
[Opt_Model, res]=Asmod(InpPat,TarPat, option, Ini_Model,re,ct,vis,vts);
[error mapPerformance_c] = evaluate_model(Opt_Model, 0, res);
disp(max(error));

%% Plot performance
process_network_performance();
%close all;
