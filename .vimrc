" =============================================================================
" Vim 配置文件 - 适用于 C/C++ 和 Python 开发
" =============================================================================

" 基础设置
" -----------------------------------------------------------------------------
set nocompatible              " 关闭 vi 兼容模式
filetype off                  " 临时关闭文件类型检测

" 基本编辑器设置
set encoding=utf-8            " 使用 UTF-8 编码
set fileencoding=utf-8
set number                    " 显示行号
set relativenumber            " 显示相对行号
set cursorline               " 高亮当前行
set showcmd                  " 显示命令
set showmode                 " 显示模式
set wildmenu                 " 命令行补全增强
set wildmode=longest:full,full
set laststatus=2             " 始终显示状态栏
set ruler                    " 显示光标位置
set scrolloff=5              " 光标移动时保持5行缓冲
set sidescrolloff=5
set wrap                     " 自动换行
set linebreak                " 在单词边界处换行
set hidden                   " 允许隐藏修改过的缓冲区

" 搜索设置
set hlsearch                 " 高亮搜索结果
set incsearch                " 增量搜索
set ignorecase               " 搜索时忽略大小写
set smartcase                " 智能大小写（有大写字母时区分大小写）

" 缩进设置
set autoindent               " 自动缩进
set smartindent              " 智能缩进
set cindent                  " C 语言风格缩进
set tabstop=4                " Tab 宽度
set shiftwidth=4             " 缩进宽度
set softtabstop=4            " 软 Tab 宽度
set expandtab                " 使用空格代替 Tab
set backspace=indent,eol,start " 增强退格键功能

" 代码折叠
set foldmethod=syntax        " 基于语法折叠
set foldlevelstart=99        " 默认不折叠
set foldcolumn=1             " 显示折叠列

" 备份和撤销
set nobackup                 " 不创建备份文件
set nowritebackup
set noswapfile               " 不创建交换文件
set undofile                 " 持久化撤销
set undodir=~/.vim/undodir   " 撤销文件目录
if !isdirectory(&undodir)
    call mkdir(&undodir, "p", 0700)
endif

" 性能优化
set lazyredraw               " 执行宏时不重绘
set ttyfast                  " 快速终端连接
set updatetime=300           " 更快的更新时间

" 鼠标支持
set mouse=a                  " 启用鼠标

" 分割窗口
set splitbelow               " 水平分割时新窗口在下方
set splitright               " 垂直分割时新窗口在右侧

" =============================================================================
" 插件管理器 vim-plug 安装
" =============================================================================

" 自动安装 vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" =============================================================================
" 插件列表
" =============================================================================

call plug#begin('~/.vim/plugged')

" 主题和界面
Plug 'morhetz/gruvbox'                      " Gruvbox 主题
Plug 'vim-airline/vim-airline'              " 状态栏
Plug 'vim-airline/vim-airline-themes'       " 状态栏主题
Plug 'ryanoasis/vim-devicons'               " 文件图标
Plug 'Yggdroot/indentLine'                  " 缩进线

" 文件管理和导航
Plug 'preservim/nerdtree'                   " 文件树
Plug 'Xuyuanp/nerdtree-git-plugin'          " NERDTree Git 集成
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " 模糊查找
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'                    " 代码大纲

" Git 集成
Plug 'tpope/vim-fugitive'                   " Git 命令
Plug 'airblade/vim-gitgutter'               " Git 修改标记

" 代码补全和语言服务器
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " 智能补全和 LSP 支持

" C/C++ 支持
Plug 'octol/vim-cpp-enhanced-highlight'     " C++ 语法高亮增强
Plug 'vim-scripts/a.vim'                    " 头文件/源文件切换
Plug 'rhysd/vim-clang-format'               " Clang-format 集成

" Python 支持
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }  " Python IDE 功能
Plug 'psf/black', { 'for': 'python' }       " Python 代码格式化
Plug 'tell-k/vim-autopep8'                  " autopep8 集成

" 调试器
Plug 'puremourning/vimspector'              " 多语言调试器

" 代码注释
Plug 'preservim/nerdcommenter'              " 快速注释

" 括号和引号
Plug 'jiangmiao/auto-pairs'                 " 自动配对
Plug 'tpope/vim-surround'                   " 修改包围字符

" 代码片段
Plug 'honza/vim-snippets'                   " 代码片段集合

" 快速移动
Plug 'easymotion/vim-easymotion'            " 快速跳转

" 其他实用工具
Plug 'godlygeek/tabular'                    " 文本对齐
Plug 'plasticboy/vim-markdown'              " Markdown 支持
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

