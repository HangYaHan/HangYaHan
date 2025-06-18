## Easy

---

### Leetcode 14

你的代码在处理最长公共前缀时存在逻辑错误。具体来说，代码在比较字符串前缀时使用了 `substr` 方法，这会导致在某些情况下返回错误的结果。特别是，当 `i` 为 0 时，`substr(0, i)` 返回空字符串，这会导致错误的比较结果。

此外，代码在比较前缀时没有考虑到字符串长度的边界情况。

以下是修正后的代码：

```cpp
class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        if (strs.empty()) return "";
        
        std::string result;
        for (int i = 0; i < strs[0].size(); i++) {
            char c = strs[0][i];
            for (int j = 1; j < strs.size(); j++) {
                if (i >= strs[j].size() || strs[j][i] != c) {
                    return result;
                }
            }
            result += c;
        }
        return result;
    }
};
```

修正后的代码逻辑如下：
1. 首先检查输入的字符串数组是否为空，如果为空则返回空字符串。
2. 遍历第一个字符串的每个字符。
3. 对于每个字符，检查其他字符串在相同位置上的字符是否相同，或者是否已经到达字符串的末尾。
4. 如果发现字符不匹配或者到达字符串末尾，则返回当前的结果。
5. 如果所有字符串在当前字符位置上都匹配，则将该字符添加到结果中。

这样可以正确处理所有边界情况，并确保返回正确的最长公共前缀。

---

### Leetcode 20

你的代码在处理括号匹配时存在一些问题，特别是对空栈的处理不当。具体来说，当栈为空时，代码尝试访问栈顶元素 `stack.top()`，这会导致段错误（Segmentation Fault）。

以下是修正后的代码：

```cpp
class Solution {
public:
    bool isValid(string s) {
        std::stack<char> stack;
        for (int i = 0; i < s.size(); i++) {
            char c = s[i];
            if (c == '(' || c == '[' || c == '{') {
                stack.push(c);
            } else {
                if (stack.empty()) {
                    return false;
                }
                char top = stack.top();
                if ((top == '(' && c == ')') ||
                    (top == '[' && c == ']') ||
                    (top == '{' && c == '}')) {
                    stack.pop();
                } else {
                    return false;
                }
            }
        }
        return stack.empty();
    }
};
```

修正后的代码逻辑如下：
1. 遍历输入字符串 `s` 的每个字符。
2. 如果字符是左括号 `(`、`[` 或 `{`，则将其压入栈中。
3. 如果字符是右括号 `)`、`]` 或 `}`，则检查栈是否为空：
   - 如果栈为空，说明没有匹配的左括号，返回 `false`。
   - 如果栈不为空，检查栈顶元素是否与当前右括号匹配：
     - 如果匹配，则弹出栈顶元素。
     - 如果不匹配，返回 `false`。
4. 最后，检查栈是否为空。如果栈为空，说明所有括号都匹配，返回 `true`；否则返回 `false`。

这样可以正确处理所有括号匹配的情况，并避免段错误。

---

### Leetcode 168 && 171
对于字符串和整数之间的处理，可以更多的考虑它的ASCII码，而不是创建一个unordered_map

### Leetcode
空链表！！！
链表要正确的连接起来

### Leetcode 26
空指针！！！
尤其是双指针的时候

### Leetcode 69
mid = left + (right - left) / 2;