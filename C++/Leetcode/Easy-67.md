### 题目描述

给定两个二进制字符串 `a` 和 `b`，返回它们的和，结果也以二进制字符串的形式表示。

**示例**：

- 输入：`a = "11"`, `b = "1"`
- 输出：`"100"`
- 解释：`11 + 1 = 100`。

- 输入：`a = "1010"`, `b = "1011"`
- 输出：`"10101"`
- 解释：`1010 + 1011 = 10101`。

### 我的答案

```cpp
string addBinary(string a, string b) {
    int carry = 0;
    int sum = 0;
    int length = max(a.size(), b.size());
    int temp;
    string result;
    for (int i = 0; i < length; ++i) {
        int digitA = (i < a.size()) ? a[a.size() - 1 - i] - '0' : 0;
        int digitB = (i < b.size()) ? b[b.size() - 1 - i] - '0' : 0;
        sum = digitA + digitB + carry;
        carry = sum / 2; // Calculate carry for the next iteration
        sum = sum % 2; // Get the last bit of the sum
        temp = sum + '0'; // Convert the sum to a character
        result.push_back(static_cast<char>(temp)); // Append the result to the string
    }

    if (carry) {
        result.push_back('1'); // If there's a carry left, append it to the result
    }
    reverse(result.begin(), result.end()); // Reverse the result to get the correct order
    return result; // Return the final result
}
```

### 详细解释

这个算法的核心思想是从两个字符串的最后一位开始，逐位相加，并处理进位。具体步骤如下：

1. **初始化变量**：
   - 设置 `carry` 为 `0`，表示初始进位为 `0`。
   - 设置 `sum` 为 `0`，用于存储当前位的和。
   - 计算两个字符串的最大长度 `length = max(a.size(), b.size())`。

2. **逐位相加**：
   - 从 `0` 到 `length - 1` 遍历，逐位相加。
   - 获取当前位的值 `digitA` 和 `digitB`，如果字符串长度不足，则补 `0`。
   - 计算当前位的和 `sum = digitA + digitB + carry`。
   - 计算进位 `carry = sum / 2`。
   - 计算当前位的值 `sum = sum % 2`。
   - 将当前位的值转换为字符并追加到结果字符串 `result` 中。

3. **处理最高位进位**：
   - 如果循环结束后 `carry` 仍为 `1`，说明需要在结果字符串的最前面插入一个 `1`。

4. **反转结果字符串**：
   - 由于是从最低位开始相加，结果字符串是逆序的，需要反转后返回。

5. **返回结果**：
   - 返回最终的结果字符串 `result`。

**示例说明**：
- 对于输入 `a = "11"`, `b = "1"`：
  - 初始时，`carry = 0`。
  - `i = 0`，`digitA = 1`, `digitB = 1`, `sum = 1 + 1 + 0 = 2`，`carry = 1`, `sum = 0`，`result = "0"`。
  - `i = 1`，`digitA = 1`, `digitB = 0`, `sum = 1 + 0 + 1 = 2`，`carry = 1`, `sum = 0`，`result = "00"`。
  - 循环结束后 `carry = 1`，`result = "001"`。
  - 反转后返回 `"100"`。

- 对于输入 `a = "1010"`, `b = "1011"`：
  - 初始时，`carry = 0`。
  - `i = 0`，`digitA = 0`, `digitB = 1`, `sum = 0 + 1 + 0 = 1`，`carry = 0`, `sum = 1`，`result = "1"`。
  - `i = 1`，`digitA = 1`, `digitB = 1`, `sum = 1 + 1 + 0 = 2`，`carry = 1`, `sum = 0`，`result = "01"`。
  - `i = 2`，`digitA = 0`, `digitB = 0`, `sum = 0 + 0 + 1 = 1`，`carry = 0`, `sum = 1`，`result = "101"`。
  - `i = 3`，`digitA = 1`, `digitB = 1`, `sum = 1 + 1 + 0 = 2`，`carry = 1`, `sum = 0`，`result = "0101"`。
  - 循环结束后 `carry = 1`，`result = "01011"`。
  - 反转后返回 `"10101"`。

### 解题思路

#### 我的思路

- **逐位相加**：
  - 从两个字符串的最后一位开始，逐位相加，并处理进位。
  - 如果当前位相加后没有进位，继续处理下一位。
- **处理最高位进位**：
  - 如果循环结束后仍有进位，在结果字符串的最前面插入一个 `1`。
- **反转结果字符串**：
  - 由于从最低位开始相加，结果字符串是逆序的，需要反转后返回。
- **时间复杂度**：
  - 时间复杂度为 `O(n)`，其中 `n` 是两个字符串的最大长度。
- **空间复杂度**：
  - 空间复杂度为 `O(n)`，用于存储结果字符串。

#### 标准解答

**思路**：
- **逐位相加**：
  - 从两个字符串的最后一位开始，逐位相加，并处理进位。
  - 使用一个 `while` 循环，直到两个字符串都处理完且没有进位。
- **处理最高位进位**：
  - 如果循环结束后仍有进位，在结果字符串的最前面插入一个 `1`。
- **时间复杂度**：
  - 时间复杂度为 `O(n)`。
- **空间复杂度**：
  - 空间复杂度为 `O(n)`。

#### 比较

- **时间复杂度**：
  - 我的答案和标准解答的时间复杂度均为 `O(n)`。
- **空间复杂度**：
  - 我的答案和标准解答的空间复杂度均为 `O(n)`。
- **无意义的比较**：
  - 我的答案中使用了 `reverse` 函数来反转结果字符串，而标准解答在逐位相加时直接将结果插入到字符串的前面，避免了额外的反转操作。

### 具体实现

#### 标准解答的实现

```cpp
string addBinary(string a, string b) {
    string ans;
    int carry = 0;
    int i = a.length() - 1, j = b.length() - 1;
    while (i >= 0 || j >= 0 || carry) {
        if (i >= 0) carry += a[i--] - '0';
        if (j >= 0) carry += b[j--] - '0';
        ans = to_string(carry % 2) + ans;
        carry /= 2;
    }
    return ans;
}
```

### 补充知识

#### 三目运算符

**三目运算符**：
- 三目运算符（`?:`）是一种简洁的条件表达式，可以用来替代简单的 `if-else` 语句。
- 语法：`condition ? expression1 : expression2`
  - 如果 `condition` 为真，执行 `expression1`，否则执行 `expression2`。
- 三目运算符可以增加代码的可读性，减少冗余代码。

**示例**：
- 在 `addBinary` 函数中，可以使用三目运算符来简化获取当前位值的代码：
  ```cpp
  int digitA = (i < a.size()) ? a[a.size() - 1 - i] - '0' : 0;
  int digitB = (i < b.size()) ? b[b.size() - 1 - i] - '0' : 0;
  ```

#### 字符串操作

**字符串操作**：
- 在 C++ 中，`string` 类提供了丰富的操作方法，如 `push_back`、`insert`、`reverse` 等。
- `push_back`：在字符串的末尾追加一个字符。
- `insert`：在字符串的指定位置插入一个字符或子串。
- `reverse`：反转字符串。

### 总结

通过逐位相加和处理进位的算法，我们可以在 `O(n)` 的时间复杂度内实现两个二进制字符串的加法操作。使用三目运算符可以简化代码，提高可读性。掌握这些技巧，可以帮助我们更好地设计和优化算法。