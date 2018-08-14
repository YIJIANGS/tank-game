clear;clc;close;
%% tank image ��ȡ̹��ͼƬ���ü����궨�ߴ�
[A,map,transparency] = imread('tank.png');  
tank_im=imresize(A,[50,50]);
tank_im=double(tank_im)/255;
tank_transparency=imresize(transparency,[50 50]); %̹��ͼ���alpha��Ϣ ���㱳������Ϊ͸��
%% missile image ��ȡ����ͼƬ���ü�
[A,map,transparency] = imread('missile.png'); 
A=A(100:end-99,300:end-299,:);
transparency=transparency(100:end-99,300:end-299);
missile_im=imresize(A,[30 30]);
missile_im=double(missile_im)/255;
missile_transparency=imresize(transparency,[30 30]); %������alpha��Ϣ 

%% map image ��ȡ����ͼ�񲢲ü�
map=imread('snow_field.jpg'); 
map=imresize(map,[500 500]);
face='up'; %��ʼ̹�������Ϸ�
%% wall image ��ȡ�ϰ���ͼ�񲢲ü�
wall=imread('wall.jpeg');
wall=imresize(wall,[50 50]);
wall_posx=200; %�ϰ�����ͼ�ϵ�λ��
wall_posy=200;
%% boom image ��ȡ��ըͼ�񲢲ü�
boom=imread('boom.jpg');
boom=imresize(boom,[50 50]);

%%
t1_posx=40; %initial tank position ��ʼ̹��λ��
t1_posy=40;
missile_fire=0; %check if missile is fired ���Ƕ����Ƿ�����
%%
fig_h = figure; %��ȡͼ����
imshow(map) %��ʾ����ͼ
hold on %����ʾͼ�ϼ�����ͼ
fig2=imagesc(t1_posx,t1_posy, tank_im); %̹����ͼ���ϵ�λ��
wall_fig=imagesc(wall_posx,wall_posy,wall); %�ϰ�����ͼ����λ��
set(fig2, 'AlphaData', tank_transparency) %̹��ͼ����͸����
set(fig_h,'KeyPressFcn', @tank_move); %���̿����¼� �ο�tank_move����
set(fig_h,'KeyReleaseFcn', @shoot_missile); %�����¼����ɿ����̺󴥷��� �ο�shoot_missile����
