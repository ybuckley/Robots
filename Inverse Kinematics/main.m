% main for optimizing 4 link inverse kinematics

global x_d;
global lb ub
global l_half_torso l_upper_arm l_forearm l_hand

% target x_d is [ x, y, and angle ]
% x_d = [0.5 0.5 3.0]' % impossible?
x_d = [0.5 0.5 1.5]'
% x_d = [0.5 0.5 0.4]' % impossible?
% x_d = rand([3,1])

lb = [ -0.15, -0.05, -0.66, -1.0, 0.0, -1.2 ]';
ub = [ 0.15, 0.05, 0.66, 1.0, 2.4, 1.2 ]';

l_half_torso = 0.2838;
l_upper_arm = 0.3060;
l_forearm = 0.3060;
l_hand = 0.21;

% set up drawing stuff
initdraw

% joint angles are torso_x torso_y torso_angle shoulder elbow wrist
p_d = [ 0.0 0.0 0.0 0.0 0.0 0.0 ]'
% p0 is the intitial parameter vector
p0=[ 0.0 0.0 0.0 0.0 0.0 0.0 ]'
% p0= (rand([4,1]) - 0.5)*2*pi

p = [ 0 0 0 0 0 0 ];

draw( p );
