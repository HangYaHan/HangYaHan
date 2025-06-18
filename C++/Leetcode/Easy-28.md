### 题目描述

给定两个字符串 `haystack` 和 `needle`，请你在 `haystack` 字符串中找出 `needle` 字符串的第一个匹配项的下标（下标从 0 开始）。如果 `needle` 不是 `haystack` 的一部分，则返回 `-1`。

**示例**：

- 输入：`haystack = "sadbutsad"`, `needle = "sad"`
- 输出：`0`
- 解释：`"sad"` 在下标 `0` 和 `6` 处匹配。第一个匹配项的下标是 `0`，所以返回 `0`。

- 输入：`haystack = "leetcode"`, `needle = "leeto"`
- 输出：`-1`
- 解释：`"leeto"` 没有在 `"leetcode"` 中出现，所以返回 `-1`。

### 我的答案

```cpp
int strStr(string haystack, string needle) {
    int length = needle.length();

    if (length > haystack.length()) {
        return -1;
    }

    for (int i = 0; i <= haystack.length() - length; i++) {
        if (haystack.substr(i, length) == needle) {
            return i;
        }
    }
  
    return -1;
}
```

### 详细解释

这个算法的核心思想是遍历 `haystack`，检查每个可能的起始位置是否与 `needle` 匹配。具体步骤如下：

1. **计算长度**：
   - 首先计算 `needle` 的长度 `length`。

2. **剪枝**：
   - 如果 `needle` 的长度大于 `haystack` 的长度，直接返回 `-1`，因为 `needle` 不可能在 `haystack` 中出现。

3. **遍历检查**：
   - 使用 `for` 循环遍历 `haystack`，从 `0` 到 `haystack.length() - length`。
   - 每次循环检查 `haystack.substr(i, length)` 是否等于 `needle`。
   - 如果相等，返回当前索引 `i`。

4. **返回结果**：
   - 如果遍历结束后仍未找到匹配项，返回 `-1`。

**示例说明**：
- 对于输入 `haystack = "sadbutsad"`, `needle = "sad"`：
  - `length = 3`。
  - `i = 0`，`haystack.substr(0, 3) = "sad"`，等于 `needle`，返回 `0`。

- 对于输入 `haystack = "leetcode"`, `needle = "leeto"`：
  - `length = 5`。
  - `i = 0`，`haystack.substr(0, 5) = "leetc"`，不等于 `needle`。
  - `i = 1`，`haystack.substr(1, 5) = "eetc"`，不等于 `needle`。
  - `i = 2`，`haystack.substr(2, 5) = "etco"`，不等于 `needle`。
  - `i = 3`，`haystack.substr(3, 5) = "tcod"`，不等于 `needle`。
  - `i = 4`，`haystack.substr(4, 5) = "code"`，不等于 `needle`。
  - 返回 `-1`。

### 解题思路

#### 我的思路

- **遍历检查**：
  - 遍历 `haystack`，检查每个可能的起始位置是否与 `needle` 匹配。
  - 使用 `substr` 方法来获取子字符串进行比较。
- **时间复杂度**：
  - 时间复杂度为 `O(m * n)`，其中 `m` 是 `haystack` 的长度，`n` 是 `needle` 的长度。因为每次 `substr` 操作的时间复杂度为 `O(n)`。
- **空间复杂度**：
  - 空间复杂度为 `O(1)`，只使用了常数级别的额外空间。

#### 标准解答

**思路**：
- **暴力解法**：
  - 使用双指针法，一个指针 `fast` 遍历 `haystack`，另一个指针 `slow` 遍历 `needle`。
  - 当 `fast` 指针遇到与 `needle[0]` 相等的字符时，`fast` 和 `slow` 指针一起移动，比较后续字符。
  - 如果 `slow` 指针遍历完 `needle`，返回 `fast - slow`。
  - 如果 `fast` 指针遍历完 `haystack` 仍未找到匹配项，返回 `-1`。
- **KMP算法**：
  - 计算 `needle` 的 `next` 表，用于在匹配失败时跳过一些重复的计算。
  - 使用 `next` 表进行匹配，时间复杂度为 `O(m + n)`。

**时间复杂度**：
- **暴力解法**：时间复杂度为 `O(m * n)`。
- **KMP算法**：时间复杂度为 `O(m + n)`。

