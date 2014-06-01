#lang planet neil/sicp
;Exercise 2.2

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

(print-point (midpoint-segment (make-segment (make-point 3 5) (make-point -5 10))))
; (-1, 15/2) --- works