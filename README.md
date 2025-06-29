# Vim 配置使用指南

> 本指南基于您的 `.vimrc` 配置文件，提供完整的使用说明和最佳实践。

## 目录

1. [快速入门](#快速入门)
2. [基本概念](#基本概念)
3. [快捷键大全](#快捷键大全)
4. [插件指南](#插件指南)
5. [开发工作流](#开发工作流)
6. [常见问题](#常见问题)
7. [进阶技巧](#进阶技巧)

---

## 快速入门

### 🚀 最常用的 10 个快捷键

| 快捷键         | 功能         | 使用场景               |
| -------------- | ------------ | ---------------------- |
| `,` (逗号)     | Leader 键    | 所有自定义快捷键的前缀 |
| `jj`           | 退出插入模式 | 快速返回普通模式       |
| `Ctrl+s`       | 保存文件     | 随时保存工作           |
| `<leader>e`    | 文件树       | 浏览项目文件           |
| `Ctrl+p`       | 文件搜索     | 快速打开文件           |
| `<leader>fg`   | 全局搜索     | 搜索代码内容           |
| `gd`           | 跳转定义     | 查看函数/变量定义      |
| `K`            | 显示文档     | 查看函数说明           |
| `Ctrl+h/j/k/l` | 窗口导航     | 在分割窗口间移动       |
| `<leader>w`    | 保存文件     | 另一种保存方式         |

### 🎯 第一次使用

1. 打开 Vim 后，插件会自动安装（需要网络连接）
2. 等待插件安装完成（底部会有提示）
3. 重启 Vim 或执行 `:source ~/.vimrc` 或使用 `<leader>rv`
4. 执行 `:checkhealth` 检查环境（Neovim）

---

## 基本概念

### Leader 键

- **Leader 键设置为：`,` (逗号)**
- 所有 `<leader>` 开头的快捷键都需要先按逗号
- 例如：`<leader>w` = 先按逗号，再按 w
- **注意**：Leader 键已从空格改为逗号，避免输入延迟

### 模式说明

- **普通模式 (Normal)**：默认模式，用于导航和执行命令
- **插入模式 (Insert)**：输入文本，按 `i` 进入，按 `jj` 或 `Esc` 退出
- **可视模式 (Visual)**：选择文本，按 `v` 进入
- **命令模式 (Command)**：执行 Ex 命令，按 `:` 进入

### 窗口 vs 缓冲区 vs 标签页

- **缓冲区**：打开的文件在内存中的表示
- **窗口**：显示缓冲区内容的视口
- **标签页**：包含一组窗口的容器

---

## 快捷键大全

### 📝 文件操作

| 快捷键        | 功能           | 说明                   |
| ------------- | -------------- | ---------------------- |
| **保存/退出** |                |                        |
| `Ctrl+s`      | 保存           | 普通/插入模式均可用    |
| `<leader>w`   | 保存           | 仅普通模式             |
| `<leader>q`   | 退出           | 不保存退出             |
| `<leader>wq`  | 保存并退出     | 保存后退出             |
| `Ctrl+q`      | 快速退出       | 关闭窗口               |
| `Ctrl+x`      | 保存并退出     | 另一种方式             |
| **文件切换**  |                |                        |
| `<leader>｀`  | 切换上一个文件 | 在两个文件间快速切换   |
| `Ctrl+n`      | 下一个缓冲区   | 切换到下一个打开的文件 |
| `Ctrl+b`      | 上一个缓冲区   | 切换到上一个打开的文件 |

### 🔍 搜索和导航

| 快捷键       | 功能            | 说明                  |
| ------------ | --------------- | --------------------- |
| **文件搜索** |                 |                       |
| `Ctrl+p`     | 模糊搜索文件    | FZF 文件搜索          |
| `<leader>ff` | 搜索文件        | 同上                  |
| `<leader>fg` | 搜索内容        | 使用 ripgrep 全局搜索 |
| `<leader>fb` | 搜索缓冲区      | 在已打开文件中搜索    |
| `<leader>fh` | 搜索历史        | 最近打开的文件        |
| `<leader>ft` | 搜索标签        | ctags 标签搜索        |
| `<leader>fl` | 搜索行          | 在所有行中搜索        |
| **代码导航** |                 |                       |
| `gd`         | 跳转到定义      | LSP 功能              |
| `gy`         | 跳转到类型定义  | LSP 功能              |
| `gi`         | 跳转到实现      | LSP 功能              |
| `gr`         | 查找所有引用    | LSP 功能              |
| `K`          | 显示文档/帮助   | 悬浮窗显示            |
| **文件树**   |                 |                       |
| `<leader>e`  | 打开/关闭文件树 | NERDTree              |
| `<leader>o`  | 打开/关闭大纲   | Tagbar                |

### 🪟 窗口管理

| 快捷键        | 功能           | 说明           |
| ------------- | -------------- | -------------- |
| **窗口导航**  |                |                |
| `Ctrl+h`      | 焦点移到左窗口 | 快速切换       |
| `Ctrl+j`      | 焦点移到下窗口 | 快速切换       |
| `Ctrl+k`      | 焦点移到上窗口 | 快速切换       |
| `Ctrl+l`      | 焦点移到右窗口 | 快速切换       |
| **窗口操作**  |                |                |
| `<leader>sv`  | 垂直分割       | 左右分割       |
| `<leader>sh`  | 水平分割       | 上下分割       |
| `<leader>sc`  | 关闭窗口       | 关闭当前窗口   |
| `<leader>so`  | 只保留当前窗口 | 关闭其他窗口   |
| **调整大小**  |                |                |
| `Ctrl+←/→`    | 调整宽度       | 减小/增加 5 列 |
| `Ctrl+↑/↓`    | 调整高度       | 增加/减小 2 行 |
| `<leader>+/-` | 调整高度       | 增加/减小 5 行 |
| `<leader>>/<` | 调整宽度       | 增加/减小 5 列 |

### 📑 标签页和缓冲区

| 快捷键         | 功能           | 说明           |
| -------------- | -------------- | -------------- |
| **缓冲区**     |                |                |
| `<leader>bb`   | 缓冲区列表     | FZF 缓冲区选择 |
| `<leader>bn`   | 下一个缓冲区   | 向前切换       |
| `<leader>bp`   | 上一个缓冲区   | 向后切换       |
| `<leader>bd`   | 关闭缓冲区     | 关闭当前文件   |
| **标签页**     |                |                |
| `<leader>ta`   | 新建标签页     | 创建新标签     |
| `<leader>tc`   | 关闭标签页     | 关闭当前标签   |
| `<leader>to`   | 只保留当前标签 | 关闭其他标签   |
| `<leader>tn`   | 下一个标签页   | 向前切换       |
| `<leader>tp`   | 上一个标签页   | 向后切换       |
| `<leader>t1-5` | 切换到标签 1-5 | 快速跳转       |

### 💻 代码编辑

| 快捷键          | 功能              | 说明                           |
| --------------- | ----------------- | ------------------------------ |
| **智能补全**    |                   |                                |
| `Tab`           | 下一个补全项/跳转 | 补全菜单导航或代码片段参数跳转 |
| `Shift+Tab`     | 上一个补全项/跳转 | 补全菜单导航或代码片段参数跳转 |
| `Enter`         | 确认补全          | 接受建议                       |
| `Ctrl+Space`    | 触发补全          | 手动触发                       |
| **代码操作**    |                   |                                |
| `<leader>rn`    | 重命名符号        | LSP 重构                       |
| `<leader>f`     | 格式化代码        | 格式化选中区域                 |
| `<leader>cf`    | C++ 格式化        | clang-format                   |
| `<leader>b`     | Python 格式化     | Black                          |
| `<leader>ap`    | Python autopep8   | autopep8 格式化                |
| `<leader>db`    | Python 插入断点   | 插入 breakpoint()              |
| **移动和编辑**  |                   |                                |
| `<S-j>`/`<S-k>` | 移动行            | 上下移动当前行                 |
| `<leader>y`     | 复制到系统剪贴板  | 跨应用复制                     |
| `<leader>p`     | 从系统剪贴板粘贴  | 跨应用粘贴                     |
| `<leader>r`     | 查看寄存器        | 显示所有寄存器内容             |
| `<leader>m`     | 查看标记          | 显示所有标记                   |
| `<leader>sa`    | 选择全部          | 选中整个文件                   |
| `<leader>id`    | 插入日期          | 插入当前日期                   |
| `<leader>it`    | 插入时间          | 插入当前日期时间               |
| `<leader>za`    | 切换折叠          | 打开/关闭当前折叠              |
| `<leader>zc`    | 关闭折叠          | 关闭当前折叠                   |
| `<leader>zo`    | 打开折叠          | 打开当前折叠                   |
| `<leader>zR`    | 打开所有折叠      | 展开文件中所有折叠             |
| `<leader>zM`    | 关闭所有折叠      | 折叠文件中所有可折叠内容       |

### 🚀 快速移动 (EasyMotion)

| 快捷键              | 功能               | 说明                             |
| ------------------- | ------------------ | -------------------------------- |
| `<leader><leader>`  | 单字符跳转         | 输入一个字符，跳转到屏幕任意位置 |
| `<leader><leader>s` | 双字符跳转         | 输入两个字符进行精确跳转         |
| `<leader><leader>f` | 向前搜索字符       | 向前搜索并跳转                   |
| `<leader><leader>F` | 向后搜索字符       | 向后搜索并跳转                   |
| `<leader><leader>w` | 跳转到词首         | 向前跳转到单词开头               |
| `<leader><leader>W` | 跳转到词首(WORD)   | 向前跳转到 WORD 开头             |
| `<leader><leader>b` | 向后跳转词首       | 向后跳转到单词开头               |
| `<leader><leader>B` | 向后跳转词首(WORD) | 向后跳转到 WORD 开头             |
| `<leader><leader>e` | 跳转到词尾         | 向前跳转到单词结尾               |
| `<leader><leader>E` | 跳转到词尾(WORD)   | 向前跳转到 WORD 结尾             |
| `<leader><leader>j` | 向下跳转行         | 快速向下跳转到指定行             |
| `<leader><leader>k` | 向上跳转行         | 快速向上跳转到指定行             |
| `<leader><leader>L` | 跳转到任意行       | 显示所有行的标签                 |
| `<leader><leader>l` | 行内向前跳转       | 当前行内                         |
| `<leader><leader>h` | 行内向后跳转       | 当前行内                         |
| `<leader><leader>/` | 搜索跳转           | 输入搜索词后跳转                 |
| `<leader><leader>n` | 下一个匹配         | 跳转到下一个搜索匹配             |
| `<leader><leader>N` | 上一个匹配         | 跳转到上一个搜索匹配             |

### 🐛 调试功能

| 快捷键       | 功能       | 说明          |
| ------------ | ---------- | ------------- |
| `<leader>dd` | 启动调试   | Vimspector    |
| `<leader>dx` | 停止调试   | 重置调试器    |
| `<leader>de` | 求值表达式 | 查看变量值    |
| `<leader>dw` | 添加监视   | 监视变量      |
| `<leader>do` | 查看输出   | 调试输出      |
| `F5`         | 继续运行   | 调试时使用    |
| `F10`        | 单步跳过   | Step Over     |
| `F11`        | 单步进入   | Step Into     |
| `F12`        | 单步退出   | Step Out      |
| `F9`         | 切换断点   | 设置/取消断点 |

### ⚙️ 其他功能

| 快捷键         | 功能         | 说明            |
| -------------- | ------------ | --------------- |
| `<leader>ev`   | 编辑 vimrc   | 快速修改配置    |
| `<leader>rv`   | 重载 vimrc   | 应用新配置      |
| `<leader><CR>` | 清除搜索高亮 | 清除高亮        |
| `F5`           | 编译运行     | C++/Python 程序 |

### 🔍 文件/搜索/大纲

| 快捷键         | 功能         | 说明        |
| -------------- | ------------ | ----------- |
| `<leader>e`    | 文件树       | NERDTree    |
| `<leader>o`    | 代码大纲     | Tagbar      |
| `<leader>ff`   | 文件搜索     | FZF         |
| `<leader>fg`   | 全局搜索     | FZF Rg      |
| `<leader>fb`   | 缓冲区搜索   | FZF Buffers |
| `<leader>fh`   | 历史文件     | FZF History |
| `<leader>ft`   | 标签搜索     | FZF Tags    |
| `<leader>fl`   | 行搜索       | FZF Lines   |
| `<leader><CR>` | 清除搜索高亮 |             |
| `<leader>sr`   | 全文替换     | :%s/        |
| `<leader>*`    | 搜索当前词   | FZF Rg      |
| `//`           | 搜索选中文本 | 可视模式下  |

### 🚀 快速移动 (EasyMotion)

| 快捷键              | 功能               | 说明                             |
| ------------------- | ------------------ | -------------------------------- |
| `<leader><leader>`  | 单字符跳转         | 输入一个字符，跳转到屏幕任意位置 |
| `<leader><leader>s` | 双字符跳转         | 输入两个字符进行精确跳转         |
| `<leader><leader>f` | 向前搜索字符       | 向前搜索并跳转                   |
| `<leader><leader>F` | 向后搜索字符       | 向后搜索并跳转                   |
| `<leader><leader>w` | 跳转到词首         | 向前跳转到单词开头               |
| `<leader><leader>W` | 跳转到词首(WORD)   | 向前跳转到 WORD 开头             |
| `<leader><leader>b` | 向后跳转词首       | 向后跳转到单词开头               |
| `<leader><leader>B` | 向后跳转词首(WORD) | 向后跳转到 WORD 开头             |
| `<leader><leader>e` | 跳转到词尾         | 向前跳转到单词结尾               |
| `<leader><leader>E` | 跳转到词尾(WORD)   | 向前跳转到 WORD 结尾             |
| `<leader><leader>j` | 向下跳转行         | 快速向下跳转到指定行             |
| `<leader><leader>k` | 向上跳转行         | 快速向上跳转到指定行             |
| `<leader><leader>L` | 跳转到任意行       | 显示所有行的标签                 |
| `<leader><leader>l` | 行内向前跳转       | 当前行内                         |
| `<leader><leader>h` | 行内向后跳转       | 当前行内                         |
| `<leader><leader>/` | 搜索跳转           | 输入搜索词后跳转                 |
| `<leader><leader>n` | 下一个匹配         | 跳转到下一个搜索匹配             |
| `<leader><leader>N` | 上一个匹配         | 跳转到上一个搜索匹配             |

### 🐙 Git 操作 (Fugitive/GitGutter)

| 快捷键       | 功能         | 说明      |
| ------------ | ------------ | --------- |
| `<leader>gs` | Git 状态     | Fugitive  |
| `<leader>gc` | Git 提交     | Fugitive  |
| `<leader>gp` | Git 推送     | Fugitive  |
| `<leader>gl` | Git 拉取     | Fugitive  |
| `<leader>gL` | Git 日志     | Fugitive  |
| `<leader>gb` | Git 责任查看 | Fugitive  |
| `<leader>gd` | Git 差异     | Fugitive  |
| `]c`         | 下一个修改   | GitGutter |
| `[c`         | 上一个修改   | GitGutter |
| `<leader>hp` | 预览修改     | GitGutter |
| `<leader>hs` | 暂存修改     | GitGutter |
| `<leader>hu` | 撤销修改     | GitGutter |
| `<leader>hh` | 切换高亮     | GitGutter |

### 💬 代码注释 (NERDCommenter)

| 快捷键       | 功能       | 说明                 |
| ------------ | ---------- | -------------------- |
| `<leader>cc` | 切换注释   | 选中行注释/取消注释  |
| `<leader>cs` | 性感注释   | 多行注释格式         |
| `<leader>c$` | 注释到行尾 | 从光标位置注释到行尾 |
| `<leader>cu` | 取消注释   | 取消选中行的注释     |
| `<leader>cm` | 最小注释   | 使用最少的注释符号   |
| `<leader>cn` | 嵌套注释   | 使用嵌套注释         |
| `<leader>cl` | 左对齐注释 | 注释符左对齐         |
| `<leader>cb` | 两端对齐   | 注释符两端对齐       |

### 📐 文本对齐 (Tabular)

| 快捷键             | 功能       | 说明          |
| ------------------ | ---------- | ------------- |
| `<leader>a=`       | 对齐等号   | Tabularize /= |
| `<leader>a:`       | 对齐冒号   | Tabularize /: |
| `<leader>a,`       | 对齐逗号   | Tabularize /, |
| `<leader>a`        | 对齐管道符 | Tabularize /  |
| `<leader>a<space>` | 自定义对齐 | Tabularize /  |

### 🔄 头文件/源文件切换 (a.vim)

| 快捷键       | 功能         | 说明                   |
| ------------ | ------------ | ---------------------- |
| `<leader>as` | 当前窗口切换 | .h/.cpp 文件切换       |
| `<leader>av` | 垂直分割切换 | 新垂直窗口打开对应文件 |
| `<leader>ah` | 水平分割切换 | 新水平窗口打开对应文件 |
| `<leader>at` | 新标签页切换 | 新标签页打开对应文件   |

### ⚙️ 配置文件

| 快捷键       | 功能       | 说明         |
| ------------ | ---------- | ------------ |
| `<leader>ev` | 编辑 vimrc | 快速修改配置 |
| `<leader>rv` | 重载 vimrc | 应用新配置   |

---

## 插件指南

### 🎨 界面美化

- **Gruvbox**：暗色主题，护眼配色
- **Airline**：强大的状态栏，显示模式、文件、Git 状态等
- **IndentLine**：显示缩进线，便于查看代码层级
- **Devicons**：文件类型图标（需要 Nerd Font）

### 📁 文件管理

- **NERDTree**：

  - `?`：显示帮助
  - `o`：打开文件/目录
  - `s`：垂直分割打开
  - `i`：水平分割打开
  - `m`：显示菜单（创建/删除/移动文件）
  - `r`：刷新目录

- **FZF**：
  - `Ctrl+t`：在新标签页打开
  - `Ctrl+x`：水平分割打开
  - `Ctrl+v`：垂直分割打开
  - 输入时支持模糊匹配

### 🔧 代码功能

- **CoC.nvim**：

  - 提供 LSP 支持
  - 智能代码补全
  - 实时错误检查
  - 代码片段支持

- **Tagbar**：显示代码结构大纲
  - 支持多种语言
  - 快速跳转到函数/类

### 🐙 Git 集成

- **Fugitive**：

  - `:Git`：Git 状态
  - `:Gwrite`：Git add
  - `:Gcommit`：提交
  - `:Gpush`：推送
  - `:Gdiffsplit`：查看差异

- **GitGutter**：
  - 显示修改标记
  - `[c`/`]c`：跳转到上/下一个修改

### 🚀 快速移动

- **EasyMotion**：革命性的光标移动方式
  - **使用方法**：
    1. 按下触发键（如 `<leader><leader>w`）
    2. 屏幕上会显示字母标签
    3. 按下对应字母即可跳转
  - **优势**：
    - 减少按键次数
    - 精确跳转
    - 可视化导航
  - **常用场景**：
    - `<leader><leader>` + 字符：快速跳转到任意字符
    - `<leader><leader>s` + 两个字符：更精确的跳转
    - `<leader><leader>j/k`：快速上下移动多行

---

## 开发工作流

### C++ 开发流程

1. **创建项目结构**

   ```bash
   mkdir -p src include tests
   touch CMakeLists.txt
   ```

2. **编辑代码**

   - `<leader>e` 打开文件树
   - 使用 `.h`/`.cpp` 文件切换：`<leader>a`
   - `gd` 跳转到定义查看实现

3. **编写代码**

   - 使用 CoC 自动补全
   - `K` 查看函数文档
   - `<leader>cf` 格式化代码
   - **模板参数跳转**：
     - 选择 `std::map` 等模板后
     - 使用 `Tab` 跳到下一个参数位置
     - 使用 `Shift+Tab` 跳到上一个参数位置
   - **注意**：C++ 文件中 `<` 不会自动补全为 `<>`

4. **编译运行**

   - `F5` 快速编译运行
   - 或使用终端：`:!cmake . && make`

5. **调试**
   - 创建 `.vimspector.json` 配置
   - `<leader>dd` 启动调试
   - `F9` 设置断点

### Python 开发流程

1. **虚拟环境**

   ```vim
   :!python -m venv venv
   :!source venv/bin/activate
   ```

2. **编码**

   - 自动 PEP8 检查
   - `<leader>b` Black 格式化
   - `F5` 运行脚本

3. **调试**
   - 安装 debugpy：`:!pip install debugpy`
   - 配置 Vimspector
   - 使用调试快捷键

---

## 常见问题

### ❓ 插件没有自动安装？

```vim
:PlugInstall
```

### ❓ CoC 补全不工作？

1. 检查语言服务器：`:CocInfo`
2. 安装对应扩展：`:CocInstall coc-clangd`
3. 检查项目配置文件

### ❓ 图标显示为方块？

安装 Nerd Font：

```bash
# Ubuntu/Debian
sudo apt install fonts-nerd-font

# 或手动下载
https://www.nerdfonts.com/
```

### ❓ FZF 搜索很慢？

1. 添加 `.gitignore` 排除大文件
2. 使用 ripgrep 代替 grep
3. 限制搜索深度

### ❓ C++ 跳转定义不准确？

1. 生成 `compile_commands.json`：
   ```bash
   cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
   ```
2. 链接到项目根目录
3. 重启 CoC：`:CocRestart`

### ❓ C++ 模板相关问题？

1. **`<` 自动补全为 `<>`**：通过 `coc-settings.json` 配置，C++ 文件已禁用此功能
2. **模板参数跳转**：
   - 确保 `coc-snippets` 已安装：`:CocInstall coc-snippets`
   - 使用 `Tab`/`Shift+Tab` 在参数间跳转
   - 例如：`std::map<|key|<leader> |value|>` 中，`|` 表示跳转点

---

## 进阶技巧

### 🚀 效率提升

1. **快速替换**

   ```vim
   :%s/old/new/g  " 全文替换
   :s/old/new/g   " 当前行替换
   ```

2. **宏录制**

   - `qa`：开始录制到寄存器 a
   - 执行操作
   - `q`：停止录制
   - `@a`：执行宏
   - `10@a`：执行 10 次

3. **批量注释**

   - 可视模式选择多行
   - `<leader>cc`：注释
   - `<leader>cu`：取消注释

4. **多光标编辑**（需要额外插件）
   ```vim
   Plug 'mg979/vim-visual-multi'
   ```

### 🎯 自定义配置

1. **项目特定配置**
   创建 `.vimrc.local`：

   ```vim
   " 项目特定的设置
   set tabstop=2
   set shiftwidth=2
   ```

2. **自定义代码片段**
   编辑 `~/.config/coc/ultisnips/cpp.snippets`

3. **自定义快捷键**
   ```vim
   " 添加到 .vimrc
   nnoremap <leader>custom :echo "自定义命令"<CR>
   ```

### 🔧 性能优化

1. **大文件处理**

   ```vim
   " 对大文件禁用某些功能
   autocmd BufReadPre *.log set syntax=off
   ```

2. **启动优化**

   - 延迟加载插件
   - 使用 `--startuptime` 分析

3. **搜索优化**
   ```vim
   set ignorecase  " 忽略大小写
   set smartcase   " 智能大小写
   ```

---

## 快速参考卡片

### 🎯 最常用组合

- 打开文件：`<leader>e` → 导航 → `Enter`
- 搜索内容：`<leader>fg` → 输入关键词 → 选择文件
- 分屏编码：`<leader>sv` → `Ctrl+l` → 编辑
- 快速保存：编辑 → `Ctrl+s` → 继续编辑
- 代码跳转：光标放在符号上 → `gd` → `Ctrl+o` 返回
- 快速移动：`<leader><leader>` + 字符 → 按标签跳转

### 💡 记忆技巧

- **f** = find（查找）
- **w** = write（写入/保存）
- **q** = quit（退出）
- **s** = split（分割）
- **g** = go（跳转）
- **r** = rename/reload（重命名/重载）
- **b** = buffer（缓冲区）
- **t** = tab（标签页）

---

## 结语

这份配置追求在功能强大和易用性之间找到平衡。建议：

1. 先掌握基本快捷键（前 10 个）
2. 逐步学习文件导航和窗口管理
3. 最后探索高级功能和自定义

记住：**最好的配置是适合自己的配置**。根据需要调整，让 Vim 成为你的生产力工具！

---

_最后更新：基于您的 .vimrc 配置文件_
_如有问题，请检查 `:checkhealth` 和 `:messages`_
