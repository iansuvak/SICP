#lang planet neil/sicp
;Exercise 2.30
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-m tree)
       (map (lambda (sub-tree)
              (if (pair? sub-tree)
                  (square-tree-m sub-tree)
                  (square sub-tree)))
            tree))

(define (square x) (* x x))
(square-tree-m
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))

;both ways work

