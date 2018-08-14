function shoot_missile(fig_obj,eventDat)
missile_fire=evalin('base', 'missile_fire'); %��ȡ�����ռ��missile_fire��Ϣ ��ѯ�Ƿ��䵼��

if missile_fire==1 %�������Ϊ����
    missile_transparency=evalin('base', 'missile_transparency'); %��ȡ�����ռ䵼��alpha��Ϣ
    missile_im=evalin('base', 'missile_im'); %��ȡ�����ռ䵼��ͼ��
    wall_fig=evalin('base','wall_fig'); %��ȡ�����ռ��ϰ���ͼ����
    wall_posx=evalin('base', 'wall_posx'); %��ȡ�ϰ���λ����Ϣ
    wall_posy=evalin('base', 'wall_posy');
    boom=evalin('base', 'boom'); %��ȡ��ըͼ��
    t1_posx=evalin('base', 't1_posx'); %��ȡ̹��λ��
    t1_posy=evalin('base', 't1_posy');
    face=evalin('base', 'face'); %��ȡ��ǰ̹����Է���
    missile_fire=0; %���������
    assignin('base', 'missile_fire',missile_fire) %����������¸�ֵ�������ռ�
    
    if strcmp(face,'up') %��������Ϸ� ��������ͼ��
        missile=imrotate(missile_im,180); %����ͼ����ת180��
        alpha=imrotate(missile_transparency,180);
        for i=1:10
            fig3=imagesc(t1_posx+10,t1_posy-i*15, missile); %������ͼ
            set(fig3, 'AlphaData', alpha) %����͸����
            pause(.05) %ͣ0.05��
            set(fig3,'Visible','off') %��յ���ͼ
        end
    
    elseif strcmp(face,'down')  %��������·� ��������ͼ��
        missile=missile_im;
        alpha=missile_transparency;
        missile_posx=t1_posx+10;
        missile_posy=t1_posy+20;
        for i=1:10 
            missile_posy=missile_posy+15;%���µ���λ��
            %������������ϰ���
            if missile_posx>wall_posx && missile_posx<wall_posx+30 && missile_posy>wall_posy-30 && missile_posy<wall_posy
                set(wall_fig,'Visible','off') %����ϰ���ͼ��
                wall_fig=imagesc(wall_posx,wall_posy,boom); %��ըͼ������ϰ���ͼ��
            end
            fig3=imagesc(missile_posx,missile_posy, missile);
            set(fig3, 'AlphaData', alpha)
            pause(.05)
            set(fig3,'Visible','off')
        end
        
        elseif strcmp(face,'right')  %��������ҷ� ��������ͼ��
        missile=imrotate(missile_im,90);
        alpha=imrotate(missile_transparency,90);
        for i=1:10
            fig3=imagesc(t1_posx+30+i*15,t1_posy+10, missile);
            set(fig3, 'AlphaData', alpha)
            pause(.05)
            set(fig3,'Visible','off')
        end
        
        elseif strcmp(face,'left')  %��������� ��������ͼ��
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