{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;
      startup = [
        { command = "bash ~/.config/polybar/launch.sh --blocks"; always = true; notification = false; }
        { command = "bash ~/.fehbg"; always = true; notification = false; }
        { command = "exec dunst"; always = true; notification = true; }
      ];
      terminal = "kitty";
      window.titlebar = false;
      gaps = {
        inner = 5;
        outer = 5;
      };
      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+s" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
      };
      bars = [
        {
         mode = "invisible"; 
        }
      ];
    };
  };
}