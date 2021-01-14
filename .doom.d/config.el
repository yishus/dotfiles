;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; When starting up, maximize the window
(when IS-MAC
  (map! :iv "s-x" #'kill-region
        :n [s-up] #'beginning-of-buffer
        :n [s-down] #'end-of-buffer)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-font (font-spec :family "Fira Code" :size 13))
;; (setq doom-theme 'custom-doom-gruvbox)
(setq doom-theme 'doom-moonlight)

(set-fontset-font "fontset-default"
                    '(#x1F600 . #x1F64F)
                    (font-spec :name "Apple Color Emoji") nil 'prepend)

(after! doom-modeline
  (setq doom-modeline-vcs-max-length 20))

(after! doom-themes
  (setq doom-themes-neotree-enable-variable-pitch nil))

(setq neo-window-fixed-size nil)

(when (featurep! :tools lsp)
  ;; (setq +lsp-company-backend 'company-capf)
  (setq lsp-enable-file-watchers nil))

;; Web
(after! lsp-clients
  :config
  (defun lsp-clients-flow-activate-p (file-name _mode)
  "Checks if the Flow language server should be enabled for a
  particular FILE-NAME and MODE."
  (and (derived-mode-p 'js-mode 'web-mode 'js2-mode 'flow-js2-mode 'rjsx-mode)
       (lsp-clients-flow-project-p file-name))))

(after! web-mode
  (setq web-mode-markup-indent-offset 2))

;; org-mode
(setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/")

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
  (setq org-roam-directory org-directory)
  (setq org-roam-db-location (concat org-directory "org-roam.db"))
  (setq org-roam-dailies-capture-templates
        '(("d" "daily" plain (function org-roam-capture--get-point)
           ""
           :immediate-finish t
           :file-name "private-%<%Y-%m-%d>"
           :head "#+TITLE: %<%Y-%m-%d>"))))

(use-package! shadowenv
  :hook
  (after-init . shadowenv-global-mode))
