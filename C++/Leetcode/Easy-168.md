### 题目描述

给你一个整数 `columnNumber`，返回它在 Excel 表中相对应的列名称。

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
- 输入：`columnNumber = 1`
- 输出：`"A"`
- 解释：`1` 对应 `"A"`。

- 输入：`columnNumber = 28`
- 输出：`"AB"`
- 解释：`28` 对应 `"AB"`。

- 输入：`columnNumber = 701`
- 输出：`"ZY"`
- 解释：`701` 对应 `"ZY"`。

- 输入：`columnNumber = 2147483647`
- 输出：`"FXSHRXW"`
- 解释：`2147483647` 对应 `"FXSHRXW"`。

### 我的答案

```cpp
string convertToTitle(int columnNumber) {
    std::unordered_map<int, char> map;
    for (int i = 0; i < 26; i++) {
        map[i] = 'A' + i;
    }
  
    std::string result;
    while (columnNumber > 0) {
        columnNumber--;
        result = map[columnNumber % 26] + result;
        columnNumber /= 26;
    }
    return result;
}
```

### 详细解释

这个算法的核心思想是将整数 `columnNumber` 转换为 Excel 列名称。具体步骤如下：

1. **初始化**：
   - 使用一个 `unordered_map` 来存储数字与字母的对应关系，`0 -> 'A'`, `1 -> 'B'`, ..., `25 -> 'Z'`。

2. **转换**：
   - 当 `columnNumber` 大于 `0` 时，执行以下步骤：
     - 将 `columnNumber` 减 `1`（因为 Excel 列是从 `1` 开始的，而我们的映射是从 `0` 开始的）。
     - 计算 `columnNumber % 26`，得到当前位的字母。
     - 将当前位的字母添加到结果字符串的头部。
     - 将 `columnNumber` 除以 `26`，进入下一个位数。

3. **返回结果**：
   - 遍历结束后，返回结果字符串。

**示例说明**：
- 对于输入 `columnNumber = 28`：
  - `28 - 1 = 27`，`27 % 26 = 1`，对应 `'B'`，结果字符串为 `"B"`。
  - `27 / 26 = 1`，`1 - 1 = 0`，`0 % 26 = 0`，对应 `'A'`，结果字符串为 `"AB"`。
  - `1 / 26 = 0`，结束循环。
  - 返回结果 `"AB"`。

### 解题思路

#### 我的思路

- **映射关系**：
  - 使用 `unordered_map` 存储数字与字母的对应关系，`0 -> 'A'`, `1 -> 'B'`, ..., `25 -> 'Z'`。
- **转换逻辑**：
  - 通过循环将整数 `columnNumber` 转换为 Excel 列名称，每次处理一位，并将结果字符串拼接在头部。
- **时间复杂度**：
  - 时间复杂度为 `O(log26(columnNumber))`，因为每次循环将 `columnNumber` 除以 `26`，直到 `columnNumber` 变为 `0`。
- **空间复杂度**：
  - 空间复杂度为 `O(1)`，除了结果字符串外，只使用了常数级别的额外空间。

#### 官方建议的思路

**直接映射**：
- 不需要使用 `unordered_map`，可以直接通过 `char` 转换得到字母。
- 每次处理一位，将结果字符串拼接在头部，最后返回结果。

**时间复杂度**：
- 时间复杂度为 `O(log26(columnNumber))`。

**空间复杂度**：
- 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 我的答案与官方答案的比较

- **时间复杂度**：我的答案和官方答案的时间复杂度均为 `O(log26(columnNumber))`。
- **空间复杂度**：我的答案的空间复杂度为 `O(1)`，官方答案的空间复杂度也为 `O(1)`，但官方答案避免了使用 `unordered_map`，减少了内存消耗。
- **无意义的比较**：我的答案通过 `unordered_map` 存储映射关系，但官方答案直接通过 `char` 转换，避免了多余的比较和存储。

### 具体实现

**直接映射法的实现**：
- **初始化**：
  - 不需要额外的映射表。
- **转换逻辑**：
  - 对于每个位数，计算 `columnNumber % 26`，得到当前位的字母。
  - 将当前位的字母添加到结果字符串的头部。
  - 将 `columnNumber` 除以 `26`，进入下一个位数。
- **返回结果**：
  - 遍历结束后，返回结果字符串。

**示例代码**：
```cpp
string convertToTitle(int columnNumber) {
    std::string result;
    while (columnNumber > 0) {
        columnNumber--;
        char currentChar = 'A' + (columnNumber % 26);
        result = currentChar + result;
        columnNumber /= 26;
    }
    return result;
}
```

### 补充知识

#### 进制转换

- **26 进制**：
  - Excel 列名称可以看作是一个 `26` 进制的数，每一位的取值范围是 `[0, 25]`，对应 `'A'` 到 `'Z'`。
- **转换方法**：
  - 每次将 `columnNumber` 减 `1`，然后取 `columnNumber % 26`，得到当前位的字母。
  - 将 `columnNumber` 除以 `26`，继续处理下一位。

#### 字符串拼接

- **字符串拼接**：
  - 在 `C++` 中，可以使用 `+` 操作符拼接字符串。
  - 每次将当前位的字符添加到结果字符串的头部。

#### 优化建议

- **减少内存消耗**：
  - 避免使用 `unordered_map`，直接通过 `char` 转换得到字母。
- **减少循环次数**：
  - 每次循环处理一位，减少不必要的计算。

### 总结

通过直接映射法，可以在 `O(log26(columnNumber))` 的时间复杂度内将整数 `columnNumber` 转换为 Excel 列名称。通过避免使用 `unordered_map`，可以减少内存消耗。对于优化，可以直接通过 `char` 转换，减少循环次数。