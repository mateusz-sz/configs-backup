 ;;;;;;;;;;;;;;
;; Packages ;;
;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)


;;;;;;;;;;;;;;;;;
;; Common Lisp ;;
;;;;;;;;;;;;;;;;;

(use-package slime
  :ensure t
  :init
  (slime-setup '(slime-fancy
                 slime-quicklisp
                 slime-asdf
                 slime-repl
                 slime-fuzzy
                 slime-presentations
                 slime-media
                 ;; slime-breakpoints
                 slime-mdot-fu))
  :config
  (setf slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
  (setf slime-lisp-implementations
        `((sbcl ("sbcl" "--dynamic-space-size" "5000"))))
  ;; (load "~/.roswell/lisp/quicklisp/clhs-use-local.el" 'noerror)
  ;; WGA
  :bind (("C-c s" . slime-selector)
         :map slime-repl-mode-map
         ("C-c M-1" . slime-macroexpand-1)
         :map slime-mode-map
         ("C-c M-1" . slime-macroexpand-1)
         ("C-c ~" . slime-sync-package-and-default-directory)))


;;;;;;;;;;;;
;; Colors ;;
;;;;;;;;;;;;

(use-package rainbow-mode
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow Delimiters ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(use-package rainbow-delimiters
  :ensure t
  :hook ((lisp-mode . rainbow-delimiters-mode)
	 (lisp-interaction-mode . rainbow-delimiters-mode)
	 (slime-repl-mode . rainbow-delimiters-mode)
         (emacs-lisp-mode . rainbow-delimiters-mode)
         ))

(use-package tron-legacy-theme
  :ensure t
  :config
  (setq tron-legacy-theme-vivid-cursor t)
  (setq tron-legacy-theme-softer-bg t)
  (load-theme 'tron-legacy t))

(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages
   '(slime rainbow-delimiters rainbow-mode tron-legacy-theme use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 163 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark violet"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "dodger blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "gold"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "orange red"))))
 '(show-paren-match ((t (:background "green" :foreground "#FFFFFF" :weight bold)))))


;; Keepit specific config
(setenv "CL_SOURCE_REGISTRY" "(:source-registry (:include \"/home/msz/keepit/asdf.conf\") :inherit-configuration)")
