;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

(package! org :pin "ca873f7")
(package! graphql-mode)
(package! chruby)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
