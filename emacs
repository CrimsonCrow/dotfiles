;;; package --- Summary
;;; Commentary:
(require 'package)
;;; Code:
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))
;;(use-package try :ensure t)
;;(use-package which-key :ensure t :config (which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (lsp-ui company-c-headers yasnippet-classic-snippets company-lsp rg hydra ibuffer-projectile ivy ggtags auto-complete which-key smartparens yasnippet-snippets doom-modeline projectile all-the-icons evil neotree flycheck-irony flycheck-rtags company-irony-c-headers company-irony doom-themes rtags cmake-ide irony-eldoc flycheck company)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack Nerd Font" :foundry "SRC" :slant normal :weight normal :height 98 :width normal)))))

(require 'use-package)

(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode neotree-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "Turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'."
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)

;;(setq backup-directory-alist `(("." . "~/.emacs.d/saves/")))
;;(setq backup-by-copying t)
;;(setq delete-old-versions t
;;  kept-new-versions 6
;;  kept-old-versions 2
;;  version-control t)

(setq make-backup-files nil)

(require 'evil)
(evil-mode 1)

;; doom-themes
(use-package doom-themes
	     :config
	     ;; Global setting default
	     (setq doom-themes-enable-bold t
		   doom-themes-enable-italic t)
	     (load-theme 'doom-one t)

	     ;; Enable flashing mode-line-on errors
	     (doom-themes-visual-bell-config)
	     ;; Enable neotree
	     (doom-themes-neotree-config)
	     ;; Treemacs
	     (setq doom-themes-treemacs-theme "doom-colors")
	     (doom-themes-treemacs-config))

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq-default neo-show-hidden-files t)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(require 'doom-modeline)
(doom-modeline-mode 1)

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package hydra
:ensure t)

(use-package projectile
    :ensure t
    :bind (:map projectile-mode-map
                  ("s-p" . 'projectile-command-map)
                  ("C-c p" . 'projectile-command-map))
  
    :config
    (setq projectile-completion-system 'ivy)

    (projectile-mode +1))


(use-package ibuffer-projectile
  :ensure t
  :config
  (add-hook 'ibuffer-hook
	    (lambda ()
	    (ibuffer-projectile-set-filter-groups)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	    (ibuffer-do-sort-by-alphabetic)))))

;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
    :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	   (c-mode . lsp)
	   (c++-mode . lsp)
            ;; if you want which-key integration
            (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)

(use-package which-key
:ensure t
:config
(which-key-mode))

;; Auto completion
(use-package auto-complete
:ensure t
:init
(progn
(ac-config-default)
(global-auto-complete-mode t)
))

(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)

(global-company-mode t)
)

(use-package company-lsp
  :ensure t
  :config
(setq compnay-lsp-enable-snippet t)
 (push 'company-lsp company-backends)
)

(use-package company-irony
  :ensure t
  :config (add-to-list 'company-backends 'company-irony))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/9/")
  )

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package irony-eldoc
  :ensure t
  :config (add-hook 'irony-mode-hook #'irony-eldoc))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)
(use-package yasnippet-classic-snippets
  :ensure t)

;; tags for code navigation
(use-package ggtags
:ensure t
:config
(add-hook 'c-mode-common-hook
(lambda ()
(when (derived-mode-p 'c-mode 'c++-mode)
(ggtags-mode 1))))
)

(use-package rg
:ensure t
:config
(rg-enable-default-bindings)
(rg-enable-menu))

(require 'rtags)
(cmake-ide-setup)

;; custom functions

;; kill-other
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
;; init.el ends here
