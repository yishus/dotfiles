;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; When starting up, maximize the window
(when IS-MAC
  (map! :iv "s-x" #'kill-region
        :n [s-up] #'beginning-of-buffer
        :n [s-down] #'end-of-buffer)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-font (font-spec :family "iA Writer Mono S" :size 13 :weight 'bold))
(setq doom-theme 'doom-oceanic-next)

(when (featurep! :tools lsp)
  (setq lsp-enable-file-watchers nil))

;; (after! magit
;;   :config
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-tags-header)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-status-headers)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-pushremote)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-pushremote)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpulled-from-upstream)
;;   (remove-hook 'magit-status-sections-hook 'magit-insert-unpushed-to-upstream-or-recent))

;; org-mode
(setq org-directory "~/.org/")

(after! org
  :config
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (setq org-log-done 'time))

(after! deft
  :config
  (setq deft-directory org-directory))

(after! org-roam
  :config
  (setq org-roam-directory org-directory)
  (setq org-roam-db-location "~/org/org-roam.db"))

(use-package! shadowenv
  :hook
  (after-init . shadowenv-global-mode))

;; (use-package! spin)
