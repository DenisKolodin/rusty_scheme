
(define (main)

        (with-input-from-file (cadr (command-line))
          (lambda ()
            (let ((list-to-build (cons #f '())))
              (let cont ((env (env.new))
                         (bco (create-bco))
                         (last-compiled-head list-to-build))
                (let ((res (read)))
                  (if (eof-object? res)
                      (cdr list-to-build)
                      (let ((just-compiled
                             (cons (compile-form res env bco) '())))
                        (set-cdr! last-compiled-head just-compiled)
                        (set! last-compiled-head just-compiled)))))))))
