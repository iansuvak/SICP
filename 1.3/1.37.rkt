#lang planet neil/sicp
;Exercise 1.37

; recursive
(define (cont-frac-r n d k)
  (define (helper step)
    (if (> step k)
        0
        (/ (n step) (+ (d step) (helper (+ step 1))))))
  (helper 1)
  )

; PHI = 1.6180555555555558
(/ 1 (cont-frac-r (lambda (x) 1.00) (lambda (x) 1.00) 12)) ; takes 12 steps


;iterative
(define (cont-frac-i n d k)
  (define (iter depth result)
    (if (< depth 1)
        result
        (iter (- depth 1) (/ (n depth) (+ (d depth) result)))))
  (iter k 0))

(/ 1 (cont-frac-i (lambda (x) 1.00) (lambda (x) 1.00) 12)) ; takes 12 steps
  