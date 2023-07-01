function youget = weappool(numpool, prob5, prob4, count5, count4, count3)
    youget = zeros(1, numpool);
    pity5count = 0;
    pity5flag = 0;
    pity4count = 0;
    pity4flag = 0;
    for wish = 1:numpool
        pity5count = pity5count + 1;
        pity4count = pity4count + 1;
        myrand = rand;
        win = rand;
        if (myrand < prob5) || (pity5count >= 80)
            pity5count = 0;
            pity4count = 0;
            if (win < 0.375 || pity5flag >=2)
                pity5flag = 0;
                pity4flag = 0;
                youget(wish) = 10001;
            elseif (win < 0.75)
                pity4flag = 0;
                youget(wish) = 10002;
                pity5flag = pity5flag + 1;
            else
                youget(wish) = randi([3, count5], 1) + 10000;
            end
        elseif (myrand < prob4) || (pity4count >= 10)
            if (win < 0.5 || pity4flag)
                pity4flag = 0;
                youget(wish) = randi([1, 5], 1) + 100;
            else
                pity4flag = 1;
                youget(wish) = randi([6, count4], 1) + 100;
            end
        else
            youget(wish) = randi([1, count3], 1);
        end
    end
end