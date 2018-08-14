function tank_move(fig_obj,eventDat)
spd=5; %坦克移动速度
fig2=evalin('base', 'fig2'); %获取坦克图像句柄

map=evalin('base', 'map'); %获取地图
transparency=evalin('base', 'tank_transparency'); %坦克alpha信息
face=evalin('base', 'face'); %坦克面对方向
tank_im=evalin('base', 'tank_im'); %坦克图
t1_posx=evalin('base', 't1_posx'); %坦克位置
t1_posy=evalin('base', 't1_posy');
direction=get(fig_obj, 'CurrentKey'); %获取当前按键
if strcmp(direction,'uparrow') %上键
    set(fig2,'Visible','off') %清除坦克图
    tank=tank_im;
    alpha=transparency;
    if t1_posy>spd %如果没超过边界 更新坦克位置
        t1_posy=t1_posy-spd;
    end
    face='up'; %更新面对方向
    fig2=imagesc(t1_posx,t1_posy, tank); %重新画坦克
    set(fig2, 'AlphaData', alpha) %坦克背景透明
elseif strcmp(direction,'downarrow') %下键
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,180);
    alpha=imrotate(transparency,180);
    if t1_posy<size(map,1)-size(tank_im,1)-spd
        t1_posy=t1_posy+spd;
    end
    face='down';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'rightarrow') %右键
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,-90);
    alpha=imrotate(transparency,-90);
    if t1_posx<size(map,2)-size(tank_im,2)-spd
        t1_posx=t1_posx+spd;
    end
    face='right';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'leftarrow') %左键
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,90);
    alpha=imrotate(transparency,90);
    if t1_posx>spd
        t1_posx=t1_posx-spd;
    end
    face='left';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'space') %空格键
    missile_fire=1; %触发导弹发射
    assignin('base', 'missile_fire',missile_fire ) %导弹发射信息赋值到工作空间
else
%     if strcmp(face,'up')
%         tank=tank_im;
%         alpha=transparency;
%     elseif strcmp(face,'down')
%         tank=imrotate(tank_im,180);
%         alpha=imrotate(transparency,180);
%     elseif strcmp(face,'right')
%         tank=imrotate(tank_im,-90);
%         alpha=imrotate(transparency,-90);
%     elseif strcmp(face,'left')
%         tank=imrotate(tank_im,90);
%         alpha=imrotate(transparency,90);
%     end
end




assignin('base', 't1_posx',t1_posx ) %坦克位置赋值到工作空间
assignin('base', 'face',face ) %坦克面对方向赋值到工作空间
assignin('base', 't1_posy',t1_posy )
assignin('base', 'fig2',fig2 ) %坦克图像句柄赋值到工作空间
