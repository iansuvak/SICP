#lang planet neil/sicp
;Exercise 2.21

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))
(define (square-list-m items)
  (map square items))

(define (square x) (* x x))

(square-list (list 1 2 3 4))
(square-list-m (list 1 2 3 4))