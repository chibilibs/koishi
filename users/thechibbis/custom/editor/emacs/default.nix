{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraPackages = (epkgs:
      (with epkgs; [
        doom-themes #
        doom-modeline #
        all-the-icons #
        use-package
        use-package-chords
        magit
        company
        direnv
        flycheck
        projectile
        evil #
        evil-collection #
        treemacs #
        treemacs-evil #
        treemacs-projectile #
        treemacs-all-the-icons #
        treemacs-magit #
        lsp-mode #
        lsp-treemacs #
        lsp-ui #
        nix-mode #
        rust-mode #
        ivy 
        ivy-rich
        counsel
        counsel-projectile
        which-key #
        general #
      ])
    );
  };

  home.file.".emacs.d" = {
    source = ./.emacs.d;
  };
}