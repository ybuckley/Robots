% optimize assignment inverse kinematics
% using constraints

global x_d p_d lb ub answer;

x_d
p_d
p0

% set options for fmincon()
% options = optimset('Display','iter','MaxFunEvals',1000000,'Algorithm','interior-point');
options = optimset('Display','iter','MaxFunEvals',1000000,'Algorithm','sqp');

% do optimization
[answer,fval,exitflag]=fmincon(@criterion,p0,[],[],[],[],lb,ub,@constraints,options);

answer
fval
exitflag
