function youget = stdpool(numpool, prob5, prob4, count5, count4, count3)
    youget = zeros(1, numpool);
    pity5count = 0;
    pity4count = 0;
    for wish = 1:numpool
        myrand = rand;
        pity5count = pity5count + 1;
        pity4count = pity4count + 1;
        if (myrand < prob5 || pity5count >= 90)
            youget = randi([1, count5], 1) + 10000;
            pity5count = 0;
            pity4count = 0;
        elseif (myrand < prob4 || pity4count >= 90)
            youget = randi([1, count4], 1) + 100;
            pity4count = 0;
        else
            youget = randi([1, count3], 1);
        end
    end
end