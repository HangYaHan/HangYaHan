% 实验2.2 样条插值与拉格朗日插值的收敛性比较
% 作者: XXX
% 日期: XXX

%% 1. 定义被逼近函数
f = @(x) 1 ./ (1 + 25 * x.^2); % 修改为 f(x) = 1/(1 + 25x^2)

%% 2. 生成插值节点
n_list = 5:5:50; % 插值节点个数列表
error_spline = zeros(1, length(n_list)); % 初始化样条插值误差
error_lagrange = zeros(1, length(n_list)); % 初始化拉格朗日插值误差

for i = 1:length(n_list)
    n = n_list(i); % 当前插值节点数
    x = linspace(-1, 1, n); % 生成等距节点，区间为 [-1, 1]
    y = f(x); % 计算函数值

    %% 3. 获取样条插值结果
    pp_spline = spline(x, y); % 生成三次样条插值模型
    x_eval = linspace(-1, 1, 1000); % 评估点
    y_spline = ppval(pp_spline, x_eval); % 样条插值结果
    y_true = f(x_eval); % 真实函数值

    % 计算样条插值误差
    error_spline(i) = max(abs(y_spline - y_true)); % 最大误差

    %% 4. 获取拉格朗日插值结果
    % 计算拉格朗日插值多项式
    y_lagrange = zeros(size(x_eval));
    for k = 1:length(x_eval)
        L = ones(size(x));
        for j = 1:length(x)
            if j ~= 1:length(x)
                L(j) = L(j) * (x_eval(k) - x(j)) / (x(1) - x(j));
            end
        end
        y_lagrange(k) = sum(y .* prod(L));
    end

    % 计算拉格朗日插值误差
    error_lagrange(i) = max(abs(y_lagrange - y_true)); % 最大误差
end

%% 5. 绘制误差随节点数增加的变化图
figure('Name', '样条插值与拉格朗日插值误差比较');
semilogy(n_list, error_spline, 'o-', 'LineWidth', 2, 'DisplayName', '样条插值');
hold on;
semilogy(n_list, error_lagrange, 's-', 'LineWidth', 2, 'DisplayName', '拉格朗日插值');
title('样条插值与拉格朗日插值误差随节点数增加的变化');
xlabel('插值节点数');
ylabel('最大误差 (对数刻度)');
legend('Location', 'best');
grid on;

%% 6. 实验结果分析
% 1. 误差随节点数增加的变化
% 从误差图中可以看出，样条插值的误差随着插值节点数的增加而逐渐减小，表现出良好的收敛性。
% 拉格朗日插值在某些节点数较多时会出现龙格现象，导致误差增大。

% 2. 与拉格朗日多项式插值的对比
% 样条插值通过分段使用低阶多项式，有效避免了龙格现象，表现出更稳定的误差收敛性。

%% 实验小结
% - 对于函数 f(x) = 1/(1 + 25x^2)，样条插值的误差收敛性优于拉格朗日插值。
% - 样条插值在实际应用中具有广泛用途，例如车门曲线设计、机器人路径规划等。
% - 通过实验验证，样条插值在逼近复杂函数时优于传统的多项式插值方法。


%% 6. 车门曲线设计
% 车门曲线数据
x_car = 0:10;
y_car = [0.0, 0.79, 1.53, 2.19, 2.71, 3.03, 3.27, 2.89, 3.06, 3.19, 3.29];

% 指定端点导数值的三次样条插值
% 指定起始点和结束点的导数值为 0.8 和 0.2
pp_car = csape(x_car, y_car, 'complete', [0.8, 0.2]);

% 评估点
x_car_eval = linspace(0, 10, 1000);
y_car_spline = ppval(pp_car, x_car_eval);

% 绘制车门曲线
figure('Name', '车门曲线设计');
plot(x_car, y_car, 'o', 'LineWidth', 2); % 原始数据点
hold on;
plot(x_car_eval, y_car_spline, 'LineWidth', 2); % 样条插值曲线
title('车门曲线设计（指定端点导数值）');
xlabel('x');
ylabel('y');
legend('数据点', '三次样条插值曲线', 'Location', 'best');
grid on;


