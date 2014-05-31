#lang planet neil/sicp

;Exercise 2.3

(define (make-rectangle A C)
  (let ((B (make-point (x-point C) (y-point A)))
        (D (make-point (x-point A) (y-point C))))
    (cons (cons A B) (cons C D))))

(define (get-dimensions rect)
  

; All of 2.2 below
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))
  
(define (length-segment seg)
  (x-point (start-segment seg)
           )) ; unfinished
  

(define (midpoint-segment segment)
  (let (( start (start-segment segment))
        (end (end-segment segment)))
    (let ((x1 (x-point start))
          (x2 (x-point end))
          (y1 (y-point start))
          (y2 (y-point end)))
      (make-point (average x1 x2) (average y1 y2)))))

(define (average x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
