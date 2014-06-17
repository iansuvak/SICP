#lang planet neil/sicp
;Exercise 2.41
;Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than or equal to a given integer n that sum to a given integer s.
(define (unique-trips n)
  (flatmap 
   (lambda (i)
     (map (lambda (j) (append (list j) i))
          (enumerate-interval 1 (- (car i) 1))))
   (unique-pairs n)))

(define (triple-sums n s)
  (filter (lambda (x) (= s (accumulate + 0 x)))
          (unique-trips n)))

;defs

(define (unique-pairs n)
   (flatmap
    (lambda (i)
      (map (lambda (j) (list j i))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
;testing
(unique-trips 4)
(triple-sums 4 6)
(triple-sums 6 10)