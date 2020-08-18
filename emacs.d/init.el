(require 'package)
;;; Code:
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; Initialize package
(package-initialize)

(setq configuration-dir "~/.emacs.d/")

;; Auto load use-package
;;(eval-when-compile
;;  (require 'use-package))

;; load literate configuration
(org-babel-load-file (concat configuration-dir "config.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-line-numbers-type (quote relative))
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (lsp-mode org-plus-contrib doom-themes org-pdfview doom-modeline zeal-at-point yasnippet ws-butler which-key use-package smartparens sane-term rmsbolt real-auto-save rainbow-delimiters pdf-tools org-autolist moody minions markdown-mode magit-todos magit-lfs iy-go-to-char ivy-rich iedit git-gutter-fringe flycheck expand-region exec-path-from-shell dired-sidebar counsel-projectile company-c-headers cheat-sh avy all-the-icons-dired)))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-project-dir . "/home/crow/Documents/Game")
     (cmake-ide-build-dir . "/home/crow/Documents/dev/Game/build"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)
