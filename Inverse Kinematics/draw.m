function pos = draw( joints )
% do forward kinematics of assignment robot
% joint angles are torso_x torso_y torso_angle shoulder elbow wrist

global x_d;
global l_half_torso l_upper_arm l_forearm l_hand
global h_axes link1 link2 link3 link4 hand1 hand2 hand3 target target2 zzero

torso_x = joints(1);
torso_y = joints(2);
a1 = joints(3);
a12 = joints(3) + joints(4);
a123 = joints(3) + joints(4) + joints(5);
a1234 = joints(3) + joints(4) + joints(5) + joints(6);

% move hand back to make this visually more appealing
l_short = l_hand - 0.03;

spine = [ torso_x torso_y ]';
shoulder = spine + [l_half_torso*cos(a1) l_half_torso*sin(a1)]';
elbow = shoulder + [l_upper_arm*cos(a12) l_upper_arm*sin(a12)]';
wrist = elbow + [l_forearm*cos(a123) l_forearm*sin(a123)]';
hand = wrist + [l_short*cos(a1234) l_short*sin(a1234)]';

% draw hand
l_base_2 = 0.06;
l_finger = 0.08;
h_l_corner = hand + [-l_base_2*sin(a1234) l_base_2*cos(a1234)]';
h_r_corner = hand + [l_base_2*sin(a1234) -l_base_2*cos(a1234)]';
h_l_tip = h_l_corner + [l_finger*cos(a1234) l_finger*sin(a1234)]';
h_r_tip = h_r_corner + [l_finger*cos(a1234) l_finger*sin(a1234)]';

set(link1,'Parent',h_axes,'Xdata',[spine(1) shoulder(1)], ...
'Ydata',[spine(2) shoulder(2)],'visible','on');
set(link2,'Parent',h_axes,'Xdata',[shoulder(1) elbow(1)], ...
'Ydata', [shoulder(2) elbow(2)],'visible','on');
set(link3,'Parent',h_axes,'Xdata',[elbow(1) wrist(1)], ...
'Ydata', [elbow(2) wrist(2)],'visible','on');
set(link4,'Parent',h_axes,'Xdata',[wrist(1) hand(1)], ...
'Ydata', [wrist(2) hand(2)],'visible','on');

set(hand1,'Parent',h_axes,'Xdata',[h_l_corner(1) h_r_corner(1)], ...
'Ydata',[h_l_corner(2) h_r_corner(2)],'visible','on');
set(hand2,'Parent',h_axes,'Xdata',[h_l_corner(1) h_l_tip(1)], ...
'Ydata',[h_l_corner(2) h_l_tip(2)],'visible','on');
set(hand3,'Parent',h_axes,'Xdata',[h_r_corner(1) h_r_tip(1)], ...
'Ydata',[h_r_corner(2) h_r_tip(2)],'visible','on');

a = x_d(3);
l_target = 0.04;
l_target2 = 0.2;
far_end = [ x_d(1) + l_target*cos(a) x_d(2) + l_target*sin(a) ]';
far_end2 = [ x_d(1) + l_target2*cos(a) x_d(2) + l_target2*sin(a) ]';

set(target,'Parent',h_axes,'Xdata',[ x_d(1) far_end(1) ], ...
    'Ydata', [ x_d(2) far_end(2) ],'visible','on');

set(target2,'Parent',h_axes,'Xdata',[ far_end(1) far_end2(1) ], ...
    'Ydata', [ far_end(2) far_end2(2) ],'visible','on');

set(zzero,'Parent',h_axes,'Xdata',[ -0.02 0.02 ], ...
    'Ydata', [ 0.0 0.0 ],'visible','on');

drawnow
pause(0.15);

end
