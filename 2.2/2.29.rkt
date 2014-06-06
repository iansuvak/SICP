#lang planet neil/sicp
;Exercise 2.29

;given
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;b)
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))
(define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))

;c)
(define (branch-torque branch)
  (* (branch-length branch) (branch-weight branch)))

(define (balanced-branch branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      true))

(define (balanced? mobile)
  (and (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
       (balanced-branch (left-branch mobile)) (balanced-branch (right-branch mobile))))
;d) I would just have to change right-branch and branch-structure to use cdr instead of (car (cdr))

;some testing 
(define a
(make-mobile 
 (make-branch 4 1)
 (make-branch 4 1))
  )
(define b
(make-mobile 
 (make-branch 1 9)
 (make-branch 3 3))
  )
(define c
(make-mobile 
 (make-branch 5 5)
 (make-branch 6 5))
  )

(define abt
   (make-mobile
    (make-branch 6 a)
    (make-branch 1 b)))
(define abf
   (make-mobile
    (make-branch 7 a)
    (make-branch 1 b)))

(balanced? a)
(balanced? b)
(balanced? c)
(total-weight a)
(total-weight b)
(total-weight c)
(balanced? abt)
(total-weight abt)
(balanced? abf)
(total-weight abf)
;not thorough but I am satisfied that it works..


