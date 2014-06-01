#lang planet neil/sicp
;Exercise 2.5


; this works because 2 and 3 are coprime and you can calculate value of a (or b) by counting how many times does the product divide into 2 (or 3) 

(define (cons a b)
  (* (expt 2 a) (expt 3 b))) 

(define (car pair)
  (define (iter num count)
    (if (= (remainder num 2) 0)
        (iter (/ num 2) (+ count 1))
        count))
  (iter pair 0))

(define (cdr pair)
  (define (iter num count)
    (if (= (remainder num 3) 0)
        (iter (/ num 3) (+ count 1))
        count))
  (iter pair 0))