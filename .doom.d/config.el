;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yishu See"
      user-mail-address "yishuyishu@gmail.com"
      doom-font (font-spec :family "JetBrains Mono" :size 15))

;;; When starting up, maximize the window
(when IS-MAC
  (map! :iv "s-x" #'kill-region
        :n [s-up] #'beginning-of-buffer
        :n [s-down] #'end-of-buffer)
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-theme 'doom-flatwhite)
(setq org-directory (file-truename "~/.org/"))
(setq display-line-numbers-type t)

(when (featurep! :tools lsp)
  (setq lsp-enable-file-watchers nil)
  (setq-hook! 'typescript-mode-hook +format-with-lsp nil)
  (setq-hook! 'typescript-tsx-mode-hook +format-with-lsp nil))

(setq yishus/org-agenda-directory (file-truename "~/.org/gtd/"))
(setq yishus/org-roam-directory (file-truename "~/.org/braindump/"))

(after! lsp-mode
  :config
  (setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/dev/stderr")))

(after! org
  (setq org-agenda-files (directory-files-recursively yishus/org-agenda-directory "\\.org$"))
  (setq org-capture-templates
        '(("p" "Protocol captures")
          ("pt" "Protocol todo" entry
           (file "gtd/inbox.org")
           "* TODO %:description"
           :immediate-finish t)
          ("t" "Todo" entry
           (file "gtd/inbox.org")
           "* TODO %?")))
  (setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")))
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
                                              (org-agenda-files '(,(expand-file-name "inbox.org" yishus/org-agenda-directory)))
                                              (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
                                       (todo "NEXT"
                                             ((org-agenda-overriding-header "Reading list")
                                              (org-agenda-files '(,(expand-file-name "private_reading_inbox.org" org-roam-directory))))))))))

(after! deft
  :config
  (setq deft-directory yishus/org-roam-directory))

(after! org-roam
  :init
  (setq org-roam-directory yishus/org-roam-directory)
  (setq org-roam-db-location "~/Documents/org/org-roam.db"))

(use-package! apheleia
  :config
  (apheleia-global-mode t))