" =============================================================================
" 插件配置
" =============================================================================

" 主题配置
syntax enable
set background=dark
colorscheme gruvbox

" 透明背景（可选）
" hi Normal guibg=NONE ctermbg=NONE

" Airline 配置
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#coc#enabled = 1

" NERDTree 配置
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git$', '\.vscode$', '\.idea$']
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" 自动关闭 NERDTree（当它是最后一个窗口时）
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" FZF 配置
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" IndentLine 配置
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'markdown']

" Auto-pairs 配置（用于基本括号配对）
let g:AutoPairsMapBS = 1  " 使用退格键删除配对
let g:AutoPairsMapCR = 1  " 回车时自动缩进
let g:AutoPairsMapSpace = 0  " 禁用空格键的特殊映射

" 注意：coc-pairs 的尖括号配对已通过 coc-settings.json 配置
" C++ 文件中已禁用 '<' 的自动配对

" NERDCommenter 配置
let g:NERDSpaceDelims = 1            " 注释符号后加空格
let g:NERDCompactSexyComs = 1        " 使用紧凑的性感注释
let g:NERDDefaultAlign = 'left'      " 左对齐注释
let g:NERDCommentEmptyLines = 1      " 允许注释空行
let g:NERDTrimTrailingWhitespace = 1 " 删除注释时清理行尾空格
let g:NERDToggleCheckAllLines = 1    " 检查所有选中的行

" EasyMotion 配置
let g:EasyMotion_do_mapping = 0  " 禁用默认映射
let g:EasyMotion_smartcase = 1   " 智能大小写
let g:EasyMotion_startofline = 0 " 保持光标列位置
let g:EasyMotion_use_upper = 1   " 使用大写字母
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" =============================================================================
" CoC.nvim 配置（LSP 和智能补全）
" =============================================================================

" CoC 扩展列表
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-clangd',
    \ 'coc-cmake',
    \ 'coc-pyright',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-vimlsp'
    \ ]

" 使用 Tab 进行补全导航和代码片段
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 代码片段跳转
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" 使用回车确认补全
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <c-space> 触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo 代码导航
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 K 显示文档
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 高亮光标下的符号
autocmd CursorHold * silent call CocActionAsync('highlight')

" 符号重命名
nmap <leader>rn <Plug>(coc-rename)

" 格式化代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" =============================================================================
" C/C++ 特定配置
" =============================================================================

" C++ 语法高亮增强
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

" Clang-format 配置
let g:clang_format#style_options = {
            \ "BasedOnStyle": "Google",
            \ "IndentWidth": 4,
            \ "ColumnLimit": 100,
            \ "AllowShortFunctionsOnASingleLine": "Empty",
            \ "KeepEmptyLinesAtTheStartOfBlocks": "false"}

" 自动格式化 C/C++ 文件
autocmd FileType c,cpp nnoremap <buffer> <leader>cf :ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer> <leader>cf :ClangFormat<CR>

" =============================================================================
" Python 特定配置
" =============================================================================

" Python-mode 配置
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 100
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_rope = 0  " 使用 CoC 代替 rope
let g:pymode_virtualenv = 1  " 支持虚拟环境
let g:pymode_breakpoint = 1  " 支持断点
let g:pymode_breakpoint_bind = '<leader>db'  " 插入断点

" Black 配置
let g:black_linelength = 100
autocmd FileType python nnoremap <buffer> <leader>b :Black<CR>

" =============================================================================
" Vimspector 调试器配置
" =============================================================================

let g:vimspector_enable_mappings = 'HUMAN'

" 自定义调试快捷键
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :call vimspector#Reset()<CR>
nmap <leader>de :call vimspector#Eval()<CR>
nmap <leader>dw :call vimspector#Watch()<CR>
nmap <leader>do :call vimspector#ShowOutput()<CR>

" =============================================================================
" 自定义快捷键映射
" =============================================================================

" 设置 Leader 键为逗号（避免空格键延迟）
let mapleader = ","
let g:mapleader = ","

" -----------------------------------------------------------------------------
" 基础快捷键映射
" -----------------------------------------------------------------------------

" 快速退出插入模式
inoremap jj <Esc>

" 快速保存和退出
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-q> :q<CR>
nnoremap <C-x> :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>

