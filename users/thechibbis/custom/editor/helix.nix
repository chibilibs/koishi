{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        line-number = "absolute";
        idle-timeout = 300;
        bufferline = "multiple";
        color-modes = true;
      };
      editor.cursor-shape = {
        insert = "bar";
      };
      editor.statusline = {
        left = ["mode" "spacer" "spinner" "spacer" "diagnostics"];
        center = ["file-name"];
        right = ["selections" "position" "file-encoding" "file-line-ending" "file-type"];
        separator = "│";
        mode.normal = "NORMAL";
        mode.insert = "INSERT";
        mode.select = "SELECT";
      };
      editor.file-picker = {
        hidden = false;
      };
      editor.lsp = {
        display-messages = true;
      };
      editor.indent-guides = {
        render = true;
        character = "▏";
        skip-levels = 1;
      };
      keys.normal = {
        esc = ["collapse_selection" "keep_primary_selection"];
      };
    };
  };
}
