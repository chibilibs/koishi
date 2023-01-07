{ config, pkgs, ... }:
let
  ccStdenv = with pkgs.llvmPackages_14; [
    stdenv
    llvm
    clang
    pkgs.clang-tools
    libcxx
    libcxxabi
  ];
in
{
  # Packages that sould be installed to the user profile.
  home.packages = [
    pkgs.discord-canary
  
    # utils
    pkgs.ffmpeg
    pkgs.p7zip
    pkgs.mpv
    pkgs.obs-studio
    
    # note-taking
    pkgs.obsidian
    
    # Coding
    pkgs.vscode
    pkgs.jetbrains.idea-ultimate
    pkgs.nixpkgs-fmt
  
    # rust stuff
    pkgs.ripgrep
    pkgs.gnumake
    pkgs.rustup
    pkgs.trunk # rust + wasm == blazingly fast
        
    # lsp
    pkgs.rust-analyzer
    pkgs.jdt-language-server
    pkgs.nil

    # Java stuff
    pkgs.prismlauncher
    pkgs.jdk17
    pkgs.maven
    pkgs.gradle

    # Die python
    pkgs.python3

    # Xorg == Jorge
    pkgs.xclip
    
    # random stuff
    pkgs.neofetch
    pkgs.polybar
    pkgs.rofi
    pkgs.feh
    pkgs.imagemagick

    # Fonts | polybar-themes fonts dependencies
    pkgs.iosevka
    pkgs.noto-fonts
    pkgs.noto-fonts-extra
    pkgs.noto-fonts-emoji
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    pkgs.material-design-icons
    pkgs.terminus_font
    pkgs.fantasque-sans-mono
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "Hack" ]; })
  ] ++ ccStdenv;


  home.file.".fehbg".source = ./home/.fehbg;
  home.file.".wallpaper.jpg".source = ../../hosts/koishi/assets/wallpaper.jpg;
  home.file.".config/polybar".source = ./home/polybar;

  fonts.fontconfig.enable = true;
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "curses";
  };
  
  imports = [
    ./custom/editor/helix.nix
#    ./custom/editor/emacs
    ./custom/app/dev/git.nix
    ./custom/app/term/kitty.nix
    ./custom/app/web/firefox.nix
    ./custom/shell/zsh.nix
    ./custom/windowManager/i3
    ./custom/windowManager/dunst
    ./custom/windowManager/picom
  ];
}
