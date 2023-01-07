{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    extraArgs = [ "--experimental-backends" ];
    backend = "glx";
    opacityRules = [
      "90:class_g = 'kitty'"
    ];
    shadow = true;
    settings = {
      blur = { 
          method = "dual_kawase";
          size = 7;
          deviation = 5.0;
      };
      blur-background-exclude = [
      	"window_type = 'desktop'"
      	"window_type = 'utility'"
        "class_g = 'slop'"
        "class_g     = 'maim'"
        "_GTK_FRAME_EXTENTS@:c"
      ];
      corner-radius = 10;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}