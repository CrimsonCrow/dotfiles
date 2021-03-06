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
 '(flycheck-c/c++-clang-executable "/usr/bin/clang++-10")
 '(flycheck-c/c++-gcc-executable "/usr/bin/g++-10")
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (selected persp-mode perspective eshell-git-prompt fish-completion exec-path-from-shell multiple-cursors flycheck-clangcheck company-c-headers yasnippet-classic-snippets company-lsp rg hydra ibuffer-projectile ivy ggtags auto-complete which-key smartparens yasnippet-snippets doom-modeline projectile all-the-icons evil neotree flycheck-irony flycheck-rtags company-irony-c-headers company-irony doom-themes rtags cmake-ide irony-eldoc flycheck company)))
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
  (doom-themes-neotree-config))

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

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("magit" (mode . magit-mode))
               ("IRC" (or (mode . circe-channel-mode) (mode . circe-server-mode)))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("mu4e" (or

                        (mode . mu4e-compose-mode)
                        (name . "\*mu4e\*")
                        ))
               ("programming" (or
                               (mode . clojure-mode)
                               (mode . clojurescript-mode)
                               (mode . python-mode)
                               (mode . c++-mode)))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "default")))

;; don't show these
                                        ;(add-to-list 'ibuffer-never-show-predicates "zowie")
;; Don't show filter groups if there are no buffers in that group
(setq ibuffer-show-empty-filter-groups nil)

;; Don't ask for confirmation to delete marked buffers
(setq ibuffer-expert t)

(use-package ibuffer-projectile
  :ensure t
  :config
  (add-hook 'ibuffer-hook
	    (lambda ()
	    (ibuffer-projectile-set-filter-groups)
	    (unless (eq ibuffer-sorting-mode 'alphabetic)
	    (ibuffer-do-sort-by-alphabetic)))))

(use-package ace-window
  :ensure t
  :config
  (setq aw-scope 'frame) ;; was global
  (global-set-key (kbd "C-x O") 'other-frame)
  (global-set-key [remap other-window] 'ace-window))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Auto completion
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)

  (global-company-mode t))

(use-package company-lsp
  :ensure t
  :config
  (setq company-lsp-enable-snippet t)
  (push 'company-lsp company-backends))

(use-package company-irony
  :ensure t
  :config (add-to-list 'company-backends 'company-irony))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/10/"))

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

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1))

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
                (ggtags-mode 1)))))

(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings)
  (rg-enable-menu))

(use-package multiple-cursors
:ensure t
)

(use-package selected
  :ensure t
  :commands selected-minor-mode
  :bind (:map selected-keymap
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("w" . count-words-region)
              ("m" . apply-macro-to-region-lines)))

(defhydra hydra-multiple-cursors (:hint nil)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search
 [Click] Cursor at point       [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


    (use-package fish-completion
    :ensure t
    :config
    (global-fish-completion-mode))
  ;; (use-package eshell-prompt-extras
  ;; :ensure t
  ;; :config
  ;; (setq epe-show-python-info nil)
  ;; )

  (use-package eshell-git-prompt
  :ensure t
  :config
  (eshell-git-prompt-use-theme 'git-radar)
  )


  (setq scroll-step 1)

  (require 'cl-lib)
  (defun select-or-create (arg)
    "Commentary ARG."
    (if (string= arg "New eshell")
        (eshell t)
      (switch-to-buffer arg)))
  (defun eshell-switcher (&optional arg)
    "Commentary ARG."
    (interactive)
    (let* (
           (buffers (cl-remove-if-not (lambda (n) (eq (buffer-local-value 'major-mode n) 'eshell-mode)) (buffer-list)) )
           (names (mapcar (lambda (n) (buffer-name n)) buffers))
           (num-buffers (length buffers) )
           (in-eshellp (eq major-mode 'eshell-mode)))
      (cond ((eq num-buffers 0) (eshell (or arg t)))
            ((not in-eshellp) (switch-to-buffer (car buffers)))
            (t (select-or-create (completing-read "Select Shell:" (cons "New eshell" names)))))))



(defun eshell/in-term (prog &rest args)
  "Run shell command in term buffer."
  (switch-to-buffer (apply #'make-term prog prog nil args))
  (term-mode)
  (term-char-mode))

(use-package perspective
  :ensure t
  :config
  (persp-mode))

(with-eval-after-load "persp-mode-autoloads"
      (setq wg-morph-on nil) ;; switch off animation
      (setq persp-autokill-buffer-on-remove 'kill-weak)
      (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))

(require 'rtags)
(cmake-ide-setup)

;; custom functions

;; kill-other
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; function decides whether .h file is C or C++ header, sets C++ by
;; default because there's more chance of there being a .h without a
;; .cc than a .h without a .c (ie. for C++ template files)
(defun c-c++-header ()
  "Set either 'c-mode' or 'c++-mode', whichever is appropriate for header."
  (interactive)
  (let ((c-file (concat (substring (buffer-file-name) 0 -1) "c")))
    (if (file-exists-p c-file)
        (c-mode)
      (c++-mode))))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-c++-header))

;; and if that doesn't work, a function to toggle between c-mode and
;; c++-mode
(defun c-c++-toggle ()
  "Toggle between 'c-mode' and 'c++-mode'."
  (interactive)
  (cond ((string= major-mode "c-mode")
         (c++-mode))
        ((string= major-mode "c++-mode")
         (c-mode))))

(provide 'init)
;;; init.el ends here
