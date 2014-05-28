#lang planet neil/sicp
;Exercise 1.44


(define (square x)
  (* x x))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

((smooth square) 2.3)
(square 2.3)

; From 1.43

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter c result)
    (if (<= c 1) result
        (iter (- c 1) (compose f result))))
    (iter n f))


(((repeated smooth 4) square) 2.3)