(setq load-path (cons "/vendor/lean4-mode" load-path))

(require 'lean4-mode)
(require 'company)

(defun jcreed-lean4-mode-hook ()
  ;;;; these don't seem to work
  ;; (setq lsp-inlay-hint-enable t)
  ;; (lsp-inlay-hints-mode)
  (setq warning-minimum-level :error)
  (company-mode)
  (setq lsp-enable-file-watchers nil)
  (define-key lean4-mode-map "\M-;" 'company-complete)
  (define-key lean4-mode-map "\M-." 'lsp-find-definition))
(add-hook 'lean4-mode-hook #'jcreed-lean4-mode-hook)
(custom-set-faces
 '(font-lock-warning-face ((t (:foreground "yellow" :background "#dc322f")))))
