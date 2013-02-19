; Global
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq css-indent-offset 2)
(setq show-trailing-whitespace t)

(add-to-list 'load-path "~/.emacs.d")
(let ((default-directory "~/.emacs.d"))
  (normal-top-level-add-subdirs-to-load-path))

; My PHP setup

(add-hook 'php-mode-hook 'my-php-mode)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'php-electric-mode "php-electric" "Enhancements for php mode." t)
(autoload 'drupal-mode "drupal-mode" "Minor mode for editing Drupal PHP files." t)
(autoload 'js2-mode "js2" nil t)

; Markdown mode
(autoload 'markdown-mode "markdown-mode.elc" "Majore mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

; Puppet mode
(autoload 'puppet-mode "puppet-mode" "Major mode for editing Puppet files" t)
(setq auto-mode-alist (cons '("\\.pp" . puppet-mode) auto-mode-alist))

; Drupal
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|php\\|profile\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(info\\|make\\)$" . conf-windows-mode))
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

; Geben
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

; Git
(autoload 'git "git" "Emacs git integration" t)

(put 'downcase-region 'disabled nil)

(show-paren-mode 1)

(setq show-paren-delay 0)

(put 'upcase-region 'disabled nil)

; Cucumber
(add-to-list 'load-path "~/.emacs.d/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

; SCSS
(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss-mode"))
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(scss-compile-at-save nil))

; YAML mode.
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; Solarized dark theme
(require 'color-theme-solarized)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
   (color-theme-initialize)
   (color-theme-solarized-dark)))
