#lang planet neil/sicp

; Exercise 1.27

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))   

(define (pass-fermat n)
  (define (pf n a)
    (cond ((= (- n 1) a) #t)
          ((= (expmod a n n) a) (pf n (+ a 1)))
          (else #f)))
  (pf n 2))

; Verification portion
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
;561, 1105, 1729, 2465, 2821, and 6601

(pass-fermat 561)
(pass-fermat 1105)
(pass-fermat 1729)
(pass-fermat 2465)
(pass-fermat 2821)
(pass-fermat 6601)

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)


