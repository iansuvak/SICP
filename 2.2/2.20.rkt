#lang planet neil/sicp
;Exercise 2.20

(define (same-parity . xs)
  (define (filter-iter in rem out)
    (if (null? in)
        (reverse out)
        (if (= (remainder (car in) 2) rem)
            (filter-iter (cdr in) rem (cons (car in) out))
            (filter-iter (cdr in) rem out))))
  (filter-iter xs (remainder (car xs) 2) nil))
            
(define (even? x)
  (= (remainder x 2) 0))

(define (reverse xs)
  (define (rev-iter in out)
    (if (null? in)
        out
        (rev-iter (cdr in) (cons (car in) out))))
    (rev-iter (cdr xs) (list (car xs))))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
