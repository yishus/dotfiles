;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yishu See"
      user-mail-address "yishuyishu@gmail.com"
      doom-font (font-spec :family "JetBrains Mono" :size 16))

;;; When starting up, maximize the window
(when (featurep :system 'macos)
  (map! :iv "s-x" #'kill-region
        :n [s-up] #'beginning-of-buffer
        :n [s-down] #'end-of-buffer)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-theme 'doom-nord-aurora)
(setq org-directory (file-truename "~/.org/"))
(setq display-line-numbers-type t)

;; (when (modulep! :tools lsp)
;;   (setq lsp-enable-file-watchers nil)
;;   (setq-hook! 'typescript-mode-hook +format-with-lsp nil)
;;   (setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil))

(after! org
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
  (setq org-capture-templates
        '(("t" "Todo" entry
           (file "inbox.org")
           "* TODO %?")))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
          (sequence "IDEA(i)" "|" "PARKING(p)" "Archived(a@/!)")))
  (setq org-archive-location "archive.org::datetree/"))

(after! org-agenda
  :config
  (setq org-agenda-block-separator nil)
  (setq org-agenda-custom-commands `((" " "Agenda"
                                      ((agenda ""
                                               ((org-agenda-span 'week)
                                                (org-deadline-warning-days 365)))
                                       (todo "NEXT"
                                             ((org-agenda-overriding-header "Next actions")
                                              (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled)))))))))

(after! deft
  :config
  (setq deft-directory org-directory)
  (setq deft-recursive t))

(after! org-roam
  :init
  (setq org-roam-directory org-directory)
  (setq org-roam-db-location "~/Documents/org/org-roam.db")
  (setq org-roam-dailies-directory "logs/"))

(after! org-journal
  :config
  (setq org-journal-dir (expand-file-name "journal/" org-directory))
  (setq org-journal-file-type 'monthly)
  (setq org-journal-file-format "%Y%m"))

(use-package! copilot
  :config
  (setq copilot-node-executable "/opt/dev/sh/nvm/versions/node/v21.1.0/bin/node")
  :hook (prog-mode . copilot-mode))

(map! :after evil
      :map copilot-completion-map
      "<tab>" #'copilot-accept-completion)
