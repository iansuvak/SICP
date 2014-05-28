#lang planet neil/sicp
;Exercise 1.45

; from before
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (average x y)
  (/ (+ x y) 2))

(define (fourth-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y)))))
               1.0))
(define (fifth-root x)
    (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y)))))
               1.0))
(define (sixth-root x)
    (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y)))))
               1.0))
(define (seventh-root x)
      (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y)))))
               1.0))
(define (eighth-root x)
        (fixed-point (average-damp (average-damp (lambda (y) (/ x (* y y y y y y y)))))
               1.0))



