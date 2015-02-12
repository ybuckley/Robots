global answer answer2;
maincon

for m = 1:20
    for n = 1:6
        p(n) = p(n) + (answer(n) - p(n))*m/20;
    end
    draw(p);
end

maincon2
for x = 1:20
    for y = 1:6
        p(y) = p(y) + (answer2(y) - p(y))*x/20;
    end
    draw(p);
end

