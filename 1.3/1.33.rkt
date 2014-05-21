#lang planet neil/sicp

; Exercise 1.33

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

; Prime section from another problem :

(define (square x)
  (* x x))
(define (next a)
  (+ a 1))
(define  (identity x) x)

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;a
(define (sum-prime-squares a b)
  (filtered-accumulate + 0 square a next b prime?))

;b 
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))




  
(define (product-relative-primes max)
  (define (relative-prime? x)
  (= (gcd x max) 1))
  (filtered-accumulate * 1 identity 1 next (- max 1) relative-prime?))