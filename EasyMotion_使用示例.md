# EasyMotion 快速移动指南

## 🎯 什么是 EasyMotion？

EasyMotion 提供了一种革命性的 Vim 光标移动方式。它通过显示跳转标签，让你可以用最少的按键次数跳转到屏幕上的任意位置。

## 🚀 基本使用流程

1. **触发 EasyMotion**：按下快捷键（如 `,,w`）
2. **查看标签**：目标位置会显示字母标签（A, B, C...）
3. **跳转**：按下对应的字母，光标立即跳转

## 📋 常用快捷键示例

### 1. 快速跳转到任意字符

```
操作：,, 然后输入 f
效果：屏幕上所有 'f' 字符的位置都会显示标签
```

### 2. 双字符精确跳转

```
操作：,,s 然后输入 th
效果：屏幕上所有 'th' 组合的位置都会显示标签
适用：当单字符重复太多时使用
```

### 3. 快速跳转到单词

```
操作：,,w
效果：所有单词开头显示标签，向前跳转

操作：,,b
效果：所有单词开头显示标签，向后跳转
```

### 4. 行间快速移动

```
操作：,,j
效果：下方的行显示标签

操作：,,k
效果：上方的行显示标签
```

## 💡 实际应用场景

### 场景 1：编辑函数参数

```cpp
void processData(int id, string name, double value, bool active) {
    // 需要修改 value 参数
}
```

**操作**：`,,` → 输入 `v` → 按标签字母 → 直接跳转到 value

### 场景 2：快速定位错误行

```python
def calculate_total():
    items = get_items()
    total = 0
    for item in items:  # 假设这里有错误
        total += item.price
    return total
```

**操作**：`,,j` → 看到第 4 行的标签 → 按对应字母跳转

### 场景 3：在长行中精确定位

```javascript
const result = data
  .filter((item) => item.status === "active")
  .map((item) => item.value)
  .reduce((a, b) => a + b, 0);
```

**操作**：`,,s` → 输入 `ma` → 跳转到 map 位置

## 🎨 视觉效果

当你触发 EasyMotion 后，屏幕会变成类似这样：

```
原文：
The quick brown fox jumps over the lazy dog

触发 ,, 输入 o 后：
The quick brAwn fBx jumps Cver the lazy dDg
           ^     ^        ^              ^
           A     B        C              D
```

按 `C` 键，光标就会跳转到 "over" 的 'o'。

## ⚡ 高级技巧

### 1. 跨窗口跳转

使用 `overwin` 模式的命令可以跨越分割窗口：

- `,,` - 跨窗口字符跳转
- `,,L` - 跨窗口行跳转

### 2. 搜索后跳转

```
操作：,,/ → 输入搜索词 → Enter → 显示所有匹配的标签
```

### 3. 组合使用

1. 先用 `,,j` 跳到大概的行
2. 再用 `,,w` 跳到具体的词
3. 最后用普通移动微调

## 🔧 自定义配置

如果想调整标签字母（比如使用小写字母）：

```vim
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj;'
```

如果想改变高亮颜色，可以在 `.vimrc` 中添加：

```vim
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=gray
```

## 📝 记忆口诀

- **双击逗号**（`,,`）= 开启跳转模式
- **s** = search（搜索两个字符）
- **w** = word（单词跳转）
- **j/k** = 上下行跳转（同 Vim 默认）
- **/** = 搜索跳转

## ✅ 最佳实践

1. **最常用**：`,,` 和 `,,s`
2. **长距离移动**：使用 `,,j/k`
3. **精确定位**：使用双字符搜索 `,,s`
4. **跨文件搜索定位**：先用 `/` 搜索，再用 `,,n/N` 跳转

记住：EasyMotion 的目标是让你用最少的按键次数到达目标位置！
