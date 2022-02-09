;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Keith Gaddis"
      user-mail-address "keith.gaddis@gmail.com"
      orderless-matching-styles '(orderless-flex))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'wombat)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/"    )
(setq org-roam-directory "~/org-roam")
(setq deft-directory "~/deft/")
(setq deft-default-extension "md")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")
(setq doom-localleader-alt-key "<space> m")

(set-docsets! 'js2-mode "JavaScript" "JQuery")
(set-docsets! 'elixir-mode "Elixir" "hex")

(setq +lookup-open-url-fn #'eww)

;; (lsp-treemacs-sync-mode 1)
(global-visual-line-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)


(add-to-list 'display-buffer-alist
             `(,(rx bos (or
                         "*rspec-compilation*"
                         "*compilation*"
                         "*Compilation*"
                         "*projectile-rails-compilation*"
                         "*Bundler*"
                         "*Message*"
                         "*exunit-compilation*"
                         "*alchemist mix*"
                         "*elixir help*"
                         "*alchemist help*"
                         "*alchemist mix*"
                         "*alchemist elixirc*"
                         "*mix*")
                    (zero-or-more anychar)
                    eos)
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . bottom)
               (window-height   . 0.3)))


(after! (evil alchemist)
  (evil-collection-define-key 'normal 'alchemist-mode-map
    (kbd "C-j") nil
    (kbd "C-k") nil
    )
  )

(map! :map alchemist-mode-map
      :after alchemist-mode
      :n "C-j" nil
      :n "C-k" nil
      )
(map! :g "C-h" #'windmove-left)
(map! :g "C-j" #'windmove-down)
(map! :g "C-k" #'windmove-up)
(map! :g "C-l" #'windmove-right)
(map! :m "C-h" #'windmove-left)
(map! :m "C-j" #'windmove-down)
(map! :m "C-k" #'windmove-up)
(map! :m "C-l" #'windmove-right)
(map! :g "M-s" #'save-buffer)
(map! :g "s-s" #'save-buffer)
;; (map! :g "s-r" #'exunit-rerun)

(map! :leader
      :n "/" #'execute-extended-command
      :n "w-" #'+evil/window-split-and-follow
      :n "w/" #'+evil/window-vsplit-and-follow
      :n "dd" #'kg/dash-at-point
      :n "cl" #'kg/comment-or-uncomment-line-or-region
      )

(map! :map elixir-mode-map
      :localleader :desc "jump to symbol in file"
      "l" #'consult-imenu
      )
;; (map! :map elixir-mode-map
(map! :mode elixir-mode
      :n "M-i" #'kg/insert-pipe
      :i "M-i" #'kg/insert-pipe
      :n "s-l" #'kg/insert-arrow-binding
      :i "s-l" #'kg/insert-arrow-binding
      :n "s-i" #'kg/insert-pipe
      :i "s-i" #'kg/insert-pipe
      :n "s-r" #'exunit-rerun
      :e "s-r" #'exunit-rerun
      :nv "g t" #'exunit-toggle-file-and-test
      :i "C-l" #'kg/insert-hashrocket-binding
      :nv "t a" #'exunit-verify-all
      :nv "t t" #'exunit-verify-single
      :nv "t b" #'exunit-verify
      )


(progn
  (let ((map (if (boundp 'input-decode-map)
                 input-decode-map
               function-key-map)))
    ;; For this to work, you need iterm2 to remap cmd-[ilrs] to the keys below.
    ;; import special_keys.itermkeymap from doom dotfiles folder (also probably
    ;; in the home dir if you've stowed doom already)
    (define-key map "@ss" (kbd "s-s"))
    (define-key map "@si" (kbd "s-i"))
    (define-key map "@sr" (kbd "s-r"))
    (define-key map "@sl" (kbd "s-l"))
    ))



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; Elixir: Ignore some common directories that don't need to be watched
;; taken from https://github.com/elixir-lsp/elixir-ls/issues/448
(after! lsp-mode
  (dolist (match
           '("[/\\\\].direnv$"
             "[/\\\\]node_modules$"
             "[/\\\\]deps"
             "[/\\\\]build"
             "[/\\\\]_build"))
    (add-to-list 'lsp-file-watch-ignored match)))

(defun kg/dash-at-point ()
  (interactive)
  (dash-at-point t)
  )

(add-to-list 'dash-at-point-mode-alist '(elixir-mode . "hex"))

(defun kg/comment-or-uncomment-line-or-region ()
  "Toggles commenting on the current line if no region is defined,
   otherwise toggles comments on the region"
  (interactive "*")
  (let ((use-empty-active-region t) (mark-even-if-inactive nil))
    (cond
     ((use-region-p) (comment-or-uncomment-region (region-beginning) (region-end)))
     (t (comment-or-uncomment-region (line-beginning-position) (line-end-position))))))

(defun kg/insert-inspect ()
  (interactive)
  (evil-open-below 0)
  (kbd "<escape>")
  (insert "|> IO.inspect" )
  )
(defun kg/insert-pipe ()
  (interactive)
  (evil-open-below 0)
  (kbd "<escape>")
  (insert "|> " )
  )
(defun kg/insert-hashrocket-binding ()
  (interactive)
  (insert " => ")
  )

(defun kg/insert-arrow-binding ()
  (interactive)
  (insert " -> ")
  )


;; magic recipes I don't understand
(unless (display-graphic-p)
  (add-hook 'after-make-frame-functions
            '(lambda
               ;; Take advantage of iterm2's CSI u support (https://gitlab.com/gnachman/iterm2/-/issues/8382).
               (xterm--init-modify-other-keys)

               ;; Courtesy https://emacs.stackexchange.com/a/13957, modified per
               ;; https://gitlab.com/gnachman/iterm2/-/issues/8382#note_365264207
               (defun character-apply-modifiers (c &rest modifiers)
                 "Apply modifiers to the character C.
MODIFIERS must be a list of symbols amongst (meta control shift).
Return an event vector."
                 (if (memq 'control modifiers) (setq c (if (and (<= ?a c) (<= c ?z))
                                                           (logand c ?\x1f)
                                                         (logior (lsh 1 26) c))))
                 (if (memq 'meta modifiers) (setq c (logior (lsh 1 27) c)))
                 (if (memq 'shift modifiers) (setq c (logior (lsh 1 25) c)))
                 (vector c))
               (when (and (boundp 'xterm-extra-capabilities) (boundp 'xterm-function-map))
                 (let ((c 32))
                   (while (<= c 126)
                     (mapc (lambda (x)
                             (define-key xterm-function-map (format (car x) c)
                               (apply 'character-apply-modifiers c (cdr x))))
                           '(;; with ?.VT100.formatOtherKeys: 0
                             ("\e\[27;3;%d~" meta)
                             ("\e\[27;5;%d~" control)
                             ("\e\[27;6;%d~" control shift)
                             ("\e\[27;7;%d~" control meta)
                             ("\e\[27;8;%d~" control meta shift)
                             ;; with ?.VT100.formatOtherKeys: 1
                             ("\e\[%d;3u" meta)
                             ("\e\[%d;5u" control)
                             ("\e\[%d;6u" control shift)
                             ("\e\[%d;7u" control meta)
                             ("\e\[%d;8u" control meta shift)))
                     (setq c (1+ c)))))
               )))
