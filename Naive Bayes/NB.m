clear all
load('./SVM/data_set_10.mat');
train_X = data_set(:,[1,2,3]);
train_Y = data_set(:,4);
load('test.mat');
test_X = data_set(:,[1,2,3]);
test_Y = data_set(:,4);
p = 0:0.0001:1;
pf = zeros(1,length(p));
pd = zeros(1,length(p));
for i=1:length(p)
    prior = [p(i) 1-p(i)];
    model = fitcnb(train_X,train_Y,'Prior',prior);
    
    y = predict(model,test_X);
    pf(i) = sum(logical(y) & ~logical(test_Y))/(200-sum(test_Y));
    pd(i) = dot(y,test_Y)/sum(test_Y);
end

plot(pf,pd)
