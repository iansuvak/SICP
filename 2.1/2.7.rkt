#lang planet neil/sicp
;Exercise 2.7

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))
