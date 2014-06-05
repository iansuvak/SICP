#lang planet neil/sicp
;Exercise 2.12

(define (make-center-percent center tolerance)
  (let ((delta (* center (/ tolerance 100))))
        (make-interval (- center delta) (+ center delta))))

(define (percent interval)
  (let ((c (center interval)))
    (* 100 (/ (- (upper-bound interval) c) c))))
        

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

;earlier stuff
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;testing 
(make-center-percent 3 33)