**空间复杂度**：
- **暴力解法**：空间复杂度为 `O(1)`。
- **KMP算法**：空间复杂度为 `O(n)`，用于存储 `next` 表。

#### 比较

- **时间复杂度**：
  - 我的答案的时间复杂度为 `O(m * n)`。
  - 标准解答中暴力解法的时间复杂度为 `O(m * n)`，KMP算法的时间复杂度为 `O(m + n)`。
- **空间复杂度**：
  - 我的答案的空间复杂度为 `O(1)`。
  - 标准解答中暴力解法的空间复杂度为 `O(1)`，KMP算法的空间复杂度为 `O(n)`。
- **无意义的比较**：
  - 我的答案在每次 `substr` 操作后需要进行完整的字符串比较，导致额外的比较操作。
  - 标准解答中暴力解法避免了这种额外的比较操作，但仍然需要逐字符比较。
  - 使用 KMP 算法可以进一步优化时间复杂度。

### 具体实现

#### 标准解答的实现

**暴力解法**：

```cpp
int strStr(string haystack, string needle) {
    int m = haystack.length();
    int n = needle.length();

    if (n == 0) return 0;
    if (n > m) return -1;

    for (int i = 0; i <= m - n; i++) {
        int j;
        for (j = 0; j < n; j++) {
            if (haystack[i + j] != needle[j]) {
                break;
            }
        }
        if (j == n) {
            return i;
        }
    }
    return -1;
}
```

**KMP算法**：

```cpp
vector<int> computeLPSArray(string needle) {
    int n = needle.length();
    vector<int> lps(n, 0);
    int len = 0;
    for (int i = 1; i < n; i++) {
        while (len > 0 && needle[i] != needle[len]) {
            len = lps[len - 1];
        }
        if (needle[i] == needle[len]) {
            len++;
            lps[i] = len;
        }
    }
    return lps;
}

int strStr(string haystack, string needle) {
    int m = haystack.length();
    int n = needle.length();

    if (n == 0) return 0;
    if (n > m) return -1;

    vector<int> lps = computeLPSArray(needle);
    int i = 0, j = 0;
    while (i < m) {
        if (haystack[i] == needle[j]) {
            i++;
            j++;
            if (j == n) {
                return i - j;
            }
        } else {
            if (j != 0) {
                j = lps[j - 1];
            } else {
                i++;
            }
        }
    }
    return -1;
}
```

### 补充知识

#### KMP算法

**KMP算法**（Knuth-Morris-Pratt算法）是一种用于字符串匹配的高效算法，其核心思想是通过预处理 `needle` 字符串，构建一个 `next` 表（也称为 `lps` 表，即 Longest Prefix Suffix），在匹配失败时跳过一些重复的计算，从而将时间复杂度优化到 `O(m + n)`。

**构建 `next` 表**：
- `next[i]` 表示 `needle[0..i]` 的最长前缀同时也是后缀的长度。
- 例如，`needle = "ABCDABD"`，`next` 表为 `[0, 0, 0, 0, 1, 2, 0]`。

**匹配过程**：
- 使用 `next` 表在匹配失败时跳过一些重复的计算。
- 例如，当匹配到 `haystack[i]` 和 `needle[j]` 时，如果 `haystack[i] != needle[j]`，则根据 `next[j - 1]` 的值调整 `j` 的位置，继续匹配。

**时间复杂度**：
- 构建 `next` 表的时间复杂度为 `O(n)`。
- 匹配过程的时间复杂度为 `O(m)`。
- 总时间复杂度为 `O(m + n)`。

**空间复杂度**：
- 空间复杂度为 `O(n)`，用于存储 `next` 表。

#### 不应使用库函数的调用

**原因**：
- 使用库函数（如 `substr`）虽然可以快速实现功能，但这会导致我们忽略了算法的核心思想和实现细节。
- 刷题的目的是为了提高算法设计和实现的能力，而不是简单地调用现成的函数。
- 通过手动实现算法，我们可以更深入地理解算法的原理和优化技巧，从而在面对复杂问题时能够灵活应用。

### 总结

通过暴力解法和 KMP 算法，我们可以在 `O(m * n)` 或 `O(m + n)` 的时间复杂度内找到字符串中第一个匹配项的下标。KMP 算法是一种高效的算法，适用于字符串匹配问题。掌握 KMP 算法的基本思想和实现方法，可以帮助我们更好地解决字符串匹配问题。