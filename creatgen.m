function genome = creatgen(len)
%1正上移动，2正下移动，3 向左移动，4向右移动，5左上移动，6右上移动，7左下移动，8右下移动
%有效长度是到碰到障碍物或者到达终点
    genome = randi([1,8],1,len);
    
    
