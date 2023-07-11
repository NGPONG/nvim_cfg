------------------------------------------------------------------------------------------------
-- TUTORIAL:
--  1. https://neovim.io/doc/user/motion.html
--  2. http://neovim.io/doc/user/quickref.html
--  3. https://neovim.io/doc/user/lua.html
--  4. https://neovim.io/doc/user/api.html
--  5. http://neovim.io/doc/user/insert.html
--  6. https://neovim.io/doc/user/change.html
--  7. https://neovim.io/doc/user/intro.html
--  8. https://neovim.io/doc/user/builtin.html
--  9. https://neovim.io/doc/user/windows.html
-- 10. http://neovim.io/doc/user/scroll.html
-- 11. https://alpha2phi.medium.com/neovim-for-beginners-managing-buffers-91367668ce7
-- 12. https://neovim.io/doc/user/tabpage.html
-- 13. https://neovim.io/doc/user/pattern.html
-- 14. http://neovim.io/doc/user/repeat.html#complex-repeat
-- 15. https://neovim.io/doc/user/map.html#%3Amap-arguments
-- 16. https://neovim.io/doc/user/vimindex.html
-- 17. https://stackoverflow.com/questions/73841647/in-neovim-vim-how-to-know-all-used-key-combination
-- 18. https://neovim.io/doc/user/usr_24.html#24.7
-- 19. https://neovim.io/doc/user/map.html#abbreviations
-- 20. https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
-- 21. https://stackoverflow.com/questions/1506764/how-to-map-ctrla-and-ctrlshifta-differently

-- keys:
--  <q>         N***   将光标移动到下一个单词
--  <w>         N***   将光标移动到上一个单词
--  <a>         N***   进入插入模式
--  <v>         N***   进入visual模式
--  <r>         N***   进入replace模式
--  <ESC>       NIVR   退出当前模式
--  <y>         N*V*   拷贝当前光标所在字符到 +/* 寄存器当中
--  <p>         N*V*   从 +/* 寄存器当中粘贴字符当前光标所在位置
--  <gg>        N*V*   光标跳转至文件的首行
--  <G>         N*V*   光标跳转至文件的末行
--  </>         N***   设置 last search pattern
--  <n>         N***   向下索引 pattern 匹配的字符
--  <N>         N***   向上索引 pattern 匹配的字符
--  <oh>        N***   清空 last search pattern
--  <HOME>      N***   光标跳转到行首
--  <END>       N***   光标跳转到行尾
--  <S-UP>      N***   保持当前光标相对位置不动的情况下向上移动
--  <S-DOWN>    N***   保持当前光标相对位置不动的情况下向下移动
--  <sv>        N***   水平分割窗口
--  <sh>        N***   垂直分割窗口
--  <sc>        N***   关闭当前所激活的窗口
--  <so>        N***   关闭非当前所激活的所有窗口
--  <s;>        N***   调整水平分割窗口的高度+5
--  <s\>        N***   调整水平分割窗口的高度-5
--  <sk>        N***   调整垂直分割窗口的高度+5
--  <sl>        N***   调整垂直分割窗口的高度-5
--  <A-UP>      N***   向上切换窗口
--  <A-DOWN>    N***   向下切换窗口
--  <A-LEFT>    N***   向左切换窗口
--  <A-RIGHT>   N***   向右切换窗口
--  <ts>        N***   在tabline中创建新窗口
--  <tc>        N***   关闭tabline中的窗口
--  <tn>        N***   切换tabline中的窗口
--  <tp>        N***   切换tabline中的窗口
--  <to>        N***   关闭非当前所激活的所有tabline窗口
--  <d>         N*V*   剪切一个字符或选中的内容
--  <D>         N***   剪切一整行
--  <x>         N*V*   删除一个字符或选中的内容
--  <X>         N***   删除一整行
--  <c>         N*V*   修改一个字符或选中的内容
--  <C>         N***   修改一整行
--  <u>         N***   恢复上一次的修改

-- commands:
--  :>                 右边使用 <tab>
--  :<                 左边使用 <tab>
--  :ls                查看当前所有的 buffers
--  :lua               执行 lua 代码
--  :reg               查看寄存器
--  :w                 保存当前 buffer
--  :wq                保存当前 buffer 并退出 neovim
--  :help key-codes    查看按键的编码
--  :mod[e]            重绘窗口
--  :redr[aw]          重绘窗口
------------------------------------------------------------------------------------------------

local M = {}

------------------------------------------------------------------------------------------------
local tools = require 'utils.tool'
local logger = require 'utils.log'
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Mode           | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

M.Mode = tools.enum({
  ALL = '',
  NORMAL = 'n',
  VISUAL = 'v',
  INSERT = 'i',
  COMMAND = 'c'
})
------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
function M.keymap(mode, lhs, rhs, opts)
  local final_opts = {
    remap = true,
    silent = true,
  }

  tools.tbl_r_extend(final_opts, opts or {})

  vim.keymap.set(mode, lhs, rhs, final_opts)
end
------------------------------------------------------------------------------------------------

return M