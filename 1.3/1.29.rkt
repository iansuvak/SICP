#lang planet neil/sicp

;Exercise 1.29

; Sum defined in text

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (cube x) (* x x x))


;Solution

(define (simpson-integral f a b n) 
  (define h
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (factor-help k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))
  (define (term k)
    (* (factor-help k) (y k)))
  (* (/ h 3) (sum term 0 inc n))) 

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

;Running out of precision here but it seems to be working geting #e0.25 with anything larger than 2 and #e0.3 with n=1


              
 
  