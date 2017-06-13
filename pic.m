function img = pic(img,s_x,s_y,n_x,n_y,f_x,f_y)
    if f_x==0&&f_y==0
        return ;
    end
    while 1
        img(s_x,s_y)=255;
        if s_x+f_x~=n_x||s_y+f_y~=n_y
            s_x = s_x+f_x;
            s_y = s_y+f_y;
        else
            break;
        end
    end
end