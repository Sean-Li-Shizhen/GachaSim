function youget = charpool(numpool, prob5, prob4, count5, count4, count3)
    youget = zeros(1, numpool);
    % pity system
    pity5star = 0;
    pity4star = 0;
    pity5flag = 0;
    pity4flag = 0;
    for wish = 1:numpool
        pity5star = pity5star + 1;
        pity4star = pity4star + 1;
        thiswish = rand;
        win = rand < 0.5;
        % if it is 5 star
        is5 = (thiswish < prob5) || (pity5star >= 90);
        if (is5)
            % pity reset
            pity5star = 0;
            pity4star = 0;
            if (pity5flag || win)
                youget(wish) = 10001;
                % flag reset
                pity5flag = 0;
                pity4flag = 0;
            else
                youget(wish) = randi([2, count5], 1) + 10000;
                % rise large pity
                pity5flag = 1;
            end
            continue;
        end
        % if it is 4 star
        is4 = (thiswish < prob4) || (pity4star >= 10);
        if (is4)
            pity4star = 0;
            if (pity4flag || win)
                youget(wish) = randi([1, 3], 1) + 100;
                pity4flag = 0;
            else
                youget(wish) = randi([4, count4], 1) + 100;
                pity4flag = 1;
            end
            continue;
        end
        % now it is just a 3 star
        youget(wish) = randi([1, count3], 1);
    end
end