#lang planet neil/sicp
;Exercise 2.9

(define (width-interval interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

; from before

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
; demo


(width-interval (make-interval 0 1)) ; 0.5
(width-interval (make-interval 2 3)) ; 0.5
(width-interval (mul-interval (make-interval 0 1) (make-interval 2 3)))


(width-interval (make-interval 1 2)) ; 0.5
(width-interval (make-interval 2 3)) ; 0.5
(width-interval (mul-interval (make-interval 1 2) (make-interval 2 3))) ; 2
; 2 != 1.5 therefore not just function of the two widths

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

; since division involves multiplication which is not just a function of the two widths than this is definitely not either

