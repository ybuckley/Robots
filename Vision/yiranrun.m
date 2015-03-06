rgba1 = imread('a/rgba9.png');
%length of board in pixels
length = 260.0;
r = rgba1(:,:,1);
g = rgba1(:,:,2);
b = rgba1(:,:,3);
xMin = [0 0];
xMax = [0 0];
yMin = [0 0];
yMax = [0 0];


horz = size(r(1, :));
vert = size(r(:, 1));

for m = 1: vert(1)
    for n = 1: horz(2)
        if  (r( m,n) > 180) && (g(m,n) > 180) && (b(m,n) > 180)
            %find left x value
              if xMin == 0 
                xMin(1) = n;
                xMin(2) = m;
            elseif n < xMin(1)
                xMin(1) = n;
                xMin(2) = m;
            end
            %find right x value
            if (n > xMax(1)) && (abs(n - xMin(1)) < length)
                xMax(1) = n;
                xMax(2) = m;
            end
            %find top y value
            if yMin(2) == 0 
                yMin(2) = m;
                yMin(1) = n;
            elseif m < yMin(2)
                yMin(2) = m;
                yMin(1) = n;
            end
            %find bottom y value
            if m > yMax(2) && abs(m - yMin(2)) < length
                yMax(2) = m;
                yMax(1) = n;
            end
        end
    end
end

distX = (xMax(1) - xMin(1))/2;
distY = (yMax(2)-yMin(2))/2;
centroid = [xMin(1) + distX yMin(2) + distY];

xs = [xMin.' xMax.' yMin.' yMax.'];

xs = sortrows(xs.',1);
xs = xs.';

dist34 = sqrt((xs(1,4)-xs(1,3))^2 + (xs(2,4)- xs(2,3))^2)
dist24 = sqrt((xs(1,4)-xs(1,2))^2 + (xs(2,4)- xs(2,2))^2)


if dist34 < dist24
    m1 = (xs(1,3) + xs(1,4))/2;
    m2 = (xs(2,3) + xs(2,4))/2;
else
    m1 = (xs(1,2) + xs(1,4))/2;
    m2 = (xs(2,2) + xs(2,4))/2;
end

a = centroid(2) - m2;
b = m1 - centroid(1);



theta = atand(a/b);


centroid

theta



