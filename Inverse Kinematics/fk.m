function tip = fk( joints )
% do forward kinematics of assignment robot: tip x, y, and angle
% joint angles are torso_x torso_y torso_angle shoulder elbow wrist

global l_half_torso l_upper_arm l_forearm l_hand

torso_x = joints(1);
torso_y = joints(2);
a1 = joints(3);
a12 = joints(3) + joints(4);
a123 = joints(3) + joints(4) + joints(5);
a1234 = joints(3) + joints(4) + joints(5) + joints(6);

spine = [ torso_x torso_y ]';
shoulder = spine + [l_half_torso*cos(a1) l_half_torso*sin(a1)]';
elbow = shoulder + [l_upper_arm*cos(a12) l_upper_arm*sin(a12)]';
wrist = elbow + [l_forearm*cos(a123) l_forearm*sin(a123)]';
hand = wrist + [l_hand*cos(a1234) l_hand*sin(a1234)]';

tip = [ hand(1) hand(2) a1234 ];
