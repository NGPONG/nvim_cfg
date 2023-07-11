--local logger = require('utils.log')
--
--local p_in, p_out, p_err
--
--p_in  = vim.loop.new_pipe(false)
--p_out = vim.loop.new_pipe(false)
--p_err = vim.loop.new_pipe(false)
--
--local handle, pid = vim.loop.spawn('git', {
--  args = { "-P", "-c", "gc.auto=0", "log", "--pretty=format:%x00%n%H %P%n%an%n%ad%n%ar%n  %D%n  %s", "--date=raw", "--name-status", "-n256", "--diff-merges=first-parent", "--" },
--  stdio = { p_in, p_out, p_err },
--  cwd = "/home/ngpong/code",
--  env = { "HOSTTYPE=x86_64", "NAME=HOME", "WSL_INTEROP=/run/WSL/14_interop", "XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir", "LESSCLOSE=/usr/bin/lesspipe %s %s", "BASH_ENV=", "MYVIMRC=/home/ngpong/.config/nvim/init.lua", "LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:", "WSL2_IP=192.168.202.64", "VIM=/usr/share/nvim", "OLDPWD=/home/ngpong", "NVIM_LOG_FILE=/home/ngpong/.local/state/nvim/log", "VIMRUNTIME=/usr/share/nvim/runtime", "ALL_PROXY=socks5://192.168.1.2:7890", "ZSH=/home/ngpong/.oh-my-zsh", "LSCOLORS=Gxfxcxdxbxegedabagacad", "WSLENV=WT_SESSION:BASH_ENV/u:WT_PROFILE_ID", "HOST_IP=192.168.1.2", "GO111MODULE=", "HTTPS_PROXY=http://192.168.1.2:7890", "HTTP_PROXY=http://192.168.1.2:7890", "SOCKS5_ADDR=socks5://192.168.1.2:7890", "DISPLAY=:0", "GOROOT=/usr/local/go", "LESS=-R", "EDITOR=nvim", "GOPATH=/home/ngpong/go", "http_proxy=http://192.168.1.2:7890", "GIT_EDITOR=nvim", "PWD=/home/ngpong/code", "PAGER=less", "USER=ngpong", "VISUAL=nvim", "TERM=xterm-256color", "win_home=/mnt/c/Users/NGPONG/Desktop/", "WSL_DISTRO_NAME=Ubuntu-22.04", "HTTP_ADDR=http://192.168.1.2:7890", "HOME=/home/ngpong", "https_proxy=http://192.168.1.2:7890", "LESSOPEN=| /usr/bin/lesspipe %s", "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Windows/:/mnt/c/Windows/system32:/mnt/c/WINDOWS/:/mnt/c/WINDOWS/system32:/mnt/c/Users/NGPONG/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/windows/System32/WindowsPowerShell/v1.0:/mnt/c/Program Files/Neovide/:/usr/local/go/bin:/home/ngpong/go/bin:/home/ngpong/.local/bin", "_=/usr/bin/nvim", "WT_PROFILE_ID={d7b20cea-47a9-518c-95a4-c8bd91e2e1c6}", "PULSE_SERVER=unix:/mnt/wslg/PulseServer", "WAYLAND_DISPLAY=wayland-0", "WSL2_GUI_APPS_ENABLED=1", "WT_SESSION=164e9e9c-2ead-46b6-8f52-2c4eb5b0409c", "LOGNAME=ngpong", "LANG=C.UTF-8", "SHLVL=1", "all_proxy=socks5://192.168.1.2:7890", "SHELL=/usr/bin/zsh" },
--  hide = true,
--})
--
--logger.info(handle)
--logger.info(pid)
--
--p_out:read_start(function(err, chunk)
--  logger.info(chunk)
--end)

local org = {
  field_1 = 1,
  field_2 = { field_2_1 = 1 },
  field_3 = 3211,
  org_field_1 = 'NGPONG',
  field_4 = {
    field_4_1 = -1,
    field_4_2 = false,
    field_4_3 = {
      field_4_3_1 = 'ok',
      field_4_3_2 = 0,
      field_4_3_4 = {
        field_4_3_4 = 'just test test'
      }
    },
  },
  org_field_2 = true,
}
local tb = {
  field_1 = 2,
  field_3 = true,
  field_2 = { field_2_1 = 10, field_2_2 = 321 },
  tb_field_1 = 'hahahhaha',
  tb_field_2 = 1024,
  field_4 = {
    field_4_2 = true,
    field_4_3 = {
      field_4_3_1 = 'not ok',
      field_4_3_2 = 10000,
      field_4_3_3 = {
        field_4_3_3_1 = 'sbsbsbsb',
        field_4_3_3_2 = 'NGPONG niu bi !'
      },
    },
  },
}

require('utils.tool').tbl_r_extend(org, tb)

require('utils.log').info(org)