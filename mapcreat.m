clear all;


all=input('�������ͼ�ĳ��Ϳ���m n����:');
m=all(1);
n=all(2);

point = input('��������ʼ�����꡾x y��');
x=point(1);
y=point(2);

point_end = input('��������ֹ�����꡾x y��');
x_end = point_end(1);
y_end = point_end(2);

count = input('�������ϰ������');

map = zeros(m,n);

for i=1:count
    points = input('����������ϰ�������(���Ϻ���������������[[x1 y1] [x2 y2]] ):\n');
    for j =points(1):points(3)
        for k=points(2):points(4)
            map(j,k)=1;
        end
    end
end

M=50;%Ԥ����Ⱥ��ģ 
D=500;%��������
DC=D;%����������
pc=0.8;%�������
pm=0.7;%�������

genoms = zeros(M,m*n);

for i=1:M
    genoms(i,:)=creatgen(m*n);
end

path = zeros(1,m*n);
dis = zeros(1,2);
allfile = zeros(M,D);

while DC
fitness = getfitness(genoms,x,y,x_end,y_end,map,m,n);
%fprintf('%d',DC);
%allfile(:,DC) = fitness(:,2);
[ma,a]= max(fitness(:,2));
if ma==1
  %  fprintf('%d',a);
    path = genoms(a,:);
    dis = fitness(a,2:3);
    break;
end
[father,mather] = selectparent(genoms,fitness);
genoms = cross(father,mather,M,pc);
genoms = mutate(genoms,pm,M);
DC=DC-1;
end

%fprintf('sssssssssssssssssssss');
%fprintf('%d',dis(1,2));

for i =1:dis(1,2)
   % fprintf('%d-->',path(i));
end


img = zeros(m*32,n*32);
for i = 1:m
    img(i*32:i*32,:)=255;
end
for i = 1:n
    img(:,i*32:i*32)=255;
end

for i=1:m
    for j=1:n
        if map(i,j)==1
            img((i-1)*32:i*32,(j-1)*32:j*32)=255;
        end
    end
end

tempx = x;
tempy = y;
f_x=0;
f_y=0;
nextx = x;
nexty = y;
for i = 1:dis(1,2)
    f = path(i);
    switch f
        case 1
            nextx = tempx;
            nexty = tempy-1;
            f_x=0;
            f_y=-1;
             fprintf('1');
        case 2
            nextx = tempx;
            nexty = tempy+1;
            f_x = 0;
            f_y = 1;
            fprintf('2');
        case 3
            nextx = tempx-1;
            nexty = tempy;
            f_x = -1;
            f_y = 0;
            fprintf('3');
        case 4
            nextx = tempx+1;
            nexty = tempy;
            f_x = 1;
            f_y = 0;
            fprintf('4');
        case 5
            nextx = tempx-1;
            nexty = tempy-1;
            f_x = -1;
            f_y = 1;
            fprintf('5');
        case 6
            nextx = tempx+1;
            nexty = tempy-1;
            f_x = 1;
            f_y = -1;
            fprintf('6');
        case 7
            nextx = tempx-1;
            nexty = tempy+1;
            f_x = -1;
            f_y = 1;
            fprintf('7');
        case 8
            nextx = tempx+1;
            nexty = tempy+1;
            f_x = 1;
            f_y = 1;
            fprintf('8');
    end
  %  fprintf('(%d,%d)----',tempx,tempy);
  %  fprintf('(%d,%d)\n',nextx,nexty);
    img = pic(img,((tempx-1)*32+16),((tempy-1)*32+16),((nextx-1)*32+16),((nexty-1)*32+16),f_x,f_y);
    tempx = nextx;
    tempy = nexty;
end
imshow(img);







