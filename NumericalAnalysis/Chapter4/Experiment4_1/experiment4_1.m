% 实验 4.1 计算
clc; clear;

% 绝对误差限
epsilon = 0.5e-7;

%% 定义计算量函数
% 计算量 = 节点数 = (区间长度) / (步长) + 1
compute_nodes = @(h, a, b) ceil((b - a) / h) + 1;

%% 1. 计算 (1) \(\ln2 - \ln3 = -2\int_{2}^{3}\frac{1}{x^{2}-1}dx\)
f = @(x) 1 ./ (x.^2 - 1);
a = 2; b = 3;
exact_1 = log(2) - log(3);

% 复化梯形公式
h_trap_1 = step_estimate(f, a, b, epsilon, 'Trapezoidal');
nodes_trap_1 = compute_nodes(h_trap_1, a, b);
result_trap_1 = composite_trapezoidal(f, a, b, h_trap_1);
error_trap_1 = abs(result_trap_1 + 2 * exact_1);

% 复化 Simpson 公式
h_simp_1 = step_estimate(f, a, b, epsilon, 'Simpson');
nodes_simp_1 = compute_nodes(h_simp_1, a, b);
result_simp_1 = composite_simpson(f, a, b, h_simp_1);
error_simp_1 = abs(result_simp_1 + 2 * exact_1);

% 复化 Gauss-Legendre Ⅰ型公式
h_gauss_1 = step_estimate(f, a, b, epsilon, 'Gauss');
nodes_gauss_1 = compute_nodes(h_gauss_1, a, b);
result_gauss_1 = composite_gauss(f, a, b, h_gauss_1);
error_gauss_1 = abs(result_gauss_1 + 2 * exact_1);

%% 2. 计算 (2) \(\pi = 4\int_{0}^{1}\frac{1}{1 + x^{2}}dx\)
f = @(x) 1 ./ (1 + x.^2);
a = 0; b = 1;
exact_2 = pi;

% 复化梯形公式
h_trap_2 = step_estimate(f, a, b, epsilon, 'Trapezoidal');
nodes_trap_2 = compute_nodes(h_trap_2, a, b);
result_trap_2 = composite_trapezoidal(f, a, b, h_trap_2);
error_trap_2 = abs(4 * result_trap_2 - exact_2);

% 复化 Simpson 公式
h_simp_2 = step_estimate(f, a, b, epsilon, 'Simpson');
nodes_simp_2 = compute_nodes(h_simp_2, a, b);
result_simp_2 = composite_simpson(f, a, b, h_simp_2);
error_simp_2 = abs(4 * result_simp_2 - exact_2);

% 复化 Gauss-Legendre Ⅰ型公式
h_gauss_2 = step_estimate(f, a, b, epsilon, 'Gauss');
nodes_gauss_2 = compute_nodes(h_gauss_2, a, b);
result_gauss_2 = composite_gauss(f, a, b, h_gauss_2);
error_gauss_2 = abs(4 * result_gauss_2 - exact_2);

%% 3. 计算 (3) \(\frac{2}{\ln3} = \int_{0}^{1}3^{x}dx\)
f = @(x) 3.^x;
a = 0; b = 1;
exact_3 = 2 / log(3);

% 复化梯形公式
h_trap_3 = step_estimate(f, a, b, epsilon, 'Trapezoidal');
nodes_trap_3 = compute_nodes(h_trap_3, a, b);
result_trap_3 = composite_trapezoidal(f, a, b, h_trap_3);
error_trap_3 = abs(result_trap_3 - exact_3);

% 复化 Simpson 公式
h_simp_3 = step_estimate(f, a, b, epsilon, 'Simpson');
nodes_simp_3 = compute_nodes(h_simp_3, a, b);
result_simp_3 = composite_simpson(f, a, b, h_simp_3);
error_simp_3 = abs(result_simp_3 - exact_3);

% 复化 Gauss-Legendre Ⅰ型公式
h_gauss_3 = step_estimate(f, a, b, epsilon, 'Gauss');
nodes_gauss_3 = compute_nodes(h_gauss_3, a, b);
result_gauss_3 = composite_gauss(f, a, b, h_gauss_3);
error_gauss_3 = abs(result_gauss_3 - exact_3);

%% 4. 计算 (4) \(e^{2} = \int_{1}^{2}xe^{x}dx\)
f = @(x) x .* exp(x);
a = 1; b = 2;
exact_4 = exp(2);

% 复化梯形公式
h_trap_4 = step_estimate(f, a, b, epsilon, 'Trapezoidal');
nodes_trap_4 = compute_nodes(h_trap_4, a, b);
result_trap_4 = composite_trapezoidal(f, a, b, h_trap_4);
error_trap_4 = abs(result_trap_4 - exact_4);

% 复化 Simpson 公式
h_simp_4 = step_estimate(f, a, b, epsilon, 'Simpson');
nodes_simp_4 = compute_nodes(h_simp_4, a, b);
result_simp_4 = composite_simpson(f, a, b, h_simp_4);
error_simp_4 = abs(result_simp_4 - exact_4);

