;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;;; When starting up, maximize the window
(when IS-MAC
  (add-hook 'window-setup-hook #'toggle-frame-maximized))

(setq doom-font (font-spec :family "Dank Mono" :size 14))
(setq doom-theme 'doom-nord)

(after! doom-modeline
  (setq doom-modeline-vcs-max-length 20))

(after! doom-themes
  (setq doom-themes-neotree-enable-variable-pitch nil))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(defun git-blame-line ()
  "Runs `git blame` on the current line and
   adds the commit id to the kill ring"
  (interactive)
  (let* ((line-number (save-excursion
                        (goto-char (point-at-bol))
                        (+ 1 (count-lines 1 (point)))))
         (line-arg (format "%d,%d" line-number line-number))
         (commit-buf (generate-new-buffer "*git-blame-line-commit*")))
    (call-process "git" nil commit-buf nil
                  "blame" (buffer-file-name) "-L" line-arg)
    (let* ((commit-id (with-current-buffer commit-buf
                        (buffer-substring 1 9)))
           (log-buf (generate-new-buffer "*git-blame-line-log*")))
      (kill-new commit-id)
      (call-process "git" nil log-buf nil
                    "log" "-1" "--pretty=%h   %an   %s" commit-id)
      (with-current-buffer log-buf
        (message "Line %d: %s" line-number (buffer-string)))
      (kill-buffer log-buf))
    (kill-buffer commit-buf)))

(global-set-key (kbd "M-g b") 'git-blame-line)

;; Web
(def-package! company-flow
  :when (featurep! :completion company)
  :config
  (set-company-backend! 'rjsx-mode 'company-flow 'company-files))

(def-package! flow-minor-mode
  :after flycheck
  :hook ((js2-mode . flow-minor-mode)
         (rjsx-mode . flow-minor-mode)))

(def-package! flycheck-flow
  :config
  (defun flycheck-flow--predicate ()
    "Shall we run the checker?"
    (and
     buffer-file-name
     (file-exists-p buffer-file-name)
     (locate-dominating-file buffer-file-name ".flowconfig"))))

(def-package! prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (rjsx-mode . prettier-js-mode)
         (css-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)))

(after! lsp-clients
  :config
  (defun lsp-clients-flow-activate-p (file-name _mode)
  "Checks if the Flow language server should be enabled for a
particular FILE-NAME and MODE."
  (and (derived-mode-p 'js-mode 'web-mode 'js2-mode 'flow-js2-mode 'rjsx-mode)
       (lsp-clients-flow-project-p file-name))))
