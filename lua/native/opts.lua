------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://neovim.io/doc/user/eval.html
--  2. https://neovim.io/doc/user/options.html
--  3. https://neovim.io/doc/user/lua-guide.html#lua-guide-variables
--  4. https://neovim.io/doc/user/lua-guide.html#lua-guide-options
--  5. https://alpha2phi.medium.com/neovim-for-beginners-managing-buffers-91367668ce7
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
local tool = require 'utils.tool'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- utf8 编码
vim.opt.encoding = "utf-8"
vim.bo.fileencoding = 'utf-8'

-- 剪切板设置
-- 
-- NOTE: 
--  1. 当 host 为 win11 的情况下，需要将 win32yank.exe 移动到 c/windows/system32/ 目录下才可用
--  2. 一个目前所找到的可备用的解决方案为：使用 xclip/xsel/wl-cliboard，并在 host 中开启 xserver
--  3. 由于 WSLG 已内置了 xserver，网上资料说似乎使用内置的即可，但是实际测试没有效果，这一点有待研究(因为 win32yank 偶尔会有问题)
--  4. 还有一个官方推荐的方案为粘贴时使用 powershell，但是实际体验下来会卡顿
--
-- REF:
--  1. https://neovim.io/doc/user/usr_09.html#_using-the-keyboard
--  2. https://github.com/neovim/neovim/issues/19204
--  3. https://stackoverflow.com/questions/68435130/wsl-clipboard-win32yank-in-init-lua
--  4. https://neovim.io/doc/user/provider.html#provider-clipboard
--  5. https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
vim.go.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "win32yank-win11-wsl2",
  copy = {
    ["+"] = 'win32yank.exe -i --crlf',
    ["*"] = 'win32yank.exe -i --crlf',
  },
  paste = {
    ["+"] = 'win32yank.exe -o --lf',
    ["*"] = 'win32yank.exe -o --lf',
  },
  cache_enabled = false,
}

-- 字符过长自动换行
vim.wo.wrap = true -- 当一行的字符过长时，超出行的字符将会被包裹并显示在下一行
vim.wo.breakindent = true -- 换行时自动对齐上一行的格式(可能会有性能损失)
vim.wo.breakindentopt = 'sbr' -- 设置换行符
vim.wo.showbreak = '➥►' -- 设置换行符
vim.go.display = 'lastline' -- '@@@' 放在最后一列上

-- 禁用鼠标模式
vim.go.mouse = nil

-- 侧边显示行号
vim.wo.number = true

-- 使用空格替代 <Tab>
vim.bo.expandtab = true

local tab_size = 1
if (tool.curpath_exist('project_w_server') or tool.curpath_exist('game301_server')) then
  tab_size = 4
elseif (vim.fn.expand('%:e') == 'go') then
  tab_size = 4
else
  tab_size = 4
end
-- 控制 <Tab> 缩进所代表的空格数
vim.bo.tabstop = tab_size
vim.bo.softtabstop = tab_size
-- 控制 shift 缩进所代表的空格数
vim.bo.shiftwidth = tab_size
vim.go.shiftround = true

-- 新行自动对齐上一行
vim.bo.autoindent = false
vim.bo.smartindent = true

-- 设置 24位 RGB 真彩颜色
vim.go.termguicolors = true

-- 允许光标移动到行的末端，即最后没有字符的位置
vim.go.virtualedit = 'onemore'

-- 高亮所在行
vim.wo.cursorline = true

-- 输入字符时隐藏鼠标(没效果)
vim.go.mousehide = true

-- 提示信息相关的设置
-- f  use "(3 of 5)" instead of "(file 3 of 5)"
-- i  use "[noeol]" instead of "[Incomplete last line]"
-- l  use "999L, 888B" instead of "999 lines, 888 bytes"
-- m	use "[+]" instead of "[Modified]"
-- n	use "[New]" instead of "[New File]"
-- r	use "[RO]" instead of "[readonly]"
-- w	use "[w]" instead of "written" for file write message	and "[a]" instead of "appended" for ':w >> file' command
-- x	use "[dos]" instead of "[dos format]", "[unix]" instead of "[unix format]" and "[mac]" instead of "[macformat]"
-- a	all of the above abbreviations
-- o	overwrite message for writing a file with subsequent message for reading a file (useful for ":wn" or when 'autowrite' on)
-- O	message for reading a file overwrites any previous message; also for quickfix message (e.g., ":cn")
-- s	don't give "search hit BOTTOM, continuing at TOP" or "search hit TOP, continuing at BOTTOM" messages; when using the search count do not show "W" after the count message (see S below)
-- t	truncate file message at the start if it is too long to fit on the command-line, "<" will appear in the left most column; ignored in Ex mode
-- T	truncate other messages in the middle if they are too long to fit on the command line; "..." will appear in the middle; ignored in Ex mode
-- W	don't give "written" or "[w]" when writing a file
-- A	don't give the "ATTENTION" message when an existing	swap file is found
-- I	don't give the intro message when starting Vim, see :intro
-- c	don't give ins-completion-menu messages; for example, "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found", "Back at original", etc.
-- C	don't give messages while scanning for ins-completion items, for instance "scanning tags"
-- q	use "recording" instead of "recording @a"
-- F	don't give the file info when editing a file, like :silent was used for the command
-- S	do not show search count message when searching, e.g.	"[1/5]"
vim.opt.shortmess = nil
vim.opt.shortmess = vim.opt.shortmess + 'o'
vim.opt.shortmess = vim.opt.shortmess + 'O'
vim.opt.shortmess = vim.opt.shortmess + 's'
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.shortmess = vim.opt.shortmess + 'F'

