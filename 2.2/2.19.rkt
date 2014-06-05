#lang planet neil/sicp
;Exercise 2.19
(define us-coins (list  10 1 50 5 25))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination xs) (car xs)) 
(define (except-first-denomination xs) (cdr xs))
(define (no-more? xs) (null? xs))

(cc 100 us-coins)
