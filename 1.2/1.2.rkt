#lang planet neil/sicp

;Exercise 1.9 clearly recursive

;Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10) ; 1024
(A 2 4) ; 65536
(A 3 3) ; 65536
(A 2 3)

; A (-x 1) (A x (- y 1))
; A 0 (A 1 (- y 1))
; (g 3)
; (A 1 3)
; (A 0 (A 1 2))
; (A 0 (A 0 (A 1 1)))
; (A 0 (A 0 2))
; (A 0 4)
; 8
(define (f n) (A 0 n)) ; computes 2n
(define (g n) (A 1 n)) ; computes 2^n
(define (h n) (A 2 n)) ; computes (2^(2^(2^)...n times) a power tower

;Exercise 1.11

(define (f11 n) 
  (if (< n 3)
      n
      (+ (f11 (- n 1)) (* 2 (f11 (- n 2))) (* 3 (f11 (- n 3)))))) 
; (f11 4)
; (+ (f11 3) (* 2 (f11 2) (* 3 (f11 1)))))
; (+ (+ (f11 2) (* 2 (f11 1) 0)) (* 2  2) (*3 1)))
; (+ (+ 2 2) 4 3))
; (+ 4 7)
; 11

(define (f112 n)
  (define (y a b c) 
    (+ c (* 2 b) (* 3 a)))
  (define (f-iter iter a b c sum)
    (cond ((< n 3) n)
          ((= iter n) sum)
          (else (f-iter (+ iter 1) b c (y a b c) (y a b c)))))
  (f-iter 2 0 1 2 2))
    
(f112 4)
