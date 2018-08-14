function shoot_missile(fig_obj,eventDat)
missile_fire=evalin('base', 'missile_fire'); %获取工作空间的missile_fire信息 查询是否发射导弹

if missile_fire==1 %如果反馈为发射
    missile_transparency=evalin('base', 'missile_transparency'); %获取空座空间导弹alpha信息
    missile_im=evalin('base', 'missile_im'); %获取工作空间导弹图像
    wall_fig=evalin('base','wall_fig'); %获取工作空间障碍物图像句柄
    wall_posx=evalin('base', 'wall_posx'); %获取障碍物位置信息
    wall_posy=evalin('base', 'wall_posy');
    boom=evalin('base', 'boom'); %获取爆炸图像
    t1_posx=evalin('base', 't1_posx'); %获取坦克位置
    t1_posy=evalin('base', 't1_posy');
    face=evalin('base', 'face'); %获取当前坦克面对方向
    missile_fire=0; %清理发射变量
    assignin('base', 'missile_fire',missile_fire) %发射变量重新赋值到工作空间
    
    if strcmp(face,'up') %如果面向上方 调整导弹图像
        missile=imrotate(missile_im,180); %导弹图像旋转180度
        alpha=imrotate(missile_transparency,180);
        for i=1:10
            fig3=imagesc(t1_posx+10,t1_posy-i*15, missile); %画导弹图
            set(fig3, 'AlphaData', alpha) %背景透明化
            pause(.05) %停0.05秒
            set(fig3,'Visible','off') %清空导弹图
        end
    
    elseif strcmp(face,'down')  %如果面向下方 调整导弹图像
        missile=missile_im;
        alpha=missile_transparency;
        missile_posx=t1_posx+10;
        missile_posy=t1_posy+20;
        for i=1:10 
            missile_posy=missile_posy+15;%更新导弹位置
            %如果导弹击中障碍物
            if missile_posx>wall_posx && missile_posx<wall_posx+30 && missile_posy>wall_posy-30 && missile_posy<wall_posy
                set(wall_fig,'Visible','off') %清空障碍物图像
                wall_fig=imagesc(wall_posx,wall_posy,boom); %爆炸图像代替障碍物图像
            end
            fig3=imagesc(missile_posx,missile_posy, missile);
            set(fig3, 'AlphaData', alpha)
            pause(.05)
            set(fig3,'Visible','off')
        end
        
        elseif strcmp(face,'right')  %如果面向右方 调整导弹图像
        missile=imrotate(missile_im,90);
        alpha=imrotate(missile_transparency,90);
        for i=1:10
            fig3=imagesc(t1_posx+30+i*15,t1_posy+10, missile);
            set(fig3, 'AlphaData', alpha)
            pause(.05)
            set(fig3,'Visible','off')
        end
        
        elseif strcmp(face,'left')  %如果面向左方 调整导弹图像
        missile=imrotate(missile_im,-90);
        alpha=imrotate(missile_transparency,-90);
        for i=1:10
            fig3=imagesc(t1_posx-i*15,t1_posy+10, missile);
            set(fig3, 'AlphaData', alpha)
            pause(.05)
            set(fig3,'Visible','off')
        end
    end
    
%     for i=1:10
%         alpha=missile_transparency;
%         fig3=imagesc(t1_posx+i*15,t1_posy, missile_im);
%         set(fig3, 'AlphaData', alpha)
%         pause(.1)
%         set(fig3,'Visible','off')
%     end
end