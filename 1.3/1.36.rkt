#lang planet neil/sicp
;Exercise 1.36

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

; not dampened
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1) ; 37 steps

;dampened
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 1.1) ; 13 steps.. much faster