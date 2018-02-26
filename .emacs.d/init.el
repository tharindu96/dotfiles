;;; init.el --- Summary
;;; Commentary:

;;; Code:
(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; add ./lisp to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; increase the garbage collection threshold to 500 MB
(setq gc-cons-threshold (* 500 1024 1024))
(add-hook 'after-init-hook (lambda() (setq gc-cons-threshold (* 50 1024 1024))))

;; list package archives and initialize them
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(require 'init-user)

;; load packages

(require 'init-restart-emacs)
(require 'init-color-theme)

(require 'init-dired)
(require 'init-diminish)
(require 'init-flyspell)
(require 'init-async)
(require 'init-cl-lib)
(require 'init-dash)
(require 'init-s)
(require 'init-which-key)
(require 'init-discover-my-major)
(require 'init-flx-ido)
(require 'init-smex)
(require 'init-beacon)
(require 'init-goto-chg)
(require 'init-avy)
(require 'init-highlight-symbol)
(require 'init-projectile)
(require 'init-ztree)
(require 'init-neotree)
(require 'init-ggtags)
(require 'init-dumb-jump)
(require 'init-dash-at-point)
(require 'init-fill-column-indicator)
(require 'init-region-state)
(require 'init-spaceline)
(require 'init-fancy-battery)
(require 'init-origami)
(require 'init-tex-site)

(require 'init-company)
(require 'init-helm)
(require 'init-git-gutter)
(require 'init-magit)
(require 'init-git-timemachine)
(require 'init-yagist)
(require 'init-editorconfig)
(require 'init-auto-compile)
(require 'init-rtags)
(require 'init-autopair)
;; (require 'init-header2)
(require 'init-undo-tree)

(require 'init-markdown-mode)
(require 'init-writegood-mode)
(require 'init-rjsx-mode)
(require 'init-yaml-mode)
(require 'init-emacs-lisp-mode)
(require 'init-pyenv-mode)
(require 'init-web-mode)
(require 'init-js2-mode)
(require 'init-scss-mode)
(require 'init-json-mode)
(require 'init-nginx-mode)
(require 'init-emmet-mode)
(require 'init-lua-mode)
(require 'init-rust-mode)
(require 'init-php-mode)

;; (require 'init-haskell-mode)
;; (require 'init-slime)

;; load scripts

(setq c-default-style "linux"
      c-basic-offset 8)

(global-undo-tree-mode 1)
