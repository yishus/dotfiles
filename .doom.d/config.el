;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; When starting up, maximize the window
(when IS-MAC
  (map! :iv "s-x" #'kill-region
        :n [s-up] #'beginning-of-buffer
        :n [s-down] #'end-of-buffer)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-font (font-spec :family "Dank Mono" :size 14))
(setq doom-theme 'custom-doom-gruvbox)

(set-fontset-font "fontset-default"
                    '(#x1F600 . #x1F64F)
                    (font-spec :name "Apple Color Emoji") nil 'prepend)

(after! doom-modeline
  (setq doom-modeline-vcs-max-length 20))

(after! doom-themes
  (setq doom-themes-neotree-enable-variable-pitch nil))

(setq neo-window-fixed-size nil)

(use-package! fish-completion
  :config
  (global-fish-completion-mode))

(when (featurep! :tools lsp)
  (setq +lsp-company-backend 'company-capf))

;; Web
(after! lsp-clients
  :config
  (defun lsp-clients-flow-activate-p (file-name _mode)
  "Checks if the Flow language server should be enabled for a
  particular FILE-NAME and MODE."
  (and (derived-mode-p 'js-mode 'web-mode 'js2-mode 'flow-js2-mode 'rjsx-mode)
       (lsp-clients-flow-project-p file-name))))

;; org-mode
(setq org-directory "~/Documents/org/")

(after! org-journal
  :custom
  (setq org-journal-dir org-directory)
  (setq org-journal-file-format "private-%Y-%m-%d.org"))

(after! deft
  :config
  (setq deft-directory org-directory)
  (setq deft-default-extension "org")
  (setq deft-use-filter-string-for-filename t)
  (setq deft-extensions '("org"))
  (setq deft-file-naming-rules
      '((noslash . "-")
        (nospace . "-")
        (case-fn . downcase))))

(after! org-roam
  :config
  (setq org-roam-dailies-capture-templates
        '(("d" "daily" plain (function org-roam-capture--get-point)
           ""
           :immediate-finish t
           :file-name "private-%<%Y-%m-%d>"
           :head "#+TITLE: %<%Y-%m-%d>"))))
