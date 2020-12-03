clc;
close all;
clear all;

snrr = [-30:0.25:-2];
pdd=ones(1,size(snrr,2));
for snr = snrr
    load('dataset_1.mat');
    avg_data = Pd_rawData(:,1);
    data = (avg_data - mean(avg_data))./sqrt(var(avg_data));
    snr = 10^(snr/10); % snr = -18 dB
    N = length(data);
    M = 500;
    data_set = zeros(2*M,2);
    for i =1:M
        noise = randn(1,N)';
        signal = sqrt(snr).*data + randn(1,N)';
        obs_H0 = find_energy(noise,snr);
        obs_H1 = find_energy(signal,snr);
    
        data_set(i,1) = obs_H0;
        data_set(i+M,1) = obs_H1;
    
        data_set(i,2) = 1;
        data_set(i+M,2) = 0;
    
        %disp(i);
    end

    data_set = data_set(randperm(size(data_set, 1)), :);
    data_set(:,1) = rescale(data_set(:,1));
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    