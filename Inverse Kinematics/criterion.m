function score = criterion(p);

global x_d;

x = fk(p);

score = (x'-x_d)'*(x'-x_d);

end