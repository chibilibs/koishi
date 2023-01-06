(setq inhibit-startup-message t)

(setq
 globals--leader-key   "<SPC>"                    ;; Leader prefix key used for most bindings
 )

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 140)

(require 'use-package)

(use-package all-the-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-gruvbox") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)) 

(use-package general
  :ensure t
  :demand t
  :config
  (general-evil-setup t)
  (define-key evil-motion-state-map " " nil)
  (general-create-definer leader-def :prefix globals--leader-key)
  (leader-def
    :states 'normal
    ;; Misc
    "TAB" 'mode-line-other-buffer
    "." 'xref-find-definitions
    "," 'xref-pop-marker-stack
    "'" 'eshell
    "qq" 'evil-quit

    ;; Applications
    "a" '(:ignore t :which-key "applications")
    "au" 'undo-tree-visualize
    "aU" 'straight-pull-all
    "ac" 'cfw:open-org-calendar

    ;; Buffers
    "b" '(:ignore t :which-key "buffers")
    "bb" 'counsel-switch-buffer
    "bd" 'kill-this-buffer
    "bp" 'previous-buffer
    "bn" 'next-buffer
    "bN" 'evil-buffer-new
    "be" 'erase-buffer

    ;; Bookmarks
    "B" '(:ignore t :which-key "bookmarks")
    "BB" 'bookmark-jump
    "Bs" 'bookmark-set

    ;; Compiling
    "c" 'compile

    ;; Errors
    "e" '(:ignore t :which-key "errors")

    ;; Files
    "f" '(:ignore t :which-key "file")
    "ff" 'find-file
    "fs" 'save-buffer
    "fS" 'evil-write-all
    "fR" 'rename-file
    "fb" 'ranger-show-bookmarks
    "fP" 'open-config-file

    ;; Focus
    "F" '(:ignore t :which-key "focus")

    ;; LSP
    "l" '(:ignore t :which-key "language")

    ;; Projects
    "p" '(:ignore t :which-key "project")

    ;; Toggles
    "t" '(:ignore t :which-key "toggles")
    "tn" 'display-line-numbers-mode
    "tL" 'visual-line-mode
    "tu" 'lsp-ui-mode
    "ti" 'highlight-indent-guides-mode
    "tt" 'treemacs-

    ;; Themes
    "T" '(:ignore t :which-key "themes")

    ;; Windows
    "w" '(:ignore t :which-key "window")
    "wm" 'delete-other-windows
    "wf" 'delete-other-windows
    "wj" 'evil-window-down
    "wk" 'evil-window-up
    "wl" 'evil-window-right
    "wh" 'evil-window-left
    "ws" 'split-and-follow-horizontally
    "wv" 'split-and-follow-vertically
    "wd" 'evil-window-delete
    "wc" 'evil-window-delete
    "wH" 'evil-window-move-far-left
    "wL" 'evil-window-move-far-right
    "wK" 'evil-window-move-very-top
    "wJ" 'evil-window-move-very-bottom
    "w=" 'balance-windows

    ;; Help
    "h" '(:ignore t :which-key "help")
    "hk" 'describe-key
    "hv" 'describe-variable
    "hf" 'describe-function
    "hK" 'general-describe-keybindings
    )

(use-package treemacs
  :ensure t
  :custom
  (treemacs-no-png-images nil)
  (treemacs-width 35))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package which-key
  :defer 5
  :ensure t
  :config
  (which-key-mode))

 (use-package magit
  :ensure t
  :defer 3)

 (use-package projectile
  :ensure t
  :custom
  (projectile-enable-caching t)
  :config
  (projectile-mode))

  (use-package counsel-projectile
    :ensure t)

 (use-package company
  :defer 0.5
  :ensure t
  :delight
  :init (global-company-mode)
  :custom
  (company-begin-commands '(self-insert-command))
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.1)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  :config
  (add-to-list 'company-backends
               '(company-yasnippet
                 company-files
                 company-keywords
                 company-capf
                 company-dabbrev
                 company-dabbrev-code)))

 (use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

 (use-package rust-mode
  :ensure t)

 (use-package nix-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (rust-mode       . lsp-deferred)
	    (nix-mode        . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-enable-completion-at-point t))

  (use-package lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-flycheck-live-reporting t)
  (lsp-ui-sideline-toggle-symbols-info t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-peek-enable t))
