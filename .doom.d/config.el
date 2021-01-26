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

;; (after! doom-modeline
;;   (setq doom-modeline-vcs-max-length 20))

(when (featurep! :tools lsp)
  (setq lsp-enable-file-watchers nil))

;; org-mode
(setq org-directory "~/.org/")

(defun buffer-face-writing ()
  (interactive)
  (setq buffer-face-mode-face '(:background "white" :family "SF Pro"))
  (buffer-face-mode))

;; (add-hook! org-mode #'buffer-face-writing)

(after! org
  (setq org-agenda-files (list org-directory)))

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
  (setq org-roam-db-location "~/Documents/org/org-roam.db")
  (setq org-roam-dailies-capture-templates
        '(("d" "daily" plain (function org-roam-capture--get-point)
           ""
           :immediate-finish t
           :file-name "private-%<%Y-%m-%d>"
           :head "#+TITLE: %<%Y-%m-%d>"))))

(use-package! shadowenv
  :hook
  (after-init . shadowenv-global-mode))
