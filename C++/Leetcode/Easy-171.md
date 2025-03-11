### 题目描述

给你一个字符串 `columnTitle`，表示 Excel 表格中的列名称。返回该列名称对应的列序号。

**例如**：
- `A -> 1`
- `B -> 2`
- `C -> 3`
- ...
- `Z -> 26`
- `AA -> 27`
- `AB -> 28`
- ...

**示例**：
- 输入：`columnTitle = "A"`
- 输出：`1`
- 解释：`"A"` 对应 `1`。

- 输入：`columnTitle = "AB"`
- 输出：`28`
- 解释：`"AB"` 对应 `28`。

- 输入：`columnTitle = "ZY"`
- 输出：`701`
- 解释：`"ZY"` 对应 `701`。

### 我的答案

```cpp
int titleToNumber(string columnTitle) {
    int result = 0;
    std::unordered_map<char, int> map;
    for (int i = 0; i < 26; i++) {
        map['A' + i] = i + 1;
    }

    for (int i = 0; i < columnTitle.size(); i++) {
        result = result * 26 + map[columnTitle[i]];
    }

    return result;
}
```

### 详细解释

这个算法的核心思想是将 Excel 列名称 `columnTitle` 转换为对应的列序号。具体步骤如下：

1. **初始化**：
   - 使用一个 `unordered_map` 来存储字母与数字的对应关系，`'A' -> 1`, `'B' -> 2`, ..., `'Z' -> 26`。

2. **转换**：
   - 遍历字符串 `columnTitle`：
     - 对于每个字符 `columnTitle[i]`，根据映射表 `map` 获取其对应的数值。
     - 将当前结果乘以 `26`，然后加上当前字符对应的数值。
     - 更新结果 `result`。

3. **返回结果**：
   - 遍历结束后，返回结果 `result`。

**示例说明**：
- 对于输入 `columnTitle = "AB"`：
  - 遍历到 `'A'`，`map['A'] = 1`，`result = 0 * 26 + 1 = 1`。
  - 遍历到 `'B'`，`map['B'] = 2`，`result = 1 * 26 + 2 = 28`。
  - 返回结果 `28`。

### 解题思路

#### 我的思路

- **映射关系**：
  - 使用 `unordered_map` 存储字母与数字的对应关系，`'A' -> 1`, `'B' -> 2`, ..., `'Z' -> 26`。
- **转换逻辑**：
  - 通过循环将字符串 `columnTitle` 转换为列序号，每次处理一位，更新结果 `result`。
- **时间复杂度**：
  - 时间复杂度为 `O(n)`，其中 `n` 是字符串 `columnTitle` 的长度。
- **空间复杂度**：
  - 空间复杂度为 `O(1)`，因为 `unordered_map` 的大小是固定的 `26`。

#### 官方建议的思路

**直接映射**：
- 不需要使用 `unordered_map`，可以直接通过字符的 ASCII 值计算字母对应的数值。
- 每次处理一位，更新结果 `result`。

**时间复杂度**：
- 时间复杂度为 `O(n)`，其中 `n` 是字符串 `columnTitle` 的长度。

**空间复杂度**：
- 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 我的答案与官方答案的比较

- **时间复杂度**：我的答案和官方答案的时间复杂度均为 `O(n)`。
- **空间复杂度**：我的答案的空间复杂度为 `O(1)`，官方答案的空间复杂度也为 `O(1)`，但官方答案避免了使用 `unordered_map`，减少了内存消耗。
- **无意义的比较**：我的答案通过 `unordered_map` 存储映射关系，但官方答案直接通过字符的 ASCII 值计算，避免了多余的比较和存储。

### 具体实现

**直接映射法的实现**：
- **初始化**：
  - 不需要额外的映射表。
- **转换逻辑**：
  - 遍历字符串 `columnTitle`：
    - 对于每个字符 `columnTitle[i]`，计算其对应的数值 `value = columnTitle[i] - 'A' + 1`。
    - 将当前结果乘以 `26`，然后加上当前字符对应的数值。
    - 更新结果 `result`。
- **返回结果**：
  - 遍历结束后，返回结果 `result`。

**示例代码**：
```cpp
int titleToNumber(string columnTitle) {
    int result = 0;
    for (int i = 0; i < columnTitle.size(); i++) {
        int value = columnTitle[i] - 'A' + 1;
        result = result * 26 + value;
    }
    return result;
}
```

### 补充知识

#### ASCII 码

- **ASCII 码**：
  - 字符在计算机中以 ASCII 码表示，`'A'` 的 ASCII 值为 `65`，`'B'` 的 ASCII 值为 `66`，依此类推，`'Z'` 的 ASCII 值为 `90`。
- **字符转换**：
  - 通过 `columnTitle[i] - 'A' + 1` 计算字符对应的数值。

#### 进制转换

- **26 进制**：
  - Excel 列名称可以看作是一个 `26` 进制的数，每一位的取值范围是 `[1, 26]`，对应 `'A'` 到 `'Z'`。
- **转换方法**：
  - 每次将当前结果乘以 `26`，然后加上当前字符对应的数值。

#### 字符串处理

- **字符串遍历**：
  - 通过循环遍历字符串 `columnTitle`，处理每一位字符。
- **结果更新**：
  - 每次更新结果 `result`，直到遍历结束。

### 总结

通过直接映射法，可以在 `O(n)` 的时间复杂度内将 Excel 列名称 `columnTitle` 转换为对应的列序号。通过避免使用 `unordered_map`，可以减少内存消耗。对于优化，可以直接通过字符的 ASCII 值计算，减少循环次数。