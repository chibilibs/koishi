{
  programs.zsh = {
    enable = true;
    initExtra = "[ '$TTY' = '/dev/tty1' ] && startx /usr/bin/env i3";
    profileExtra = ". '$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh'";
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}