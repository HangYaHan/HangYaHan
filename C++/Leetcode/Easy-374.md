### 题目描述

我们正在玩一个猜数字游戏。游戏的规则如下：

- 我会从 `1` 到 `n` 随机选择一个数字 `pick`。
- 你需要猜出我选出的数字。
- 如果你猜错了，我会告诉你，我选出的数字比你猜的数字大了还是小了。
- 你可以通过调用预先定义好的接口 `int guess(int num)` 来获取猜测结果。这个接口返回值有三种可能的情况：
  - `-1`：你猜的数字比我选出的数字大（即 `num > pick`）。
  - `1`：你猜的数字比我选出的数字小（即 `num < pick`）。
  - `0`：你猜的数字与我选出的数字相等（即 `num == pick`）。

你的任务是写一个函数 `guessNumber(int n)`，返回我选出的数字 `pick`。

**示例**：
- 输入：`n = 10, pick = 6`
- 输出：`6`
- 解释：在 `1` 到 `10` 的范围内，猜 `6` 是正确答案。

- 输入：`n = 1, pick = 1`
- 输出：`1`
- 解释：在 `1` 到 `1` 的范围内，猜 `1` 是正确答案。

- 输入：`n = 2, pick = 1`
- 输出：`1`
- 解释：在 `1` 到 `2` 的范围内，猜 `1` 是正确答案。

### 我的答案

```cpp
int guessNumber(int n) {
    long left = 1;
    long right = n;
    while (1)
    {
        long mid = (left + right) / 2;
        if (guess(mid) == 0){
            return mid;
        }
        else if (guess(mid) == -1){
            right = mid - 1;
        }
        else{
            left = mid + 1;
        }
    }
}
```

### 详细解释

这个算法的核心思想是通过二分查找在一个有序序列 `[1, n]` 中找到目标数字 `pick`。具体步骤如下：

1. **初始化**：
   - 设置搜索范围的左右边界：`left = 1`，`right = n`。

2. **二分查找**：
   - 在 `while (1)` 循环中，不断缩小搜索范围：
     - 计算中间值 `mid = (left + right) / 2`。
     - 调用 `guess(mid)` 获取猜测结果：
       - 如果 `guess(mid) == 0`，表示猜中了目标数字，返回 `mid`。
       - 如果 `guess(mid) == -1`，表示目标数字比 `mid` 小，更新右边界 `right = mid - 1`。
       - 如果 `guess(mid) == 1`，表示目标数字比 `mid` 大，更新左边界 `left = mid + 1`。

3. **返回结果**：
   - 当找到目标数字时，返回 `mid`。

**示例说明**：
- 对于输入 `n = 10, pick = 6`：
  - 初始范围 `[1, 10]`，`mid = 5`，`guess(5) = 1`，更新左边界 `left = 6`。
  - 新范围 `[6, 10]`，`mid = 8`，`guess(8) = -1`，更新右边界 `right = 7`。
  - 新范围 `[6, 7]`，`mid = 6`，`guess(6) = 0`，返回 `6`。

### 解题思路

#### 我的思路

- **二分查找**：
  - 使用二分查找在有序序列 `[1, n]` 中找到目标数字 `pick`。
  - 通过 `guess(mid)` 函数判断目标数字与中间值的关系，缩小搜索范围。
- **循环条件**：
  - 使用 `while (1)` 循环，直到找到目标数字并返回。
- **时间复杂度**：
  - 时间复杂度为 `O(log n)`，因为每次循环都将搜索范围减半。
- **空间复杂度**：
  - 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 官方建议的思路

**二分查找**：
- 同样使用二分查找在有序序列 `[1, n]` 中找到目标数字 `pick`。
- 通过 `guess(mid)` 函数判断目标数字与中间值的关系，缩小搜索范围。

**时间复杂度**：
- 时间复杂度为 `O(log n)`，每次循环都将搜索范围减半。

**空间复杂度**：
- 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 我的答案与官方答案的比较

- **时间复杂度**：我的答案和官方答案的时间复杂度均为 `O(log n)`。
- **空间复杂度**：我的答案的空间复杂度为 `O(1)`，官方答案的空间复杂度也为 `O(1)`。
- **无意义的比较**：我的答案和官方答案的实现方式基本一致，没有进行无意义的比较。

### 具体实现

**二分查找法的实现**：
- **初始化**：
  - 设置搜索范围的左右边界：`left = 1`，`right = n`。
- **二分查找**：
  - 在 `while (1)` 循环中，不断缩小搜索范围：
    - 计算中间值 `mid = (left + right) / 2`。
    - 调用 `guess(mid)` 获取猜测结果：
      - 如果 `guess(mid) == 0`，表示猜中了目标数字，返回 `mid`。
      - 如果 `guess(mid) == -1`，表示目标数字比 `mid` 小，更新右边界 `right = mid - 1`。
      - 如果 `guess(mid) == 1`，表示目标数字比 `mid` 大，更新左边界 `left = mid + 1`。
- **返回结果**：
  - 当找到目标数字时，返回 `mid`。

**示例代码**：
```cpp
int guessNumber(int n) {
    int left = 1;
    int right = n;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        int result = guess(mid);
        if (result == 0) {
            return mid;
        } else if (result == -1) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return -1;  // 如果未找到，返回 -1（理论上不会执行到这一步）
}
```

### 补充知识

#### 二分查找

- **二分查找**：
  - 二分查找是一种在有序序列中查找目标值的算法。
  - 每次查找将搜索范围减半，直到找到目标值或搜索范围为空。
- **时间复杂度**：
  - 时间复杂度为 `O(log n)`，每次循环将搜索范围减半。
- **空间复杂度**：
  - 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 循环条件

- **`while (1)`**：
  - 使用 `while (1)` 循环，表示无限循环，直到找到目标数字并返回。
  - 也可以使用 `while (left <= right)` 作为循环条件，避免无限循环。

#### 防止整数溢出

- **整数溢出**：
  - 在计算中间值 `mid` 时，直接使用 `(left + right) / 2` 可能导致整数溢出。
  - 可以使用 `left + (right - left) / 2` 来避免整数溢出。

### 总结

通过二分查找法，可以在 `O(log n)` 的时间复杂度内找到目标数字 `pick`。通过避免使用 `while (1)` 循环，可以减少潜在的无限循环风险。对于优化，可以使用 `left + (right - left) / 2` 来避免整数溢出。