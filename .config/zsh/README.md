Add the following line to /etc/zsh/zshenv
This will set the global option for a zsh shell to check the home dir for a .zshenv file

```bash
[ -f "$HOME/.config/zsh/.zshenv" ] && source "$HOME/.config/zsh/.zshenv"
