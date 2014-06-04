#lang planet neil/sicp
;Exercise 2.8
(define (sub-interval x y)
  (make-interval 
   (- (lower-bound x) (upper-bound y))
   (- (upper-bound x) (lower-bound y))))
  
  
 
 ; from 2.7 
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

;testing
(sub-interval (make-interval 1 6) (make-interval 2 3))
