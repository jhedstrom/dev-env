(add-to-list 'load-path "~/.emacs.d")

; My PHP setup

(add-hook 'php-mode-hook 'my-php-mode)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'php-electric-mode "php-electric" "Enhancements for php mode." t)
(autoload 'drupal-mode "drupal-mode" "Minor mode for editing Drupal PHP files." t)

; Drupal
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|profile\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("\\.\\(info\\|make\\)$" . conf-windows-mode))

; Geben
(autoload 'geben "geben" "PHP Debugger on Emacs" t)

(put 'downcase-region 'disabled nil)

(show-paren-mode 1)

(setq show-paren-delay 0)

(put 'upcase-region 'disabled nil)
