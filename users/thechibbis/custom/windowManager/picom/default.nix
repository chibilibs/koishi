{ pkgs, ... }:
{
  services.picom = {
    enable = true;
    extraArgs = [ "--experimental-backends" ];
    backend = "glx";
    opacityRules = [
      "90:class_g = 'kitty'"
    ];
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
      	"_GTK_FRAME_EXTENTS@:c"
      ];
      corner-radius = 7;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];
    };
  };
}