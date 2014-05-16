#lang planet neil/sicp

(define (square x)
  (* x x))

(define (m-r 

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (m-r (expmod base (/ exp 2) m)))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))


