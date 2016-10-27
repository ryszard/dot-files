(require 'cl)

;; use the mouse even if you are working from a terminal.
(require 'mouse)
(require 'mwheel)
(unless window-system
  (xterm-mouse-mode t)
   (mouse-wheel-mode t))


(setq inhibit-splash-screen t)
(when window-system
  (tool-bar-mode -1)
  (set-default-font "-apple-Monaco-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
)

(setq ns-pop-up-frames nil)
(setq mac-function-modifier  'meta)
(when window-system (scroll-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)


(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-enable-at-startup nil)

;; paste at point:
(setq mouse-yank-at-point t)
(setq mouse-wheel-scroll-amount '(0.04))

(global-font-lock-mode t)
(column-number-mode 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq make-backup-files nil)
(auto-save-mode -1)
(setq auto-save-default nil)

(require 'undo-tree)
(global-undo-tree-mode)


(which-func-mode)

(ido-mode)
(show-paren-mode 1)
(setq ido-enable-flex-matching t)
(require 'uniquify)

(setq uniquify-buffer-name-style 'forward)


(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

;; save places in visited files
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.saveplace")
(require 'saveplace)

(setq ls-lisp-dirs-first t)
(setq comint-prompt-read-only t)
(setq ring-bell-function 'ignore)


;;; cycling windows if there si more than one frame
(global-set-key (kbd "s-`") 'next-multiframe-window)
(global-set-key (kbd "s-~") 'previous-multiframe-window)1

(global-set-key (kbd "M-`") 'next-multiframe-window)
(global-set-key (kbd "M-~") 'previous-multiframe-window)

(setq-default display-buffer-reuse-frames t)
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(dolist (el '("/usr/local/bin"))
  (push el exec-path))


(defun split-window-vertically* ()
  "Vertically split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (ido-read-buffer "vsplit ")))
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer new-buffer)))


(defun split-window-horizontally* ()
  "Horizontaly split window and move to the new buffer."
  (interactive)
  (let ((new-buffer (ido-read-buffer "hsplit ")))
    (split-window-horizontally)
    (other-window 1)
    (switch-to-buffer new-buffer)))

(global-set-key (kbd "C-x 2") 'split-window-vertically*)
(global-set-key (kbd " C-x 3") 'split-window-horizontally*)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'git)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)


(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-set-key [(control x) ? ] 'ido-switch-buffer)
(toggle-frame-maximized)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (classic)))
 '(custom-safe-themes
   (quote
	("b8c5adfc0230bd8e8d73450c2cd4044ad7ba1d24458e37b6dec65607fc392980" "8016855a07f289a6b2deb248e192633dca0165f07ee5d51f9ba982ec2c36797d" default)))
 '(ess-tab-complete-in-script t)
 '(gofmt-command "/Users/ryszard/Projects/GOPATH/bin/goimports")
 '(js-indent-level 2)
 '(python-indent-offset 2)
 '(safe-local-variable-values
   (quote
	((outline-minor-mode)
	 (whitespace-style face tabs spaces trailing lines space-before-tab::space newline indentation::space empty space-after-tab::space space-mark tab-mark newline-mark)
	 (Syntax . ANSI-Common-Lisp))))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
