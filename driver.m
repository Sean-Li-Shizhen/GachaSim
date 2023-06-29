rng(688885);

% banner info
fourchars = ["Barbara" "Razor" "Xiangling" "Beidou" "Xingqiu" ...
             "Ningguang" "Fischl" "Bennett" "Noelle" "Chongyun" ...
             "Sucrose" "Diona" "Xinyan" "Rosaria" "Yanfei" ...
             "Sayu" "Kujou" "Thoma" "Yunjin" "Shinobu" ...
             "Heizou" "Collei" "Dori" "Candice" "Layla" ...
             "Faruzan" "Yaoyao" "Mika" "Kaveh" "Kirara"];
fourweaps = ["gongchang" "jiligong" "juexian" "xifenggong" "zaoxin" ...
             "jilishu" "liulangyuezhang" "xifengshu" "xifengqiang" "xialiqiang" ...
             "yucai" "jilidajian" "zhongjian" "xifengdajian" "xialijian" ...
             "jilijian" "dijian" "xifengjian"];
fivechars = ["Jean" "Diluc" "Qiqi" "Mona" "Keqing" "Tignari" "Dehya"];
fiveweaps = ["Amos" "Sky Bow" "Four Wind" "Sky Book" "Jade Spear" ...
             "Sky Spear" "Wolf End" "Sky Claymore" "Sky Blade" "Wind Sword"];
threestars = ["tangong" "shenshe" "yayu" "feiyu" "taolong" ...
              "modao" "heiyin" "yilifuren" "longxuejian" "tieying" ... 
              "feitian" "liming" "lengren"];
          
% banner setup
fours = [fourchars, fourweaps];
fours(3) = [];
fours(21) = [];
fours(27) = [];
fours = ["Xiangling", "Heizou", "Yaoyao", fours];
fives = ["Alhaithem", fivechars];

% wish
budget = 200;
igot = charpool(budget, 0.006, 0.051, length(fives), length(fours), length(threestars));

% result analysis
result = strings(1, budget);
fivecount = numel(igot(igot > 10000));
fourcount = numel(igot(igot > 100)) - fivecount;
for i = 1:length(igot)
    if igot(i) > 10000
        result(i) = fives(igot(i) - 10000);
    elseif igot(i) > 100
        result(i) = fours(igot(i) - 100);
    else
        result(i) = threestars(igot(i));
    end
end
disp(result(igot > 10000));
disp(result(igot > 100));
         