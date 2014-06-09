#lang planet neil/sicp
;Exercise 2.33
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y)  (cons (p x) y)) nil sequence))
(define (append seq1 seq2)
 (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate length-help 0 sequence))

(map (lambda (x) (* x 2)) (list 1 2 3))

(append (list 1 2 3) (list 4 5 6))

(define (length-help x y) (+ y 1))


(length (list 1 2 3))