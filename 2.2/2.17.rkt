#lang planet neil/sicp
;Exercise 2.17
(define (last-pair xs)
  (if (null? (cdr xs))
      (list (car xs))
      (last-pair (cdr xs))))
; testing
(last-pair (list 23 72 149 34))
;(34)