" 切换到上一个文件
nnoremap <leader>` :e#<CR>

" -----------------------------------------------------------------------------
" 缓冲区和标签页操作
" -----------------------------------------------------------------------------

" 缓冲区导航
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bb :Buffers<CR>

" 标签页操作
nnoremap <leader>ta :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tp :tabprev<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
nnoremap <leader>t5 5gt

" -----------------------------------------------------------------------------
" 窗口管理
" -----------------------------------------------------------------------------

" 窗口导航
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 窗口分割
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sc :close<CR>
nnoremap <leader>so :only<CR>

" 窗口大小调整（使用方向键）
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>

" 窗口大小调整（使用 Leader 键）
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>> :vertical resize +5<CR>
nnoremap <leader>< :vertical resize -5<CR>

" -----------------------------------------------------------------------------
" 文件操作和搜索
" -----------------------------------------------------------------------------

" 文件树和大纲
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>o :TagbarToggle<CR>

" FZF 文件搜索
nnoremap <C-p> :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fl :Lines<CR>

" 清除搜索高亮
nnoremap <leader><CR> :nohlsearch<CR>

" 搜索和替换
" 搜索当前选中的文本
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" 在当前文件中替换
nnoremap <leader>sr :%s/
vnoremap <leader>sr :s/
" 搜索当前光标下的单词
nnoremap <leader>* :Rg <C-R><C-W><CR>

" -----------------------------------------------------------------------------
" 代码编辑
" -----------------------------------------------------------------------------

" 移动行
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" 复制到系统剪贴板
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" 快速访问寄存器
nnoremap <leader>r :reg<CR>
" 快速设置标记
nnoremap <leader>m :marks<CR>

" 选择全部
nnoremap <leader>sa ggVG

" 快速插入日期时间
nnoremap <leader>id "=strftime('%Y-%m-%d')<CR>P
nnoremap <leader>it "=strftime('%Y-%m-%d %H:%M:%S')<CR>P

" 代码折叠
nnoremap <leader>za za  " 切换折叠
nnoremap <leader>zc zc  " 关闭折叠
nnoremap <leader>zo zo  " 打开折叠
nnoremap <leader>zR zR  " 打开所有折叠
nnoremap <leader>zM zM  " 关闭所有折叠

" -----------------------------------------------------------------------------
" 快速移动 (EasyMotion)
" -----------------------------------------------------------------------------

" 使用两个 leader 键激活 EasyMotion，避免与其他快捷键冲突
" 双字符搜索跳转（最常用）
nmap <leader><leader>s <Plug>(easymotion-overwin-f2)

" 单字符搜索跳转
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>F <Plug>(easymotion-overwin-F)

" 行跳转
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)

" 词跳转
map <leader><leader>w <Plug>(easymotion-w)
map <leader><leader>W <Plug>(easymotion-W)
map <leader><leader>b <Plug>(easymotion-b)
map <leader><leader>B <Plug>(easymotion-B)
map <leader><leader>e <Plug>(easymotion-e)
map <leader><leader>E <Plug>(easymotion-E)

" 行首行尾跳转
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>L <Plug>(easymotion-overwin-line)

" 搜索跳转
map <leader><leader>/ <Plug>(easymotion-sn)
map <leader><leader>n <Plug>(easymotion-next)
map <leader><leader>N <Plug>(easymotion-prev)

" 快速跳转到任意位置（两次空格）
nmap <leader><leader> <Plug>(easymotion-overwin-f)

" -----------------------------------------------------------------------------
" Git 操作 (Fugitive)
" -----------------------------------------------------------------------------

" Git 状态
nnoremap <leader>gs :Git<CR>
" Git 提交
nnoremap <leader>gc :Git commit<CR>
" Git 推送
nnoremap <leader>gp :Git push<CR>
" Git 拉取
nnoremap <leader>gl :Git pull<CR>
" Git 日志
nnoremap <leader>gL :Git log<CR>
" Git 责任查看
nnoremap <leader>gb :Git blame<CR>
" Git 差异
nnoremap <leader>gd :Gdiffsplit<CR>

" -----------------------------------------------------------------------------
" Git 修改标记 (GitGutter)
" -----------------------------------------------------------------------------

" 跳转到下一个修改
nmap ]c <Plug>(GitGutterNextHunk)
" 跳转到上一个修改
nmap [c <Plug>(GitGutterPrevHunk)
" 预览修改
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
" 暂存修改
nmap <leader>hs <Plug>(GitGutterStageHunk)
" 撤销修改
nmap <leader>hu <Plug>(GitGutterUndoHunk)
" 切换修改高亮
nnoremap <leader>hh :GitGutterToggle<CR>

" -----------------------------------------------------------------------------
" 代码注释 (NERDCommenter)
" -----------------------------------------------------------------------------
" 设置注释
map <leader>cc <Plug>NERDCommenterComment
" 切换注释
map <leader>c<space> <Plug>NERDCommenterToggle
" 性感注释
map <leader>cs <Plug>NERDCommenterSexy
" 注释到行尾
map <leader>c$ <Plug>NERDCommenterToEOL
" 取消注释
map <leader>cu <Plug>NERDCommenterUncomment
" 最小注释
map <leader>cm <Plug>NERDCommenterMinimal
" 嵌套注释
map <leader>cn <Plug>NERDCommenterNested
" 对齐注释
map <leader>cl <Plug>NERDCommenterAlignLeft
map <leader>cb <Plug>NERDCommenterAlignBoth

" -----------------------------------------------------------------------------
" 文本对齐 (Tabular)
" -----------------------------------------------------------------------------

" 对齐等号
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
" 对齐冒号
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
" 对齐逗号
nnoremap <leader>a, :Tabularize /,\zs<CR>
vnoremap <leader>a, :Tabularize /,\zs<CR>
" 对齐管道符
nnoremap <leader>a<bar> :Tabularize /<bar><CR>
vnoremap <leader>a<bar> :Tabularize /<bar><CR>
" 自定义对齐
nnoremap <leader>a<space> :Tabularize /
vnoremap <leader>a<space> :Tabularize /

" -----------------------------------------------------------------------------
" 头文件/源文件切换 (a.vim)
" -----------------------------------------------------------------------------

" 在当前窗口切换
nnoremap <leader>as :A<CR>
" 在垂直分割窗口切换
nnoremap <leader>av :AV<CR>
" 在水平分割窗口切换
nnoremap <leader>ah :AS<CR>
" 在新标签页切换
nnoremap <leader>at :AT<CR>

" -----------------------------------------------------------------------------
" Python 格式化 (autopep8)
" -----------------------------------------------------------------------------

" 格式化整个文件
autocmd FileType python nnoremap <buffer> <leader>ap :Autopep8<CR>
" 格式化选中区域
autocmd FileType python vnoremap <buffer> <leader>ap :Autopep8<CR>

" -----------------------------------------------------------------------------
" Markdown 预览
" -----------------------------------------------------------------------------

" 启动/停止预览
nmap <leader>mp <Plug>MarkdownPreviewToggle
" 启动预览
nmap <leader>ms <Plug>MarkdownPreview
" 停止预览
nmap <leader>mx <Plug>MarkdownPreviewStop

" -----------------------------------------------------------------------------
" 包围字符操作 (vim-surround)
" -----------------------------------------------------------------------------

" vim-surround 使用默认映射：
" cs"' - 将双引号改为单引号
" cs'<q> - 将单引号改为 <q> 标签
" cst" - 将标签改为双引号
" ds" - 删除双引号
" ysiw] - 在单词周围添加方括号
" yss) - 在整行周围添加圆括号
" 在可视模式下，S + 字符可以添加包围

" -----------------------------------------------------------------------------
" 配置文件
" -----------------------------------------------------------------------------

" 快速编辑配置文件
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" =============================================================================
" 自动命令
" =============================================================================

" 自动去除行尾空格
autocmd BufWritePre * :%s/\s\+$//e

" 记住上次编辑位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 特定文件类型设置
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType cpp,c setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript,html,css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal wrap linebreak

" =============================================================================
" 状态栏自定义
" =============================================================================

" 显示当前模式
set showmode

" 自定义状态行（如果不使用 airline）
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]

" =============================================================================
" 其他设置
" =============================================================================

" 启用文件类型检测
filetype plugin indent on

" 启用语法高亮
syntax on

" 设置标签页
set showtabline=2

" 允许使用系统剪贴板
set clipboard=unnamedplus

" 设置补全选项
set completeopt=menuone,noselect,preview

" 禁用响铃
set noerrorbells
set visualbell
set t_vb=

" 加快键盘响应
set ttimeout
set ttimeoutlen=50
set timeoutlen=1000  " 映射序列超时时间（毫秒）

" =============================================================================
" 自定义函数
" =============================================================================

" 编译运行 C++ 程序
function! CompileRunCpp()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ -std=c++23 % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    endif
endfunction

" 快捷键编译运行
nnoremap <F5> :call CompileRunCpp()<CR>

" 运行 Python 程序
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python3 %<CR>

" =============================================================================
" 项目特定配置（可选）
" =============================================================================

" 读取项目本地配置
if filereadable(".vimrc.local")
    source .vimrc.local
endif

" =============================================================================
" 最后的初始化
" =============================================================================

" 确保所有插件都已加载
if exists('g:loaded_coc')
    " CoC 相关的最终配置
endif

" vim: set ft=vim :
