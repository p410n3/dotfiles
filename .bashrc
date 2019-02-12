 force_color_prompt=yes
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[$

 export LS_OPTIONS='--color=auto'
 eval "`dircolors`"
 alias ls='ls $LS_OPTIONS'
 alias ll='ls $LS_OPTIONS -l'
 alias l='ls $LS_OPTIONS -lA'

 Some more alias to avoid making mistakes:
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
