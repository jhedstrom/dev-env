(defun drupal-mode ()
  "Drupal php-mode."
  (interactive)
  (php-mode)
  (php-electric-mode)
  (message "Drupal mode activated.")
  (set 'tab-width 2)
  (set 'c-basic-offset 2)
  (set 'indent-tabs-mode nil)
  (set 'fill-column 80)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
  ; More Drupal-specific customizations here
  (setq show-trailing-whitespace t)
)

(defconst my-php-style
  '((c-offsets-alist . (
    (arglist-close . c-lineup-close-paren) ; correct arglist closing parenthesis
   )))
  "My PHP Programming style"
)
(c-add-style "my-php-style" my-php-style)

(defun my-php-mode ()
  "My personal php-mode customizations."
  (c-set-style "my-php-style")
  ; More generic PHP customizations here

  ; PHP Codesniffer.
  (set (make-local-variable 'compile-command) (format "phpcs --report=emacs --standard=Drupal %s" (buffer-file-name)))
)

(provide 'drupal-mode)
