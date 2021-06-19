;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Yishu See"
      user-mail-address "yishuyishu@gmail.com"
      doom-font (font-spec :family "iA Writer Mono S" :size 14))

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
  (setq lsp-enable-file-watchers nil))

(setq yishus/org-agenda-directory (file-truename "~/.org/gtd/"))
(setq yishus/org-roam-directory (file-truename "~/.org/braindump/"))

(after! org
  (setq org-agenda-files (directory-files-recursively yishus/org-agenda-directory "\\.org$"))
  (setq org-capture-templates
        '(("p" "Protocol captures")
          ("pt" "Protocol todo" entry
           (file+headline "inbox.org" "To Review")
           "* TODO %:description"
           :immediate-finish t)
          ("pr" "Protocol read" entry
           (file+olp ,(expand-file-name "reading_and_writing_inbox.org" org-roam-directory) "The List")
           "* TO-READ [[%:link][%:description]] %^g"
           :immediate-finish t)
          ("t" "Todo" entry
           (file+headline "inbox.org" "To Review")
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
                                       (todo "TODO"
                                             ((org-agenda-overriding-header "Inbox")
                                              (org-agenda-files '(,(expand-file-name "inbox.org" yishus/org-agenda-directory)))))
                                       (todo "TODO"
                                             ((org-agenda-overriding-header "One-off Tasks")
                                              (org-agenda-files '(,(expand-file-name "next.org" yishus/org-agenda-directory)))
                                              (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))))
                                       ("r" "Reading"
                                             ((todo "WRITING"
                                                    ((org-agenda-overriding-header "Writing")
                                                     (org-agenda-files '(,(expand-file-name "reading_and_writing_inbox.org" org-roam-directory)))))
                                              (todo "READING"
                                                    ((org-agenda-overriding-header "Reading")
                                                     (org-agenda-files '(,(expand-file-name "reading_and_writing_inbox.org" org-roam-directory)))))
                                              (todo "TO-READ"
                                                    ((org-agenda-overriding-header "To Read")
                                                     (org-agenda-files '(,(expand-file-name "reading_and_writing_inbox.org" org-roam-directory))))))))))

(after! deft
  :config
  (setq deft-directory org-directory))

(after! org-roam
  :init
  (setq org-roam-directory yishus/org-roam-directory)
  (setq org-roam-db-location "~/Documents/org/org-roam.db"))
