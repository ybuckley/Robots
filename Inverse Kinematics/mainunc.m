% optimize 2 link inverse kinematics

global x_d;
global l_half_torso l_upper_arm l_forearm l_hand

x_d
p0

% do optimization
[answer,fval,exitflag]=fminunc(@criterion,p0);

answer
fval
exitflag