-- 不显示当前的输入模式(左下角)
vim.go.showmode = false

-- 不显示当前光标所在行号还有列号(右下角)
vim.go.ruler = false

-- 关闭状态行(最后一行)
vim.go.laststatus = 0

-- 不显示当前输入的命令(右下角)
vim.go.showcmd = false

-- 控制命令行的高度(最后一行)
vim.go.cmdheight = 1

-- 未保存当前buffer的时候就可以切换到其他buffer
vim.go.hidden = true

-- 分割窗口
vim.go.splitbelow = false
vim.go.splitright = false

-- 不创建备份文件
vim.go.backup = false
vim.go.writebackup = false

-- 创建swap文件，开启状态下可能会有性能问题，视情况修改
vim.bo.swapfile = true
vim.go.updatecount = 200 -- 当输入多少个字符后会刷新swap文件
vim.go.updatetime = 4000 -- 当多少毫秒未输入后会刷新swap文件

-- 改进搜索模式
--  1. 在输入 pattern 后可以立即开始搜索
--  2. 在还未输入 <CR> 的情况下可以通过 <C-g>/<C-t> 来过滤搜索内容
--  3. 当搜索到末尾时会出现报错提示而不是循环搜索
--  4. 当输入全小写的时候忽略大小写搜索，当存在一个大写的时候则使用全词匹配
vim.go.incsearch = true
vim.go.wrapscan = true
vim.go.ignorecase = false
vim.go.smartcase = true

-- 上下滚动时可看到的最小行数
vim.go.scrolloff = 0

-- 左右滚动时可看到的最好列数
vim.go.sidescrolloff = 0

-- 显示左侧图标指示列
vim.wo.signcolumn = 'yes:1'

-- 当文件被外部修改时则自动加载
vim.go.autoread = true

-- 快捷键连击等待时间
vim.go.timeoutlen = 500

-- 完成菜单相关的设置
-- menu      Use a popup menu to show the possible completions. The menu is only shown when there is more than one match and sufficient colors are available.  ins-completion-menu
-- menuone   Use the popup menu also when there is only one match. Useful when there is additional information about the match, e.g., what file it comes from.
-- longest   Only insert the longest common text of the matches. If the menu is displayed you can use CTRL-L to add more characters. Whether case is ignored depends on the kind of completion.  For buffer text the 'ignorecase' option is used.
-- preview   Show extra information about the currently selected completion in the preview window.  Only works in combination with "menu" or "menuone".
-- noinsert  Do not insert any text for a match until the user selects a match from the menu. Only works in combination with "menu" or "menuone". No effect if "longest" is present.
-- noselect  Do not select a match in the menu, force the user to select one from the menu. Only works in combination with "menu" or "menuone".
vim.opt.completeopt = vim.opt.completeopt + 'menu'
vim.opt.completeopt = vim.opt.completeopt + 'menuone'
vim.opt.completeopt = vim.opt.completeopt + 'noinsert' -- 等lsp那些配置完事儿了后测试下
vim.opt.completeopt = vim.opt.completeopt + 'preview'  -- 等lsp那些配置完事儿了后测试下
vim.opt.completeopt = vim.opt.completeopt + 'noselect'

-- 是否显示不可见字符，对于查看文件中是否有多余字符(tab 或 space)有帮助
vim.wo.list = true

-- 不可见字符的表示
-- vim.o.listchars = "space:·,tab:··"

-- 代码补全体验增强 
-- REF: https://neovim.io/doc/user/options.html#'wildmenu'
vim.go.wildmenu = true

-- 控制 tabline 显示行为
-- 0  never
-- 1  only if there are at least two tab pages
-- 2  always
vim.go.showtabline = 2

-- 设置字体
vim.go.guifont = 'FiraCode Nerd Font Mono'
------------------------------------------------------------------------------------------------