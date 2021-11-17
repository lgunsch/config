(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))


(setq prelude-theme 'monokai-theme)
(setq default-frame-alist '((font . "Cascadia Code-13")))
;; (setq default-frame-alist '((font . "Source Code Pro-13")))
;; (add-to-list 'default-frame-alist
;;             '(font . "Cascadia Code-13:antialias=true:hinting=true"))

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(global-display-line-numbers-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 24))

;; default indents for modes
(setq yaml-indent-offset 2)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; fix cperl-mode electric {} conflicting with smartparens-mode
(with-eval-after-load 'cperl-mode
  (add-hook 'smartparens-enabled-hook  (lambda () (define-key cperl-mode-map "{" nil)))
  (add-hook 'smartparens-disabled-hook  (lambda () (define-key cperl-mode-map "{" 'cperl-electric-lbrace))))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package ansible
  :ensure t
  :hook yaml-mode)

(use-package avy
  :ensure t
  :bind (
         ("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)))

(use-package dockerfile-mode
  :ensure t)

(use-package json-mode
  :ensure t
  :custom
  (json-reformat:indent-width 2))

(use-package jsonnet-mode
  :ensure t)

(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle))

(use-package helm-swoop
  :ensure t
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)
         ("C-c M-i" . helm-multi-swoop)
         ("C-x M-i" . helm-multi-swoop-all)
         :map isearch-mode-map
         ("M-i" . helm-swoop-from-isearch)
         :map helm-swoop-map
         ("M-i" . helm-multi-swoop-all-from-helm-swoop))
  :init
  (setq helm-multi-swoop-edit-save t)
  (setq helm-swoop-split-with-multiple-windows nil)
  (setq helm-swoop-split-direction 'split-window-horizontally)
  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color t)
  (setq helm-swoop-move-to-line-cycle t)
  (setq helm-swoop-use-line-number-face t)  ; Face `helm-swoop-line-number-face`
)

(use-package highlight-indentation
  :ensure t)

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(use-package indent-tools
  :ensure t
  :bind ("C-c >" . indent-tools-hydra/body))

(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  :hook
  ((prog-mode . highlight-indent-guides-mode)
   (yaml-mode . highlight-indent-guides-mode)
   (jsonnet-mode . highlight-indent-guides-mode)
   (json-mode . highlight-indent-guides-mode)
   (ansible-mode)))

; configure Org Mode
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "CODE-REVIEW" "TESTING" "DONE")))

(use-package zig-mode
  :ensure t)
