function experiment7_1_single_file()
    % ���������������ֵ����������������Է���ͼ
    clc; % ����

    % �����ʼֵ�Ͳ���
    initial_values = [10]; % ��ʼֵ�б�
    max_iter = 100; % ����������
    tol = 1e-6; % ������ֵ

    % �������ֵ�����
    for i = 1:length(initial_values)
        x0 = initial_values(i); % ��ǰ��ʼֵ
        disp(['��ʼֵ: ', num2str(x0)]);

        % �������� 1
        [x_iter1, iter1] = iterate(@iter_func1, x0, max_iter, tol);
        plot_convergence(x_iter1, iter1, '�������� 1 �����Է���');

        % �������� 2
        [x_iter2, iter2] = iterate(@iter_func2, x0, max_iter, tol);
        plot_convergence(x_iter2, iter2, '�������� 2 �����Է���');

        % �������� 3
        [x_iter3, iter3] = iterate(@iter_func3, x0, max_iter, tol);
        plot_convergence(x_iter3, iter3, '�������� 3 �����Է���');
    end
end

% ����ѭ������
function [x_iter, iter] = iterate(func, x0, max_iter, tol)
    % ���룺
    % func - �����������
    % x0 - ��ʼֵ
    % max_iter - ����������
    % tol - ������ֵ
    % �����
    % x_iter - ����ֵ�б�
    % iter - ��������

    x_iter = zeros(1, max_iter); % Ԥ����洢�ռ�
    x_iter(1) = x0; % ��ʼֵ

    for iter = 2:max_iter
        x_iter(iter) = func(x_iter(iter-1)); % ������һ������ֵ
        % ���������
        if abs(x_iter(iter) - x_iter(iter-1)) < tol
            x_iter = x_iter(1:iter); % �ض�δʹ�õĲ���
            return;
        end
    end
    x_iter = x_iter(1:max_iter); % �ﵽ����������
end

% ��ͼ����
function plot_convergence(x_seq, converged, func_name)
    figure;
    iter_num = 1:length(x_seq);
    plot(iter_num, x_seq, '-o');
    title([func_name, ' �����Է���']);
    xlabel('��������');
    ylabel('����ֵ');
    legend(['���� = ', num2str(converged)]);
    grid on;
end


% ������������
function f = iter_func1(x)
    f = x^2 - 1; % ��һ����������
end

function f = iter_func2(x)
    f = sqrt(x + 1); % �ڶ�����������
end

function f = iter_func3(x)
    f = 1 + 1 / x; % ��������������
end
