#lang planet neil/sicp
;Exercise 2.23

(define (for-each f xs)
  (define (iter-helper lst)
    (if (null? lst)
        true
        (let ()
          (f (car lst))
          (iter-helper (cdr lst)))))
  (iter-helper xs))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))