% 复化 Gauss-Legendre Ⅰ型公式
h_gauss_4 = step_estimate(f, a, b, epsilon, 'Gauss');
nodes_gauss_4 = compute_nodes(h_gauss_4, a, b);
result_gauss_4 = composite_gauss(f, a, b, h_gauss_4);
error_gauss_4 = abs(result_gauss_4 - exact_4);

%% 结果展示
disp('1. (1) 计算结果与误差：');
disp(['  复化梯形公式：步长 = ', num2str(h_trap_1), '，节点数 = ', num2str(nodes_trap_1), '，误差 = ', num2str(error_trap_1)]);
disp(['  复化 Simpson 公式：步长 = ', num2str(h_simp_1), '，节点数 = ', num2str(nodes_simp_1), '，误差 = ', num2str(error_simp_1)]);
disp(['  复化 Gauss-Legendre 公式：步长 = ', num2str(h_gauss_1), '，节点数 = ', num2str(nodes_gauss_1), '，误差 = ', num2str(error_gauss_1)]);

disp('2. (2) 计算结果与误差：');
disp(['  复化梯形公式：步长 = ', num2str(h_trap_2), '，节点数 = ', num2str(nodes_trap_2), '，误差 = ', num2str(error_trap_2)]);
disp(['  复化 Simpson 公式：步长 = ', num2str(h_simp_2), '，节点数 = ', num2str(nodes_simp_2), '，误差 = ', num2str(error_simp_2)]);
disp(['  复化 Gauss-Legendre 公式：步长 = ', num2str(h_gauss_2), '，节点数 = ', num2str(nodes_gauss_2), '，误差 = ', num2str(error_gauss_2)]);

disp('3. (3) 计算结果与误差：');
disp(['  复化梯形公式：步长 = ', num2str(h_trap_3), '，节点数 = ', num2str(nodes_trap_3), '，误差 = ', num2str(error_trap_3)]);
disp(['  复化 Simpson 公式：步长 = ', num2str(h_simp_3), '，节点数 = ', num2str(nodes_simp_3), '，误差 = ', num2str(error_simp_3)]);
disp(['  复化 Gauss-Legendre 公式：步长 = ', num2str(h_gauss_3), '，节点数 = ', num2str(nodes_gauss_3), '，误差 = ', num2str(error_gauss_3)]);

disp('4. (4) 计算结果与误差：');
disp(['  复化梯形公式：步长 = ', num2str(h_trap_4), '，节点数 = ', num2str(nodes_trap_4), '，误差 = ', num2str(error_trap_4)]);
disp(['  复化 Simpson 公式：步长 = ', num2str(h_simp_4), '，节点数 = ', num2str(nodes_simp_4), '，误差 = ', num2str(error_simp_4)]);
disp(['  复化 Gauss-Legendre 公式：步长 = ', num2str(h_gauss_4), '，节点数 = ', num2str(nodes_gauss_4), '，误差 = ', num2str(error_gauss_4)]);

%% 函数定义
function h = step_estimate(f, a, b, epsilon, method)
    % 估算步长 h
    if strcmp(method, 'Trapezoidal')
        % 复化梯形公式的余项
        h = sqrt((b - a)^3 * max(abs(diff(f(a:1e-5:b)))) / (12 * epsilon));
    elseif strcmp(method, 'Simpson')
        % 复化 Simpson 公式的余项
        h = ( (b - a)^5 * max(abs(diff(f(a:1e-5:b), 2))) / (180 * epsilon) )^(1/4);
    elseif strcmp(method, 'Gauss')
        % 复化 Gauss-Legendre Ⅰ型公式的余项
        h = ( (b - a)^5 * max(abs(diff(f(a:1e-5:b), 2))) / (1920 * epsilon) )^(1/4);
    end
end

function result = composite_trapezoidal(f, a, b, h)
    % 复化梯形公式
    x = a:h:b;
    result = h * (sum(f(x)) - 0.5 * (f(a) + f(b)));
end

function result = composite_simpson(f, a, b, h)
    % 复化 Simpson 公式
    x = a:h:b;
    result = h/3 * (f(a) + f(b) + 4 * sum(f(x(2:2:end-1))) + 2 * sum(f(x(3:2:end-2))));
end

function result = composite_gauss(f, a, b, h)
    % 复化 Gauss-Legendre Ⅰ型公式
    x = a:h:b;
    result = 0;
    for i = 1:length(x)-1
        c1 = (x(i) + x(i+1)) / 2 - (x(i+1) - x(i)) / (2 * sqrt(3));
        c2 = (x(i) + x(i+1)) / 2 + (x(i+1) - x(i)) / (2 * sqrt(3));
        result = result + 0.5 * (x(i+1) - x(i)) * (f(c1) + f(c2));
    end
end
