#lang planet neil/sicp
;Exercise 2.37
;accumulate 
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))
(define (transpose mat)
  (accumulate-n cons nil mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
   (map (lambda (row) (matrix-*-vector cols row)) m)))

;testing
(define a (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define b (list (list 1 2 3) (list 3 2 1) (list 2 1 3)))
(define c (list (list 4 5 6) (list 6 5 4) (list 4 6 5)))
(matrix-*-vector a (list 1 2 3))
(transpose a)
(matrix-*-matrix b c)