;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! company-emoji)

(package! company-flow)
(package! flow-minor-mode)
(package! prettier-js)
(package! flycheck-flow)

(package! org-journal)
(package! deft)
(package! org-roam :recipe
  (:host github
   :repo "jethrokuan/org-roam"
   :branch "develop"))
