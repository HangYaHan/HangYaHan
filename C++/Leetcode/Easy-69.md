## 题目
x 的平方根
Category	Difficulty	Likes	Dislikes
algorithms	Easy (38.69%)	1643	-
Tags
Companies
给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。

 

示例 1：

输入：x = 4
输出：2
示例 2：

输入：x = 8
输出：2
解释：8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。
## 我的答案
int mySqrt(int x) {
        int left = 0;
        int right = x;
        int mid = 0;
        int result = 0;

        if (x == 0 || x == 1) {
            return x; // Return x if it is 0 or 1, as their square roots are themselves
        }

        while (left <= right) {
            mid = left + (right - left) / 2; // Calculate mid to avoid overflow
            if (mid <= x / mid) { // Check if mid^2 is less than or equal to x
                result = mid; // Update result if mid^2 is less than or equal to x
                left = mid + 1; // Move left pointer to search for a larger square root
            } else {
                right = mid - 1; // Move right pointer to search for a smaller square root
            }
        }


        return result;
    }
## 解题思路
对不适合二分的情况剪枝
（介绍一下我的思路）

标准答案
方法1:袖珍计算器（查对数表来获取计算结果）
例如根号x = e ^ 1/2 logx
由于计算误差，对于最后的结果要判断n，n+1哪个对

（比较一下我的答案和官方建议的答案，主要从时间复杂度和空间复杂度来说明，另外还要分析有没有进行无意义的比较）

## 具体实现

## 补充知识