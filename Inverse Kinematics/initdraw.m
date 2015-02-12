global h_axes link1 link2 link3 link4 hand1 hand2 hand3 target target2 zzero

scrsz = get(0,'ScreenSize');
animation = figure(1);

color0 = [0 0 0];
color1 = [1 0 0];
color2 = [0 0 1];
color3 = [0 1 0];
color4 = [1 0 1];
color5 = [1 1 0];

set(animation,'name','My Robot','Position',[20 100 500 500]);
h_axes = axes('Parent',animation,'Units','Pixels','Position',[0 0 500 500],'Ylim',[-1.2 1.2],'Xlim',[-1.2 1.2]);

target = line('Parent',h_axes,'Color',color0,'Visible','off','LineWidth',10);
target2 = line('Parent',h_axes,'Color',color5,'Visible','off','LineWidth',10);
zzero = line('Parent',h_axes,'Color',color0,'Visible','off','LineWidth',10);
link1 = line('Parent',h_axes,'Color',color1,'Visible','off','LineWidth',10);
link2 = line('Parent',h_axes,'Color',color2,'Visible','off','LineWidth',10);
link3 = line('Parent',h_axes,'Color',color3,'Visible','off','LineWidth',10);
link4 = line('Parent',h_axes,'Color',color4,'Visible','off','LineWidth',10);
hand1 = line('Parent',h_axes,'Color',color1,'Visible','off','LineWidth',10);
hand2 = line('Parent',h_axes,'Color',color2,'Visible','off','LineWidth',10);
hand3 = line('Parent',h_axes,'Color',color3,'Visible','off','LineWidth',10);

set(h_axes,'visible','on');
