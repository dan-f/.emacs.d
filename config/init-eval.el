(require 'init-commands)

(defvar-local dan-f/eval-sexp-fn #'eval-last-sexp
  "Buffer-local variable for evaluating expressions")

(defvar-local dan-f/eval-defn-fn #'eval-defun
  "Buffer-local variable for evaluating definitions")

(defvar-local dan-f/eval-buff-fn #'eval-buffer
  "Buffer-local variable for evaluating buffers")

(defvar-local dan-f/eval-regn-fn #'eval-region
  "Buffer-local variable for evaluating regions")

(defvar dan-f/eval-map
  (let ((map (make-sparse-keymap "eval")))
    (define-key map "s" (lambda (&rest args)
                          (interactive)
                          (funcall dan-f/eval-sexp-fn args)))
    (define-key map "f" (lambda (&rest args)
                          (interactive)
                          (funcall dan-f/eval-defn-fn args)))
    (define-key map "b" (lambda (&rest args)
                          (interactive)
                          (funcall dan-f/eval-buff-fn args)))
    (define-key map "r" (lambda (start end)
                          (interactive "r")
                          (funcall dan-f/eval-regn-fn start end)))
    map))

(defmacro dan-f/eval-for-mode (mode &rest bindings)
  (declare (indent defun))
  (let ((mode-hook (intern (format "%s-mode-hook" mode)))
        (make-local-bindings
         (lambda (binding)
           (let* ((var-nickname (car binding))
                  (eval-fn (cdr binding))
                  (var-name (intern (format "dan-f/eval-%s-fn" var-nickname))))
             `(setq ,var-name ',eval-fn)))))
    `(add-hook ',mode-hook
               (lambda ()
                 ,@(mapcar make-local-bindings bindings)))))

(define-key dan-f/command-map "e" dan-f/eval-map)

(provide 'init-eval)
