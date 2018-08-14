function tank_move(fig_obj,eventDat)
spd=5; %̹���ƶ��ٶ�
fig2=evalin('base', 'fig2'); %��ȡ̹��ͼ����

map=evalin('base', 'map'); %��ȡ��ͼ
transparency=evalin('base', 'tank_transparency'); %̹��alpha��Ϣ
face=evalin('base', 'face'); %̹����Է���
tank_im=evalin('base', 'tank_im'); %̹��ͼ
t1_posx=evalin('base', 't1_posx'); %̹��λ��
t1_posy=evalin('base', 't1_posy');
direction=get(fig_obj, 'CurrentKey'); %��ȡ��ǰ����
if strcmp(direction,'uparrow') %�ϼ�
    set(fig2,'Visible','off') %���̹��ͼ
    tank=tank_im;
    alpha=transparency;
    if t1_posy>spd %���û�����߽� ����̹��λ��
        t1_posy=t1_posy-spd;
    end
    face='up'; %������Է���
    fig2=imagesc(t1_posx,t1_posy, tank); %���»�̹��
    set(fig2, 'AlphaData', alpha) %̹�˱���͸��
elseif strcmp(direction,'downarrow') %�¼�
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,180);
    alpha=imrotate(transparency,180);
    if t1_posy<size(map,1)-size(tank_im,1)-spd
        t1_posy=t1_posy+spd;
    end
    face='down';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'rightarrow') %�Ҽ�
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,-90);
    alpha=imrotate(transparency,-90);
    if t1_posx<size(map,2)-size(tank_im,2)-spd
        t1_posx=t1_posx+spd;
    end
    face='right';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'leftarrow') %���
    set(fig2,'Visible','off')
    tank=imrotate(tank_im,90);
    alpha=imrotate(transparency,90);
    if t1_posx>spd
        t1_posx=t1_posx-spd;
    end
    face='left';
    fig2=imagesc(t1_posx,t1_posy, tank);
    set(fig2, 'AlphaData', alpha)
elseif strcmp(direction,'space') %�ո��
    missile_fire=1; %������������
    assignin('base', 'missile_fire',missile_fire ) %����������Ϣ��ֵ�������ռ�
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




assignin('base', 't1_posx',t1_posx ) %̹��λ�ø�ֵ�������ռ�
assignin('base', 'face',face ) %̹����Է���ֵ�������ռ�
assignin('base', 't1_posy',t1_posy )
assignin('base', 'fig2',fig2 ) %̹��ͼ������ֵ�������ռ�
