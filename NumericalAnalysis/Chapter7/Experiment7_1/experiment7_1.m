function experiment7_1_single_file()
    % 主函数：运行三种迭代法并绘制收敛性分析图
    clc; % 清屏

    % 定义初始值和参数
    initial_values = [10]; % 初始值列表
    max_iter = 100; % 最大迭代次数
    tol = 1e-6; % 收敛阈值

    % 运行三种迭代法
    for i = 1:length(initial_values)
        x0 = initial_values(i); % 当前初始值
        disp(['初始值: ', num2str(x0)]);

        % 迭代函数 1
        [x_iter1, iter1] = iterate(@iter_func1, x0, max_iter, tol);
        plot_convergence(x_iter1, iter1, '迭代函数 1 收敛性分析');

        % 迭代函数 2
        [x_iter2, iter2] = iterate(@iter_func2, x0, max_iter, tol);
        plot_convergence(x_iter2, iter2, '迭代函数 2 收敛性分析');

        % 迭代函数 3
        [x_iter3, iter3] = iterate(@iter_func3, x0, max_iter, tol);
        plot_convergence(x_iter3, iter3, '迭代函数 3 收敛性分析');
    end
end

% 迭代循环函数
function [x_iter, iter] = iterate(func, x0, max_iter, tol)
    % 输入：
    % func - 迭代函数句柄
    % x0 - 初始值
    % max_iter - 最大迭代次数
    % tol - 收敛阈值
    % 输出：
    % x_iter - 迭代值列表
    % iter - 迭代次数

    x_iter = zeros(1, max_iter); % 预分配存储空间
    x_iter(1) = x0; % 初始值

    for iter = 2:max_iter
        x_iter(iter) = func(x_iter(iter-1)); % 计算下一个迭代值
        % 检查收敛性
        if abs(x_iter(iter) - x_iter(iter-1)) < tol
            x_iter = x_iter(1:iter); % 截断未使用的部分
            return;
        end
    end
    x_iter = x_iter(1:max_iter); % 达到最大迭代次数
end

% 绘图函数
function plot_convergence(x_seq, converged, func_name)
    figure;
    iter_num = 1:length(x_seq);
    plot(iter_num, x_seq, '-o');
    title([func_name, ' 收敛性分析']);
    xlabel('迭代次数');
    ylabel('迭代值');
    legend(['收敛 = ', num2str(converged)]);
    grid on;
end


% 三个迭代函数
function f = iter_func1(x)
    f = x^2 - 1; % 第一个迭代函数
end

function f = iter_func2(x)
    f = sqrt(x + 1); % 第二个迭代函数
end

function f = iter_func3(x)
    f = 1 + 1 / x; % 第三个迭代函数
end
