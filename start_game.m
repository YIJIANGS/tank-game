clear;clc;close;
%% tank image 读取坦克图片并裁剪至标定尺寸
[A,map,transparency] = imread('tank.png');  
tank_im=imresize(A,[50,50]);
tank_im=double(tank_im)/255;
tank_transparency=imresize(transparency,[50 50]); %坦克图像的alpha信息 方便背景设置为透明
%% missile image 读取导弹图片并裁剪
[A,map,transparency] = imread('missile.png'); 
A=A(100:end-99,300:end-299,:);
transparency=transparency(100:end-99,300:end-299);
missile_im=imresize(A,[30 30]);
missile_im=double(missile_im)/255;
missile_transparency=imresize(transparency,[30 30]); %导弹的alpha信息 

%% map image 读取背景图像并裁剪
map=imread('snow_field.jpg'); 
map=imresize(map,[500 500]);
face='up'; %初始坦克面向上方
%% wall image 读取障碍物图像并裁剪
wall=imread('wall.jpeg');
wall=imresize(wall,[50 50]);
wall_posx=200; %障碍物在图上的位置
wall_posy=200;
%% boom image 读取爆炸图像并裁剪
boom=imread('boom.jpg');
boom=imresize(boom,[50 50]);

%%
t1_posx=40; %initial tank position 初始坦克位置
t1_posy=40;
missile_fire=0; %check if missile is fired 这是定义是否发射火箭
%%
fig_h = figure; %获取图像句柄
imshow(map) %显示背景图
hold on %在显示图上继续画图
fig2=imagesc(t1_posx,t1_posy, tank_im); %坦克在图像上的位置
wall_fig=imagesc(wall_posx,wall_posy,wall); %障碍物在图像上位置
set(fig2, 'AlphaData', tank_transparency) %坦克图背景透明化
set(fig_h,'KeyPressFcn', @tank_move); %键盘控制事件 参考tank_move函数
set(fig_h,'KeyReleaseFcn', @shoot_missile); %键盘事件（松开键盘后触发） 参考shoot_missile函数
