fish_vi_key_bindings
# consider making it a function
abbr -a -g to_clipboard xclip -selection c
abbr -a -g from_clipboard xclip -selection c -o

# abbr -a -g dotfiles git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
abbr -a -g dtf git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
