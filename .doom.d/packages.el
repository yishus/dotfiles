;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! company-flow)
(package! flow-minor-mode)
(package! prettier-js)
(when (featurep! :tools flycheck)
  (package! flycheck-flow))
