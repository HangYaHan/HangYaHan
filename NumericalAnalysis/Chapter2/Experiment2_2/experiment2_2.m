% ʵ��2.2 ������ֵ���������ղ�ֵ�������ԱȽ�
% ����: XXX
% ����: XXX

%% 1. ���屻�ƽ�����
f = @(x) 1 ./ (1 + 25 * x.^2); % �޸�Ϊ f(x) = 1/(1 + 25x^2)

%% 2. ���ɲ�ֵ�ڵ�
n_list = 5:5:50; % ��ֵ�ڵ�����б�
error_spline = zeros(1, length(n_list)); % ��ʼ��������ֵ���
error_lagrange = zeros(1, length(n_list)); % ��ʼ���������ղ�ֵ���

for i = 1:length(n_list)
    n = n_list(i); % ��ǰ��ֵ�ڵ���
    x = linspace(-1, 1, n); % ���ɵȾ�ڵ㣬����Ϊ [-1, 1]
    y = f(x); % ���㺯��ֵ

    %% 3. ��ȡ������ֵ���
    pp_spline = spline(x, y); % ��������������ֵģ��
    x_eval = linspace(-1, 1, 1000); % ������
    y_spline = ppval(pp_spline, x_eval); % ������ֵ���
    y_true = f(x_eval); % ��ʵ����ֵ

    % ����������ֵ���
    error_spline(i) = max(abs(y_spline - y_true)); % ������

    %% 4. ��ȡ�������ղ�ֵ���
    % �����������ղ�ֵ����ʽ
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

    % �����������ղ�ֵ���
    error_lagrange(i) = max(abs(y_lagrange - y_true)); % ������
end

%% 5. ���������ڵ������ӵı仯ͼ
figure('Name', '������ֵ���������ղ�ֵ���Ƚ�');
semilogy(n_list, error_spline, 'o-', 'LineWidth', 2, 'DisplayName', '������ֵ');
hold on;
semilogy(n_list, error_lagrange, 's-', 'LineWidth', 2, 'DisplayName', '�������ղ�ֵ');
title('������ֵ���������ղ�ֵ�����ڵ������ӵı仯');
xlabel('��ֵ�ڵ���');
ylabel('������ (�����̶�)');
legend('Location', 'best');
grid on;

%% 6. ʵ��������
% 1. �����ڵ������ӵı仯
% �����ͼ�п��Կ�����������ֵ��������Ų�ֵ�ڵ��������Ӷ��𽥼�С�����ֳ����õ������ԡ�
% �������ղ�ֵ��ĳЩ�ڵ����϶�ʱ������������󣬵����������

% 2. ���������ն���ʽ��ֵ�ĶԱ�
% ������ֵͨ���ֶ�ʹ�õͽ׶���ʽ����Ч�������������󣬱��ֳ����ȶ�����������ԡ�

%% ʵ��С��
% - ���ں��� f(x) = 1/(1 + 25x^2)��������ֵ����������������������ղ�ֵ��
% - ������ֵ��ʵ��Ӧ���о��й㷺��;�����糵��������ơ�������·���滮�ȡ�
% - ͨ��ʵ����֤��������ֵ�ڱƽ����Ӻ���ʱ���ڴ�ͳ�Ķ���ʽ��ֵ������


%% 6. �����������
% ������������
x_car = 0:10;
y_car = [0.0, 0.79, 1.53, 2.19, 2.71, 3.03, 3.27, 2.89, 3.06, 3.19, 3.29];

% ָ���˵㵼��ֵ������������ֵ
% ָ����ʼ��ͽ�����ĵ���ֵΪ 0.8 �� 0.2
pp_car = csape(x_car, y_car, 'complete', [0.8, 0.2]);

% ������
x_car_eval = linspace(0, 10, 1000);
y_car_spline = ppval(pp_car, x_car_eval);

% ���Ƴ�������
figure('Name', '�����������');
plot(x_car, y_car, 'o', 'LineWidth', 2); % ԭʼ���ݵ�
hold on;
plot(x_car_eval, y_car_spline, 'LineWidth', 2); % ������ֵ����
title('����������ƣ�ָ���˵㵼��ֵ��');
xlabel('x');
ylabel('y');
legend('���ݵ�', '����������ֵ����', 'Location', 'best');
grid on;


